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
    public partial class JobListing : System.Web.UI.Page
    {
        protected string category = "";
        protected string region = "";
        protected string location = "";
        protected string country = "";
        protected string title = "";

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                try
                {
                    category = Request.QueryString["Cat"].ToString();
                    region = Request.QueryString["Reg"].ToString();
                    location = Request.QueryString["Loc"].ToString();
                    country = Request.QueryString["Cou"].ToString();
                    title = Request.QueryString["key"].ToString();
                }
                catch (NullReferenceException)
                {
                }

                ddlCategory.SelectedValue = category;
                ddlCountry.SelectedValue = country;
                ddlRegion.SelectedValue = region;
                ddlLocation.SelectedValue = location;
                txtTitle.Text = title;

                if (country != "1") //1 = Zambia
                {
                    ddlRegion.SelectedValue = "";
                    ddlLocation.SelectedValue = "";
                    ddlLocation.Enabled = false;
                    ddlRegion.Enabled = false;
                }
                else
                {
                    ddlRegion.Enabled = true;
                    ddlRegion.SelectedValue = popRegion(region);
                    ddlLocation.SelectedValue = popLocation(location, ddlRegion.SelectedValue.ToString());
                }
            }
            else
            {

            }
            
        }
        /////////////////////////////////////////////////////////////
        ///              ZamJobs Search Functions                 ///
        ///                       Created by Jarred Jardine       ///
        ///                                                       ///
        /// The following function allows the jobsdb to be        ///
        /// searched by specific criteria including job title,    ///
        /// job category, region, location,                       ///
        ///                                                       ///
        /// It works by creaing a dynamic sql select query that   ///
        /// changes apon input.                                   ///
        ///                                                       ///
        /////////////////////////////////////////////////////////////
        
        public DataTable getList(string category, string region, string location, string title, string country)
        {
            string queryFilter = "";
            string categoryFilter = CategorySearch(category);
            string regionFilter = RegionSearch(region);
            string locationFilter = LocationSearch(location);
            string titleFilter = JobTitleSearch(title);
            string countryFilter = CountrySearch(country);
            int filters = 5;
            string[] filterArray = new string[filters];
            filterArray[0] = categoryFilter;
            filterArray[1] = regionFilter;
            filterArray[2] = locationFilter;
            filterArray[3] = titleFilter;
            filterArray[4] = countryFilter;
            bool concatenateflag = false;
            
            if (categoryFilter == "" && regionFilter == "" && locationFilter == "" && titleFilter == "" && countryFilter == "")
            {
                queryFilter = "";
                concatenateflag = false;
            }
            else
            {
                queryFilter = " WHERE ";
                concatenateflag = true;
            }
            
            if(concatenateflag)
            {
                for (int i = 0; i < filters; i++)
                {
                    if (filterArray[i] != "")
                    {
                        if (queryFilter != " WHERE ")
                        {
                            queryFilter = queryFilter + " AND " + filterArray[i]; 
                        }
                        else
                        {
                            queryFilter = queryFilter + filterArray[i];
                        }
                    }
                }
            }

            dataAccess JobListing = new dataAccess();
            string queryString = "SELECT * FROM jobsdb_ActiveJobPosts_View" + queryFilter;
            DataTable list = JobListing.getTable(queryString);
            return list;   
        }

        public string GetCategory(string category)
        {
            string categoryName = "";
            if (category != "" && category != null)
            {
                dataAccess database = new dataAccess();
                DataTable catTbl = database.getTable("SELECT Category FROM jobsdb_JobCategory WHERE ID='" + category + "'");
                categoryName = catTbl.Rows[0]["Category"].ToString();
            }
            else
            {
                categoryName = "Any Category";
            }
            return categoryName;
        }

        public string GetCountry(string country)
        {
            string countryName = "";
            if (country != "" && country != null)
            {
                dataAccess database = new dataAccess();
                DataTable couTbl = database.getTable("SELECT Country FROM jobsdb_Country WHERE ID='" + country + "'");
                countryName = couTbl.Rows[0]["Country"].ToString();
            }
            else
            {
                countryName = "Any Country";
            }
            return countryName;
        }

        public string GetRegion(string region)
        {
            string regionName = "";
            if (region != "" && region != null)
            {
                dataAccess database = new dataAccess();
                DataTable regTbl = database.getTable("SELECT Region FROM jobsdb_Region WHERE ID='" + region + "'");
                regionName = regTbl.Rows[0]["Region"].ToString();
            }
            else
            {
                regionName = "Any Region";
            }
            return regionName;
        }

        public string GetLocation(string location)
        {
            string locationName = "";
            if (location != "" && location != null)
            {
                dataAccess database = new dataAccess();
                DataTable locTbl = database.getTable("SELECT Location FROM jobsdb_Location WHERE ID='" + location + "'");
                locationName = locTbl.Rows[0]["Location"].ToString();
            }
            else
            {
                locationName = "Any Location";
            }
            return locationName;
        }

        public string GetTitle(string title)
        {
            if (title == "" || title == null)
            {
                title = "Any Job Title";
            }
            
            return title;
        }

        public string CategorySearch(string category)
        {
            if (category != "")
            {
                category = "CategoryID='" + category + "' ";
            }
            return category;
        }

        public string RegionSearch(string region)
        {
            if (region != "")
            {
                region = "RegionID='" + region + "' ";
            }
            return region;
        }

        public string LocationSearch(string location)
        {
            if (location != "")
            {
                location = "LocationID='" + location + "' ";
            }
            return location;
        }

        public string JobTitleSearch(string title)
        {
            if (title != "")
            {
                title = "Title LIKE '%" + title + "%' ";
            }
            return title;
        }

        public string CountrySearch(string country)
        {
            if (country != "")
            {
                country = "CountryID='" + country + "' ";
            }
            return country;
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

            Response.Redirect("JobListing.aspx?row=0&key=" + txtTitle.Text.ToString() + "&Cat=" + ddlCategory.SelectedValue.ToString() + "&Reg=" + ddlRegion.SelectedValue.ToString() + "&Loc=" + ddlLocation.SelectedValue.ToString() + "&Cou=" + ddlCountry.SelectedValue.ToString());
        }


        protected void btClear_Click(object sender, EventArgs e)
        {
            ddlRegion.Enabled = true;
            ddlRegion.SelectedValue = "";
            ddlRegion.Enabled = false;
            ddlLocation.Enabled = true;
            ddlLocation.SelectedValue = "";
            ddlLocation.Enabled = false;
            ddlCountry.SelectedValue = "";
            ddlCategory.SelectedValue = "";
            txtTitle.Text = "";
        }
    }
}
