<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CompanyJobListing.aspx.cs" Inherits="zamjobs.CompanyJobListing" Title="ZamJobs.com - Company Job Listing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<%
     
    string rowString = Request.QueryString["row"];
    string title = "";
    string category = "";
    string region = "";
    string location = "";
    string company = "";
    title = Request.QueryString["key"];
    category = Request.QueryString["Cat"];
    region = Request.QueryString["Reg"];
    location = Request.QueryString["Loc"];
    company = Request.QueryString["adv"];
    zamjobs.jobsearch jobsearch = new zamjobs.jobsearch();
    System.Data.DataTable list = getList(category, region, location, title, company);
   
    int count = 0;
    int rowCount = list.Rows.Count - 1;
    int rows = 0;
    int pageCount = 0;
    zamjobs.Format format = new zamjobs.Format();
    
    try
    {
        count = Convert.ToInt32(rowString);
    }
    catch (FormatException formatEx)
    {
        Response.Redirect("~/InvalidPageRequest.aspx");
    }
    Response.Write("<h3><a href='CompanyDetail.aspx?id=" + company + "'>" + jobsearch.GetCompanyNameByID(company) +"</a> Job Listings</h3>");
    Response.Write("<p>Search for " + GetTitle(title) + ", " + GetCategory(category) + ", " + GetRegion(region) + ", " + GetLocation(location) + "<p>");
       
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
            Response.Write("<td style='width: 60%;'>Location: " + list.Rows[count]["Location"].ToString() + "</td>");
            Response.Write("<td colspan='2'>Region: " + list.Rows[count]["Region"].ToString() + "</td>");
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
            Response.Write("<a href='CompanyJobListing.aspx?row=" + 10 * i + "&key=" + title + "&Cat=" + category +
                "&Reg=" + region + "&Loc=" + location + "&adv=" + company + "'>" + (i + 1) + "</a>" + " ");
        }
        Response.Write("</p>");
    }
    else
    {
        Response.Write("Your Search has returned 0 results.");
    }
    
     %>
</asp:Content>
