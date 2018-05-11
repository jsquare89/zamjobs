<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PostAdvert.aspx.cs" Inherits="zamjobs.Employer.PostAdvert" Title="ZamJobs - Post a Job" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
        .style3
        {
            width: 107px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Post Your Advetisement<asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
                        </h3>
    <fieldset><legend>Job Details</legend>

            <table class="style2">
                <tr>
                    <td>
                        &nbsp;</td>
                    <td class="style3">
                        <asp:Label ID="lblJobTitle" runat="server" Text="Job Title"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtJobTitle" runat="server" Width="150px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvJobTitle" runat="server" 
                            ControlToValidate="txtJobTitle" Display="Dynamic" 
                            ValidationGroup="PostValidation">*</asp:RequiredFieldValidator>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td class="style3">
                        <asp:Label ID="lblJobOverview" runat="server" Text="Job Overview"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtJobOverview" runat="server" Height="100px" 
                            TextMode="MultiLine" Width="100%"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td class="style3">
                        <asp:Label ID="lblCategory" runat="server" Text="Job Category"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlCategory" runat="server" AppendDataBoundItems="True" 
                            DataSourceID="SqlDataSourceCategory" DataTextField="Category" 
                            DataValueField="ID" Width="150px">
                            <asp:ListItem Selected="True">Select Category</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td class="style3">
                        <asp:Label ID="lblJobType" runat="server" Text="Job Type"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlJobType" runat="server" AppendDataBoundItems="True" 
                            DataSourceID="SqlDataSourceJobType" DataTextField="JobType" 
                            DataValueField="ID" Width="150px">
                            <asp:ListItem Selected="True">Select Job Type</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                
                
                </table>
                  <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
                  <table class="style2">
                <tr>
                    <td>
                        &nbsp;</td>
                    <td class="style3">
                        <asp:Label ID="lblCountry" runat="server" Text="Country"></asp:Label>
                    </td>
                    <td>
                <asp:DropDownList ID="ddlCountry" runat="server" AppendDataBoundItems="true" 
                                AutoPostBack="True" DataSourceID="SqlDataSourceCountry" DataTextField="Country" 
                                DataValueField="ID" 
                    onselectedindexchanged="ddlCountry_SelectedIndexChanged" Width="150px">
                                <asp:ListItem Selected="True" Value="">Any Country</asp:ListItem>
                </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td class="style3">
                        <asp:Label ID="lblRegion" runat="server" Text="Region"></asp:Label>
                    </td>
                    <td>
                <asp:DropDownList ID="ddlRegion" runat="server" AppendDataBoundItems="True" 
                                AutoPostBack="True" 
                    onselectedindexchanged="ddlRegion_SelectedIndexChanged" Width="150px">
                                <asp:ListItem Selected="True" Value="">Any Region</asp:ListItem>
            </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td class="style3">
                        <asp:Label ID="lblLocation" runat="server" Text="Location(Town/City)"></asp:Label>
                    </td>
                    <td>
                <asp:DropDownList ID="ddlLocation" runat="server" AppendDataBoundItems="True" 
                    Width="150px">
                                <asp:ListItem Selected="True" Value="">Any Location</asp:ListItem>
                            </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table></ContentTemplate>
        </asp:UpdatePanel>
            <asp:SqlDataSource ID="SqlDataSourceCountry" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
                SelectCommand="SELECT [ID], [Country] FROM [jobsdb_Country] ORDER BY [Country]">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceJobType" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
                SelectCommand="SELECT [ID], [JobType] FROM [jobsdb_JobType]">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceCategory" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
                SelectCommand="SELECT * FROM [jobsdb_JobCategory]"></asp:SqlDataSource>

                                        </fieldset>

<fieldset><legend>Job Requirements</legend>    
            <table class="style2">
                <tr>
                    <td>
                        &nbsp;</td>
                    <td class="style3">
                        <asp:Label ID="lblWorkExperience" runat="server" 
                            Text="Required Work Experience"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlWorkExperience" runat="server">
                            <asp:ListItem>Select Years</asp:ListItem>
                            <asp:ListItem Value="0">None</asp:ListItem>
                            <asp:ListItem Value="1">1 Year</asp:ListItem>
                            <asp:ListItem Value="2">2 Years</asp:ListItem>
                            <asp:ListItem Value="3">3 Years</asp:ListItem>
                            <asp:ListItem Value="4">4 Years</asp:ListItem>
                            <asp:ListItem Value="5">5 Years</asp:ListItem>
                            <asp:ListItem Value="6">6 Years</asp:ListItem>
                            <asp:ListItem Value="7">7 Years</asp:ListItem>
                            <asp:ListItem Value="8">8 Years</asp:ListItem>
                            <asp:ListItem Value="9">9 Years</asp:ListItem>
                            <asp:ListItem Value="10">10 Years</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td class="style3">
                        <asp:Label ID="lblWorkExperienceComments" runat="server" 
                            Text="Work Experience Comments"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtWorkExperience" runat="server" Height="100px" 
                            TextMode="MultiLine" Width="100%"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td class="style3">
                        <asp:Label ID="lblEducation" runat="server" Text="Required Education Level"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlEducation" runat="server" AppendDataBoundItems="True" 
                            DataSourceID="SqlDataSourceEducation" DataTextField="EducationLevel" 
                            DataValueField="ID">
                            <asp:ListItem Selected="True">Select Education</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td class="style3">
                        <asp:Label ID="lblEducationLevel" runat="server" 
                            Text="Education Level Comments"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEducation" runat="server" Height="100px" 
                            TextMode="MultiLine" Width="100%"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td class="style3">
                        <asp:Label ID="lblPersonalAttributes" runat="server" 
                            Text="Required Personal Attributes"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPesonalAttributes" runat="server" Height="100px" 
                            TextMode="MultiLine" Width="100%"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td class="style3">
                        <asp:Label ID="lblCompetencies" runat="server" Text="Required Competencies"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCompetencies" runat="server" Height="100px" 
                            TextMode="MultiLine" Width="100%"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td class="style3">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td class="style3">
                        <asp:Label ID="lblAdvertLength" runat="server" Text="Advert Length"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlAdvertLength" runat="server">
                            <asp:ListItem Selected="True" Value="" Text="Select Length"></asp:ListItem>
                            <asp:ListItem Value="15" Text="15 Day (1 Unit)"></asp:ListItem>
                            <asp:ListItem Value="30" Text="30 Day (2 Units)"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvLength" runat="server" 
                            ControlToValidate="ddlAdvertLength" Display="Dynamic" 
                            ValidationGroup="PostValidation">*</asp:RequiredFieldValidator>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td class="style3">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td class="style3">
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="btnPost" runat="server" onclick="btnPost_Click" Text="Post" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
            <asp:SqlDataSource ID="SqlDataSourceEducation" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
                SelectCommand="SELECT [ID], [EducationLevel] FROM [jobsdb_Education] ORDER BY [ID]">
            </asp:SqlDataSource>
</fieldset>
</asp:Content>
