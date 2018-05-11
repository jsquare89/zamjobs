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
    public partial class JobAdverts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connString = ConfigurationManager.ConnectionStrings["ZamJobsConnString"].ConnectionString;
            string selectCommand = @"SELECT jobsdb_JobPost.ID, jobsdb_JobPost.Title, jobsdb_JobPost.PostDate, jobsdb_JobPost.ExpireDate FROM jobsdb_JobPost INNER JOIN jobsdb_Employer ON jobsdb_JobPost.Company = jobsdb_Employer.ID WHERE (jobsdb_Employer.Email ='" + User.Identity.Name + "')";

            //SqlDataSource SqlDataSourceJobAdverts = new SqlDataSource(connString, selectCommand);
            //GridView1.DataSource = SqlDataSourceJobAdverts; 
            SqlDataSourceJobAdvert.ConnectionString = connString;
            SqlDataSourceJobAdvert.SelectCommand = selectCommand;
            //GridView1.DataBind();

            btnExtendAdvert.Enabled = false;
            btnViewDetail.Enabled = false;
            ddlAdvertLength.Enabled = false;

        }

        protected void btnExtendAdvert_Click(object sender, EventArgs e)
        {
            dataAccess database = new dataAccess();
            advertiser post = new advertiser();
            string totalUnits = post.GetUnitCountByEmail(User.Identity.Name);

            int unitAmount = 0;
            double addDate = 0;
            if (ddlAdvertLength.SelectedValue.ToString() == "15")
            {
                addDate = 15;
                unitAmount = 1;
            }
            else if(ddlAdvertLength.SelectedValue.ToString() == "30")
            {
                addDate = 30;
                unitAmount = 2;
            }
            DateTime expiryDate = post.GetExpireDateByJobPostID(GridView1.SelectedValue.ToString());
            
            bool flag = post.DepleteUnitsByEmail(unitAmount, User.Identity.Name);
                //Redirect user to success page
            if (flag)
            {
                database.updateData("UPDATE jobsdb_JobPost SET ExpireDate ='" + string.Format("{0:yyyy/MM/dd}", expiryDate.AddDays(addDate)) + "' WHERE ID='" + GridView1.SelectedValue.ToString() + "'");
                Response.Redirect("PostSuccessfull.aspx?PostID=" + GridView1.SelectedValue.ToString() + "&type=e&amt=" + unitAmount.ToString() + "&units=" + totalUnits);
            }
            else
            {
                Response.Redirect("PostFailed.aspx");
            }
            
        }

        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            btnViewDetail.Enabled = true;
            btnExtendAdvert.Enabled = true;
            ddlAdvertLength.Enabled = true;
        }

        protected void btnViewDetail_Click(object sender, EventArgs e)
        {
            Response.Redirect("JobPostApplicants.aspx?PostID=" + GridView1.SelectedValue.ToString());
        }
    }
}
