﻿<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="Confirm.ascx.vb" Inherits="Kaya028_DC_Denpyo.Confirm" %>

<asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server"></asp:ScriptManagerProxy>

<asp:Panel ID="pnl_00" runat="server" Style="display: none;" CssClass="modalPopup">
    <asp:Panel ID="pnl_01" runat="server" Style="width: 100%; background-color: #FFCFAF; border: solid 1px Gray; color: Black; cursor: pointer;">
        <div style="text-align: center; padding: 2px 0px;">
            <asp:Literal ID="lrl_Caption" runat="server" />
        </div>
    </asp:Panel>
    
    <asp:Literal ID="lrl_Message" runat="server" />
    
    <table style="width: 100%;">
        <colgroup>
            <col style="width: 100%;"/>
        </colgroup>
        <tr style="height: 10px;"><td></td></tr>
        <tr>
            <td style="text-align: center;">
                <asp:Button ID="btn_OK" runat="server" CausesValidation="false" Text="OK" Style="cursor: pointer;" />
                <asp:Button ID="btn_Cancel" runat="server" CausesValidation="false" Text="Cancel" Style="cursor: pointer;" />
            </td>
        </tr>
    </table>
</asp:Panel>

<ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
    TargetControlID="hdn_dummyTarget"
    PopupControlID="pnl_00" 
    BackgroundCssClass="modalBackground"
    OkControlID=""
    OnOkScript=""
    CancelControlID="btn_Cancel"
    DropShadow="true"
    PopupDragHandleControlID="pnl_01" />

<asp:HiddenField ID="hdn_dummyTarget" runat="server" />
