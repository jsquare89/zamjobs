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
    public partial class ChangePassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void ChangePassword1_ContinueButtonClick(object sender, EventArgs e)
        {
            string strRedirect = "~/Administrator/Profile.aspx";
            Response.Redirect(strRedirect);
        
        }

        protected void ChangePassword1_CancelButtonClick(object sender, EventArgs e)
        {
            string strRedirect = "~/Administrator/Profile.aspx";
            Response.Redirect(strRedirect);
        }
    }
}
