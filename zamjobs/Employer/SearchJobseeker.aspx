<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SearchJobseeker.aspx.cs" Inherits="zamjobs.Employer.SearchJobseeker" Title="ZamJobs.com - Search Jobseekers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
        .style3
        {
            width: 20px;
        }
        .style4
        {
            width: 131px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Jobseeker Search
    </h3>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>

    <table class="style2">
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                <asp:Label ID="lblCountry" runat="server" Text="Country"></asp:Label></td>
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
            <td class="style3">
                &nbsp;</td>
            <td class="style4"><asp:Label ID="lblRegion" runat="server" Text="Region"></asp:Label></td>
            <td><asp:DropDownList ID="ddlRegion" runat="server" AppendDataBoundItems="True" 
                                AutoPostBack="True" 
                    onselectedindexchanged="ddlRegion_SelectedIndexChanged" Width="150px">
                                <asp:ListItem Selected="True" Value="">Any Region</asp:ListItem>
            </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                <asp:Label ID="lblLocation" runat="server" Text="Location(Town/City)"></asp:Label>
            </td>
            <td><asp:DropDownList ID="ddlLocation" runat="server" AppendDataBoundItems="True" 
                    Width="150px">
                                <asp:ListItem Selected="True" Value="">Any Location</asp:ListItem>
                            </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                <asp:Label ID="lblCategory" runat="server" Text="Category"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlCategory" runat="server" AppendDataBoundItems="True" 
                    DataSourceID="SqlDataSourceCategory" DataTextField="Category" 
                    DataValueField="ID" Width="150px">
                    <asp:ListItem Selected="True" Text="Any Category" Value=""></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                <asp:Label ID="lblEducation" runat="server" Text="Education"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlEducation" runat="server" AppendDataBoundItems="True" 
                    DataSourceID="SqlDataSourceEducation" DataTextField="EducationLevel" 
                    DataValueField="ID" Width="150px">
                    <asp:ListItem Selected="True" Text="Any Education" Value=""></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                <asp:Label ID="lblExperience" runat="server" Text="Experience"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlExperience" runat="server" AppendDataBoundItems="True" 
                    Width="150px" DataSourceID="SqlDataSourceExperience" DataTextField="Years" 
                    DataValueField="Years">
                    <asp:ListItem Selected="True" Text="Any Experience" Value=""></asp:ListItem>
                </asp:DropDownList>
                <asp:RadioButtonList ID="rblExp" runat="server">
                    <asp:ListItem Selected="True" Value="=">exactly</asp:ListItem>
                    <asp:ListItem Value="&gt;=">and above</asp:ListItem>
                    <asp:ListItem Value="&lt;=">and below</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                <asp:Button ID="btnSearch" runat="server" onclick="btnSearch_Click" 
                    Text="Search" />
                <asp:Button ID="btClear" runat="server" onclick="btClear_Click" Text="Clear" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table><br />
     </ContentTemplate>
                    </asp:UpdatePanel>
                    
                       
                            
                                <asp:SqlDataSource ID="SqlDataSourceCountry" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
                                    SelectCommand="SELECT [ID], [Country] FROM [jobsdb_Country] ORDER BY [Country]">
                                </asp:SqlDataSource>
                            
                                <asp:SqlDataSource ID="SqlDataSourceCategory" 
        runat="server" ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
        SelectCommand="SELECT * FROM [jobsdb_JobCategory] ORDER BY [Category]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceEducation" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
        SelectCommand="SELECT * FROM [jobsdb_Education]"></asp:SqlDataSource>
                    
    <asp:SqlDataSource ID="SqlDataSourceExperience" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
        SelectCommand="SELECT [Years] FROM [jobsdb_Experience]"></asp:SqlDataSource>
                    
    <%
        zamjobs.jobsearch jobs = new zamjobs.jobsearch();
        System.Data.DataTable regionTbl = jobs.GetRegions();
        Response.Write("<p>Search by Region and Location<p>");
        Response.Write("<table width='100%' cellpadding='0' cellspacing='0'>");
        Response.Write("<tr bgcolor='#3399cc'>");
        Response.Write("<td>");
        Response.Write("<table width='100%' >");
        for (int i = 0; i < regionTbl.Rows.Count; i++)
        {
            if ((i % 3) == 0 && i != 9)
            {
                Response.Write("<tr>");
            }
            Response.Write("<td valign='top' bgcolor='#e7f7ff' width='33%'>");
            Response.Write("<b><a href=JobseekerListing.aspx?row=0&fil=&Cat=&Reg=" + regionTbl.Rows[i]["ID"].ToString() + "&Loc=&Cou=&Edu=&Exp= >" + regionTbl.Rows[i]["Region"].ToString() + " (" + jobs.CountJobseekerByRegionID(regionTbl.Rows[i]["ID"].ToString()) + ")</a></b><br/>");
            System.Data.DataTable locationTbl = jobs.GetLocationsByRegionID(regionTbl.Rows[i]["ID"].ToString());
            for (int j = 0; j < locationTbl.Rows.Count; j++)
            {
                Response.Write("<a href=JobseekerListing.aspx?row=0&fil=&Cat=&Reg=&Loc=" + locationTbl.Rows[j]["ID"].ToString() + "&Cou=&Edu=&Exp=>" + locationTbl.Rows[j]["Location"].ToString() + " (" + jobs.CountJobseekerByLocationID(locationTbl.Rows[j]["ID"].ToString()) + ")</a>");
                Response.Write("<br/>");       
            }
            Response.Write("</td>");
            if (((i +1) % 3) == 0 && i != 0)
            {
                Response.Write("</tr>");
            }
        }
        Response.Write("</table>");
        Response.Write("</tr>");
        Response.Write("</td>");
        Response.Write("</table><br/>");
        Response.Write("<p>Search International Jobseekers<p>");
        Response.Write("<table width='100%' cellpadding='0' cellspacing='0'>");
        Response.Write("<tr bgcolor='#3399cc'>");
        Response.Write("<td>");
        Response.Write("<table width='100%' >");
        
        System.Data.DataTable countryTbl = jobs.GetCountries();
        for (int i = 0; i < countryTbl.Rows.Count; i++)
        {
            if ((i % 3) == 0 && i != countryTbl.Rows.Count)
            {
                Response.Write("<tr>");
            }
            Response.Write("<td valign='top' bgcolor='#e7f7ff' width='33%'>");
            Response.Write("<b><a href=JobseekerListing.aspx?row=0&fil=&Cat=&Reg=&Loc=&Cou=" + countryTbl.Rows[i]["ID"].ToString() + "&Edu=&Exp= >" + countryTbl.Rows[i]["Country"].ToString() + " (" + jobs.CountJobseekerByCountryID(countryTbl.Rows[i]["ID"].ToString()) + ")</a></b><br/>");
            Response.Write("</td>");
            if ((((i + 1) % 3) == 0) && (i != 0) && (i != countryTbl.Rows.Count - 1))
            {
                Response.Write("</tr>");
            }
            
            
            if ((countryTbl.Rows.Count % 3) == 1 && i == (countryTbl.Rows.Count - 1)) //Print 2 extra table divisions
            {
                Response.Write("<td valign='top' bgcolor='#e7f7ff' width='33%'></td>");
                Response.Write("<td valign='top' bgcolor='#e7f7ff' width='33%'></td>");
                Response.Write("</tr>");
            }
            else if ((countryTbl.Rows.Count % 3) == 2 && i == (countryTbl.Rows.Count - 1)) //Print 1 extra table divisions
            {
                Response.Write("<td valign='top' bgcolor='#e7f7ff' width='33%'></td>");
                Response.Write("</tr>");
            }
            else if ((countryTbl.Rows.Count % 3) == 0 && i == (countryTbl.Rows.Count - 1)) //No extra table devisions
            {
                Response.Write("</tr>");
            }
        }
        Response.Write("</table>");
        Response.Write("</tr>");
        Response.Write("</td>");
        Response.Write("</table><br/>");
            
     %>
</asp:Content>
