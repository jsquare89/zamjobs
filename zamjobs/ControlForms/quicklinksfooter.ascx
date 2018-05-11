<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="quicklinksfooter.ascx.cs" Inherits="zamjobs.ControlForms.quicklinksfooter"  %>
<style type="text/css">
    .style1
    {
        width: 100%;
    }
    .style2
    {
        width: 33%;
    }
    .style3
    {
        width: 33%;
    }
</style>
<table class="style1">
    <tr>
        <td class="style2" align="left">
            <asp:HyperLink ID="hypLogin" runat="server" NavigateUrl="~/Login.aspx" 
                ForeColor="Black">Login</asp:HyperLink>
        </td>
        <td class="style3" align="left">
            <asp:HyperLink ID="hypJobseeker0" runat="server" 
                NavigateUrl="~/JobSearch.aspx" ForeColor="Black">Job Search</asp:HyperLink>
        </td>
        <td align="left">
            <asp:HyperLink ID="hypContactUs" runat="server" NavigateUrl="~/ContactUs.aspx" 
                ForeColor="Black">Contact 
            Us</asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td class="style2">
            <asp:HyperLink ID="hypJobseeker" runat="server" 
                NavigateUrl="~/Jobseeker/Profile.aspx" ForeColor="Black">Jobseeker Profile</asp:HyperLink>
        </td>
        <td class="style3">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
            <asp:HyperLink ID="hypAdvertiser" runat="server" 
                NavigateUrl="~/Employer/Profile.aspx" ForeColor="Black">Advertise Profile</asp:HyperLink>
        </td>
        <td class="style3">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    </table>
