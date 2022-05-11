Public Class _default
    Inherits System.Web.UI.Page

    Protected ReadOnly Property _screen_納品日_from As DateTime?
        Get
            Try
                Return DateTime.ParseExact(tbx_納品日_from.Text, "yyyy/MM/dd", Globalization.CultureInfo.InvariantCulture)
            Catch
                Return Nothing
            End Try
        End Get
    End Property

    Protected ReadOnly Property _screen_納品日_to As DateTime?
        Get
            Try
                Return DateTime.ParseExact(tbx_納品日_to.Text, "yyyy/MM/dd", Globalization.CultureInfo.InvariantCulture)
            Catch
                Return Nothing
            End Try
        End Get
    End Property

    Protected ReadOnly Property _screen_会社 As String
        Get
            Try
                Dim val As String = rbl_会社.SelectedValue

                If val = String.Empty Then
                    Return Nothing
                Else
                    Return val
                End If
            Catch
                Return Nothing
            End Try
        End Get
    End Property

    Protected ReadOnly Property _screen_店舗 As Integer?
        Get
            Try
                Dim val As Integer = Integer.Parse(ddl_店舗.SelectedValue)

                If val = 0 Then
                    Return Nothing
                Else
                    Return val
                End If
            Catch
                Return Nothing
            End Try
        End Get
    End Property

    Protected ReadOnly Property _screen_部門 As Short?
        Get
            Try
                Dim val As Short = Short.Parse(ddl_部門.SelectedValue)

                If val = 0 Then
                    Return Nothing
                Else
                    Return val
                End If
            Catch
                Return Nothing
            End Try
        End Get
    End Property

    Protected ReadOnly Property _screen_伝票番号 As Double?
        Get
            Try
                Return Double.Parse(tbx_伝票番号.Text)
            Catch
                Return Nothing
            End Try
        End Get
    End Property

    Protected ReadOnly Property _screen_仕入先 As Short?
        Get
            Try
                Dim val As Short = Short.Parse(ddl_仕入先.SelectedValue)

                If val = 0 Then
                    Return Nothing
                Else
                    Return val
                End If
            Catch
                Return Nothing
            End Try
        End Get
    End Property

    Protected ReadOnly Property _screen_JANコード As Double?
        Get
            Try
                Return Double.Parse(tbx_JANコード.Text)
            Catch
                Return Nothing
            End Try
        End Get
    End Property

    ''' <summary>
    '''     伝票種別
    ''' </summary>
    ''' <returns>
    '''     bit1：EOS発注
    '''     bit2：EOS特売
    '''     bit3：EOS以外
    ''' </returns>
    Protected ReadOnly Property _screen_伝票種別 As Byte
        Get
            Dim val As Byte = 0

            If chk_伝票種別_EOS発注.Checked Then
                val = val Or 1
            End If
            'If chk_伝票種別_EOS特売.Checked Then
            'val = val Or 2
            'End If
            If chk_伝票種別_EOS以外.Checked Then
                val = val Or 4
            End If

            Return val
        End Get
    End Property

    ''' <summary>
    '''     伝票レス
    ''' </summary>
    ''' <returns>
    '''     bit1：対応
    '''     bit2：非対応
    ''' </returns>
    Protected ReadOnly Property _screen_伝票レス As Byte
        Get
            Dim val As Byte = 0

            If chk_伝票レス_対応.Checked Then
                val = val Or 1
            End If
            If chk_伝票レス_非対応.Checked Then
                val = val Or 2
            End If

            Return val
        End Get
    End Property

    ''' <summary>
    '''     確定区分
    ''' </summary>
    ''' <returns>
    '''     bit1：済
    '''     bit2：未
    ''' </returns>
    Protected ReadOnly Property _screen_確定区分 As Byte
        Get
            Dim val As Byte = 0

            If chk_確定区分_済.Checked Then
                val = val Or 1
            End If
            If chk_確定区分_未.Checked Then
                val = val Or 2
            End If

            Return val
        End Get
    End Property

    Protected ReadOnly Property _screen_確定日 As DateTime?
        Get
            Try
                Return DateTime.ParseExact(tbx_確定日.Text, "yyyy/MM/dd", Globalization.CultureInfo.InvariantCulture)
            Catch
                Return Nothing
            End Try
        End Get
    End Property

    Protected Overrides Sub OnPreInit(e As EventArgs)
        MyBase.OnPreInit(e)

        If IsPostBack Then
            If Me.Session(Const_App.WebSrvSession.Session_SessionId) Is Nothing Then
                Dim errPrms As Dictionary(Of String, String) = New Dictionary(Of String, String)(2)
                errPrms(Const_App.ErrorPaqe.Key_ErrorMsg) = Const_App.ErrorPaqe.ErrMsg1
                errPrms(Const_App.ErrorPaqe.Key_NavUrl) = Request.RawUrl

                Session(Const_App.UrlParam.Session_Param) = errPrms

                Response.Redirect("~/error1.aspx", True)
            End If
        Else
            Me.Session(Const_App.WebSrvSession.Session_SessionId) = Session.SessionID
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsPostBack Then
            Return
        End If

        initCtrl()
    End Sub

    Private Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not ScriptManager1.IsInAsyncPostBack Then
            Return
        End If

        Select Case Request.Params("__EVENTARGUMENT")
            Case "tbx_店舗_Changed"
                ddl_店舗_SelectedIndexChanged(Nothing, Nothing)
                up_4.Update()
            Case "tbx_部門_Changed"
                ddl_部門_SelectedIndexChanged(Nothing, Nothing)
                up_4.Update()
        End Select
    End Sub

    ' ポストバック実行スクリプトを取得する。
    ' スクリプト側では、以下の置換を行う。
    '      {0}：UniqueID に相当する ID      サーバ側では、this.Request.Params("__EVENTTARGET") で取得される
    '      {1}：ポストバック引数            サーバ側では、this.Request.Params("__EVENTARGUMENT") で取得される
    Public Function GetPostBackScript() As String
        Dim script As String = Page.ClientScript.GetPostBackEventReference(btn_dummy, "{1}") + ";"
        script = script.Replace(btn_dummy.UniqueID, "{0}")

        Return script.Replace(Chr(34), "'"c)
    End Function

    Protected Sub initCtrl()
        lrl_capWnd.Text = SettingConfig.WindowCaption
        lrl_version.Text = System.Reflection.Assembly.GetExecutingAssembly().GetName().Version.ToString()

        rbl_会社.SelectedValue = "10,31"
        rbl_会社_SelectedIndexChanged(Nothing, Nothing)

        tbx_納品日_from.Text = DateTime.Now.ToString("yyyy/MM/dd")
        tbx_納品日_to.Text = tbx_納品日_from.Text

        uc_ListPager_Item.Init_ListPager(New String() {rep_1.ID}, db_伝票_ヘッダ.EmptyTable_01, SettingConfig.ListRowCount)

        lockList(False)

        If Request.Params.AllKeys.Contains(SettingConfig.PostParam_MenuUrl) Then
            lbtn_toMenu.Visible = True
            lbtn_toMenu.PostBackUrl = Request.Params(SettingConfig.PostParam_MenuUrl)
            hgc_col1.Attributes("style") = "width: 7em;"
        Else
            lbtn_toMenu.Visible = False
            hgc_col1.Attributes("style") = "width: 0;"
        End If
    End Sub

    Protected Sub lockList(val As Boolean)
        Dim not_val As Boolean = Not val

        tbx_納品日_from.Enabled = not_val
        ibtn_納品日_from.Enabled = not_val
        tbx_納品日_to.Enabled = not_val
        ibtn_納品日_to.Enabled = not_val
        rbl_会社.Enabled = not_val

        ddl_店舗.Enabled = not_val
        tbx_店舗.Enabled = not_val
        ddl_部門.Enabled = not_val
        tbx_部門.Enabled = not_val
        tbx_伝票番号.Enabled = not_val
        ddl_仕入先.Enabled = not_val
        tbx_仕入先.Enabled = not_val
        tbx_JANコード.Enabled = not_val

        chk_伝票種別_EOS発注.Enabled = not_val
        'chk_伝票種別_EOS特売.Enabled = not_val
        chk_伝票種別_EOS以外.Enabled = not_val
        chk_伝票レス_対応.Enabled = not_val
        chk_伝票レス_非対応.Enabled = not_val
        chk_確定区分_済.Enabled = not_val
        chk_確定区分_未.Enabled = not_val

        tbx_確定日.Enabled = not_val
        ibtn_確定日.Enabled = not_val

        btn_Search.Enabled = not_val
        btn_Search_mikakutei.Enabled = not_val
        btn_Clear.Enabled = val
        btn_condReset.Enabled = not_val

        Dim sb As StringBuilder = New StringBuilder(500)
        sb.Append("<script type=""text/javascript"">")
        sb.Append(" setTimeout(""$find('cpe_SearchPrm_1')._doOpen();"", 200);")
        sb.Append("</script>")
        ScriptManager.RegisterStartupScript(Me, Me.GetType(), "Rss__default_01", sb.ToString(), False)
    End Sub

    Protected Sub selectData()
        Dim tbl As DataTable = db_伝票_ヘッダ.Select_01(_screen_納品日_from, _screen_納品日_to, _screen_会社, _screen_店舗, _screen_部門, _screen_伝票番号, _screen_仕入先, _screen_JANコード, _screen_伝票種別, _screen_伝票レス, _screen_確定区分, _screen_確定日)

        uc_ListPager_Item.Init_ListPager(New String() {rep_1.ID}, tbl, SettingConfig.ListRowCount)

        lrl_納品原価合計.Text = tbl.AsEnumerable().Select(Function(a) a.Field(Of Decimal)("原価金額合計")).Sum().ToString("#,0.00")
        lrl_納品売価合計.Text = tbl.AsEnumerable().Select(Function(a) a.Field(Of Decimal)("売上金額合計")).Sum().ToString("#,0.00")
    End Sub

    Protected Sub rbl_会社_SelectedIndexChanged(sender As Object, e As EventArgs)
        ddl_店舗.DataSource = db_マスタ.Select_店舗_DdlSrc(_screen_会社)
        ddl_店舗.DataBind()
        tbx_店舗.Text = ddl_店舗.SelectedValue

        ddl_部門.DataSource = db_マスタ.Select_部門_DdlSrc(_screen_会社)
        ddl_部門.DataBind()
        tbx_部門.Text = ddl_部門.SelectedValue

        ddl_仕入先.DataSource = db_マスタ.Select_仕入先_DdlSrc(_screen_会社, _screen_店舗, _screen_部門)
        ddl_仕入先.DataBind()
        tbx_仕入先.Text = ddl_仕入先.SelectedValue
    End Sub

    Protected Sub ddl_店舗_SelectedIndexChanged(sender As Object, e As EventArgs)
        ddl_仕入先.DataSource = db_マスタ.Select_仕入先_DdlSrc(_screen_会社, _screen_店舗, _screen_部門)
        ddl_仕入先.DataBind()
        tbx_仕入先.Text = ddl_仕入先.SelectedValue
    End Sub

    Protected Sub ddl_部門_SelectedIndexChanged(sender As Object, e As EventArgs)
        ddl_仕入先.DataSource = db_マスタ.Select_仕入先_DdlSrc(_screen_会社, _screen_店舗, _screen_部門)
        ddl_仕入先.DataBind()
        tbx_仕入先.Text = ddl_仕入先.SelectedValue
    End Sub

    Protected Sub btn_Search_Click(sender As Object, e As EventArgs)
        Do
            If _screen_店舗 IsNot Nothing Then
                Exit Do
            End If
            If _screen_部門 IsNot Nothing Then
                Exit Do
            End If
            If _screen_仕入先 IsNot Nothing Then
                Exit Do
            End If
            If _screen_伝票番号 IsNot Nothing Then
                Exit Do
            End If
            If _screen_JANコード IsNot Nothing Then
                Exit Do
            End If

            Me.uc_Express.ShowPopup("ＤＢ", "次の項目から、１つ以上を指定してください。<br /> &nbsp;&nbsp;[店舗], [部門], [仕入先], [伝票番号], [JANコード]")

            Return
        Loop While False

        selectData()

        lockList(True)
    End Sub

    Protected Sub btn_Search_mikakutei_Click(sender As Object, e As EventArgs)
        ddl_店舗.SelectedValue = "0"
        tbx_店舗.Text = "0"

        ddl_部門.SelectedValue = "0"
        tbx_部門.Text = "0"

        tbx_伝票番号.Text = String.Empty

        ddl_仕入先.SelectedValue = "0"
        tbx_仕入先.Text = "0"

        tbx_JANコード.Text = String.Empty

        chk_伝票種別_EOS発注.Checked = True
        'chk_伝票種別_EOS特売.Checked = True
        chk_伝票種別_EOS以外.Checked = False

        chk_伝票レス_対応.Checked = True
        chk_伝票レス_非対応.Checked = False

        chk_確定区分_済.Checked = False
        chk_確定区分_未.Checked = True

        tbx_確定日.Text = "____/__/__"

        selectData()

        lockList(True)
    End Sub

    Protected Sub btn_Clear_Click(sender As Object, e As EventArgs)
        uc_ListPager_Item.Init_ListPager(New String() {rep_1.ID}, db_伝票_ヘッダ.EmptyTable_01, SettingConfig.ListRowCount)

        lockList(False)

        lrl_納品原価合計.Text = String.Empty
        lrl_納品売価合計.Text = String.Empty
    End Sub

    Protected Sub btn_condReset_Click(sender As Object, e As EventArgs)
        tbx_納品日_from.Text = DateTime.Now.ToString("yyyy/MM/dd")
        tbx_納品日_to.Text = tbx_納品日_from.Text

        rbl_会社.SelectedValue = "10,31"
        rbl_会社_SelectedIndexChanged(Nothing, Nothing)

        tbx_伝票番号.Text = String.Empty

        ddl_仕入先.SelectedValue = "0"
        tbx_仕入先.Text = "0"

        tbx_JANコード.Text = String.Empty

        chk_伝票種別_EOS発注.Checked = True
        'chk_伝票種別_EOS特売.Checked = True
        chk_伝票種別_EOS以外.Checked = True

        chk_伝票レス_対応.Checked = True
        chk_伝票レス_非対応.Checked = True

        chk_確定区分_済.Checked = True
        chk_確定区分_未.Checked = True

        tbx_確定日.Text = "____/__/__"
    End Sub

    Protected Sub rep_1_ItemDataBound(sender As Object, e As RepeaterItemEventArgs)
        If e.Item.ItemType <> ListItemType.Item AndAlso e.Item.ItemType <> ListItemType.AlternatingItem Then
            Return
        End If

        Dim tc As HtmlTableCell
        For a As Integer = 1 To 4
            tc = DirectCast(e.Item.FindControl("val1_" + a.ToString("d")), HtmlTableCell)
            If tc.InnerText.Trim()(0) = "-"c Then
                tc.Style("color") = "red"
            End If
        Next

        Dim kaiTenCd As Integer = DirectCast(DataBinder.Eval(e.Item.DataItem, "会社店ｺｰﾄﾞ"), Integer),
            bumonCd As Short = DirectCast(DataBinder.Eval(e.Item.DataItem, "部門ｺｰﾄﾞ"), Short),
            siireCd As Short = DirectCast(DataBinder.Eval(e.Item.DataItem, "仕入先ｺｰﾄﾞ"), Short),
            denNo As Double = DirectCast(DataBinder.Eval(e.Item.DataItem, "伝票番号"), Double)

        Dim rep As Repeater = DirectCast(e.Item.FindControl("rep_2"), Repeater)
        rep.DataSource = db_伝票_データ.Select_01(kaiTenCd, bumonCd, siireCd, denNo)
        rep.DataBind()

        Dim report As HyperLink = DirectCast(e.Item.FindControl("hl_report"), HyperLink)
        report.NavigateUrl = String.Format("~/frm_DenpyoDetail.aspx?kaiTenCd={0}&bumonCd={1}&siireCd={2}&denNo={3}",
                                           kaiTenCd.ToString("d"), bumonCd.ToString("d"), siireCd.ToString("d"), CLng(denNo).ToString("d"))
        report.Target = "_blank"
    End Sub

    Protected Sub rep_2_ItemDataBound(sender As Object, e As RepeaterItemEventArgs)
        If e.Item.ItemType <> ListItemType.Item AndAlso e.Item.ItemType <> ListItemType.AlternatingItem Then
            Return
        End If

        Dim tc As HtmlTableCell
        For a As Integer = 1 To 2
            tc = DirectCast(e.Item.FindControl("val2_" + a.ToString("d")), HtmlTableCell)
            If tc.InnerText.Trim()(0) = "-"c Then
                tc.Style("color") = "red"
            End If
        Next
    End Sub
End Class
