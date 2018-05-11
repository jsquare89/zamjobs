<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PurchaseJobseekerDetails.aspx.cs" Inherits="zamjobs.Employer.PurchaseJobseekerDetails" Title="ZamJobs.com - Purchase Jobseeker Detail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h3>Purchase Jobseeker Details</h3>
    <p>
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
    </p>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataKeyNames="ID" DataSourceID="SqlDataSourceJobseeker" Height="50px" 
        Width="100%" BorderColor="#3399CC" CellPadding="1">
        <Fields>
            <asp:BoundField DataField="ID" DataFormatString="ZS{0:000000}" HeaderText="ID" 
                InsertVisible="False" ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="FirstName" HeaderText="First Name" 
                SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="Last Name" 
                SortExpression="LastName" />
            <asp:BoundField DataField="Country" HeaderText="Country" 
                SortExpression="Country" ReadOnly="True" />
            <asp:BoundField DataField="Region" HeaderText="Region" 
                SortExpression="Region" ReadOnly="True" />
            <asp:BoundField DataField="Location" HeaderText="Location" 
                SortExpression="Location" ReadOnly="True" />
            <asp:BoundField DataField="Nationality" HeaderText="Nationality" 
                SortExpression="Nationality" ReadOnly="True" />
            <asp:BoundField DataField="Category" HeaderText="Category" 
                SortExpression="Category" ReadOnly="True" />
            <asp:BoundField DataField="Experience" HeaderText="Experience" 
                SortExpression="Experience" DataFormatString="{0} years" />
            <asp:BoundField DataField="Education" HeaderText="Education" 
                SortExpression="Education" ReadOnly="True" />
        </Fields>
        <AlternatingRowStyle BackColor="#D4F1FF" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSourceJobseeker" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" SelectCommand="SELECT        ID, FirstName, LastName,
                             (SELECT        Country
                               FROM            jobsdb_Country
                               WHERE        (ID = jobsdb_JobSeeker.Country)) AS Country,
                             (SELECT        Region
                               FROM            jobsdb_Region
                               WHERE        (ID = jobsdb_JobSeeker.Region)) AS Region,
                             (SELECT        Location
                               FROM            jobsdb_Location
                               WHERE        (ID = jobsdb_JobSeeker.Location)) AS Location,
                             (SELECT        Nationality
                               FROM            jobsdb_Nationality
                               WHERE        (ID = jobsdb_JobSeeker.Nationality)) AS Nationality, 
                             (SELECT        Category
                               FROM            jobsdb_JobCategory
                               WHERE        (ID = jobsdb_JobSeeker.JobCategory)) AS Category,
                           Experience,
                             (SELECT        EducationLevel
                               FROM            jobsdb_Education
                               WHERE        (ID = jobsdb_JobSeeker.Education)) AS Education
FROM            jobsdb_JobSeeker
WHERE Status ='1' AND Active = 'Y' AND ID = @ID">
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="id" />
        </SelectParameters>
    </asp:SqlDataSource><br />
    <table width="100%"><tr><td align="center">
        <asp:Button ID="btnPurchaseDetails" runat="server" 
            onclick="btnPurchaseDetails_Click" Text="Purchase Details" />
        </td></tr></table>
</asp:Content>
