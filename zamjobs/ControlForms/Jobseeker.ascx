<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Jobseeker.ascx.cs" Inherits="zamjobs.ControlForms.Jobseeker" %>
<div style="border: solid 1px #3399cc;">

    <table style="width:100%;">
        <tr>
            <td>
                <h4>Jobseeker Controls</h4></td>
            <td>
                    <asp:Button ID="btnSignout" runat="server" onclick="btnSignout_Click" 
                        Text="Signout" CausesValidation="False" BackColor="#D4F1FF" 
                        BorderColor="#3399CC" BorderStyle="Solid" />
                        </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:LoginName ID="LoginName1" runat="server" FormatString="Welcome, {0}" />
                    </td>
        </tr>
        <tr>
            <td colspan="2">
    <asp:HyperLink ID="hypProfile" runat="server" NavigateUrl="~/Jobseeker/Profile.aspx" 
                    Font-Underline="True">Profile</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td colspan="2">
    <asp:HyperLink ID="hypJobSearch" runat="server" 
                    NavigateUrl="~/JobSearch.aspx">Job Search</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td colspan="2">
    <asp:HyperLink ID="hypEditDetails" runat="server" 
                    NavigateUrl="~/Jobseeker/EditDetails.aspx">Edit Details</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td colspan="2">
  
    <asp:HyperLink ID="hypViewApplications" runat="server" 
                    NavigateUrl="~/Jobseeker/Applications.aspx">View Applications</asp:HyperLink>
  
            </td>
        </tr>
        <tr>
            <td colspan="2">
  
                <asp:HyperLink ID="hypUploadCV" runat="server" 
                    NavigateUrl="~/Jobseeker/UploadCV.aspx">Upload/Change CV</asp:HyperLink>
  
            </td>
        </tr>
        <tr>
            <td colspan="2">
    <asp:HyperLink ID="hypChangePassword" runat="server" 
                    NavigateUrl="~/Jobseeker/ChangePassword.aspx">Change Password</asp:HyperLink>
            </td>
        </tr>
    </table>
    </div>
   