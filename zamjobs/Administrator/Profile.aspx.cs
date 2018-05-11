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
    public partial class AdministratorProfile : System.Web.UI.Page
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
        }
    }
}
