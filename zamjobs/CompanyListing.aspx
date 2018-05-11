<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CompanyListing.aspx.cs" Inherits="zamjobs.CompanyListing" Title="ZamJobs.com - Company Listing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<h3>Advertiser Listing</h3>
    <table width="100%">
        <tr>
            <td width="60%">
                &nbsp;</td>
            <td>
                <asp:Label ID="lblRecordsPerPage" runat="server" Text="Records Per Page"></asp:Label>
                <asp:DropDownList ID="ddlRecordsPerPage" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddlRecordsPerPage_SelectedIndexChanged">
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem Selected="True">20</asp:ListItem>
                    <asp:ListItem>50</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td width="60%">
                &nbsp;</td>
            <td>
                <asp:Label ID="lblTotalRecords" runat="server" Text="Total Records"></asp:Label>
                <asp:Label ID="lblCompanyCount" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table><br />


    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID" 
        DataSourceID="SqlDataSourceCompanyList" Width="100%" CellPadding="4" 
        ForeColor="#333333" GridLines="None">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="ID" 
                DataNavigateUrlFormatString="~/CompanyDetail.aspx?id={0}" DataTextField="ID" 
                DataTextFormatString="ZA{0:000000}" HeaderText="Advertiser ID" 
                SortExpression="ID" />
            <asp:HyperLinkField DataNavigateUrlFields="ID" 
                DataNavigateUrlFormatString="~/CompanyDetail.aspx?id={0}" 
                DataTextField="CompanyName" HeaderText="Company Name" 
                SortExpression="CompanyName" />
            <asp:BoundField DataField="CategoryName" HeaderText="CategoryName" 
                ReadOnly="True" SortExpression="CategoryName" />
            <asp:HyperLinkField DataNavigateUrlFields="WebsiteURL" 
                DataNavigateUrlFormatString="{0}" DataTextField="WebsiteURL" 
                HeaderText="Website URL" />
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceCompanyList" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
        
        SelectCommand="SELECT jobsdb_Employer.ID, jobsdb_Employer.CompanyName, (SELECT Category FROM jobsdb_JobCategory WHERE (ID = jobsdb_Employer.Category)) AS CategoryName, jobsdb_Employer.WebsiteURL FROM jobsdb_Employer INNER JOIN jobsdb_JobPost ON jobsdb_Employer.ID = jobsdb_JobPost.Company GROUP BY jobsdb_Employer.ID, jobsdb_Employer.CompanyName, jobsdb_Employer.Category, jobsdb_Employer.WebsiteURL ORDER BY jobsdb_Employer.CompanyName"></asp:SqlDataSource>




</asp:Content>
