<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PostSuccessfull.aspx.cs" Inherits="zamjobs.Employer.PostSuccessfull" Title="ZamJobs.com - Post Succesful" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h3>Post Successful</h3>
<%
    string postID = Request.QueryString["PostID"].ToString();
    string type = Request.QueryString["type"].ToString();
    string amount = Request.QueryString["amt"].ToString();
    string units = Request.QueryString["units"].ToString();
    zamjobs.advertiser post = new zamjobs.advertiser();
    
    zamjobs.Format format = new zamjobs.Format();
    System.Data.DataTable postTbl = post.getJobPostDetail(postID);
    if (type == "n")// if new job post
    {
        Response.Write("<p>Thank you for Posting your job vacancy with ZamJobs.com<p>");
        Response.Write("<p>Posted Job Summary<br/>");
        Response.Write("Job Post ID: " + format.GetJobPostIdFormat(postTbl.Rows[0]["ID"].ToString()) + "<br/>");
        Response.Write("Job Title: " + postTbl.Rows[0]["Title"].ToString() + "<br/>");
        Response.Write("Post Date: " + format.DateFormat(postTbl.Rows[0]["PostDate"].ToString()) + "<br/>");
        Response.Write("Expire Date: " + format.DateFormat(postTbl.Rows[0]["ExpireDate"].ToString()) + "<br/></p>");
        Response.Write("<p>Units prior to transaction: " + units + "<br/>");
        Response.Write("Units Deducted = " + amount + "<br/>");
        Response.Write("Units Remainaing = " + post.GetUnitCountByEmail(User.Identity.Name) + "</p>");
    }
    else if(type == "e")// if extended job post
    {
        Response.Write("<p>Thank you for extending your job post<p>");
        Response.Write("<p>Extended Job Post Summary<br/>");
        Response.Write("Job Post ID: " + format.GetJobPostIdFormat(postTbl.Rows[0]["ID"].ToString()) + "<br/>");
        Response.Write("Job Title: " + postTbl.Rows[0]["Title"].ToString() + "<br/>");
        Response.Write("Post Date: " + format.DateFormat(postTbl.Rows[0]["PostDate"].ToString()) + "<br/>");
        Response.Write("Expire Date: " + format.DateFormat(postTbl.Rows[0]["ExpireDate"].ToString()) + "<br/></p>"); 
        Response.Write("<p>Units prior to transaction: " + units + "<br/>");
        Response.Write("Units Deducted: " + amount + "<br/>");
        Response.Write("Units Remainaing: " + post.GetUnitCountByEmail(User.Identity.Name) + "</p>");
    }
    
     %>
</asp:Content>
