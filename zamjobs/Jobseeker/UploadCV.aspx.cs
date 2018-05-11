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

namespace zamjobs.Jobseeker
{
    public partial class UploadCV : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDownloadCV_Click(object sender, EventArgs e)
        {
            jobseeker CV = new jobseeker();
            string JobseekerEmail = User.Identity.Name;
            byte[] data = CV.GetCV(JobseekerEmail);
            // Open binary data in word .doc format
            Response.Clear();
            Response.Buffer = true;
            Response.ContentType = "application/vnd.ms-word";
            Response.AddHeader("content-disposition", "attachment;filename=CV.doc");
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            Response.BinaryWrite(data);
            Response.End();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            fiuCV.Controls.Clear();
            lblMessage.Visible = false;
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            bool flag = false;
            Byte[] CV = fiuCV.FileBytes;
            if ((Convert.ToInt32(fiuCV.PostedFile.ContentLength.ToString()) < 131072) && fiuCV.PostedFile.FileName.EndsWith(".doc"))
            {
                jobseeker uploadCV = new jobseeker();
                flag =  uploadCV.UploadCV(CV, User.Identity.Name);
            }
            
            if (flag)
            {
                lblMessage.Text = "CV successfully uploaded";
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Visible = true; 
            }
            else
            {
                lblMessage.Text = "CV upload failed. Please ensure CV file is of type MS Word 2003 .doc format and smaller than 128kb";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Visible = true;
            }

        }
    }
}
