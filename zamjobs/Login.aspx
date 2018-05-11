<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="zamjobs.Login" Title="ZamJobs.com - Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 30%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="PanelLogin" runat="server">
    <h3>Client Login</h3>
    <div>
        <br />
    <table class="style1">
        <tr>
            <td align="right">
    <asp:Label ID="lblUserID" runat="server" Text="Email"></asp:Label>
            </td>
            <td>
    <asp:TextBox ID="txtUserID" runat="server" Width="150px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvUserID" runat="server" 
        ErrorMessage="Email Required" ControlToValidate="txtUserID" Display="Dynamic">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="style2">
    <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
            </td>
            <td>
    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
        ErrorMessage="Password Required" ControlToValidate="txtPassword" Display="Dynamic">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
    <asp:CheckBox ID="chbRememberMe" runat="server" Text="Remember me" 
    TextAlign="Left" />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
    <asp:Label ID="lblLegendStatus" runat="server" EnableViewState="False" 
        ForeColor="Red" />
    <asp:RegularExpressionValidator ID="revUserID" runat="server" 
        ErrorMessage="Invalid User ID" ControlToValidate="txtUserID" 
        ValidationExpression="[\w|_@.]*" ValidationGroup="LoginValidation"></asp:RegularExpressionValidator>
    <asp:RegularExpressionValidator ID="revPassword" runat="server" 
        ErrorMessage="Invalid password" ControlToValidate="txtPassword" 
        ValidationExpression='[\w| !"§$%&amp;/()=\-?\*]*' 
        ValidationGroup="LoginValidation" ></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
    <asp:Button ID="btnLogin" runat="server" Text="Login" onclick="Button1_Click" 
        ValidationGroup="LoginValidation" />
            </td>
        </tr>
        </table>
        <br />
        <p>Not Registered Yet. </p>
        <p>Click here to register as a Job Seeker.</p>
        <p>Click here to register as a Job Advitisor.</p>
 </div>
 </asp:Panel>
</asp:Content>
