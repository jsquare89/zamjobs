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

namespace zamjobs
{
    public partial class CompanyDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string ID = Request.QueryString["id"].ToString();
            jobsearch job = new jobsearch();
            btnSearchCompanyJobs.Text = "Search Jobs (" + job.GetJobCountByCompanyID(ID) +")";
            dataAccess database = new dataAccess();
            System.Data.DataTable logos = database.getTable("SELECT Logo FROM jobsdb_Employer Where ID='" + ID + "'");
            if (logos.Rows[0]["Logo"].ToString() == "")
            {
                imgLogo.ImageUrl = "~/Images/no-logo.gif";
                
            }
            else
            {
                imgLogo.ImageUrl = "CompanyDetail.aspx?id=" + ID + "&imageID=" + ID;
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

        protected void btnSearchCompanyJobs_Click(object sender, EventArgs e)
        {
            Response.Redirect("CompanyJobListing.aspx?row=0&key=&Cat=&Reg=&Loc=&adv=" + Request.QueryString["id"].ToString());
            
        }
    }
}
