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
    public partial class UploadLogo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            advertiser advertiser = new advertiser();
            string ID = advertiser.getCompanyID(User.Identity.Name);
            
            dataAccess database = new dataAccess();
            System.Data.DataTable logos = database.getTable("SELECT Logo FROM jobsdb_Employer Where ID='" + ID + "'");
            if (logos.Rows[0]["Logo"].ToString() == "")
            {
                imgLogo.ImageUrl = "~/Images/no-logo.gif";
            }
            else
            {
                imgLogo.ImageUrl = "UploadLogo.aspx?imageID=" + ID;
                displayAdvertiserLogo();
            }
            
      
        }

        public void displayAdvertiserLogo()
        {
            try
            {

                dataAccess database = new dataAccess();
                string queryString = Request.QueryString["imageID"].ToString();
                System.Data.DataTable logos = database.getTable("SELECT Logo FROM jobsdb_Employer Where ID='" + queryString + "'");
                Byte[] buffer = (Byte[])logos.Rows[0]["logo"];
                Response.Clear();
                Response.ContentType = "Image/jpeg";
                Response.BinaryWrite(buffer);
                
            }
            catch (NullReferenceException)
            {
            }
           

        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            fiuLogo.Controls.Clear();
            lblMessage.Text = "";
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            bool validImage = false;

            advertiser logo = new advertiser();
            validImage = logo.validateLogoDimensions(fiuLogo);

            if (validImage)
            {
                bool flag = false;
                flag = logo.updateLogo(fiuLogo.FileBytes, logo.getCompanyID(User.Identity.Name));
                if (flag)
                {
                    lblMessage.Text = "Upload Successful";
                    lblMessage.Visible = true;
                    lblMessage.ForeColor = System.Drawing.Color.Green;

                }
                else
                {
                    lblMessage.Text = "Upload Failed";
                    lblMessage.Visible = true;
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                lblMessage.Text = "Upload Failed. Please ensure image is in .jpg or .jpeg format and having dimensions 150x100.";
                lblMessage.Visible = true;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}
