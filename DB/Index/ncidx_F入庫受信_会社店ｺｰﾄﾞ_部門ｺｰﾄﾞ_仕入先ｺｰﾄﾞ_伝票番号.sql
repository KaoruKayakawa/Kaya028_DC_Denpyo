USE [DCENTER]
GO

/****** Object:  Index [ncidx_F入庫受信_会社店ｺｰﾄﾞ_部門ｺｰﾄﾞ_仕入先ｺｰﾄﾞ_伝票番号]    Script Date: 2021/11/12 18:41:58 ******/
CREATE NONCLUSTERED INDEX [ncidx_F入庫受信_会社店ｺｰﾄﾞ_部門ｺｰﾄﾞ_仕入先ｺｰﾄﾞ_伝票番号] ON [dbo].[F_入庫受信]
(
	[会社店ｺｰﾄﾞ] ASC,
	[部門ｺｰﾄﾞ] ASC,
	[仕入先ｺｰﾄﾞ] ASC,
	[伝票番号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
