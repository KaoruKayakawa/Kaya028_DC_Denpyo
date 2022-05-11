USE [DCENTER]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ft_伝票_1]') AND type in (N'IF'))
DROP FUNCTION [dbo].[ft_伝票_1]
GO

/****** Object:  UserDefinedFunction [dbo].[ft_伝票_1]    Script Date: 2021/11/03 9:45:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		kayakawa
-- Create date: 2021-11-03
-- Description:	
-- =============================================
CREATE FUNCTION [dbo].[ft_伝票_1]
(	
	-- Add the parameters for the function here
	@kaiTenCd int, @bumonCd smallint, @siireCd smallint, @denNo float
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	
	WITH
		t1 AS (
			SELECT *
			FROM [vi_伝票_ヘッダ_1]
			WHERE [会社店ｺｰﾄﾞ] = @kaiTenCd
				AND [部門ｺｰﾄﾞ] = @bumonCd
				AND [仕入先ｺｰﾄﾞ] = @siireCd
				AND [伝票番号] = @denNo
		),
		t2 AS (
			SELECT 
				[行番号] AS [明細_行番号],
				[JANｺｰﾄﾞ] AS [明細_JANｺｰﾄﾞ],
				[商品名] AS [明細_商品名],
				[規格] AS [明細_規格],
				[発注ﾊﾞﾗ数] AS [明細_発注ﾊﾞﾗ数],
				[納品ﾊﾞﾗ数] AS [明細_納品ﾊﾞﾗ数],
				[検品ﾊﾞﾗ数] AS [明細_検品ﾊﾞﾗ数],
				[原単価] AS [明細_原単価],
				[売単価] AS [明細_売単価]
			FROM [vi_伝票_データ_1]
			WHERE [会社店ｺｰﾄﾞ] = @kaiTenCd
				AND [部門ｺｰﾄﾞ] = @bumonCd
				AND [仕入先ｺｰﾄﾞ] = @siireCd
				AND [伝票番号] = @denNo
		)
	SELECT t1.*, t2.*
	FROM t1
	CROSS JOIN t2
)
GO
