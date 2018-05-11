<%@ Page Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="zamjobs.AdministratorProfile" Title="ZamJobs.com - Administrator Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h3>Administrator Profile</h3>
    You are logged in as 
    <asp:Label ID="lblUserID" runat="server" Text="Label"></asp:Label>
    <br />
You are an administrator<br />
</asp:Content>
