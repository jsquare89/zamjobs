<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="JobseekerDetails.aspx.cs" Inherits="zamjobs.Employer.JobseekerDetails" Title="ZamJobs.com - Jobseeker Detail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h3>Jobseeker Details</h3>
    <p>
        <asp:Label ID="lblErrorMsg" runat="server"></asp:Label>
    </p>
    
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataKeyNames="ID" DataSourceID="SqlDataSourceJobseekerDetails" Height="50px" 
        Width="100%" BorderColor="#3399CC" CellPadding="1" Enabled="False">
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" DataFormatString="JS{0:000000}" />
            <asp:BoundField DataField="FirstName" HeaderText="First Name" 
                SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="Last Name" 
                SortExpression="LastName" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Country" HeaderText="Country" ReadOnly="True" 
                SortExpression="Country" />
            <asp:BoundField DataField="Region" HeaderText="Region" ReadOnly="True" 
                SortExpression="Region" />
            <asp:BoundField DataField="Location" HeaderText="Location" ReadOnly="True" 
                SortExpression="Location" />
            <asp:BoundField DataField="Nationality" HeaderText="Nationality" 
                ReadOnly="True" SortExpression="Nationality" />
            <asp:BoundField DataField="ID_Passport" HeaderText="ID/Passport Number" 
                SortExpression="ID_Passport" />
            <asp:BoundField DataField="ContactNumber" HeaderText="Contact Number" 
                SortExpression="ContactNumber" />
            <asp:BoundField DataField="Category" HeaderText="Category" ReadOnly="True" 
                SortExpression="Category" />
            <asp:BoundField DataField="Experience" HeaderText="Experience" 
                SortExpression="Experience" />
            <asp:BoundField DataField="Education" HeaderText="Education" 
                SortExpression="Education" ReadOnly="True" />
        </Fields>
        <AlternatingRowStyle BackColor="#D4F1FF" />
    </asp:DetailsView>
               
  <asp:SqlDataSource ID="SqlDataSourceJobseekerDetails" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
            
        SelectCommand="SELECT ID, FirstName, LastName, Email, (SELECT Country FROM jobsdb_Country WHERE (ID = jobsdb_JobSeeker.Country)) AS Country, (SELECT Region FROM jobsdb_Region WHERE (ID = jobsdb_JobSeeker.Region)) AS Region, (SELECT Location FROM jobsdb_Location WHERE (ID = jobsdb_JobSeeker.Location)) AS Location, (SELECT Nationality FROM jobsdb_Nationality WHERE (ID = jobsdb_JobSeeker.Nationality)) AS Nationality, ID_Passport, ContactNumber, (SELECT Category FROM jobsdb_JobCategory WHERE (ID = jobsdb_JobSeeker.JobCategory)) AS Category, Experience, (SELECT EducationLevel FROM jobsdb_Education WHERE (ID = jobsdb_JobSeeker.Education)) AS Education FROM jobsdb_JobSeeker WHERE (ID = @ID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ID" QueryStringField="JobseekerID" />
            </SelectParameters>
        </asp:SqlDataSource>
  
        <table align="center" class="style2">
            <tr>
                <td style="text-align: center">
                    <asp:Button ID="btnDownloadCV" runat="server" onclick="btnDownloadCV_Click" 
                        Text="Download CV" />
                </td>
            </tr>
        </table>
   
</asp:Content>
