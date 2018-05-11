<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="JobDetail.aspx.cs" Inherits="zamjobs.JobDetail" Title="ZamJobs - Job Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <h3>Job Details</h3>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataKeyNames="ID" DataSourceID="SqlDataSourceJobDetails" Height="50px" 
        Width="100%" BorderColor="#3399CC" CellPadding="1">
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="Job Post ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" DataFormatString="ZP{0:000000}" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Overview" HeaderText="Overview" 
                SortExpression="Overview" />
            <asp:HyperLinkField DataNavigateUrlFields="CompanyID" 
                DataNavigateUrlFormatString="AdvertiserDetail.aspx?id={0}" 
                DataTextField="Company" HeaderText="Company" />
            <asp:BoundField DataField="Country" HeaderText="Country" 
                SortExpression="Country" ReadOnly="True" />
            <asp:BoundField DataField="Region" HeaderText="Region" 
                SortExpression="Region" ReadOnly="True" />
            <asp:BoundField DataField="Location" HeaderText="Location" 
                SortExpression="Location" ReadOnly="True" />
            <asp:BoundField DataField="Category" HeaderText="Category" 
                SortExpression="Category" ReadOnly="True" />
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" 
                ReadOnly="True" />
            <asp:BoundField DataField="WorkExperience" HeaderText="Work Experience (Years)" 
                SortExpression="WorkExperience" />
            <asp:BoundField DataField="WorkExperienceComment" 
                HeaderText="Work Experience Comment" 
                SortExpression="WorkExperienceComment" />
            <asp:BoundField DataField="EducationLevel" HeaderText="Education Level" 
                SortExpression="EducationLevel" ReadOnly="True" />
            <asp:BoundField DataField="EducationLevelComment" 
                HeaderText="Education Level Comment" 
                SortExpression="EducationLevelComment" />
            <asp:BoundField DataField="PersonalAttributes" HeaderText="Personal Attributes" 
                SortExpression="PersonalAttributes" />
            <asp:BoundField DataField="Competencies" HeaderText="Competencies" 
                SortExpression="Competencies" />
            <asp:BoundField DataField="PostDate" HeaderText="Post Date" 
                SortExpression="PostDate" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="ExpireDate" HeaderText="Expire Date" 
                SortExpression="ExpireDate" DataFormatString="{0:dd/MM/yyyy}" />
        </Fields>
        <AlternatingRowStyle BackColor="#D4F1FF" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSourceJobDetails" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
        
        
        
        SelectCommand="SELECT ID, Title, Overview, (SELECT CompanyName FROM jobsdb_Employer WHERE (jobsdb_JobPost.Company = ID)) AS Company, Company AS CompanyID, (SELECT Country FROM jobsdb_Country WHERE (ID = jobsdb_JobPost.Country)) AS Country, (SELECT Region FROM jobsdb_Region WHERE (ID = jobsdb_JobPost.Region)) AS Region, (SELECT Location FROM jobsdb_Location WHERE (ID = jobsdb_JobPost.Location)) AS Location, (SELECT Category FROM jobsdb_JobCategory WHERE (ID = jobsdb_JobPost.Category)) AS Category, (SELECT JobType FROM jobsdb_JobType WHERE (ID = jobsdb_JobPost.Type)) AS Type, WorkExperience, WorkExperienceComment, (SELECT EducationLevel FROM jobsdb_Education WHERE (ID = jobsdb_JobPost.EducationLevel)) AS EducationLevel, EducationLevelComment, PersonalAttributes, Competencies, PostDate, ExpireDate FROM jobsdb_JobPost WHERE (ID = @ID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="id" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Button ID="btnBack" runat="server" onclick="btnBack_Click" 
        Text="Back to Applications" />
    </asp:Content>
