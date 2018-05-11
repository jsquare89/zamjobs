<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Advertiser.ascx.cs" Inherits="zamjobs.ControlForms.Advertiser" %>
<div style="border: solid 1px #3399cc;">

    <table style="width:100%;">
        <tr>
            <td><h4>Advertiser Controls</h4>
                </td>
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
                <asp:Label ID="lblUnits" runat="server" Text="Units = "></asp:Label>
                <asp:Label ID="lblUnitsBind" runat="server"></asp:Label>
                    </td>
        </tr>
        <tr>
            <td colspan="2">
    <asp:HyperLink ID="hypProfile" runat="server" NavigateUrl="~/Employer/Profile.aspx">Profile</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td colspan="2">
    <asp:HyperLink ID="hypEditDetails" runat="server" NavigateUrl="~/Employer/EditDetails.aspx">Edit Details</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td colspan="2">
    <asp:HyperLink ID="hypViewPostedJobAdverts" runat="server" 
                    NavigateUrl="~/Employer/JobAdverts.aspx">View 
                Posted Job Advert</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td colspan="2">
    <asp:HyperLink ID="hypPostJobAdvert" runat="server" 
                    NavigateUrl="~/Employer/PostAdvert.aspx">Post 
                Job Advert</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td colspan="2">
    <asp:HyperLink ID="hypViewApplications" runat="server" 
                    NavigateUrl="~/Employer/Applications.aspx">View Applications</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:HyperLink ID="hypSearchJobseeker" runat="server" 
                    NavigateUrl="~/Employer/SearchJobseeker.aspx">Search Jobseekers</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:HyperLink ID="hypPurchasedJobseeker" runat="server" 
                    NavigateUrl="~/Employer/PurchasedJobseekers.aspx">Purchased Jobseekers</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:HyperLink ID="hypOrderHistory" runat="server" 
                    NavigateUrl="~/Employer/OrderHistory.aspx">Order/Purchase History</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:HyperLink ID="hypPurchaseUnits" runat="server" 
                    NavigateUrl="~/Employer/PurchaseUnits.aspx">Purchase Units</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:HyperLink ID="hypUploadLogo" runat="server" 
                    NavigateUrl="~/Employer/UploadLogo.aspx">Upload Logo</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td colspan="2">
    <asp:HyperLink ID="hypChangePassword" runat="server" 
                    NavigateUrl="~/Employer/ChangePassword.aspx">Change Password</asp:HyperLink>
            </td>
        </tr>
    </table>
    </div>
   