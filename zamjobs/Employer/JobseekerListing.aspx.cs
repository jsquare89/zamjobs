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
    public partial class JobseekerListing : System.Web.UI.Page
    {
        protected string category = "";
        protected string region = "";
        protected string location = "";
        protected string country = "";
        protected string education = "";
        protected string experience = "";
        protected string filter = "";

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
                    education = Request.QueryString["Edu"].ToString();
                    experience = Request.QueryString["Exp"].ToString();
                    filter = Request.QueryString["fil"].ToString();
                }
                catch (NullReferenceException)
                {
                }

                ddlCategory.SelectedValue = category;
                ddlCountry.SelectedValue = country;
                ddlRegion.SelectedValue = region;
                ddlLocation.SelectedValue = location;
                ddlExperience.SelectedValue = experience;
                ddlEducation.SelectedValue = education;
                
                rblExp.SelectedIndex = rblExp.Items.IndexOf(rblExp.Items.FindByValue(filter));
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

        public DataTable getList(string category, string region, string location, string country, string education, string experience, string filter)
        {
            string queryFilter = "";
            string categoryFilter = CategorySearch(category);
            string regionFilter = RegionSearch(region);
            string locationFilter = LocationSearch(location);
            string countryFilter = CountrySearch(country);
            string educationFilter = EducationSearch(education);
            string experienceFilter = ExperienceSearch(experience, filter);

            int filters = 6;
            string[] filterArray = new string[filters];
            filterArray[0] = categoryFilter;
            filterArray[1] = regionFilter;
            filterArray[2] = locationFilter;
            filterArray[3] = countryFilter;
            filterArray[4] = educationFilter;
            filterArray[5] = experienceFilter;
            bool concatenateflag = false;

            if (categoryFilter == "" && regionFilter == "" && locationFilter == "" && countryFilter == "" && educationFilter == "" && experienceFilter == "")
            {
                queryFilter = "";
                concatenateflag = false;
            }
            else
            {
                queryFilter = " AND ";
                concatenateflag = true;
            }

            if (concatenateflag)
            {
                for (int i = 0; i < filters; i++)
                {
                    if (filterArray[i] != "")
                    {
                        if (queryFilter != " AND ")
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
            string queryString = @"SELECT        ID, FirstName, LastName,
                             (SELECT        Country
                               FROM            jobsdb_Country
                               WHERE        (ID = jobsdb_JobSeeker.Country)) AS Country,
                             (SELECT        Region
                               FROM            jobsdb_Region
                               WHERE        (ID = jobsdb_JobSeeker.Region)) AS Region,
                             (SELECT        Location
                               FROM            jobsdb_Location
                               WHERE        (ID = jobsdb_JobSeeker.Location)) AS Location,
                             (SELECT        Nationality
                               FROM            jobsdb_Nationality
                               WHERE        (ID = jobsdb_JobSeeker.Nationality)) AS Nationality, 
                             (SELECT        Category
                               FROM            jobsdb_JobCategory
                               WHERE        (ID = jobsdb_JobSeeker.JobCategory)) AS Category,Experience,
                             (SELECT        EducationLevel
                               FROM            jobsdb_Education
                               WHERE        (ID = jobsdb_JobSeeker.Education)) AS Education
                            FROM jobsdb_JobSeeker WHERE Status ='1' AND Active = 'Y' " + queryFilter;
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

        public string GetCountry(string country)
        {
            string countryName = "";
            if (country != "" && country != null)
            {
                dataAccess database = new dataAccess();
                DataTable conTbl = database.getTable("SELECT Country FROM jobsdb_Country WHERE ID='" + country + "'");
                countryName = conTbl.Rows[0]["Country"].ToString();
            }
            else
            {
                countryName = "Any Country";
            }
            return countryName;
        }

        public string GetEducation(string education)
        {
            string educationName = "";
            if (education != "" && education != null)
            {
                dataAccess database = new dataAccess();
                DataTable conTbl = database.getTable("SELECT EducationLevel FROM jobsdb_Education WHERE ID='" + education + "'");
                educationName = conTbl.Rows[0]["EducationLevel"].ToString();
            }
            else
            {
                educationName = "Any Education";
            }
            return educationName;
        }

        public string GetExperience(string experience, string filter)
        {
            string experienceName = "";
            if (experience != "" && experience != null && filter != "" && filter != null)
            {
                if (filter == "g")
                {
                    filter = "greater than or equal to ";
                }
                else if (filter == "l")
                {
                    filter = "less than or equal to ";
                }
                else if (filter == "e")
                {
                    filter = "equal to ";
                }
                else
                {
                    filter = "";
                }
                 experienceName = filter + experience + " years experience" ;
            }
            else
            {
                experienceName = "Any Experience";
            }
            return experienceName;
        }




        public string CategorySearch(string category)
        {
            if (category != "")
            {
                category = "JobCategory='" + category + "' ";
            }
            return category;
        }

        public string RegionSearch(string region)
        {
            if (region != "")
            {
                region = "Region='" + region + "' ";
            }
            return region;
        }

        public string LocationSearch(string location)
        {
            if (location != "")
            {
                location = "Location='" + location + "' ";
            }
            return location;
        }

        public string CountrySearch(string country)
        {
            if (country != "")
            {
                country = "Country='" + country + "' ";
            }
            return country;
        }

        public string EducationSearch(string education)
        {
            if (education != "")
            {
                education = "Education='" + education + "' ";
            }
            return education;
        }

        public string ExperienceSearch(string experience, string filter)
        {
            if(filter == "g")
            {
                filter = ">=";
            }
            else if(filter =="l")
            {
                filter = "<=";
            }
            else if (filter == "e")
            {
                filter = "=";
            }
            else
            {
                filter = "";
            }

            if (experience != "" && filter != "")
            {
                experience = "Experience " + filter + " " + Convert.ToInt32(experience) + " ";
            }
            return experience;
        }

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Enable province selection on selection of Zambia in ddlCountry            
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
            if(rblExp.SelectedValue.ToString() == ">=")
            {
                filter = "g";
            }
            else if(rblExp.SelectedValue.ToString() == "<=")
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
