using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

namespace zamjobs.Employer
{
    public partial class JobPostApplicants : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["PostID"] != null)
            {
                advertiser jobpost = new advertiser();
                string companyID = jobpost.getCompanyID(User.Identity.Name);
                string jobpostID = Request.QueryString["PostID"].ToString();
                string selectQuery = @"SELECT        ID, Title, Overview,
                             (SELECT        CompanyName
                               FROM            jobsdb_Employer
                               WHERE        (jobsdb_JobPost.Company = ID)) AS Company,
                             (SELECT        Country
                               FROM            jobsdb_Country
                               WHERE        (ID = jobsdb_JobPost.Country)) AS Country,
                             (SELECT        Region
                               FROM            jobsdb_Region
                               WHERE        (ID = jobsdb_JobPost.Region)) AS Region,
                             (SELECT        Location
                               FROM            jobsdb_Location
                               WHERE        (ID = jobsdb_JobPost.Location)) AS Location,
                             (SELECT        Category
                               FROM            jobsdb_JobCategory
                               WHERE        (ID = jobsdb_JobPost.Category)) AS Category,
                             (SELECT        JobType
                               FROM            jobsdb_JobType
                               WHERE        (ID = jobsdb_JobPost.Type)) AS Type,
                             WorkExperience, WorkExperienceComment,
                             (SELECT        EducationLevel
                               FROM            jobsdb_Education
                               WHERE        (ID = jobsdb_JobPost.EducationLevel)) AS EducationLevel, EducationLevelComment, PersonalAttributes, Competencies, PostDate, ExpireDate
                            FROM            jobsdb_JobPost
                        WHERE        ID ='" + jobpostID + "' AND Company='" + companyID + "'";
                SqlDataSource sqlDataSourceJobPost = new SqlDataSource();
                sqlDataSourceJobPost.ConnectionString = ConfigurationManager.ConnectionStrings["ZamJobsConnString"].ConnectionString.ToString();
                sqlDataSourceJobPost.SelectCommand = selectQuery;
                DetailsView1.DataSource = sqlDataSourceJobPost;
                DetailsView1.DataBind();
            }

        }


    }
}
