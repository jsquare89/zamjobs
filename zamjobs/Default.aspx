<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="zamjobs._Default" MasterPageFile="~/MasterPage.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
<h1>Welcome to ZamJobs!</h1>
                            
        <font face="Tahoma, Arial" size="2">
        <p align="justify">
            Welcome to <b>ZamJobs.com</b>. ZamJobs is the first online job search and job 
            posting website in Zambia. Whether you are searching for a job or an employee, 
            we can help you find what you have in mind. We offer you the best way to change 
            your career or help to change someone else&#39;s future. Register with us for free 
            today !!!
            <br />
                            </p>
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr valign="top">
                                    <td width="48%">
                                        <font face="Tahoma, Arial" size="2">
                                        <h4 style="text-align: center">
                                            Jobseekers</h4>
                                        <p align="justify">
                                            <b>Job Search</b><br />
                                            Browse our list of employment opportunities to find the job you&#39;re looking for.<br />
                                        </p>
                                        <p align="justify">
                                            <b>Search Advertisers</b><br />
                                            Research companies to find out more on Zambia top employers.<br />
                                        </p>
                                        <p align="justify">
                                            <b>Free CV space on the web</b><br />
                                            Regiseter and upload your CV to give companies nation wide access to your 
                                            details. It just might help get you that break in your career.
                                        </p>
                                        <p align="justify">
                                            <b>Instantly
                                            Notify Employers</b><br />
                                            &quot;Apply&quot; for a job post in order to instantly notify a company of your interest 
                                            in their vacany. They will immediately gain access to your CV and details.<br />
                                        </p>
                                        </font>
                                    </td>
                                    <td width="4%">
                                        <p align="justify">
                                            <font face="Tahoma, Arial" size="2">&nbsp;</font></p>
                                    </td>
                                    <td width="48%">
                                        <font face="Tahoma, Arial" size="2">
                                        <h4 class="style2">
                                            Advertiser</h4>
                    <p align="justify">
                        <b>Advertise Jobs Online</b><br />
                        Advertise all your vacancies online and reach thousands of job-seekers both 
                        nationwide and internationaly.<br />
                        <br />
                        <b>CV Search</b><br />
                        Search amongst Jobseeker registered with us and gain access to their CVs and find the best professionals nationwide.<br />
                        <br />
                        <b>Free Company Profile Page</b><br />
                        We will create a page on our website to promote your business, displaying your 
                        name, logo and details. Jobseeker will be able to Search all your job post from 
                        your profile page.</p>
                                            <p align="justify">
                                                ZamJobs.com offers you the right solution for your business recruitement needs. Open a free account today! </font>
                    </p>
                </td>
            </tr>
        </table>
        </font>
        <p> &nbsp;</p>
<a href="AdvertiserReg.aspx">Company</a>
<a href="JobseekerReg.aspx">Jobseeker</a>

</div>

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
        Response.Write("<b><a href=JobListing.aspx?row=0&key=&Cat=&Reg=" + regionTbl.Rows[i]["ID"].ToString() + "&Loc= >" + regionTbl.Rows[i]["Region"].ToString() + " (" + jobs.CountJobsByRegionID(regionTbl.Rows[i]["ID"].ToString()) + ")</a></b><br/>");
        System.Data.DataTable locationTbl = jobs.GetLocationsByRegionID(regionTbl.Rows[i]["ID"].ToString());
        for (int j = 0; j < locationTbl.Rows.Count; j++)
        {
            Response.Write("<a href=JobListing.aspx?row=0&key=&Cat=&Reg=&Loc=" + locationTbl.Rows[j]["ID"].ToString() + ">" + locationTbl.Rows[j]["Location"].ToString() + " (" + jobs.CountJobsByLocationID(locationTbl.Rows[j]["ID"].ToString()) + ")</a>");
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
     %>



</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">

    <style type="text/css">
        .style2
        {
            text-align: center;
        }
    </style>

</asp:Content>
