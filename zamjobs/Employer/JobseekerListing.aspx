<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="JobseekerListing.aspx.cs" Inherits="zamjobs.Employer.JobseekerListing" Title="ZamJobs.com - Jobseeker Listing" %>
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
    <h3>Jobseeker Search Listing</h3>
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
    string rowString = Request.QueryString["row"];

    string category = "";
    string region = "";
    string location = "";
    string country = "";
    string education = "";
    string experience = "";
    string filter = "";
    

    category = Request.QueryString["Cat"];
    region = Request.QueryString["Reg"];
    location = Request.QueryString["Loc"];
    country = Request.QueryString["Cou"];
    education = Request.QueryString["Edu"];
    experience = Request.QueryString["Exp"];
    filter = Request.QueryString["fil"];
    System.Data.DataTable list = getList(category, region, location, country, education, experience, filter);
   
    int count = 0;
    int rowCount = list.Rows.Count - 1;
    int rows = 0;
    int pageCount = 0;
    zamjobs.Format format = new zamjobs.Format();
    Response.Write("<p>Search for " + GetCategory(category) + ", " + GetCountry(country) + ", " + GetRegion(region) + ", " + GetLocation(location) + ", " + GetEducation(education) + ", " + GetExperience(experience,filter) + "<p>");
        
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
            Response.Write("<td style='width: 50%;'><a href='PurchaseJobseekerDetails.aspx?id=" + Id + "'>" + list.Rows[count]["FirstName"].ToString() + " " + list.Rows[count]["LastName"].ToString() + "</a>");
            Response.Write(" (" + format.GetJobseekerIdFormat(Id) + ")</td>");
            Response.Write("<td>Category: " + list.Rows[count]["Category"].ToString() + "</td>");
            Response.Write("</tr>");
            Response.Write("<tr>");
            Response.Write("<td style='width: 50%;'>Country: " + list.Rows[count]["Country"].ToString() + "</td>");
            Response.Write("<td colspan='2'>Nationality: " +list.Rows[count]["Nationality"].ToString() + "</td>");
            Response.Write("</tr>");
            Response.Write("<tr>");
            Response.Write("<td style='width: 50%;'>Region: " + list.Rows[count]["Region"].ToString() + "</td>");
            Response.Write("<td colspan='2'>Experience: " + list.Rows[count]["Experience"].ToString() + " years</td> ");
            Response.Write("</tr>");
            Response.Write("<tr>");
            Response.Write("<td style='width: 50%;'>Location: " + list.Rows[count]["Location"].ToString() + "</td>");
            Response.Write("<td colspan='2'>Education: " + list.Rows[count]["Education"].ToString() + "</td>");
            Response.Write("</tr>");
            Response.Write("</table>");

            Response.Write("<img src='Images/jobpost_devider.gif'/><br/>");
            
           
        }
        pageCount = (rowCount / 10) + 1;
        Response.Write("<p>Page: ");
        for (int i = 0; i < pageCount; i++)
        {
            Response.Write("<a href='JobseekerListing.aspx?row=" + 10 * i + "&fil=" + filter + "&Cat=" + category +
                "&Reg=" + region + "&Loc=" + location + "&Cou=" + country + "&Edu=" + education + "&Exp=" + experience + "'>" + (i + 1) + "</a>" + " ");
        }
        Response.Write("</p>");
    }
    else
    {
        Response.Write("Your Search has returned 0 results.");
    }
    
     %>
</asp:Content>
