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
    public partial class CompanyJobListing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public DataTable getList(string category, string region, string location, string title, string company)
        {
            string queryFilter = "";
            string categoryFilter = CategorySearch(category);
            string regionFilter = RegionSearch(region);
            string locationFilter = LocationSearch(location);
            string titleFilter = JobTitleSearch(title);
            string companyFilter = CompanySearch(company);
            int filters = 5;
            string[] filterArray = new string[filters];
            filterArray[0] = categoryFilter;
            filterArray[1] = regionFilter;
            filterArray[2] = locationFilter;
            filterArray[3] = titleFilter;
            filterArray[4] = companyFilter;
            bool concatenateflag = false;

            if (categoryFilter == "" && regionFilter == "" && locationFilter == "" && titleFilter == "" && companyFilter == "")
            {
                queryFilter = "";
                concatenateflag = false;
            }
            else
            {
                queryFilter = " WHERE ";
                concatenateflag = true;
            }

            if (concatenateflag)
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
            string queryString = "SELECT ID, Title, Overview," +
                "(SELECT CompanyName FROM jobsdb_Employer WHERE (jobsdb_JobPost.Company = ID)) AS Company," +
                "(SELECT Country FROM jobsdb_Country WHERE (ID = jobsdb_JobPost.Country)) AS Country," +
                "(SELECT Region FROM jobsdb_Region WHERE (ID = jobsdb_JobPost.Region)) AS Region, Region AS RegionID," +
                "(SELECT Location FROM jobsdb_Location WHERE (ID = jobsdb_JobPost.Location)) AS Location, Location AS LocationID ," +
                "(SELECT Category FROM jobsdb_JobCategory WHERE (ID = jobsdb_JobPost.Category)) AS Category, Category AS CategoryID," +
                "(SELECT JobType FROM jobsdb_JobType WHERE (ID = jobsdb_JobPost.Type)) AS Type," +
                "PostDate, ExpireDate FROM jobsdb_JobPost" + queryFilter;
            DataTable list = JobListing.getTable(queryString);
            return list;
        }

        public string GetCategory(string category)
        {
            string categoryName = "";
            if (category != "")
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
            if (region != "")
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
            if (location != "")
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
            if (title == "")
            {
                title = "Any Job Title";
            }

            return title;
        }

        public string CategorySearch(string category)
        {
            if (category != "" || category != string.Empty)
            {
                category = "Category='" + category + "' ";
            }
            return category;
        }

        public string RegionSearch(string region)
        {
            if (region != "" || region != string.Empty)
            {
                region = "Region='" + region + "' ";
            }
            return region;
        }

        public string LocationSearch(string location)
        {
            if (location != "" || location != string.Empty)
            {
                location = "Location='" + location + "' ";
            }
            return location;
        }

        public string JobTitleSearch(string title)
        {
            if (title != "" || title != string.Empty)
            {
                title = "Title LIKE '%" + title + "%' ";
            }
            return title;
        }

        public string CompanySearch(string company)
        {
            if (company != "" || company != string.Empty)
            {
                company = "Company='" + company + "'";
            }
            return company;
        }

    }
}
