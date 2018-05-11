<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CompanyDetail.aspx.cs" Inherits="zamjobs.CompanyDetail" Title="ZamJobs.com - Company Detail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h3>Advertiser Details</h3>
    <table align="center" width="100%">
        <tr>
            <td width="50%" align="center">
                <asp:Button ID="btnSearchCompanyJobs" runat="server" Text="Search Jobs" 
                    onclick="btnSearchCompanyJobs_Click" />
            </td>
            <td align="center">
                <asp:Image ID="imgLogo" runat="server" />
            </td>
        </tr>
    </table><br />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataKeyNames="ID" DataSourceID="SqlDataSourceAdvertiserDetails" Height="50px" 
        Width="100%" BorderColor="#3399CC" CellPadding="1">
        <Fields>
            <asp:BoundField DataField="ID" DataFormatString="ZA{0:000000}" HeaderText="ID" 
                InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="CompanyName" HeaderText="Company Name" 
                SortExpression="CompanyName" />
            <asp:BoundField DataField="ContactName" HeaderText="Contact Name" 
                SortExpression="ContactName" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Country" HeaderText="Country" 
                SortExpression="Country" />
            <asp:BoundField DataField="Region" HeaderText="Region" 
                SortExpression="Region" />
            <asp:BoundField DataField="Location" HeaderText="Location" 
                SortExpression="Location" />
            <asp:BoundField DataField="ContactNumber" HeaderText="Contact Number" 
                SortExpression="ContactNumber" />
            <asp:BoundField DataField="AltContactNumber" HeaderText="Alt Contact Number" 
                SortExpression="AltContactNumber" />
            <asp:BoundField DataField="PostalAddress" HeaderText="Postal Address" 
                SortExpression="PostalAddress" />
            <asp:BoundField DataField="WebsiteURL" HeaderText="Website URL" 
                SortExpression="WebsiteURL" />
            <asp:BoundField DataField="Category" HeaderText="Category" 
                SortExpression="Category" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description" />
        </Fields>
        <AlternatingRowStyle BackColor="#D4F1FF" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSourceAdvertiserDetails" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" SelectCommand="SELECT ID, CompanyName, ContactName, Email, (SELECT Country FROM jobsdb_Country WHERE (ID = jobsdb_Employer.Country)) AS Country, (SELECT Region FROM jobsdb_Region WHERE (ID = jobsdb_Employer.Region)) AS Region, (SELECT Location FROM jobsdb_Location WHERE (ID = jobsdb_Employer.Location)) AS Location, ContactNumber, AltContactNumber, PostalAddress, WebsiteURL, (SELECT Category FROM jobsdb_JobCategory WHERE (ID = jobsdb_Employer.Category)) AS Category, Description, Logo FROM jobsdb_Employer
WHERE ID =@ID">
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
