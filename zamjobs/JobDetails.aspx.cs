using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

namespace zamjobs
{
    public partial class JobDetails : System.Web.UI.Page
    {
        static string prevPage = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    prevPage = Request.UrlReferrer.ToString();
                }
                catch(NullReferenceException)
                {
                    Response.Redirect("~/InvalidPageRequest.aspx");
                }

            }

            HttpCookie objck = Request.Cookies["zamjobs_authcookie"];

            if (objck == null) // Double checks to ensure user is logged in. If not user redirected to default.aspx
            {
                btnApply.Enabled = false;
                
            }
            else
            {
                string[] userRole = Roles.GetRolesForUser(User.Identity.Name); // gets user role
                
                switch (userRole[0]) // switch based on user roles to changes apply button
                {
                    case "jobseeker":
                        {
                            lblJobseekerMsg.Text = "Apply for this job to alert the advertiser of your interest. Simply click the apply button.";
                            lblJobseekerMsg.Visible = true;
                            btnApply.Enabled = true;
                        }
                        break;
                    case "employer": btnApply.Enabled =false;
                        break;
                    case "admin": btnApply.Enabled =false;
                        break;
                    default: btnApply.Enabled =false;
                        break;
                }
            }

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect(prevPage);
        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            SqlConnection connString = new SqlConnection(ConfigurationManager.ConnectionStrings["ZamJobsConnString"].ConnectionString);
            dataAccess applicant = new dataAccess();
            DataTable idTable = applicant.getTable("SELECT ID FROM jobsdb_Jobseeker WHERE Email = '" + User.Identity.Name + "'");
            string id = idTable.Rows[0]["ID"].ToString();
            string jobPost =  Request.QueryString["PostID"];
            int userId = Convert.ToInt32(id);
            int postID = Convert.ToInt32(jobPost); 
            DataTable application = applicant.getTable("SELECT JobseekerID, JobPostID FROM jobsdb_Application WHERE JobseekerID = " + 
                userId + " AND JobPostID = " + postID);
            if (application.Rows.Count == 0)
            {
                string insertString = "INSERT INTO jobsdb_Application (JobseekerID, JobPostID, Date) VALUES ('" +
                    userId + "','" + postID + "','" + DateTime.Now.ToShortDateString() + "')";

                try
                {
                    SqlCommand cmd = new SqlCommand(insertString, connString);

                    connString.Open();
                    // Call ExecuteNonQuery to send command
                    cmd.ExecuteNonQuery();
                    connString.Close();

                    lblMessage.Text = "Application successful. Thankyou for applying.";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Visible = true;
                  
                }
                catch (SqlException)
                {
                    lblMessage.Text = "An Error has occured with your application. Please retry. If problem persists please contact us.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Visible = true;
                }
            }
            else
            {
                lblMessage.Text = "You have Already Applied for this job.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Visible = true;
            }

        }

    }
}
