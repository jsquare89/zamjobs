<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="UploadLogo.aspx.cs" Inherits="zamjobs.Employer.UploadLogo" Title="ZamJobs.com - Upload/Change Logo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
        .style3
        {            text-align: left;
        }
        .style4
        {
            height: 23px;
        }
        .style6
        {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h3>Upload/Change Logo</h3>
    <p>Upload your company logo to be visually recognised at ZamJobs.com. Please ensure 
        the image file to upload is of type .jpg or .jpeg and has the dimensions 150x100 
        pixels. </p>
   <asp:Panel runat="server" DefaultButton="btnUpload" >
        <table class="style2">
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style6">
                    Currently Uploaded Logo</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style6">
                    <asp:Image ID="imgLogo" runat="server" Width="150px" Height="100px" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style6">
                    <asp:FileUpload ID="fiuLogo" runat="server" Width="200px" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style4">
                    </td>
                <td class="style6">
                    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                    </td>
                <td class="style4">
                    </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style6">
                    <asp:Button ID="btnClear" runat="server" Text="Clear"  Width="50px" 
                        onclick="btnClear_Click"/>
                    <asp:Button ID="btnUpload" runat="server" Text="Upload" Width="75px" 
                        style="margin-left: 50px" onclick="btnUpload_Click" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
  </asp:Panel>
</asp:Content>
