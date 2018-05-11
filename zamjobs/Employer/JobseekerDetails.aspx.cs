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
    public partial class JobseekerDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string ID = Request.QueryString["JobseekerID"].ToString();
                int idNum = Convert.ToInt32(ID);
                try
                {
                    
                    advertiser jobseeker = new advertiser();
                    bool flag = jobseeker.checkJobseeker(ID);
                    if (flag)
                    {
                        if (jobseeker.checkUserAccessToJobseeker(User.Identity.Name, ID))
                        {
                            btnDownloadCV.Visible = true;
                            lblErrorMsg.Visible = false;
                            DetailsView1.Enabled = true;
                        }
                        else
                        {
                            btnDownloadCV.Visible = false;
                            lblErrorMsg.Text = "You do not have access to the requested jobseeker.";
                            lblErrorMsg.Visible = true;
                            DetailsView1.Enabled = false;
                            DetailsView1.Visible = false;
                        }
                    }
                    else
                    {
                        btnDownloadCV.Visible = false;
                        lblErrorMsg.Text = "There hase been an error with your request.";
                        lblErrorMsg.Visible = true;
                    }
                }
                catch(FormatException)
                {
                }
            }
            catch (Exception)
            {
                btnDownloadCV.Visible = false;
                lblErrorMsg.Text = "There hase been an error with your request.";
                lblErrorMsg.Visible = true;

            }

        }

        protected void btnDownloadCV_Click(object sender, EventArgs e)
        {
            advertiser CV = new advertiser();
            string jobseekerID = Request.QueryString["JobseekerID"].ToString();
            byte[] data = CV.getCV(jobseekerID);
            // Open binary data in word .doc format
            Response.Clear();
            Response.Buffer = true;
            Response.ContentType = "application/vnd.ms-word";
            Response.AddHeader("content-disposition", "attachment;filename=ZamJobsCV_" + CV.GetJobseekerName(jobseekerID) + ".doc");
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            Response.BinaryWrite(data);
            Response.End();
        }
    }
}
