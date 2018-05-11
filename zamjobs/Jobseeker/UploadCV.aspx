<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="UploadCV.aspx.cs" Inherits="zamjobs.Jobseeker.UploadCV" Title="ZamJobs.com - Upload/Change CV" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
        .style3
        {
            width: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h3>Upload/Change CV</h3>


    <table class="style2" align="center">
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td style="text-align: center">
                <asp:Button ID="btnDownloadCV" runat="server" Text="Download Current CV" 
                    onclick="btnDownloadCV_Click" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td style="text-align: center">
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td style="text-align: center">
                <asp:FileUpload ID="fiuCV" runat="server" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td style="text-align: center">
                <asp:Button ID="btnUpload" runat="server" Text="Upload" 
                    onclick="btnUpload_Click" />
                <asp:Button ID="btnClear" runat="server" Text="Clear" 
                    onclick="btnClear_Click" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>


</asp:Content>
