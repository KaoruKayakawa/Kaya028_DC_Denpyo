<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="default.aspx.vb" Inherits="Kaya028_DC_Denpyo._default" %>

<%@ Register src="~/PopUp/Express.ascx" tagname="Express" tagprefix="uc1" %>
<%@ Register src="~/UserControl/ListPager.ascx" tagname="ListPager" tagprefix="uc1" %>

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
<body onload="history.forward();" onresize="adjust_divListHeight_2t();">
    <form id="form1" runat="server">
		<asp:Button ID="btn_dummy" runat="server" UseSubmitBehavior="false" Text="dummy" OnClientClick="return false;" Style="display: none;" />
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="true" AsyncPostBackTimeout="200"></asp:ScriptManager>

        <asp:UpdatePanel ID="up_1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
            <ContentTemplate>
                <table id="tbl_Head" style="width: 100%;">
                    <colgroup>
                        <col style="width: 100%;" />
                    </colgroup>
                    <tr>
                        <td style="background-color: linen; border: solid 2px rosybrown; padding: 2px;">
                            <table style="background-color: rosybrown; color: white; width: 100%;">
                                <colgroup>
                                    <col id="hgc_col1" runat="server" />
                                    <col />
                                    <col style="width: 20em;" />
                                </colgroup>
                                <tr>
                                    <td style="text-align: right; padding-right: 10px; font-size: 13px; font-weight: bold;">
                                        <asp:LinkButton ID="lbtn_toMenu" runat="server" ForeColor="paleturquoise" Text="MENU　&gt;" />
                                    </td>
                                    <td style="padding: 2px 0; font-size: 17px; font-weight: bold;">
                                        <asp:Literal ID="lrl_capWnd" runat="server" />
                                    </td>
                                    <td style="text-align: right; padding-right: 20px; font-size: 11px;">Ver： <asp:Literal ID="lrl_version" runat="server" /></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 10px;"><td></td></tr>
                    <tr>
                        <td style="padding-left: 1em;">
                            <table style="width: 100%;">
                                <colgroup>
                                    <col style="width: 7em;" />
                                    <col style="width: 20em;" />
                                    <col style="width: 7em;" />
                                    <col />
                                    <col style="width: 10em;" />
                                    <col style="width: 8em;" />
                                    <col style="width: 12em;" />
                                </colgroup>
                                <tr>
                                    <td style="text-align: right; padding-right: 15px;">
                                        納品日：
                                    </td>
                                    <td>
                                        <asp:TextBox ID="tbx_納品日_from" runat="server" Style="width: 6em;" />
                                        <asp:ImageButton ID="ibtn_納品日_from" runat="server" ImageUrl="~/Images/Calendar_scheduleHS.png" AlternateText="click to show calendar" />
                                        <ajaxToolkit:CalendarExtender ID="tbx_納品日_from_CalendarExtender" runat="server" Enabled="True"
                                            Format="yyyy/MM/dd" TargetControlID="tbx_納品日_from" PopupButtonID="ibtn_納品日_from" />
                                        <ajaxToolkit:MaskedEditExtender ID="tbx_納品日_from_MaskedEditExtender" runat="server"
                                            ClearMaskOnLostFocus="False" Enabled="True" MaskType="Date" Mask="9999/99/99" TargetControlID="tbx_納品日_from" />
                                        <asp:CustomValidator id="tbx_納品日_from_CustomValidator" runat="server" ControlToValidate="tbx_納品日_from" ValidationGroup="ValGrp1" Display="None"
                                            ErrorMessage="日付 （1900/01/01 ～）<br />を入力して下さい。" ClientValidationFunction="date_validateInputValue_notNull" />
                                        <ajaxToolkit:ValidatorCalloutExtender ID="tbx_納品日_from_CustomValidator_ValidatorCalloutExtender" PopupPosition="BottomLeft"
                                            runat="server" Enabled="True" TargetControlID="tbx_納品日_from_CustomValidator" />
                                        <asp:CustomValidator id="tbx_納品日_from_CustomValidator2" runat="server" ControlToValidate="tbx_納品日_from" ValidationGroup="ValGrp2" Display="None"
                                            ErrorMessage="日付 （1900/01/01 ～）<br />を入力して下さい。" ClientValidationFunction="date_validateInputValue_notNull" />
                                        <ajaxToolkit:ValidatorCalloutExtender ID="tbx_納品日_from_CustomValidator2_ValidatorCalloutExtender" PopupPosition="BottomLeft"
                                            runat="server" Enabled="True" TargetControlID="tbx_納品日_from_CustomValidator2" />
                                        &nbsp;～&nbsp;
                                        <asp:TextBox ID="tbx_納品日_to" runat="server" Style="width: 6em;" />
                                        <asp:ImageButton ID="ibtn_納品日_to" runat="server" ImageUrl="~/Images/Calendar_scheduleHS.png" AlternateText="click to show calendar" />
                                        <ajaxToolkit:CalendarExtender ID="tbx_納品日_to_CalendarExtender" runat="server" Enabled="True"
                                            Format="yyyy/MM/dd" TargetControlID="tbx_納品日_to" PopupButtonID="ibtn_納品日_to" />
                                        <ajaxToolkit:MaskedEditExtender ID="tbx_納品日_to_MaskedEditExtender" runat="server"
                                            ClearMaskOnLostFocus="False" Enabled="True" MaskType="Date" Mask="9999/99/99" TargetControlID="tbx_納品日_to" />
                                        <asp:CustomValidator id="tbx_納品日_to_CustomValidator" runat="server" ControlToValidate="tbx_納品日_to" ValidationGroup="ValGrp1" Display="None"
                                            ErrorMessage="日付 （1900/01/01 ～）<br />を入力して下さい。" ClientValidationFunction="date_validateInputValue_notNull" />
                                        <ajaxToolkit:ValidatorCalloutExtender ID="tbx_納品日_to_CustomValidator_ValidatorCalloutExtender" PopupPosition="BottomLeft"
                                            runat="server" Enabled="True" TargetControlID="tbx_納品日_to_CustomValidator" />
                                        <asp:CustomValidator id="tbx_納品日_to_CustomValidator2" runat="server" ControlToValidate="tbx_納品日_to" ValidationGroup="ValGrp2" Display="None"
                                            ErrorMessage="日付 （1900/01/01 ～）<br />を入力して下さい。" ClientValidationFunction="date_validateInputValue_notNull" />
                                        <ajaxToolkit:ValidatorCalloutExtender ID="tbx_納品日_to_CustomValidator2_ValidatorCalloutExtender" PopupPosition="BottomLeft"
                                            runat="server" Enabled="True" TargetControlID="tbx_納品日_to_CustomValidator2" />
                                    </td>
                                    <td style="text-align: right; padding-right: 0px;">
                                        会社：
                                    </td>
                                    <td>
                                        <!-- イベントが発生しない不具合への対応 -->
                                        <asp:UpdatePanel ID="up_3" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
                                            <ContentTemplate>
                                                <asp:RadioButtonList ID="rbl_会社" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rbl_会社_SelectedIndexChanged">
                                                    <asp:ListItem Value="10,31">サンシ&nbsp;&nbsp;</asp:ListItem>
                                                    <asp:ListItem Value="80">ベリー&nbsp;&nbsp;</asp:ListItem>
                                                </asp:RadioButtonList>
                                                <asp:RequiredFieldValidator ID="rbl_会社_RequiredFieldValidator" runat="server" Display="None" ValidationGroup="ValGrp1"
                                                    ErrorMessage="選択してください" ControlToValidate="rbl_会社" SetFocusOnError="true" />
                                                <ajaxToolkit:ValidatorCalloutExtender ID="rbl_会社_RequiredFieldValidator_ValidatorCalloutExtender" PopupPosition="BottomLeft"
                                                    runat="server" Enabled="True" TargetControlID="rbl_会社_RequiredFieldValidator" />
                                                <asp:RequiredFieldValidator ID="rbl_会社_RequiredFieldValidator2" runat="server" Display="None" ValidationGroup="ValGrp2"
                                                    ErrorMessage="選択してください" ControlToValidate="rbl_会社" SetFocusOnError="true" />
                                                <ajaxToolkit:ValidatorCalloutExtender ID="rbl_会社_RequiredFieldValidator2_ValidatorCalloutExtender" PopupPosition="BottomLeft"
                                                    runat="server" Enabled="True" TargetControlID="rbl_会社_RequiredFieldValidator2" />
                                            </ContentTemplate>
                                            <Triggers></Triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                    <td style="text-align: right;">
                                        <asp:Button ID="btn_Search" runat="server" CssClass="btn01" ValidationGroup="ValGrp1" Text="検 索" OnClick="btn_Search_Click" />
                                    </td>
                                    <td style="text-align: right;">
                                        <asp:Button ID="btn_Search_mikakutei" runat="server" ValidationGroup="ValGrp2" CssClass="btn01" Text="未確定全件" OnClick="btn_Search_mikakutei_Click"/>
                                    </td>
                                    <td style="padding-right: 2em; text-align: right;">
                                        <asp:Button ID="btn_Clear" runat="server" CssClass="btn01" Text="一覧クリア" OnClick="btn_Clear_Click" />
                                    </td>
                                </tr>
                                <tr style="height: 5px;"><td></td></tr>
                                <tr>
                                    <td colspan="4">
                                        <span style="color: steelblue;">その他検索条件&nbsp;</span>
                                        <asp:Image ID="img_SearchPrm_1" runat="server"  ImageUrl="~/Images/collapse_ivory.jpg" Style="vertical-align: middle; cursor: pointer;" />
                                        <span style="margin-left: 5em; color: steelblue;">合計表示&nbsp;</span>
                                        <asp:Image ID="img_SumVal_1" runat="server"  ImageUrl="~/Images/collapse_ivory.jpg" Style="vertical-align: middle; cursor: pointer;" />
                                    </td>
                                    <td colspan="3" style="padding-right: 2em; text-align: right;">
                                        <asp:Button ID="btn_condReset" runat="server" CssClass="btn01" Text="検索条件リセット" Style="font-size: 0.85em;" OnClick="btn_condReset_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Panel ID="pnl_SearchPrm_1" runat="server" Width="98%" Height="0" Style="background-color: linen; border: solid 1px rosybrown; padding: 3px 0; margin: 0 auto;">
                                <asp:UpdatePanel ID="up_2" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                                    <ContentTemplate>
                                        <table style="width: 100%;">
                                            <colgroup>
                                                <col style="width: 7em;" />
                                                <col style="width: 25em;" />
                                                <col style="width: 7em;" />
                                                <col style="width: 21em;" />
                                                <col style="width: 7em;" />
                                                <col style="width: 14em;" />
                                                <col />
                                            </colgroup>
                                            <tr>
                                                <td style="text-align: right; padding-right: 15px;">
                                                    店舗：
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddl_店舗" runat="server" Width="12em" DataTextField="店舗名" DataValueField="会社店ｺｰﾄﾞ"
                                                        AutoPostBack="true" OnSelectedIndexChanged="ddl_店舗_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                    &nbsp;
                                                    <asp:TextBox ID="tbx_店舗" runat="server" Width="8em" MaxLength="9" />
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="tbx_店舗_FilteredTextBoxExtender" runat="server"
                                                        TargetControlID="tbx_店舗" FilterType="Numbers" />
                                                </td>
                                                <td style="text-align: right; padding-right: 15px;">
                                                    部門：
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddl_部門" runat="server" Width="12em" DataTextField="部門名" DataValueField="部門ｺｰﾄﾞ"
                                                        AutoPostBack="true" OnSelectedIndexChanged="ddl_部門_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                    &nbsp;
                                                    <asp:TextBox ID="tbx_部門" runat="server" Width="4em" MaxLength="4" />
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="tbx_部門_FilteredTextBoxExtender" runat="server"
                                                        TargetControlID="tbx_部門" FilterType="Numbers" />
                                                </td>
                                                <td style="text-align: right; padding-right: 15px;">
                                                    伝票番号：
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="tbx_伝票番号" runat="server" Width="10em" MaxLength="12" />
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="tbx_伝票番号_FilteredTextBoxExtender" runat="server"
                                                        TargetControlID="tbx_伝票番号" FilterType="Numbers" />
                                                </td>
                                                <td></td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="rbl_会社" EventName="SelectedIndexChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>
                                <asp:UpdatePanel ID="up_4" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
                                    <ContentTemplate>
                                        <table style="width: 100%;">
                                            <colgroup>
                                                <col style="width: 7em;" />
                                                <col style="width: 31em;" />
                                                <col style="width: 9em;" />
                                                <col style="width: 14em;" />
                                                <col />
                                            </colgroup>
                                            <tr>
                                                <td style="text-align: right; padding-right: 15px;">
                                                    仕入先：
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="ddl_仕入先" runat="server" Width="23em"
                                                        DataTextField="仕入先名" DataValueField="仕入先ｺｰﾄﾞ" AutoPostBack="false">
                                                    </asp:DropDownList>
                                                    &nbsp;
                                                    <asp:TextBox ID="tbx_仕入先" runat="server" Width="4em" MaxLength="4" />
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="tbx_仕入先_FilteredTextBoxExtender" runat="server"
                                                        TargetControlID="tbx_仕入先" FilterType="Numbers" />
                                                </td>
                                                <td style="text-align: right; padding-right: 15px;">
                                                    JANコード：
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="tbx_JANコード" runat="server" Width="10em" MaxLength="13" />
                                                    <ajaxToolkit:FilteredTextBoxExtender ID="tbx_JANコード_FilteredTextBoxExtender" runat="server"
                                                        TargetControlID="tbx_JANコード" FilterType="Numbers" />
                                                </td>
                                                <td></td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="rbl_会社" EventName="SelectedIndexChanged" />
                                        <asp:AsyncPostBackTrigger ControlID="ddl_店舗" EventName="SelectedIndexChanged" />
                                        <asp:AsyncPostBackTrigger ControlID="ddl_部門" EventName="SelectedIndexChanged" />
                                    </Triggers>
                                </asp:UpdatePanel>
                                <table style="width: 100%;">
                                    <colgroup>
                                        <col style="width: 7em;" />
                                        <col style="width: 25em;" />
                                        <col style="width: 7em;" />
                                        <col style="width: 18em;" />
                                        <col />
                                    </colgroup>
                                    <tr>
                                        <td style="text-align: right; padding-right: 15px;">
                                            伝票種別：
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="chk_伝票種別_EOS発注" runat="server" Text="EOS発注" TextAlign="Right" Checked="True" />
                                            <asp:CheckBox ID="chk_伝票種別_EOS特売" runat="server" Text="EOS特売" TextAlign="Right" Checked="True" Visible="false"/>
                                            <asp:CheckBox ID="chk_伝票種別_EOS以外" runat="server" Text="EOS以外" TextAlign="Right" Checked="True" />
                                        </td>
                                        <td style="text-align: right; padding-right: 15px;">
                                            伝票レス：
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="chk_伝票レス_対応" runat="server" Text="対応" TextAlign="Right" Checked="True" />
                                            <asp:CheckBox ID="chk_伝票レス_非対応" runat="server" Text="非対応" TextAlign="Right" Checked="True" />
                                        </td>
                                        <td></td>
                                    </tr>
                                </table>
                                <table style="width: 100%;">
                                    <colgroup>
                                        <col style="width: 7em;" />
                                        <col style="width: 14em;" />
                                        <col style="width: 7em;" />
                                        <col style="width: 18em;" />
                                        <col />
                                    </colgroup>
                                    <tr>
                                        <td style="text-align: right; padding-right: 15px;">
                                            確定区分：
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="chk_確定区分_済" runat="server" Text="済" TextAlign="Right" Checked="True" />
                                            <asp:CheckBox ID="chk_確定区分_未" runat="server" Text="未" TextAlign="Right" Checked="True" />
                                        </td>
                                        <td style="text-align: right; padding-right: 15px;">
                                            確定日：
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tbx_確定日" runat="server" Style="width: 6em;" />
                                            <asp:ImageButton ID="ibtn_確定日" runat="server" ImageUrl="~/Images/Calendar_scheduleHS.png" AlternateText="click to show calendar" />
                                            <ajaxToolkit:CalendarExtender ID="tbx_確定日_CalendarExtender" runat="server" Enabled="True"
                                                Format="yyyy/MM/dd" TargetControlID="tbx_確定日" PopupButtonID="ibtn_確定日" />
                                            <ajaxToolkit:MaskedEditExtender ID="tbx_確定日_MaskedEditExtender" runat="server"
                                                ClearMaskOnLostFocus="False" Enabled="True" MaskType="Date" Mask="9999/99/99" TargetControlID="tbx_確定日" />
                                            <asp:CustomValidator id="tbx_確定日_CustomValidator" runat="server" ControlToValidate="tbx_確定日" ValidationGroup="ValGrp1" Display="None"
                                                ErrorMessage="日付 （1900/01/01 ～）<br />を入力して下さい。" ClientValidationFunction="date_validateInputValue_null" />
                                            <ajaxToolkit:ValidatorCalloutExtender ID="tbx_確定日_CustomValidator_ValidatorCalloutExtender" PopupPosition="BottomLeft"
                                                runat="server" Enabled="True" TargetControlID="tbx_確定日_CustomValidator" />
                                        </td>
                                        <td></td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <ajaxToolkit:CollapsiblePanelExtender ID="cpe_SearchPrm_1" runat="server" Enabled="True"
                                TargetControlID="pnl_SearchPrm_1" ExpandControlID="img_SearchPrm_1" CollapseControlID="img_SearchPrm_1"
                                Collapsed="False" ImageControlID="img_SearchPrm_1" ExpandedImage="~/Images/collapse_ivory.jpg" CollapsedImage="~/Images/expand_ivory.jpg" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Panel ID="pnl_SumVal_1" runat="server" Width="98%" Height="0" Style="background-color: white; border: solid 1px rosybrown; padding: 3px 0; margin: 0 auto;">
                                <table style="width: 100%;">
                                    <colgroup>
                                        <col style="width: 9em;" />
                                        <col style="width: 15em;" />
                                        <col style="width: 9em;" />
                                        <col style="width: 15em;" />
                                        <col />
                                    </colgroup>
                                    <tr>
                                        <td style="text-align: right; padding-right: 15px;">
                                            納品原価合計：
                                        </td>
                                        <td>
                                            <asp:Literal ID="lrl_納品原価合計" runat="server"></asp:Literal>
                                        </td>
                                        <td style="text-align: right; padding-right: 15px;">
                                            納品売価合計：
                                        </td>
                                        <td>
                                            <asp:Literal ID="lrl_納品売価合計" runat="server"></asp:Literal>
                                        </td>
                                        <td></td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <ajaxToolkit:CollapsiblePanelExtender ID="cpe_SumVal_1" runat="server" Enabled="True"
                                TargetControlID="pnl_SumVal_1" ExpandControlID="img_SumVal_1" CollapseControlID="img_SumVal_1"
                                Collapsed="True" ImageControlID="img_SumVal_1" ExpandedImage="~/Images/collapse_ivory.jpg" CollapsedImage="~/Images/expand_ivory.jpg" />
                        </td>
                    </tr>
                </table>

                <div style="margin-top: 5px; background-color: rosybrown; color: Black; border: solid 2px linen; padding: 2px;">
                    <table style="background-color: linen; width: 100%; overflow-wrap: break-word;">
                        <colgroup>
                            <col style="width: 100%;" />
                        </colgroup>
                        <tr style="height: 10px;"><td></td></tr>
                        <tr>
                            <td style="background-color: lightgrey;">
                                <asp:Repeater id="rep_1" runat="server" OnItemDataBound="rep_1_ItemDataBound">
                                    <HeaderTemplate>
                                        <div id="div_header" style="overflow-x: hidden; overflow-y: scroll; width: 0;">
                                            <table style="table-layout: fixed; border-collapse: separate; border-spacing: 1px; width: 160em; background-color: Gray;">
                                                <colgroup>
                                                    <col style="width: 5em;" />
                                                    <col style="width: 5em;" />
                                                    <col style="width: 20em;" />
                                                    <col style="width: 7em;" />
                                                    <col style="width: 7em;" />
                                                    <col style="width: 7em;" />
                                                    <col style="width: 9em;" />
                                                    <col style="width: 7em;" />
                                                    <col style="width: 7em;" />
                                                    <col style="width: 7em;" />
                                                    <col style="width: 7em;" />
                                                    <col style="width: 7em;" />
                                                    <col style="width: 7em;" />
                                                    <col style="width: 7em;" />
                                                    <col style="width: 7em;" />
                                                    <col style="width: 7em;" />
                                                    <col style="width: 7em;" />
                                                    <col style="width: 7em;" />
                                                    <col style="width: 7em;" />
                                                </colgroup>
                                                <tr>
                                                    <th style="padding: 3px; color: Gray; background-color: white; text-align: center;"></th>
                                                    <th style="padding: 3px; color: Gray; background-color: lightgrey; text-align: center;">件数</th>
                                                    <th style="padding: 3px; color: Gray; background-color: lightgrey; text-align: center;">仕入先</th>
                                                    <th style="padding: 3px; color: Gray; background-color: lightgrey; text-align: center;">納品日</th>
                                                    <th style="padding: 3px; color: Gray; background-color: lightgrey; text-align: center;">確定区分</th>
                                                    <th style="padding: 3px; color: Gray; background-color: lightgrey; text-align: center;">発注日</th>
                                                    <th style="padding: 3px; color: Gray; background-color: lightgrey; text-align: center;">伝票番号</th>
                                                    <th style="padding: 3px; color: Gray; background-color: lightgrey; text-align: center;">店舗</th>
                                                    <th style="padding: 3px; color: Gray; background-color: lightgrey; text-align: center;">部門</th>
                                                    <th style="padding: 3px; color: Gray; background-color: lightgrey; text-align: center;">発注数合計</th>
                                                    <th style="padding: 3px; color: Gray; background-color: lightgrey; text-align: center;">納品数合計</th>
                                                    <th style="padding: 3px; color: Gray; background-color: lightgrey; text-align: center;">検品数合計</th>
                                                    <th style="padding: 3px; color: Gray; background-color: lightgrey; text-align: center;">納品原価合計</th>
                                                    <th style="padding: 3px; color: Gray; background-color: lightgrey; text-align: center;">納品売価合計</th>
                                                    <th style="padding: 3px; color: Gray; background-color: lightgrey; text-align: center;">確定日付</th>
                                                    <th style="padding: 3px; color: Gray; background-color: lightgrey; text-align: center;">確定時間</th>
                                                    <th style="padding: 3px; color: Gray; background-color: lightgrey; text-align: center;">取消日付</th>
                                                    <th style="padding: 3px; color: Gray; background-color: lightgrey; text-align: center;">伝票種別</th>
                                                    <th style="padding: 3px; color: Gray; background-color: lightgrey; text-align: center;">伝票レス</th>
                                                </tr>
                                            </table>
                                        </div>
                                        <div id="div_List" style="height: 0; overflow: scroll; width: 0;" onscroll="onScroll_div_List();">
                                            <table style="table-layout: fixed; border-collapse: separate; border-spacing: 0; width: 160em; background-color: Gray;">
                                                <colgroup>
                                                    <col style="width: 5em;" />
                                                    <col style="width: 5em;" />
                                                    <col style="width: 20em;" />
                                                    <col style="width: 7em;" />
                                                    <col style="width: 7em;" />
                                                    <col style="width: 7em;" />
                                                    <col style="width: 9em;" />
                                                    <col style="width: 7em;" />
                                                    <col style="width: 7em;" />
                                                    <col style="width: 7em;" />
                                                    <col style="width: 7em;" />
                                                    <col style="width: 7em;" />
                                                    <col style="width: 7em;" />
                                                    <col style="width: 7em;" />
                                                    <col style="width: 7em;" />
                                                    <col style="width: 7em;" />
                                                    <col style="width: 7em;" />
                                                    <col style="width: 7em;" />
                                                    <col style="width: 7em;" />
                                                </colgroup>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                                <tr>
                                                    <td colspan="20" style="padding: 0;">
                                                        <asp:Panel ID="pnl_Item_Header" runat="server" Width="100%">
                                                            <table style="table-layout: fixed; border-collapse: separate; border-spacing: 1px; width: 160em; background-color: Gray;">
                                                                <colgroup style="background-color: white;">
                                                                    <col style="width: 5em;" />
                                                                    <col style="width: 5em;" />
                                                                    <col style="width: 20em;" />
                                                                    <col style="width: 7em;" />
                                                                    <col style="width: 7em;" />
                                                                    <col style="width: 7em;" />
                                                                    <col style="width: 9em;" />
                                                                    <col style="width: 7em;" />
                                                                    <col style="width: 7em;" />
                                                                    <col style="width: 7em;" />
                                                                    <col style="width: 7em;" />
                                                                    <col style="width: 7em;" />
                                                                    <col style="width: 7em;" />
                                                                    <col style="width: 7em;" />
                                                                    <col style="width: 7em;" />
                                                                    <col style="width: 7em;" />
                                                                    <col style="width: 7em;" />
                                                                    <col style="width: 7em;" />
                                                                    <col style="width: 7em;" />
                                                                </colgroup>
                                                                <tbody>
                                                                    <tr>
                                                                        <td style="background-color: lightsteelblue; text-align: center; font-weight: bold;">
                                                                            <div style="cursor: pointer;">
                                                                                <asp:Label ID="lbl_Item_Header" runat="server" Width="100%"></asp:Label>
                                                                            </div>
                                                                        </td>
                                                                        <td style="text-align: right;">
                                                                            <%# DirectCast(DataBinder.Eval(Container.DataItem, "明細件数"), Integer).ToString("#,0")%>
                                                                        </td>
                                                                        <td style="text-align: left;">
                                                                            <%# DirectCast(DataBinder.Eval(Container.DataItem, "仕入先名"), String)%>
                                                                        </td>
                                                                        <td style="text-align: center;">
                                                                            <%# DirectCast(DataBinder.Eval(Container.DataItem, "最終納品日"), DateTime).ToString("yyyy/MM/dd")%>
                                                                        </td>
                                                                        <td style="text-align: center;">
                                                                            <%# If(DataBinder.Eval(Container.DataItem, "取消日付") Is DBNull.Value, If(DirectCast(DataBinder.Eval(Container.DataItem, "確定区分"), Boolean), "〇", String.Empty), "取消")%>
                                                                        </td>
                                                                        <td style="text-align: center;">
                                                                            <%# DirectCast(DataBinder.Eval(Container.DataItem, "発注日"), DateTime).ToString("yyyy/MM/dd")%>
                                                                        </td>
                                                                        <td style="text-align: center;">
																			<%# CLng(DataBinder.Eval(Container.DataItem, "伝票番号")).ToString("d")%>
                                                                        </td>
                                                                        <td style="text-align: left;">
																			<%# DirectCast(DataBinder.Eval(Container.DataItem, "店舗名"), String)%>
                                                                        </td>
                                                                        <td style="text-align: left;">
																			<%# DirectCast(DataBinder.Eval(Container.DataItem, "部門名"), String)%>
                                                                        </td>
                                                                        <td style="text-align: right;">
																			<%#If(DataBinder.Eval(Container.DataItem, "発注数量合計") Is DBNull.Value, String.Empty, DirectCast(DataBinder.Eval(Container.DataItem, "発注数量合計"), Decimal).ToString("#,0.00"))%>
                                                                        </td>
                                                                        <td runat="server" id="val1_1" style="text-align: right;">
																			<%# DirectCast(DataBinder.Eval(Container.DataItem, "納品数量合計"), Decimal).ToString("#,0.00")%>
                                                                        </td>
                                                                        <td runat="server" id="val1_2" style="text-align: right;">
																			<%# DirectCast(DataBinder.Eval(Container.DataItem, "検品数量合計"), Decimal).ToString("#,0.00")%>
                                                                        </td>
                                                                        <td runat="server" id="val1_3" style="text-align: right;">
																			<%# DirectCast(DataBinder.Eval(Container.DataItem, "原価金額合計"), Decimal).ToString("#,0.00")%>
                                                                        </td>
                                                                        <td runat="server" id="val1_4" style="text-align: right;">
																			<%# DirectCast(DataBinder.Eval(Container.DataItem, "売上金額合計"), Decimal).ToString("#,0.00")%>
                                                                        </td>
                                                                        <td style="text-align: center;">
                                                                            <%# If(DataBinder.Eval(Container.DataItem, "確定-受信_日時") Is DBNull.Value, String.Empty, DirectCast(DataBinder.Eval(Container.DataItem, "確定-受信_日時"), DateTime).ToString("yyyy/MM/dd"))%>
                                                                        </td>
                                                                        <td style="text-align: center;">
                                                                            <%# If(DataBinder.Eval(Container.DataItem, "確定-受信_日時") Is DBNull.Value, String.Empty, DirectCast(DataBinder.Eval(Container.DataItem, "確定-受信_日時"), DateTime).ToString("HH:mm:ss"))%>
                                                                        </td>
                                                                        <td style="text-align: center;">
                                                                            <%# If(DataBinder.Eval(Container.DataItem, "取消日付") Is DBNull.Value, String.Empty, DirectCast(DataBinder.Eval(Container.DataItem, "取消日付"), DateTime).ToString("yyyy/MM/dd"))%>
                                                                        </td>
                                                                        <td style="text-align: center;">
																			<%# DirectCast(DataBinder.Eval(Container.DataItem, "伝票種別_名称"), String)%>
                                                                        </td>
                                                                        <td style="text-align: center;">
																			<%# If(DirectCast(DataBinder.Eval(Container.DataItem, "伝票レス"), Byte) = 1, "〇", String.Empty)%>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </asp:Panel>
                                                        <asp:Panel ID="pnl_Item_Detail" runat="server" Width="98%" Height="0px" Style="background-color: lavender; padding: 10px 1%;">
                                                            <asp:HyperLink ID="hl_report" runat="server">帳票出力</asp:HyperLink>
                                                            
                                                            <asp:Repeater ID="rep_2" runat="server" ClientIDMode="Predictable" OnItemDataBound="rep_2_ItemDataBound">
                                                                <HeaderTemplate>
                                                                    <table style="table-layout: fixed; border-collapse: separate; border-spacing: 1px; width: 0; background-color: Gray; margin-top: 2px;">
                                                                        <colgroup>
                                                                            <col style="width: 5em;" />
                                                                            <col style="width: 12em;" />
                                                                            <col style="width: 24em;" />
                                                                            <col style="width: 12em;" />
                                                                            <col style="width: 7em;" />
                                                                            <col style="width: 7em;" />
                                                                            <col style="width: 7em;" />
                                                                            <col style="width: 7em;" />
                                                                            <col style="width: 7em;" />
                                                                        </colgroup>
                                                                        <tr>
                                                                            <th style="padding: 3px; color: white; background-color: darkgray; text-align: center;">行</th>
                                                                            <th style="padding: 3px; color: white; background-color: darkgray; text-align: center;">JANコード</th>
                                                                            <th style="padding: 3px; color: white; background-color: darkgray; text-align: center;">商品名</th>
                                                                            <th style="padding: 3px; color: white; background-color: darkgray; text-align: center;">規格</th>
                                                                            <th style="padding: 3px; color: white; background-color: darkgray; text-align: center;">発注バラ数</th>
                                                                            <th style="padding: 3px; color: white; background-color: darkgray; text-align: center;">納品バラ数</th>
                                                                            <th style="padding: 3px; color: white; background-color: darkgray; text-align: center;">検品バラ数</th>
                                                                            <th style="padding: 3px; color: white; background-color: darkgray; text-align: center;">原単価</th>
                                                                            <th style="padding: 3px; color: white; background-color: darkgray; text-align: center;">売単価</th>
                                                                        </tr>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                        <tr>
                                                                            <td style="text-align: center; color: dimgray; background-color: white;">
                                                                                <%# DirectCast(DataBinder.Eval(Container.DataItem, "行番号"), Byte).ToString("d")%>
                                                                            </td>
                                                                            <td style="text-align: center; color: dimgray; background-color: white;">
                                                                                <%# CLng(DataBinder.Eval(Container.DataItem, "JANｺｰﾄﾞ")).ToString("d")%>
                                                                            </td>
                                                                            <td style="text-align: left; color: dimgray; background-color: white;">
                                                                                <%# DirectCast(DataBinder.Eval(Container.DataItem, "商品名"), String)%>
                                                                            </td>
                                                                            <td style="text-align: left; color: dimgray; background-color: white;">
                                                                                <%# If(DataBinder.Eval(Container.DataItem, "規格") Is DBNull.Value, String.Empty, DirectCast(DataBinder.Eval(Container.DataItem, "規格"), String))%>
                                                                            </td>
                                                                            <td style="text-align: right; color: dimgray; background-color: white;">
                                                                                <%# If(DataBinder.Eval(Container.DataItem, "発注ﾊﾞﾗ数") Is DBNull.Value, String.Empty, DirectCast(DataBinder.Eval(Container.DataItem, "発注ﾊﾞﾗ数"), Decimal).ToString("#,0.0"))%>
                                                                            </td>
                                                                            <td runat="server" id="val2_1" style="text-align: right; color: dimgray; background-color: white;">
                                                                                <%# DirectCast(DataBinder.Eval(Container.DataItem, "納品ﾊﾞﾗ数"), Decimal).ToString("#,0.0")%>
                                                                            </td>
                                                                            <td runat="server" id="val2_2" style="text-align: right; color: dimgray; background-color: white;">
                                                                                <%# DirectCast(DataBinder.Eval(Container.DataItem, "検品ﾊﾞﾗ数"), Decimal).ToString("#,0.0")%>
                                                                            </td>
                                                                            <td style="text-align: right; color: dimgray; background-color: white;">
                                                                                <%# DirectCast(DataBinder.Eval(Container.DataItem, "原単価"), Decimal).ToString("#,0.0")%>
                                                                            </td>
                                                                            <td style="text-align: right; color: dimgray; background-color: white;">
                                                                                <%# DirectCast(DataBinder.Eval(Container.DataItem, "売単価"), Decimal).ToString("#,0.0")%>
                                                                            </td>
                                                                        </tr>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    </table>
                                                                </FooterTemplate>
                                                            </asp:Repeater>
                                                        </asp:Panel>
                                                        <ajaxToolkit:CollapsiblePanelExtender ID="cpe_Item" runat="server" Enabled="True"
                                                            TargetControlID="pnl_Item_Detail" ExpandControlID="lbl_Item_Header" CollapseControlID="lbl_Item_Header" 
                                                            Collapsed="true" CollapsedText="（開く）" ExpandedText="（閉る）" TextLabelID="lbl_Item_Header">
                                                        </ajaxToolkit:CollapsiblePanelExtender>
                                                    </td>
                                                </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                            </table>
                                        </div>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center;">
                                <div style="position: relative; width: 100%;">
                                    <div style="position: absolute; left: 50%; top: 1em; margin-left: -10em; width: 20em; background-color: palegoldenrod; border: 1px solid Gray;">
                                        <uc1:ListPager ID="uc_ListPager_Item" runat="server" />
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btn_Search" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btn_Search_mikakutei" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btn_Clear" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btn_condReset" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="uc_ListPager_Item" />
            </Triggers>
        </asp:UpdatePanel>

        <asp:UpdatePanel ID="up_popUp" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
            <ContentTemplate>
                <uc1:Express id="uc_Express" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btn_Search" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
    
    <script type="text/javascript">
    <!--
        var mng;
        function pageLoad() {
            mng = Sys.WebForms.PageRequestManager.getInstance();

            mng.remove_initializeRequest(initializeRequest_mng);
            mng.add_initializeRequest(initializeRequest_mng);

            mng.remove_endRequest(endRequest_mng);
            mng.add_endRequest(endRequest_mng);

			adjust_divListHeight();

            $('<% = "#" + Me.ddl_店舗.ClientID %>').off('change.dcDenpyo');
			$('<% = "#" + Me.ddl_店舗.ClientID %>').on('change.dcDenpyo',
				function (event) {
                    $('<% = "#" + Me.tbx_店舗.ClientID %>').val($(this).val());
                });
			$('<% = "#" + Me.tbx_店舗.ClientID %>').off('change.dcDenpyo');
			$('<% = "#" + Me.tbx_店舗.ClientID %>').on('change.dcDenpyo',
                function (event) {
                    const ele = $('<% = "#" + Me.ddl_店舗.ClientID %>');
                    ele.val($(this).val());
                    if (ele.prop("selectedIndex") < 0) {
                        $(this).val("0");
						ele.val("0");
                    }
					eval(ele[0].onchange)();

					var prm = Sys.WebForms.PageRequestManager.getInstance();
					var en = '<% = "#" + Me.btn_dummy.ClientID %>';

					if (!Array.contains(prm._asyncPostBackControlIDs, en)) {
						prm._asyncPostBackControlIDs.push(en);
					}
					if (!Array.contains(prm._asyncPostBackControlClientIDs, en)) {
						prm._asyncPostBackControlClientIDs.push(en);
					}

					var ps = "<% = GetPostBackScript() %>";
					eval(ps.replace('{0}', en).replace('{1}', 'tbx_店舗_Changed'));
                });

			$('<% = "#" + Me.ddl_部門.ClientID %>').off('change.dcDenpyo');
			$('<% = "#" + Me.ddl_部門.ClientID %>').on('change.dcDenpyo',
				function (event) {
					$('<% = "#" + Me.tbx_部門.ClientID %>').val($(this).val());
                });
			$('<% = "#" + Me.tbx_部門.ClientID %>').off('change.dcDenpyo');
			$('<% = "#" + Me.tbx_部門.ClientID %>').on('change.dcDenpyo',
				function (event) {
					const ele = $('<% = "#" + Me.ddl_部門.ClientID %>');
					ele.val($(this).val());
					if (ele.prop("selectedIndex") < 0) {
						$(this).val("0");
						ele.val("0");
                    }

					var prm = Sys.WebForms.PageRequestManager.getInstance();
					var en = '<% = "#" + Me.btn_dummy.ClientID %>';

					if (!Array.contains(prm._asyncPostBackControlIDs, en)) {
						prm._asyncPostBackControlIDs.push(en);
					}
					if (!Array.contains(prm._asyncPostBackControlClientIDs, en)) {
						prm._asyncPostBackControlClientIDs.push(en);
					}

					var ps = "<% = GetPostBackScript() %>";
					eval(ps.replace('{0}', en).replace('{1}', 'tbx_部門_Changed'));
				});

			$('<% = "#" + Me.ddl_仕入先.ClientID %>').off('change.dcDenpyo');
			$('<% = "#" + Me.ddl_仕入先.ClientID %>').on('change.dcDenpyo',
                function(event){
                    $('<% = "#" + Me.tbx_仕入先.ClientID %>').val($(this).val());
                });
			$('<% = "#" + Me.tbx_仕入先.ClientID %>').off('change.dcDenpyo');
			$('<% = "#" + Me.tbx_仕入先.ClientID %>').on('change.dcDenpyo',
				function (event) {
					const ele = $('<% = "#" + Me.ddl_仕入先.ClientID %>');
					ele.val($(this).val());
					if (ele.prop("selectedIndex") < 0) {
						$(this).val("0");
						ele.val("0");
					}
                });

			let obj = $find('<%= cpe_SearchPrm_1.BehaviorID %>');
			if (obj != null) {
				obj.remove_collapsed(adjust_divListHeight_2t);
				obj.add_collapsed(adjust_divListHeight_2t);

				obj.remove_expanded(adjust_divListHeight_2t);
				obj.add_expanded(adjust_divListHeight_2t);
            }

			obj = $find('<%= cpe_SumVal_1.BehaviorID %>');
			if (obj != null) {
				obj.remove_collapsed(adjust_divListHeight_2t);
				obj.add_collapsed(adjust_divListHeight_2t);

				obj.remove_expanded(adjust_divListHeight_2t);
				obj.add_expanded(adjust_divListHeight_2t);
			}
        }
        function initializeRequest_mng(sender, args) {
            if (mng.get_isInAsyncPostBack()) {
                args.set_cancel(true);

                return;
            }

            $.sanIndicator();
        }
        function endRequest_mng(sender, args) {
            $.sanIndicator.hide();
		}

	    function adjust_divListHeight() {
		    var height = $(window).innerHeight() - $('#tbl_Head').outerHeight() - 120;
		    if (height < 0) {
			    height = 0;
		    }

		    var ele = $('#div_List');
            ele.outerHeight(height);

			var width = $(window).innerWidth() - 25;
			if (width < 0) {
				width = 0;
			}

			$('#div_header').outerWidth(width);
			$('#div_List').outerWidth(width);
	    }
        function adjust_divListHeight_2t() {
            adjust_divListHeight();
			adjust_divListHeight();
        }

	    function date_validateInputValue_null(oSrc, args) {
		    if (args.Value == '____/__/__') {
			    args.IsValid = true;

			    return;
		    }

		    date_validateInputValue(oSrc, args);
	    }

	    function date_validateInputValue_notNull(oSrc, args) {
		    if (args.Value == '____/__/__') {
			    args.IsValid = false;

			    return;
		    }

		    date_validateInputValue(oSrc, args);
	    }

	    function date_validateInputValue(oSrc, args) {
		    args.IsValid = false;

		    var dt = new Date(args.Value);
		    if (isNaN(dt)) {
			    return;
		    }

		    if (dt.getFullYear() != parseInt(args.Value.substr(0, 4), 10)) {
			    return;
		    }
		    if (dt.getMonth() + 1 != parseInt(args.Value.substr(5, 2), 10)) {
			    return;
		    }
		    if (dt.getDate() != parseInt(args.Value.substr(8, 2), 10)) {
			    return;
		    }
		    if (dt.getFullYear() < 1700) {
			    return;
		    }

		    args.IsValid = true;
	    }

	    function onScroll_div_List() {
		    document.getElementById('div_header').scrollLeft = event.srcElement.scrollLeft;
	    }
    //-->
	</script>
</body>
</html>
