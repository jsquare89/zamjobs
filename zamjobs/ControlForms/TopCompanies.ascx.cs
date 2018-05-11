using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace zamjobs.ControlForms
{
    public partial class TopCompanies : System.Web.UI.UserControl
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
           

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