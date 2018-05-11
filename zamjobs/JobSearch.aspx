<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="JobSearch.aspx.cs" Inherits="zamjobs.JobSearch" Title="ZamJobs.com - Job Search" %>
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Job Search</h3>
    <table class="style2">
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                <asp:Label ID="lblTitle" runat="server" Text="Job Title"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtTitle" runat="server" Width="150px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                <asp:Label ID="lblCategory" runat="server" Text="Category"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlCategory" runat="server" AppendDataBoundItems="True" 
                    DataSourceID="SqlDataSourceCategory" DataTextField="Category" 
                    DataValueField="ID" Width="150px">
                    <asp:ListItem Selected="True" Text="Any Category" Value=""></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
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
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                <asp:Label ID="lblRegion" runat="server" 
                    Text="Region"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlRegion" runat="server" AppendDataBoundItems="True" 
                                AutoPostBack="True" 
                    onselectedindexchanged="ddlRegion_SelectedIndexChanged" Width="150px">
                                <asp:ListItem Selected="True" Value="">Any Region</asp:ListItem>
            </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                <asp:Label ID="lblLocation" runat="server" Text="Location(Town/City)"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlLocation" runat="server" AppendDataBoundItems="True" 
                    Width="150px">
                                <asp:ListItem Selected="True" Value="">Any Location</asp:ListItem>
                            </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="btnSearch" runat="server" onclick="btnSearch_Click" 
                    Text="Search" />
                <asp:Button ID="btClear" runat="server" onclick="btClear_Click" Text="Clear" />
            </td>
        </tr>
    </table><br />
    
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
        Response.Write("<b><a href=JobListing.aspx?row=0&key=&Cou=&Cat=&Reg=" + regionTbl.Rows[i]["ID"].ToString() + "&Loc= >" + regionTbl.Rows[i]["Region"].ToString() + " (" + jobs.CountJobsByRegionID(regionTbl.Rows[i]["ID"].ToString()) + ")</a></b><br/>");
        System.Data.DataTable locationTbl = jobs.GetLocationsByRegionID(regionTbl.Rows[i]["ID"].ToString());
        for (int j = 0; j < locationTbl.Rows.Count; j++)
        {
            Response.Write("<a href=JobListing.aspx?row=0&key=&Cou=&Cat=&Reg=&Loc=" + locationTbl.Rows[j]["ID"].ToString() + ">" + locationTbl.Rows[j]["Location"].ToString() + " (" + jobs.CountJobsByLocationID(locationTbl.Rows[j]["ID"].ToString()) + ")</a>");
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
    Response.Write("</table>");
     %><asp:SqlDataSource ID="SqlDataSourceCountry" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
                                    SelectCommand="SELECT [ID], [Country] FROM [jobsdb_Country] ORDER BY [Country]">
                                </asp:SqlDataSource>
                            
                                <asp:SqlDataSource ID="SqlDataSourceCategory" 
        runat="server" ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
        SelectCommand="SELECT * FROM [jobsdb_JobCategory] ORDER BY [Category]">
    </asp:SqlDataSource>
    &nbsp;


</asp:Content>
