USE [DCENTER]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vi_F_入庫受信_1]') AND type in (N'V'))
DROP VIEW [dbo].[vi_F_入庫受信_1]
GO

/****** Object:  View [dbo].[vi_F_入庫受信_1]    Script Date: 2021/10/07 16:09:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vi_F_入庫受信_1]
AS
SELECT
 [会社店ｺｰﾄﾞ],
 [仕入先ｺｰﾄﾞ],
 [部門ｺｰﾄﾞ],
 [伝票番号],
 [行番号],
 [JANｺｰﾄﾞ],
 [商品名漢字] AS [商品名],
 [規格漢字] AS [規格],
 CAST(NULL AS decimal(6, 1)) AS [発注ﾊﾞﾗ数],
 [納品バラ数] AS [納品ﾊﾞﾗ数],
 [検品ﾊﾞﾗ数],
 [原価] AS [原単価],
 [売価] AS [売単価]
FROM [F_入庫受信]
WHERE [伝票区分] IN ('01', '08')
UNION ALL
SELECT
 [会社店ｺｰﾄﾞ],
 [仕入先ｺｰﾄﾞ],
 [部門ｺｰﾄﾞ],
 [伝票番号],
 [行番号],
 [JANｺｰﾄﾞ],
 [商品名漢字] AS [商品名],
 [規格漢字] AS [規格],
 CAST(NULL AS decimal(6, 1)) AS [発注ﾊﾞﾗ数],
 - [納品バラ数] AS [納品ﾊﾞﾗ数],
 - [検品ﾊﾞﾗ数],
 [原価] AS [原単価],
 [売価] AS [売単価]
FROM [F_入庫受信]
WHERE [伝票区分] IN ('02', '04')
GO
