<%@ Page Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ViewAdvertiser.aspx.cs" Inherits="zamjobs.Administrator.ViewAdvertiser" Title="ZamJobs.com - Manage Advertisers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Manage Advertisers</h3>
<p>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="ID" DataSourceID="SqlDataSourceAdvertiser" ForeColor="#333333" 
        GridLines="None">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="ID" DataFormatString="ZA{0:000000}" HeaderText="ID" 
                InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="CompanyName" HeaderText="Company Name" 
                SortExpression="CompanyName" />
            <asp:BoundField DataField="ContactName" HeaderText="Contact Name" 
                SortExpression="ContactName" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="ContactNumber" HeaderText="Contact Number" 
                SortExpression="ContactNumber" />
            <asp:BoundField DataField="PostalAddress" HeaderText="Postal Address" 
                SortExpression="PostalAddress" />
            <asp:BoundField DataField="WebsiteURL" HeaderText="Website URL" 
                SortExpression="WebsiteURL" />
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceAdvertiser" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" SelectCommand="
SELECT        ID, CompanyName, ContactName, Email,ContactNumber, AltContactNumber, PostalAddress, WebsiteURL
FROM            jobsdb_Employer
"></asp:SqlDataSource>
</p>
</asp:Content>
