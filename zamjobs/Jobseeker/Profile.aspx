<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="zamjobs.JobseekerProfile" Title="ZamJobs.com - Job Seeker Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h3>Jobseeker Profile</h3>
    You are logged in as 
    <asp:Label ID="lblUserID" runat="server" Text="Label"></asp:Label>
    <br />
    You are a Jobseeker. Yipee!!!<br />
</asp:Content>
