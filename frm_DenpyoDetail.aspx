<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="frm_DenpyoDetail.aspx.vb" Inherits="Kaya028_DC_Denpyo.frm_DenpyoDetail" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

    <asp:PlaceHolder ID="PlaceHolder1" runat="server">
        <%: System.Web.Optimization.Styles.Render("~/Styles/CSS") %>
        <%: System.Web.Optimization.Scripts.Render("~/Scripts/JS") %>
    </asp:PlaceHolder>
</head>
<body onload="history.forward();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" AsyncPostBackTimeout="200"></asp:ScriptManager>

        <rsweb:ReportViewer ID="ReportViewer1" runat="server" ProcessingMode="Local" Width="297mm" Height="210mm"></rsweb:ReportViewer>
    </form>
</body>
</html>
