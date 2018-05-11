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
using System.Data.SqlClient;

namespace zamjobs.Employer
{
    public partial class PostAdvert : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie objck = Request.Cookies["zamjobs_authcookie"];
            ddlRegion.Enabled = false;
            ddlLocation.Enabled = false;
            if (objck == null) // Double checks to ensure user is logged in. If not user redirected to default.aspx
            {
                Response.Redirect("~/Default.aspx");
            }
            else
            {
                ;
            }
        }

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            string region = "";

            // Enable province selection on selecetion of Zambia in ddlCountry            
            if (ddlCountry.SelectedItem.ToString() == "Zambia")
            {

                ddlRegion.Enabled = true;
                ddlRegion.SelectedValue = popRegion(region);
            }
            else
            {
                ddlRegion.Enabled = true;
                ddlRegion.SelectedValue = "";
                ddlRegion.Enabled = false;
                ddlLocation.Enabled = true;
                ddlLocation.SelectedValue = "";
                ddlLocation.Enabled = false;
            }
        }

        protected void ddlRegion_SelectedIndexChanged(object sender, EventArgs e)
        {
            string location = "";
            // Changes ddlLocation acording to region
            if (ddlRegion.SelectedValue.ToString() != "" && ddlCountry.SelectedItem.ToString() == "Zambia")
            {
                ddlLocation.SelectedValue = popLocation(location, ddlRegion.SelectedValue.ToString());
            }
            else
            {
                ddlLocation.Enabled = false;
                ddlRegion.Enabled = true;
                ddlLocation.SelectedValue = "";
            }
        }

        protected string popRegion(string region)
        {
            dataAccess database = new dataAccess();
            DataTable RegTbl = null;
            if (region != "" || region != string.Empty)
            {
                RegTbl = database.getTable("SELECT * FROM jobsdb_Region ORDER BY Region");
            }
            else
            {
                RegTbl = database.getTable("SELECT * FROM jobsdb_Region");
                region = "";
            }

            int arraySize = RegTbl.Rows.Count + 1;
            ListItem[] item = new ListItem[arraySize];
            ddlRegion.Items.Clear();
            ddlRegion.Enabled = true;

            //Populate ddlRegion with Regions from jobsdb_Region specific to the Region
            item[0] = new ListItem();
            item[0].Text = "Any Region";
            item[0].Value = "";
            ddlRegion.Items.Add(item[0]);
            for (int i = 0; i < RegTbl.Rows.Count; i++)
            {
                item[i + 1] = new ListItem();
                item[i + 1].Text = RegTbl.Rows[i]["Region"].ToString();
                item[i + 1].Value = RegTbl.Rows[i]["ID"].ToString();
                ddlRegion.Items.Add(item[i + 1]);
            }
            return region;

        }

        protected string popLocation(string location, string regionID)
        {
            dataAccess Location = new dataAccess();
            DataTable LocTbl = Location.getTable("SELECT * FROM jobsdb_Location WHERE Region = '" + regionID + "' ORDER BY Location");

            int arraySize = LocTbl.Rows.Count + 1;
            ListItem[] item = new ListItem[arraySize];
            ddlLocation.Items.Clear();
            ddlLocation.Enabled = true;
            ddlRegion.Enabled = true;
            //rfvLocation.Enabled = true;


            //Populate ddlLocation with locations from jobsdb_Location specific to the Region
            item[0] = new ListItem();
            item[0].Text = "Any Location";
            item[0].Value = "";
            ddlLocation.Items.Add(item[0]);
            for (int i = 0; i < LocTbl.Rows.Count; i++)
            {
                item[i + 1] = new ListItem();
                item[i + 1].Text = LocTbl.Rows[i]["Location"].ToString();
                item[i + 1].Value = LocTbl.Rows[i]["ID"].ToString();
                ddlLocation.Items.Add(item[i + 1]);
            }
            return location;
        }


       

        protected void btnPost_Click(object sender, EventArgs e)
        {
            SqlConnection connString = new SqlConnection(ConfigurationManager.ConnectionStrings["ZamJobsConnString"].ConnectionString);
            
            string title = txtJobTitle.Text;
            string overview = txtJobOverview.Text;
            string companyEmail = User.Identity.Name;
            dataAccess advertiser = new dataAccess();
            advertiser post = new advertiser();
            string totalUnits = post.GetUnitCountByEmail(User.Identity.Name);
            DataTable IdTbl = advertiser.getTable("SELECT ID FROM jobsdb_Employer WHERE email = '" + companyEmail + "'");
            Int16 companyID = Convert.ToInt16(IdTbl.Rows[0]["ID"]);
            Int16 country = Convert.ToInt16(ddlCountry.SelectedValue);
            Int16 region = 0;
            if (ddlRegion.SelectedValue != "")
            {
                region = Convert.ToInt16(ddlRegion.SelectedValue);
            }
            Int16 location = 0;
            if (ddlLocation.SelectedValue != "")
            {
                location = Convert.ToInt16(ddlLocation.SelectedValue);
            }
            Int16 type = Convert.ToInt16(ddlJobType.SelectedValue);
            Int16 category = Convert.ToInt16(ddlCategory.SelectedValue);
            Int16 jobType = Convert.ToInt16(ddlJobType.SelectedValue);
            
            Int16 experience = Convert.ToInt16(ddlWorkExperience.SelectedValue);
            string exerienceComment = txtWorkExperience.Text;
            Int16 education = Convert.ToInt16(ddlEducation.SelectedValue);
            string educationComment = txtEducation.Text;
            string personalAttributes = txtPesonalAttributes.Text;
            string competencies = txtCompetencies.Text;
            string postDate = string.Format( "{0:yyyy/MM/dd}", DateTime.Today);
            int unitAmount = 0;
            string expiryDate = string.Format( "{0:yyyy/MM/dd}", DateTime.Now.AddDays(Convert.ToDouble(ddlAdvertLength.SelectedValue.ToString())));
            if (ddlAdvertLength.SelectedValue.ToString() == "15")
            {
                unitAmount = 1;
            }
            else if(ddlAdvertLength.SelectedValue.ToString() == "30")
            {
                unitAmount = 2;
            }


            // create query string to insert data in database
            string insertString = @"
                        insert into jobsdb_JobPost
                        (Title,Overview,Company,Country,Region,Location,Category,Type,
                        WorkExperience,WorkExperienceComment,EducationLevel,EducationLevelComment,PersonalAttributes,Competencies,PostDate,ExpireDate)
                        values ('" + title + "','" + overview + "','" + companyID + "','" + country + "','" + region + "','" + location +
                        "','" + category + "','" + type + "','" + experience + "','" + exerienceComment + "','" + education +
                        "','" + educationComment + "','" + personalAttributes + "','" + competencies + "','" + postDate + "','" + expiryDate + "'); SELECT SCOPE_IDENTITY()";
            
            try
            {
                
                bool flag = post.DepleteUnitsByEmail(unitAmount, User.Identity.Name);
                //Redirect user to success page
                if (flag)
                {
                    //SqlCommand cmd = new SqlCommand(insertString, connString);
                    Int64 id = advertiser.insertData_ReturnID(insertString);
                    //connString.Open();
                    // Call ExecuteNonQuery to send command
                    //cmd.ExecuteNonQuery();
                    //connString.Close();
                    Response.Redirect("PostSuccessfull.aspx?PostID=" + id + "&type=n&amt=" + unitAmount.ToString() + "&units=" + totalUnits);
         
                }
                else
                {

                }
            }
            catch (SqlException)
            {
                Response.Redirect("PostUnsuccessfull.aspx");
            }





        }

      
    }
}
