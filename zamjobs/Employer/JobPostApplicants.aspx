<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="JobPostApplicants.aspx.cs" Inherits="zamjobs.Employer.JobPostApplicants" Title="ZamJobs.com - Job Post Applicants" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h3>Job Post Details - Applicants</h3>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataKeyNames="ID"  Height="50px" 
        Width="100%" BorderColor="#3399CC" CellPadding="1">
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" DataFormatString="ZP{0:000000}" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Overview" HeaderText="Overview" 
                SortExpression="Overview" />
            <asp:BoundField DataField="Company" HeaderText="Company" ReadOnly="True" 
                SortExpression="Company" />
            <asp:BoundField DataField="Country" HeaderText="Country" ReadOnly="True" 
                SortExpression="Country" />
            <asp:BoundField DataField="Region" HeaderText="Region" ReadOnly="True" 
                SortExpression="Region" />
            <asp:BoundField DataField="Location" HeaderText="Location" ReadOnly="True" 
                SortExpression="Location" />
            <asp:BoundField DataField="Category" HeaderText="Category" ReadOnly="True" 
                SortExpression="Category" />
            <asp:BoundField DataField="Type" HeaderText="Type" ReadOnly="True" 
                SortExpression="Type" />
            <asp:BoundField DataField="WorkExperience" HeaderText="Work Experience (Years)" 
                SortExpression="WorkExperience" />
            <asp:BoundField DataField="WorkExperienceComment" 
                HeaderText="Work Experience Comment" SortExpression="WorkExperienceComment" />
            <asp:BoundField DataField="EducationLevel" HeaderText="Education Level" 
                ReadOnly="True" SortExpression="EducationLevel" />
            <asp:BoundField DataField="EducationLevelComment" 
                HeaderText="Education Level Comment" SortExpression="EducationLevelComment" />
            <asp:BoundField DataField="PersonalAttributes" HeaderText="Personal Attributes" 
                SortExpression="PersonalAttributes" />
            <asp:BoundField DataField="Competencies" HeaderText="Competencies" 
                SortExpression="Competencies" />
            <asp:BoundField DataField="PostDate" HeaderText="Post Date" 
                SortExpression="PostDate" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="ExpireDate" HeaderText="Expire Date" 
                SortExpression="ExpireDate" DataFormatString="{0:dd/MM/yyyy}" />
        </Fields>
        <AlternatingRowStyle BackColor="#D4F1FF" />
    </asp:DetailsView>
    
<%
    zamjobs.advertiser advertiser = new zamjobs.advertiser();
    zamjobs.Format format = new zamjobs.Format();
    string rowString = Request.QueryString["rowCount"];
    string PostID = Request.QueryString["PostID"];
    bool flag = false;
    
    System.Data.DataTable jobPostByCompany = advertiser.getJobPostIDByCompanyEmail(User.Identity.Name);

    for (int x = 0; x < jobPostByCompany.Rows.Count; x++)
    {
        if (jobPostByCompany.Rows[x]["ID"].ToString() == PostID)
        {
            flag = true;
        }
    }

    if (flag)
    {
        System.Data.DataTable jobPost = advertiser.getJobPostDetail(PostID);
        System.Data.DataTable jobSeeker = advertiser.getJobSeeker(PostID);
        Response.Write("<h4>Applicants (" + jobSeeker.Rows.Count + ")</h4>");

        int count = 0;
        int rowCount = jobSeeker.Rows.Count - 1;
        int rows = 0;
        int pageCount = 0;

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
            Response.Write("<ul>");
            for (; count <= rows; count++)
            {
                Response.Write("<li><a href='JobseekerDetails.aspx?JobseekerID=" + jobSeeker.Rows[count]["JobseekerID"].ToString() + "'>");
                Response.Write(format.GetJobseekerIdFormat(jobSeeker.Rows[count]["JobseekerID"].ToString()) + "-");
                Response.Write(jobSeeker.Rows[count]["FirstName"].ToString() + " ");
                Response.Write(jobSeeker.Rows[count]["LastName"].ToString() + "<br/></a>");
                Response.Write(jobSeeker.Rows[count]["Email"].ToString() + " | ");
                Response.Write(jobSeeker.Rows[count]["ContactNumber"].ToString());
                Response.Write("</li>");
            }
            Response.Write("</ul>");
            pageCount = (rowCount / 10) + 1;
            Response.Write("<p>Page: ");
            for (int i = 0; i < pageCount; i++)
            {
                Response.Write("<a href='JobPostApplicants.aspx?PostID=" + PostID + "&rowCount=" + 10 * i + "'>" + (i + 1) + "</a>" + " ");
            }
            Response.Write("</p>");
        }
        else
        {
            Response.Write("<p>Currently no applicants</p>");
        }

    }
    else
    {
        Response.Redirect("~/InvalidPageRequest.aspx");
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
     %>
</asp:Content>
