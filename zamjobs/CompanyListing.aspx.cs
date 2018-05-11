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
    public partial class CompanyListing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            jobsearch jobs = new jobsearch();
            GridView1.PageSize = Convert.ToInt32(ddlRecordsPerPage.SelectedValue);
            lblCompanyCount.Text = jobs.GetCompanyCount();
        }

        protected void ddlRecordsPerPage_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.PageSize = Convert.ToInt32(ddlRecordsPerPage.SelectedValue);
            GridView1.DataBind();
            GridView1.SelectedIndex = -1;
        }
    }
}
