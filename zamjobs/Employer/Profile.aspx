<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="zamjobs.EmployerProfile" Title="ZamJobs.com - Advertiser Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
        .style3
        {
            width: 400px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h3>Advertiser Profile</h3>
    <table class="style2">
        <tr>
            <td class="style3">
    You are logged in as 
    <asp:Label ID="lblUserID" runat="server" Text="Label"></asp:Label>
    <br />
                You are an employer who wants to host many many advertisements and hire lots of 
                staff</td>
            <td style="text-align: right">
                <asp:Image runat="server" ID="imgLogo" style="text-align: right" Height="100" Width="150" />
            </td>
        </tr>
        <tr>
            <td class="style3" colspan="2">
                <a href ="PostAdvert.aspx">Post an Advertisement</a> <br />
                <a href ="EditDetails.aspx">Edit Profile Details</a><br />
                <a href ="Applications.aspx">View applications <% 
        zamjobs.advertiser advertiser = new zamjobs.advertiser();
        Response.Write("(" + advertiser.getApplicationsCount(User.Identity.Name) + ")");
         %></a><br /><br /><br /><br /></td>
           
        </tr>
    </table>
    
   
</asp:Content>
