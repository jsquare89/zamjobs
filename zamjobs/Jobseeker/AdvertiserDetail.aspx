<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AdvertiserDetail.aspx.cs" Inherits="zamjobs.Jobseeker.AdvertiserDetail" Title="ZamJobs.com - Advertiser Detail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h3>Advertiser Detail</h3>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataKeyNames="ID" DataSourceID="SqlDataSourceJobDetails" Height="50px" 
        Width="100%" BorderColor="#3399CC" CellPadding="1">
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" DataFormatString="ZA{0:000000}" />
            <asp:BoundField DataField="CompanyName" HeaderText="Company Name" 
                SortExpression="CompanyName" />
            <asp:BoundField DataField="ContactName" HeaderText="Contact Name" 
                SortExpression="ContactName" />
            <asp:BoundField DataField="Email" HeaderText="Email" 
                SortExpression="Email" />
            <asp:BoundField DataField="CountryName" HeaderText="Country" 
                SortExpression="CountryName" ReadOnly="True" />
            <asp:BoundField DataField="RegionName" HeaderText="Region" 
                SortExpression="RegionName" ReadOnly="True" />
            <asp:BoundField DataField="LocationName" HeaderText="Location" 
                SortExpression="LocationName" ReadOnly="True" />
            <asp:BoundField DataField="ContactNumber" HeaderText="Contact Number" 
                SortExpression="ContactNumber" />
            <asp:BoundField DataField="AltContactNumber" HeaderText="Alt Contact Number" 
                SortExpression="AltContactNumber" />
            <asp:BoundField DataField="PostalAddress" HeaderText="Postal Address" 
                SortExpression="PostalAddress" />
            <asp:HyperLinkField DataNavigateUrlFields="WebsiteURL" 
                DataTextField="WebsiteURL" HeaderText="Website URL" 
                SortExpression="WebsiteURL" />
            <asp:BoundField DataField="CategoryName" HeaderText="Main Category" 
                SortExpression="CategoryName" ReadOnly="True" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description" />
        </Fields>
        <AlternatingRowStyle BackColor="#D4F1FF" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSourceJobDetails" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
        
        SelectCommand="SELECT        ID, CompanyName, ContactName, Email,
                             (SELECT        Country
                               FROM            jobsdb_Country
                               WHERE        (ID = jobsdb_Employer.Country)) AS CountryName,
                             (SELECT        Region
                               FROM            jobsdb_Region
                               WHERE        (ID = jobsdb_Employer.Region)) AS RegionName,
                             (SELECT        Location
                               FROM            jobsdb_Location
                               WHERE        (ID = jobsdb_Employer.Location)) AS LocationName, ContactNumber, AltContactNumber, PostalAddress, WebsiteURL,
                             (SELECT        Category
                               FROM            jobsdb_JobCategory
                               WHERE        (ID = jobsdb_Employer.Category)) AS CategoryName, Description
FROM            jobsdb_Employer
WHERE ID = @ID">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="" Name="ID" QueryStringField="id" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Button ID="btnBack" runat="server" onclick="btnBack_Click" 
        Text="Back to Applications" />
    
</asp:Content>
