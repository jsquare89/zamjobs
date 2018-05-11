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
using System.Net;

namespace zamjobs
{
    public partial class EmployerProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie objck = Request.Cookies["zamjobs_authcookie"];

            if (objck == null) // Double checks to ensure user is logged in. If not user redirected to default.aspx
            {
                Response.Redirect("~/Default.aspx");
            }
            else
            {
                lblUserID.Text = User.Identity.Name;
               
            }

            /*image logo = new image();
            logo.displayAdvertiserLogo(User.Identity.Name);*/
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
                imgLogo.ImageUrl = "Profile.aspx?imageID=" + ID;
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
    }
}
