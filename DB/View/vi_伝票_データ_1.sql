USE [DCENTER]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[vi_伝票_データ_1]') AND type in (N'V'))
DROP VIEW [dbo].[vi_伝票_データ_1]
GO

/****** Object:  View [dbo].[vi_伝票_データ_1]    Script Date: 2021/10/07 16:10:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vi_伝票_データ_1]
AS
SELECT *
FROM vi_F_伝票明細_1
UNION ALL
SELECT *
FROM vi_F_入庫受信_1

GO
