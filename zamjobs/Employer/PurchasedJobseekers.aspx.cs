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
    public partial class PurchasedJobseekers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FillGridView();
            /*
            advertiser company = new advertiser();
            SqlDataSource sqlDataSourcePurchasedJobseekers = new SqlDataSource();
            sqlDataSourcePurchasedJobseekers.ConnectionString = ConfigurationManager.ConnectionStrings["ZamJobsConnString"].ConnectionString.ToString() ;
            string companyID = company.getCompanyID(User.Identity.Name);
            sqlDataSourcePurchasedJobseekers.SelectCommand = "SELECT jobsdb_PurchaseJobseeker.Company, jobsdb_JobSeeker.ID, jobsdb_JobSeeker.FirstName, jobsdb_JobSeeker.LastName, jobsdb_JobSeeker.ContactNumber, jobsdb_JobSeeker.Email FROM jobsdb_JobSeeker INNER JOIN jobsdb_PurchaseJobseeker ON jobsdb_JobSeeker.ID = jobsdb_PurchaseJobseeker.Jobseeker WHERE Company ='" + companyID + "'";
            GridView1.DataSource = sqlDataSourcePurchasedJobseekers;
            GridView1.DataBind();*/
        }


        protected void GridView1_OnPageIndexChanging(Object sender, GridViewPageEventArgs e)
        {
            FillGridView();
            GridView1.PageIndex = e.NewPageIndex;
        }

        protected void FillGridView()
        {
            advertiser company = new advertiser();
            SqlDataSource sqlDataSourcePurchasedJobseekers = new SqlDataSource();
            sqlDataSourcePurchasedJobseekers.ConnectionString = ConfigurationManager.ConnectionStrings["ZamJobsConnString"].ConnectionString.ToString();
            string companyID = company.getCompanyID(User.Identity.Name);
            sqlDataSourcePurchasedJobseekers.SelectCommand = "SELECT jobsdb_PurchaseJobseeker.Company, jobsdb_JobSeeker.ID, jobsdb_JobSeeker.FirstName, jobsdb_JobSeeker.LastName, jobsdb_JobSeeker.ContactNumber, jobsdb_JobSeeker.Email FROM jobsdb_JobSeeker INNER JOIN jobsdb_PurchaseJobseeker ON jobsdb_JobSeeker.ID = jobsdb_PurchaseJobseeker.Jobseeker WHERE Company ='" + companyID + "'";
            GridView1.DataSource = sqlDataSourcePurchasedJobseekers;
            GridView1.DataBind();
        }
    }
}
