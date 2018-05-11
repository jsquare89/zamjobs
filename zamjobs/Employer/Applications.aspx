<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Applications.aspx.cs" Inherits="zamjobs.Employer.Applications" Title="ZamJobs.com - Job Applications" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%
    zamjobs.advertiser advertiser = new zamjobs.advertiser();
    zamjobs.Format format = new zamjobs.Format();
    string rowString = Request.QueryString["rowCount"];
    System.Data.DataTable jobPost = advertiser.getJobPost(User.Identity.Name);
    int count = 0;
    int rowCount = jobPost.Rows.Count - 1;
    int rows = 0;
    int pageCount = 0;
    
    
    Response.Write("<h3>View Applications</h3>");
    
    if (jobPost.Rows.Count == 0) // Checks for any job post applications
    {
        Response.Write("<p>There are currently no application for jobs posted</p>");
    }
    else // if applications exist in data table continue
    {
        try // Catches for irregularities in query string that the user may have tampered with
        {
            count = Convert.ToInt32(rowString);
        }
        catch (FormatException formatEx)
        {
            Response.Redirect("~/InvalidPageRequest.aspx");
        }
        if (count >= 0 && count <= rowCount) // catches for irregularities in query string that involves numric character. if number too high or low and does not exist code will not be run. and page will be redirected
        {
            if (rowCount > count + 9) // ensure only 10 items are placed on a page
            {
                rows = count + 9;
            }
            else
            {
                rows = rowCount;
            }
            
            Response.Write("<p>View applicants for current jobs posted. Click on Job to view applicants by job or click on applicant name to view applicant's details and CV. </p>");
            Response.Write("<table id='applications_table' cellpadding='0' cellspacing='0'>");
            Response.Write("<tr>");
            Response.Write("<td id='applications_title'>Job Post ID</td>");
            Response.Write("<td id='applications_title'>Job Title</td>");
            Response.Write("<td id='applications_title'>Post Date</td>");
            Response.Write("<td id='applications_title'>Expiry Date</td>");
            Response.Write("</tr>");
            Response.Write("<tr>");
            Response.Write("<td colspan='4'></td>");
            Response.Write("</tr>");

            for (; count <= rows; count++)
            {
                Response.Write("<tr>");
                Response.Write("<td id='applications_td'>" + format.GetJobPostIdFormat(jobPost.Rows[count]["JobPostID"].ToString()) + "</td>");
                Response.Write("<td id='applications_td'><a href='JobPostApplicants.aspx?PostID=" + jobPost.Rows[count]["JobPostID"].ToString() + "'>" + jobPost.Rows[count]["Title"].ToString() + "</a></td>");
                Response.Write("<td id='applications_td'>" + format.DateFormat(jobPost.Rows[count]["PostDate"].ToString()) + "</td>");
                Response.Write("<td id='applications_td'>" + format.DateFormat(jobPost.Rows[count]["ExpireDate"].ToString()) + "</td>");
                Response.Write("</tr>");
                Response.Write("<tr>");
                Response.Write("<td colspan='4'>");
                Response.Write("<ul>");

                System.Data.DataTable jobSeeker = advertiser.getJobSeeker(jobPost.Rows[count]["JobPostID"].ToString());

                for (int i = 0; i < (jobSeeker.Rows.Count); i++)
                {
                    Response.Write("<li><a href='JobseekerDetails.aspx?JobseekerID=" + jobSeeker.Rows[i]["JobseekerID"].ToString() + "'>");
                    Response.Write( format.GetJobseekerIdFormat(jobSeeker.Rows[i]["JobseekerID"].ToString()) + " - ");
                    Response.Write(jobSeeker.Rows[i]["FirstName"].ToString() + " ");
                    Response.Write(jobSeeker.Rows[i]["LastName"].ToString());
                    Response.Write("</a></li>");
                }

                Response.Write("</ul>");
                Response.Write("</td>");
                Response.Write("</tr>");

            }
            Response.Write("</table>");
            Response.Write("<br/>");

            pageCount = (rowCount / 10) + 1;
            Response.Write("<p>Page:");
            for (int i = 0; i < pageCount; i++)
            {
                Response.Write("<a href='Applications.aspx?rowCount=" + 10 * i + "'>" + (i + 1) + "</a>" + " ");
            }
            Response.Write("</p>");
        }
        else
        {
            Response.Redirect("~/InvalidPageRequest.aspx");
        }
    }
    
     %>
</asp:Content>
