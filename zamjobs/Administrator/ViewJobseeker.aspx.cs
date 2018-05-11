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

namespace zamjobs.Administrator
{
    public partial class ViewJobseeker : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadBtn();
        }

        protected void LoadBtn()
        {
            btnDownloadCV.Enabled = false;
            btnEdit.Enabled = false;
            btnDeactivate.Enabled = false;
            btnActivate.Enabled = false;
            btnCancel.Enabled = false;
            btnViewDetail.Enabled = false;
        }

        protected void select_Click(object sender, EventArgs e)
        {
          
            btnDownloadCV.Enabled = true;
            btnEdit.Enabled = true;
            btnViewDetail.Enabled = true;
        }

        protected void btnDownloadCV_Click(object sender, EventArgs e)
        {
            string jobseekerID = Convert.ToString((int)GridView1.SelectedValue);
            administrator admin = new administrator();
            Byte[] data = admin.GetCVByJobseekerID(jobseekerID);
            Response.Clear();
            Response.Buffer = true;
            Response.ContentType = "application/vnd.ms-word";
            Response.AddHeader("content-disposition", "attachment;filename=ZamJobsCV_" + admin.GetJobseekerName(jobseekerID) + ".doc");
            Response.Charset = "";
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.BinaryWrite(data);
            Response.End();
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            btnActivate.Enabled = true;
            btnDeactivate.Enabled = true;
            btnCancel.Enabled = true;
            
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            LoadBtn();
        }

        protected void btnViewDetail_Click(object sender, EventArgs e)
        {

        }

        protected void btnActivate_Click(object sender, EventArgs e)
        {

        }

        protected void btnDeactivate_Click(object sender, EventArgs e)
        {

        }

    }
}
