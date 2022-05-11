USE [DCENTER]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vi_伝票_ヘッダ_1]') AND type in (N'V'))
DROP VIEW [dbo].[vi_伝票_ヘッダ_1]
GO

/****** Object:  View [dbo].[vi_伝票_ヘッダ_1]    Script Date: 2021/10/07 16:10:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vi_伝票_ヘッダ_1]
AS
SELECT *
FROM vi_F_伝票ﾍｯﾀﾞ_1
UNION ALL
SELECT *
FROM vi_F_入庫受信_ヘッダ_1

GO
