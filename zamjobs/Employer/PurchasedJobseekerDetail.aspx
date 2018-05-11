<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PurchasedJobseekerDetail.aspx.cs" Inherits="zamjobs.Employer.PurchasedJobseekerDetail" Title="ZamJobs.com - Purchased Jobseeker Detail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h3>Purchased Jobseeker Details</h3>
<%
    
    string ID = Request.QueryString["id"].ToString();
    string amount = Request.QueryString["amt"].ToString();
    string units = Request.QueryString["units"].ToString();
    zamjobs.advertiser jobseeker = new zamjobs.advertiser();

    zamjobs.Format format = new zamjobs.Format();
    System.Data.DataTable jobSTbl = jobseeker.getJobSeekerDetails(ID);
    Response.Write("<p>Thank you for Jobseeker Details with ZamJobs.com<p>");
    Response.Write("<p>Purchase Summary<br/>");
    Response.Write("Jobseeker ID: " + format.GetJobseekerIdFormat(jobSTbl.Rows[0]["ID"].ToString()) + "<br/>");
    Response.Write("Name: " + jobSTbl.Rows[0]["FirstName"].ToString() + " " + jobSTbl.Rows[0]["LastName"].ToString() + "<br/>");
    
    Response.Write("<p>Units prior to transaction: " + units + "<br/>");
    Response.Write("Units Deducted = " + amount + "<br/>");
    Response.Write("Units Remainaing = " + jobseeker.GetUnitCountByEmail(User.Identity.Name) + "</p>");
    
    
     %>
</asp:Content>
