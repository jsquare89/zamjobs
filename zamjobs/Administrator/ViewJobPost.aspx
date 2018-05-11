<%@ Page Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ViewJobPost.aspx.cs" Inherits="zamjobs.Administrator.ViewJobPost" Title="ZamJobs.com - Manage Job Posts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Manage Job Posts</h3>
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
        GridLines="None" AllowPaging="True" AllowSorting="True" 
        AutoGenerateColumns="False" DataKeyNames="ID" 
        DataSourceID="SqlDataSourceJobPost" Width="100%">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Company" HeaderText="Company" ReadOnly="True" 
                SortExpression="Company" />
            <asp:BoundField DataField="Region" HeaderText="Region" ReadOnly="True" 
                SortExpression="Region" />
            <asp:BoundField DataField="Location" HeaderText="Location" ReadOnly="True" 
                SortExpression="Location" />
            <asp:BoundField DataField="Category" HeaderText="Category" ReadOnly="True" 
                SortExpression="Category" />
            <asp:BoundField DataField="PostDate" HeaderText="Post Date" 
                SortExpression="PostDate" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="ExpireDate" HeaderText="Expire Date" 
                SortExpression="ExpireDate" DataFormatString="{0:dd/MM/yyyy}" />
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceJobPost" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" SelectCommand="SELECT        ID, Title,
                             (SELECT        CompanyName
                               FROM            jobsdb_Employer
                               WHERE        (jobsdb_JobPost.Company = ID)) AS Company,
                             (SELECT        Region
                               FROM            jobsdb_Region
                               WHERE        (ID = jobsdb_JobPost.Region)) AS Region,
                             (SELECT        Location
                               FROM            jobsdb_Location
                               WHERE        (ID = jobsdb_JobPost.Location)) AS Location,
                             (SELECT        Category
                               FROM            jobsdb_JobCategory
                               WHERE        (ID = jobsdb_JobPost.Category)) AS Category,
                            PostDate, ExpireDate
FROM            jobsdb_JobPost"></asp:SqlDataSource>
</asp:Content>
