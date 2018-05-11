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
using System.Net;

namespace zamjobs
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            HttpCookie cookie = Request.Cookies["zamjobs_authcookie"];
            
            if (cookie == null) // hides or shows Signout button according to whether user is logged on or off
            {
                login.Visible = true;
                AdvertiserControl.Visible = false;
               
                JobseekerControl.Visible = false;
                AdministratorControl.Visible = false;
            }
            else
            {
                string[] userRole = Roles.GetRolesForUser(); // gets user role
                
                switch (userRole[0]) // switch based on user roles to direct logged in client to correct account type
                {
                    case "jobseeker": 
                        { 
                            AdvertiserControl.Visible = false;
                            JobseekerControl.Visible = true;
                            AdministratorControl.Visible = false;
                        }
                        break;
                    case "employer":
                        {
                            AdvertiserControl.Visible = true;
                            JobseekerControl.Visible = false;
                            AdministratorControl.Visible = false;
                        }
                        break;
                    case "admin": 
                        { 
                            AdvertiserControl.Visible = false;
                            JobseekerControl.Visible = false;
                            AdministratorControl.Visible = true;
                        }
                        break;
                    default: 
                        { 
                            AdvertiserControl.Visible = false;
                            JobseekerControl.Visible = false;
                            AdministratorControl.Visible = false;
                        }
                        break;
                }
                
                login.Visible = false;

            } 
        }
    }
}
