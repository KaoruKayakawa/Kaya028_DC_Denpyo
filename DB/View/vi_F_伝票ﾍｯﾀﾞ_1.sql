USE [DCENTER]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vi_F_伝票ﾍｯﾀﾞ_1]') AND type in (N'V'))
DROP VIEW [dbo].[vi_F_伝票ﾍｯﾀﾞ_1]
GO

/****** Object:  View [dbo].[vi_F_伝票ﾍｯﾀﾞ_1]    Script Date: 2021/10/07 16:28:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vi_F_伝票ﾍｯﾀﾞ_1]
AS
WITH
 t2 AS (
  SELECT [会社店ｺｰﾄﾞ], [部門ｺｰﾄﾞ], [仕入先ｺｰﾄﾞ], [伝票番号], COUNT(*) AS [明細件数]
  FROM [F_伝票明細]
  GROUP BY [会社店ｺｰﾄﾞ], [部門ｺｰﾄﾞ], [仕入先ｺｰﾄﾞ], [伝票番号]
 )
SELECT
 t1.[仕入先ｺｰﾄﾞ],
 t1.[最終納品日],
 t1.[発注日],
 t1.[便区分],
 t1.[伝票番号],
 t1.[会社店ｺｰﾄﾞ],
 t1.[部門ｺｰﾄﾞ],
 t1.[発注ﾊﾞﾗ数量合計] AS [発注数量合計],
 t1.[納品ﾊﾞﾗ数量合計] AS [納品数量合計],
 t1.[検品ﾊﾞﾗ数量合計] AS [検品数量合計],
 t1.[納品原価金額合計] AS [原価金額合計],
 t1.[納品売上金額合計] AS [売上金額合計],
 t1.[確定区分],
 CASE t1.[確定日時]
  WHEN '1901-01-01' THEN NULL
  ELSE t1.[確定日時]
 END AS [確定-受信_日時],
 CASE t1.[取消日付]
  WHEN '1901-01-01' THEN NULL
  ELSE t1.[取消日付]
 END AS [取消日付],
 CAST('01' AS varchar(2)) AS [伝票種別],
 ISNULL(t2.[明細件数], 0) AS [明細件数],
 ISNULL(t3.[仕入先名], '-') AS [仕入先名],
 ISNULL(t4.[店舗名], '-') AS [店舗名],
 ISNULL(t5.[部門名], '-') AS [部門名],
 CAST('EOS発注' AS varchar(20)) AS [伝票種別_名称],
 CAST(
  CASE
   WHEN t6.[仕入先ｺｰﾄﾞ] IS NULL THEN 1
   ELSE 0
  END AS tinyint) AS [伝票レス],
 CAST(1 AS int) AS [データソース]
FROM [F_伝票ﾍｯﾀﾞ] t1
LEFT OUTER JOIN t2
ON t1.[会社店ｺｰﾄﾞ] = t2.[会社店ｺｰﾄﾞ]
 AND t1.[部門ｺｰﾄﾞ] = t2.[部門ｺｰﾄﾞ]
 AND t1.[仕入先ｺｰﾄﾞ] = t2.[仕入先ｺｰﾄﾞ]
 AND t1.[伝票番号] = t2.[伝票番号]
LEFT OUTER JOIN [M_仕入先] t3
ON t1.[仕入先ｺｰﾄﾞ] = t3.[仕入先ｺｰﾄﾞ]
LEFT OUTER JOIN [M_店舗] t4
ON t1.[会社店ｺｰﾄﾞ] = t4.[会社店ｺｰﾄﾞ]
LEFT OUTER JOIN [M_部門] t5
ON t4.[会社ｺｰﾄﾞ] = t5.[会社ｺｰﾄﾞ]
 AND t1.[部門ｺｰﾄﾞ] = t5.[部門ｺｰﾄﾞ]
LEFT OUTER JOIN [K_伝票レス対象外] t6
ON t1.[仕入先ｺｰﾄﾞ] = t6.[仕入先ｺｰﾄﾞ]
 AND t1.[部門ｺｰﾄﾞ] = t6.[部門ｺｰﾄﾞ]
 AND t4.[会社ｺｰﾄﾞ] = t6.[会社コード]

GO
