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
    public partial class Administrator : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignout_Click(object sender, EventArgs e)
        {
            HttpCookie ck; // recreating cookie and sending to client with exipration as now to log off client
            ck = new HttpCookie(FormsAuthentication.FormsCookieName);
            ck.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(ck);
            Response.Redirect(FormsAuthentication.DefaultUrl);
        }
    }
}