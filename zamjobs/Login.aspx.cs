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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PanelLogin.DefaultButton = btnLogin.ID;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid) return;
            
            if (Membership.ValidateUser(txtUserID.Text, txtPassword.Text))
            {
                FormsAuthenticationTicket tkt; // creating cookie with authentication ticket to allow access to pages in application
                string cookiestr;
                HttpCookie ck;
                tkt = new FormsAuthenticationTicket(1, txtUserID.Text, DateTime.Now,
                DateTime.Now.AddMinutes(20), chbRememberMe.Checked, "ZamJobs.com");
                cookiestr = FormsAuthentication.Encrypt(tkt);
                ck = new HttpCookie(FormsAuthentication.FormsCookieName, cookiestr);
                if (chbRememberMe.Checked)
                    ck.Expires = tkt.Expiration;
                ck.Path = FormsAuthentication.FormsCookiePath;

                
                string[] userRole = Roles.GetRolesForUser(txtUserID.Text); // gets user role
                string strRedirect;  // String for redirecting to the correct page
                Response.Cookies.Add(ck);

                switch (userRole[0]) // switch based on user roles to direct logged in client to correct account type
                {
                    case "jobseeker": strRedirect = "Jobseeker/Profile.aspx";
                        break;
                    case "employer": strRedirect = "Employer/Profile.aspx";
                        break;
                    case "admin": strRedirect = "Administrator/Profile.aspx";
                        break;
                    default: strRedirect = null;
                        break;
                }
             

                if (strRedirect != null)
                {
                    Response.Redirect(strRedirect, true); // after authentication redirects to profile page
                }

            }
            else
            {
                // User name and password are not correct
                lblLegendStatus.Text = "Invalid username or password!";
            }
        }
    }
}
