USE [DCENTER]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vi_F_伝票明細_1]') AND type in (N'V'))
DROP VIEW [dbo].[vi_F_伝票明細_1]
GO

/****** Object:  View [dbo].[vi_F_伝票明細_1]    Script Date: 2021/10/07 16:09:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vi_F_伝票明細_1]
AS
SELECT
 [会社店ｺｰﾄﾞ],
 [仕入先ｺｰﾄﾞ],
 [部門ｺｰﾄﾞ],
 [伝票番号],
 [行番号],
 [JANｺｰﾄﾞ],
 [商品名],
 [規格],
 [発注ﾊﾞﾗ数],
 [納品ﾊﾞﾗ数],
 [検品ﾊﾞﾗ数],
 [原単価],
 [売単価]
FROM [F_伝票明細]

GO
