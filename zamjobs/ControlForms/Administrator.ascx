<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Administrator.ascx.cs" Inherits="zamjobs.ControlForms.Administrator" %>
<div style="border: solid 1px #3399cc;">

    <table style="width:100%;">
        <tr>
            <td>
                <h4>Administrator Controls</h4></td>
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
    <asp:HyperLink ID="hypProfile" runat="server" NavigateUrl="~/Administrator/Profile.aspx">Profile</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td colspan="2">
    <asp:HyperLink ID="hypEditDetails" runat="server" 
                    NavigateUrl="~/Administrator/EditDetails.aspx">Edit Details</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td colspan="2">
    
                <asp:HyperLink ID="hypeManageAdmin" runat="server" 
                    NavigateUrl="~/Administrator/ManageAdmin.aspx">Manage Administrators</asp:HyperLink>
    
            </td>
        </tr>
        <tr>
            <td colspan="2">
    
                <asp:HyperLink ID="hypUnitsManagement" runat="server" 
                    NavigateUrl="~/Administrator/CreditAccount.aspx">Manage Advertiser Units</asp:HyperLink>
    
            </td>
        </tr>
        <tr>
            <td colspan="2">
    
                <asp:HyperLink ID="hypViewAdvertisers" runat="server" 
                    NavigateUrl="~/Administrator/ViewAdvertiser.aspx">Manage Advertisers</asp:HyperLink>
    
            </td>
        </tr>
        <tr>
            <td colspan="2">
    
                <asp:HyperLink ID="hypViewJobssekers" runat="server" 
                    NavigateUrl="~/Administrator/ViewJobseeker.aspx">Manage Jobseekers</asp:HyperLink>
    
            </td>
        </tr>
        <tr>
            <td colspan="2">
    
                <asp:HyperLink ID="hypViewJobPosts" runat="server" 
                    NavigateUrl="~/Administrator/ViewJobPost.aspx">Manage Job Posts</asp:HyperLink>
    
            </td>
        </tr>
        <tr>
            <td colspan="2">
    
                <asp:HyperLink ID="hypManageUtilities" runat="server" 
                    NavigateUrl="~/Administrator/ManageUtilities.aspx">Manage Utilities</asp:HyperLink>
    
            </td>
        </tr>
        <tr>
            <td colspan="2">
    
                <asp:HyperLink ID="hypReports" runat="server" 
                    NavigateUrl="~/Administrator/Reports.aspx">Reports</asp:HyperLink>
    
            </td>
        </tr>
        <tr>
            <td colspan="2">
    <asp:HyperLink ID="HypChangePassword" runat="server" 
                    NavigateUrl="~/Administrator/ChangePassword.aspx">Change Password</asp:HyperLink>
            </td>
        </tr>
    </table>
    </div>
   