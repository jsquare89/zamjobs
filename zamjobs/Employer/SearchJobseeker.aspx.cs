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

namespace zamjobs.Employer
{
    public partial class SearchJobseeker : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ddlLocation.Enabled = false;
            ddlRegion.Enabled = false;

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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string filter = ""; // used to pass less than or greater than to query string
            if (rblExp.SelectedValue.ToString() == ">=")
            {
                filter = "g";
            }
            else if (rblExp.SelectedValue.ToString() == "<=")
            {
                filter = "l";
            }
            else if (rblExp.SelectedValue.ToString() == "=")
            {
                filter = "e";
            }

            Response.Redirect("JobseekerListing.aspx?row=0&fil=" + filter + "&Cat=" + ddlCategory.SelectedValue.ToString() + "&Reg=" + ddlRegion.SelectedValue.ToString() + "&Loc=" + ddlLocation.SelectedValue.ToString() + "&Cou=" + ddlCountry.SelectedValue.ToString() + "&Edu=" + ddlEducation.SelectedValue.ToString() + "&Exp=" + ddlExperience.SelectedValue.ToString());
        }


        protected void btClear_Click(object sender, EventArgs e)
        {
            ddlRegion.Enabled = true;
            ddlRegion.SelectedValue = "";
            ddlRegion.Enabled = false;
            ddlLocation.Enabled = true;
            ddlLocation.SelectedValue = "";
            ddlLocation.Enabled = false;
            ddlExperience.SelectedValue = "";
            ddlCountry.SelectedValue = "";
            ddlEducation.SelectedValue = "";
            ddlCategory.SelectedValue = "";

        }

        
    }
}
