Imports Microsoft.Reporting.WebForms

Public Class frm_DenpyoDetail
	Inherits System.Web.UI.Page

	Protected Overrides Sub OnPreInit(e As EventArgs)
		MyBase.OnPreInit(e)

		If IsPostBack Then
			If Me.Session(Const_App.WebSrvSession.Session_SessionId) Is Nothing Then
				Dim errPrms As Dictionary(Of String, String) = New Dictionary(Of String, String)(1)
				errPrms(Const_App.ErrorPaqe.Key_ErrorMsg) = Const_App.ErrorPaqe.ErrMsg1

				Session(Const_App.UrlParam.Session_Param) = errPrms

				Response.Redirect("~/error1.aspx", True)
			End If

			' Session ID の設定は、一覧ページでのみ行う。ユーザー操作上、分かり良いため。
#If False Then
		Else
			Me.Session(Const_App.WebSrvSession.Session_SessionId) = Session.SessionID
#End If

		End If
	End Sub

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
		If Me.IsPostBack Then
			Return
		End If

		If Request.QueryString("kaiTenCd") Is Nothing Then
			Return
		End If
		If Request.QueryString("bumonCd") Is Nothing Then
			Return
		End If
		If Request.QueryString("siireCd") Is Nothing Then
			Return
		End If
		If Request.QueryString("denNo") Is Nothing Then
			Return
		End If

		'ReportViewer1.ProcessingMode = ProcessingMode.Local

		Dim rdlc As LocalReport = ReportViewer1.LocalReport
		rdlc.ReportPath = "rep_DenpyoDetail.rdlc"

		rdlc.DataSources.Clear()
		rdlc.DataSources.Add(New ReportDataSource("DataSet1", db_伝票_レポート_1.Select_01(
												  Integer.Parse(Request.QueryString("kaiTenCd")),
												  Short.Parse(Request.QueryString("bumonCd")),
												  Short.Parse(Request.QueryString("siireCd")),
												  Double.Parse(Request.QueryString("denNo")))))

		'ReportViewer1.DataBind()
		'rdlc.Refresh()
	End Sub

End Class