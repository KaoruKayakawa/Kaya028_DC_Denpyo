USE [DCENTER]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vi_F_入庫受信_ヘッダ_1]') AND type in (N'V'))
DROP VIEW [dbo].[vi_F_入庫受信_ヘッダ_1]
GO

/****** Object:  View [dbo].[vi_F_入庫受信_ヘッダ_1]    Script Date: 2021/10/07 16:28:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vi_F_入庫受信_ヘッダ_1]
AS
WITH
 w1 AS (
  SELECT [会社店ｺｰﾄﾞ], [仕入先ｺｰﾄﾞ], [部門ｺｰﾄﾞ], [発注日付], [最終納品日付], [便区分], [伝票番号], [受信日時],
   [納品バラ数], [検品ﾊﾞﾗ数], [原価金額], [売価金額]
  FROM [F_入庫受信]
  WHERE [伝票区分] IN ('01', '08')
 ),
 w2 AS (
  SELECT [会社店ｺｰﾄﾞ], [仕入先ｺｰﾄﾞ], [部門ｺｰﾄﾞ], [発注日付], [最終納品日付], [便区分], [伝票番号], [受信日時],
   - [納品バラ数] AS [納品バラ数], - [検品ﾊﾞﾗ数] AS [検品ﾊﾞﾗ数], - [原価金額] AS [原価金額], - [売価金額] AS [売価金額]
  FROM [F_入庫受信]
  WHERE [伝票区分] IN ('02', '04')
 ),
 w3 AS (
  SELECT *
  FROM w1
  UNION ALL
  SELECT *
  FROM w2
 ),
 /*
 t1 AS (
  SELECT [会社店ｺｰﾄﾞ], [仕入先ｺｰﾄﾞ], [部門ｺｰﾄﾞ], [発注日付], [最終納品日付], [便区分], [伝票番号], [受信日時],
   COUNT(*) AS [明細件数],
   CAST(NULL AS money) AS [発注数量合計],
   SUM([納品バラ数]) AS [納品数量合計],
   SUM([検品ﾊﾞﾗ数]) AS [検品数量合計],
   SUM([原価金額]) AS [原価金額合計],
   SUM([売価金額]) AS [売上金額合計]
  FROM w3
  GROUP BY [会社店ｺｰﾄﾞ], [仕入先ｺｰﾄﾞ], [部門ｺｰﾄﾞ], [発注日付], [最終納品日付], [便区分], [伝票番号], [受信日時]
 )
 */
 t1 AS (
  SELECT [会社店ｺｰﾄﾞ], [部門ｺｰﾄﾞ], [仕入先ｺｰﾄﾞ], [伝票番号],
   MAX([発注日付]) AS [発注日付],
   MAX([最終納品日付]) AS [最終納品日付],
   MAX([便区分]) AS [便区分],
   MAX([受信日時]) AS [受信日時],
   COUNT(*) AS [明細件数],
   CAST(NULL AS money) AS [発注数量合計],
   SUM([納品バラ数]) AS [納品数量合計],
   SUM([検品ﾊﾞﾗ数]) AS [検品数量合計],
   SUM([原価金額]) AS [原価金額合計],
   SUM([売価金額]) AS [売上金額合計]
  FROM w3
  GROUP BY [会社店ｺｰﾄﾞ], [仕入先ｺｰﾄﾞ], [部門ｺｰﾄﾞ], [発注日付], [最終納品日付], [便区分], [伝票番号], [受信日時]
 )
SELECT
 t1.[仕入先ｺｰﾄﾞ],
 t1.[最終納品日付] AS [最終納品日],
 t1.[発注日付] AS [発注日],
 t1.[便区分],
 t1.[伝票番号],
 t1.[会社店ｺｰﾄﾞ],
 t1.[部門ｺｰﾄﾞ],
 t1.[発注数量合計],
 t1.[納品数量合計],
 t1.[検品数量合計],
 t1.[原価金額合計],
 t1.[売上金額合計],
 CAST(1 AS bit) AS [確定区分],
 CASE t1.[受信日時]
  WHEN '1901-01-01' THEN NULL
  ELSE t1.[受信日時]
 END AS [確定-受信_日時],
 CAST(NULL AS datetime) AS [取消日付],
 CAST('03' AS varchar(2)) AS [伝票種別],
 t1.[明細件数],
 ISNULL(t2.[仕入先名], '-') AS [仕入先名],
 ISNULL(t3.[店舗名], '-') AS [店舗名],
 ISNULL(t4.[部門名], '-') AS [部門名],
 CAST('EOS以外' AS varchar(20)) AS [伝票種別_名称],
 CAST(
  CASE
   WHEN t5.[仕入先ｺｰﾄﾞ] IS NULL THEN 1
   ELSE 0
  END AS tinyint) AS [伝票レス],
 CAST(2 AS int) AS [データソース]
FROM t1
LEFT OUTER JOIN [M_仕入先] t2
ON t1.[仕入先ｺｰﾄﾞ] = t2.[仕入先ｺｰﾄﾞ]
LEFT OUTER JOIN [M_店舗] t3
ON t1.[会社店ｺｰﾄﾞ] = t3.[会社店ｺｰﾄﾞ]
LEFT OUTER JOIN [M_部門] t4
ON t3.[会社ｺｰﾄﾞ] = t4.[会社ｺｰﾄﾞ]
 AND t1.[部門ｺｰﾄﾞ] = t4.[部門ｺｰﾄﾞ]
LEFT OUTER JOIN [K_伝票レス対象外] t5
ON t1.[仕入先ｺｰﾄﾞ] = t5.[仕入先ｺｰﾄﾞ]
 AND t1.[部門ｺｰﾄﾞ] = t5.[部門ｺｰﾄﾞ]
 AND t3.[会社ｺｰﾄﾞ] = t5.[会社コード]

GO
