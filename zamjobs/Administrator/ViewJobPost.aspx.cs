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

namespace zamjobs.Administrator
{
    public partial class ViewJobPost : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

           
        }

        protected void loadDataSource()
        {
            SqlConnection connString = new SqlConnection(ConfigurationManager.ConnectionStrings["ZamJobsConnString"].ConnectionString);
            SqlDataSource jobpost = new SqlDataSource(ConfigurationManager.ConnectionStrings["ZamJobsConnString"].ConnectionString.ToString(), @"SELECT ID,Title,(SELECT        CompanyName
                               FROM            jobsdb_Employer
                               WHERE        (jobsdb_JobPost.Company = ID)) AS Company, PostDate, ExpireDate FROM jobsdb_JobPost");
            jobpost.DataSourceMode = SqlDataSourceMode.DataSet;

            GridView1.Columns.Clear();
            GridView1.DataSourceID = null;
            GridView1.DataSource = jobpost;
            GridView1.AutoGenerateColumns = true;
            GridView1.DataBind();
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            
        }
    }
}
