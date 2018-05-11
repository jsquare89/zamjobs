<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="JobListing.aspx.cs" Inherits="zamjobs.JobListing" Title="ZamJobs.com - Job Listing" %>
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
<h3>Job Search Listing<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    </h3>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
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
        </table>
        </ContentTemplate></asp:UpdatePanel>
        
         <table class="style2">
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
    <asp:SqlDataSource ID="SqlDataSourceCountry" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
                                    SelectCommand="SELECT [ID], [Country] FROM [jobsdb_Country] ORDER BY [Country]">
                                </asp:SqlDataSource>
                            
                                <asp:SqlDataSource ID="SqlDataSourceCategory" 
        runat="server" ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
        SelectCommand="SELECT * FROM [jobsdb_JobCategory] ORDER BY [Category]">
    </asp:SqlDataSource>
<%
    string rowString = Request.QueryString["row"];
    string title = "";
    string category = "";
    string region = "";
    string location = "";
    string country = "";
    
    title = Request.QueryString["key"];
    category = Request.QueryString["Cat"];
    region = Request.QueryString["Reg"];
    location = Request.QueryString["Loc"];
    country = Request.QueryString["Cou"];
    
    System.Data.DataTable list = getList(category, region, location, title, country);
   
    int count = 0;
    int rowCount = list.Rows.Count - 1;
    int rows = 0;
    int pageCount = 0;
    zamjobs.Format format = new zamjobs.Format();
    Response.Write("<p><i>Search for " + GetTitle(title) + ", " + GetCategory(category) + ", " + GetCountry(country) + ", " + GetRegion(region) + ", " + GetLocation(location) + "</i></p>");
        
    try
    {
        count = Convert.ToInt32(rowString);
    }
    catch (FormatException formatEx)
    {
        Response.Redirect("~/InvalidPageRequest.aspx");
    }
    if (count >= 0 && count <= rowCount)
    {
        if (rowCount > count + 9)
        {
            rows = count + 9;
        }
        else
        {
            rows = rowCount;
        }
        
        for (; count <= rows; count++)
        {
            Response.Write("<table style='width: 100%;'>");
            Response.Write("<tr>");
            string Id = list.Rows[count]["ID"].ToString();            
            Response.Write("<td style='width: 60%;'>Job Title: <a href='JobDetails.aspx?PostID=" + Id + "'>" + list.Rows[count]["Title"].ToString() + "</a>");
            Response.Write(" (" + format.GetJobPostIdFormat(Id) + ")</td>");
            Response.Write("<td>Company: " + list.Rows[count]["Company"].ToString() + "</td>");
            Response.Write("</tr>");
            Response.Write("<tr>");
            Response.Write("<td style='width: 60%;'>Country: " + list.Rows[count]["Country"].ToString() + "</td>");
            Response.Write("<td colspan='2'>Category: " + list.Rows[count]["Category"].ToString() + "</td>");
            Response.Write("</tr>");
            Response.Write("<tr>");
            Response.Write("<td style='width: 60%;'>Education" + list.Rows[count]["Education"].ToString() + " with " + list.Rows[count]["WorkExperience"].ToString() + " years experience</td>");
            Response.Write("<td colspan='2'>Type: " + list.Rows[count]["Type"].ToString() + "</td>");
            Response.Write("</tr>");
            Response.Write("<tr>");
            Response.Write("<td style='width: 60%;'>Region: " + list.Rows[count]["Region"].ToString() + "</td>");
            Response.Write("<td colspan='2'>Location: " + list.Rows[count]["Location"].ToString() + "</td>");
            Response.Write("</tr>");
            Response.Write("<tr>");
            Response.Write("<td style='width: 60%;'>Post Date: " + format.DateFormat(list.Rows[count]["PostDate"].ToString()) + "</td>");
            Response.Write("<td colspan='2'>Expiry Date: " + format.DateFormat(list.Rows[count]["ExpireDate"].ToString()) + "</td>");
            Response.Write("</tr>");
            Response.Write("</table>");
            Response.Write("<img src='Images/jobpost_devider.gif'/><br/>");
            
           
        }
        pageCount = (rowCount / 10) + 1;
        Response.Write("<p>Page: ");
        for (int i = 0; i < pageCount; i++)
        {
            Response.Write("<a href='JobListing.aspx?row=" + 10 * i + "&key=" + title + "&Cat=" + category +
                "&Reg=" + region + "&Loc=" + location + "&Cou=" + country + "'>" + (i + 1) + "</a>" + " ");
        }
        Response.Write("</p>");
    }
    else
    {
        Response.Write("Your Search has returned 0 results.");
    }
    
     %>
</asp:Content>
