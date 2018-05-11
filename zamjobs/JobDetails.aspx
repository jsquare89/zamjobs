<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="JobDetails.aspx.cs" Inherits="zamjobs.JobDetails" Title="ZamJobs - Job Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">	
    <br />
    <h3>Job Details</h3>
    <p>
        <asp:Label ID="lblJobseekerMsg" runat="server"></asp:Label>
    </p>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataKeyNames="ID" DataSourceID="SqlDataSourceJobDetails" Height="50px" 
        Width="100%" BorderColor="#3399CC" CellPadding="1">
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" DataFormatString="ZP{0:000000}" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Overview" HeaderText="Overview" 
                SortExpression="Overview" />
            <asp:HyperLinkField DataNavigateUrlFields="CompanyID" 
                DataNavigateUrlFormatString="~/CompanyDetail.aspx?id={0}" 
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
            <asp:BoundField DataField="WorkExperience" HeaderText="Work Experience" 
                SortExpression="WorkExperience" />
            <asp:BoundField DataField="WorkExperienceComment" 
                HeaderText="Experience Comment" SortExpression="WorkExperienceComment" />
            <asp:BoundField DataField="EducationLevel" HeaderText="Education Level" 
                SortExpression="EducationLevel" ReadOnly="True" />
            <asp:BoundField DataField="EducationLevelComment" 
                HeaderText="Education Comment" SortExpression="EducationLevelComment" />
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
        
        
        SelectCommand="SELECT * FROM [jobsdb_ActiveJobPosts_DetailedView] WHERE ([ID] = @ID)" 
        >
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="PostID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <br />
    
    <asp:Label ID="lblMessage" runat="server" Visible="False"></asp:Label>
    <br /><br />
    <asp:Button ID="btnBack" runat="server" onclick="btnBack_Click" 
        Text="Back to Listing" />
    <asp:Button ID="btnApply" runat="server" Text="Apply" 
        onclick="btnApply_Click" />
        </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>
