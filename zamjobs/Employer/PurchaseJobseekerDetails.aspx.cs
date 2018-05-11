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

namespace zamjobs.Employer
{
    public partial class PurchaseJobseekerDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string jobseekerID = Request.QueryString["id"].ToString();
            advertiser purchase = new advertiser();
            if (purchase.CheckJobseekerStatus(jobseekerID))
            {

                if (purchase.CheckExistingPurchaseJobseeker(jobseekerID, User.Identity.Name))
                {
                    btnPurchaseDetails.Enabled = false;
                }
            }
            else
            {
                btnPurchaseDetails.Visible = false;
                lblMessage.Text = "User does not exist or inactive.";
            }

        }

        protected void btnPurchaseDetails_Click(object sender, EventArgs e)
        {
            string jobseekerID = Request.QueryString["id"].ToString();
            advertiser purchase = new advertiser();
            int unitAmount = 1;
            string totalUnits = purchase.GetUnitCountByEmail(User.Identity.Name);
            
                try
                {

                    bool flag = purchase.DepleteUnitsByEmail(unitAmount, User.Identity.Name);
                    //Redirect user to success page
                    if (flag)
                    {
                        purchase.PurchaseJobseeker(jobseekerID, User.Identity.Name);

                        Response.Redirect("PurchasedJobseekerDetail.aspx?id=" + jobseekerID + "&units=" + totalUnits +"&amt=" + unitAmount);
                    }

                    else
                    {
                        Response.Redirect("PurchaseFailure.aspx");
                    }
                }
                catch (SqlException)
                {
                    Response.Redirect("PurchaseFailure.aspx");
                }
            







           
            
        }
    }
}
