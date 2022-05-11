USE [DCENTER]
GO

/****** Object:  Index [NonClusteredIndex-20211112-170417]    Script Date: 2021/11/12 18:07:43 ******/
CREATE NONCLUSTERED INDEX [ncidx_F伝票ﾍｯﾀﾞ_会社店ｺｰﾄﾞ_部門ｺｰﾄﾞ_仕入先ｺｰﾄﾞ_伝票番号] ON [dbo].[F_伝票ﾍｯﾀﾞ]
(
	[会社店ｺｰﾄﾞ] ASC,
	[部門ｺｰﾄﾞ] ASC,
	[仕入先ｺｰﾄﾞ] ASC,
	[伝票番号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
