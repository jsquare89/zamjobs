<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Applications.aspx.cs" Inherits="zamjobs.Jobseeker.Applications" Title="ZamJobs.com - View Applications" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h3>View Applications</h3>
<%
    zamjobs.jobseeker seeker = new zamjobs.jobseeker();
    System.Data.DataTable applications =  seeker.GetApplications(User.Identity.Name);
    zamjobs.Format format = new zamjobs.Format();

    Response.Write("<table>");
    Response.Write("<tr>");
    Response.Write("<td>Job Post ID</td>");
    Response.Write("<td>Title</td>");
    Response.Write("<td>Company</td>");
    Response.Write("<td>Post Date</td>");
    Response.Write("<td>Expire Date</td>");
    Response.Write("</tr>");

    for (int i = 0; i < applications.Rows.Count; i++)
    {
        Response.Write("<tr>");
        Response.Write("<td>" + format.GetJobPostIdFormat(applications.Rows[i]["JobPostID"].ToString()) + "</td>");
        Response.Write("<td><a href='JobDetail.aspx?id=" + applications.Rows[i]["JobPostID"].ToString() + "'>" + applications.Rows[i]["Title"].ToString() + "</a></td>");
        Response.Write("<td><a href='AdvertiserDetail.aspx?id=" + applications.Rows[i]["CompanyID"].ToString() + "'>" + applications.Rows[i]["CompanyName"].ToString() + "</a></td>");
        Response.Write("<td>" + format.DateFormat(applications.Rows[i]["PostDate"].ToString()) +"</td>");
        Response.Write("<td>" + format.DateFormat(applications.Rows[i]["ExpireDate"].ToString()) +"</td>");
        Response.Write("</tr>");
    }
    Response.Write("</table>");
     %>
</asp:Content>
