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
    public partial class QuickSearch : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PanelQuickSearch.DefaultButton = btnSearch.ID;

        }


        
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            
            Response.Redirect("~/JobListing.aspx?row=0&key=" + txtSearch.Text + "&Cat=" + ddlCategory.SelectedValue.ToString() +
                "&Reg=" + ddlRegion.SelectedValue.ToString() + "&Loc=&Cou=");
        }
      
    }
}