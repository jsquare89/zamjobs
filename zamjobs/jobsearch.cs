using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace zamjobs
{
    public class jobsearch
    {
        private dataAccess database = new dataAccess();

        public Int32 CountJobsByRegionID(string regionID)
        {
            DataTable region = database.getTable("SELECT COUNT(*) FROM  jobsdb_JobPost INNER JOIN jobsdb_Employer ON jobsdb_JobPost.Company = jobsdb_Employer.ID WHERE (jobsdb_Employer.Active = 'Y') AND (jobsdb_JobPost.Region ='" + regionID + "')");
            return Convert.ToInt32(region.Rows[0][0].ToString()) ;
        }

        public Int32 CountJobsByLocationID(string locationID)
        {
            DataTable location = database.getTable("SELECT COUNT(*) FROM  jobsdb_JobPost INNER JOIN jobsdb_Employer ON jobsdb_JobPost.Company = jobsdb_Employer.ID WHERE (jobsdb_Employer.Active = 'Y') AND (jobsdb_JobPost.Location ='" + locationID + "')");
            return Convert.ToInt32(location.Rows[0][0].ToString());
        }

        public Int32 CountJobsByCompanyID(string companyID)
        {
            DataTable company = database.getTable("SELECT COUNT(*) FROM jobsdb_JobPost WHERE (Company ='" + companyID + "')");
            return Convert.ToInt32(company.Rows[0][0].ToString());
        }

        public Int32 CountJobseekerByCountryID(string countryID)
        {
            DataTable country = database.getTable("SELECT COUNT(*) FROM jobsdb_JobSeeker WHERE Status ='1' AND Active = 'Y' AND (Country ='" + countryID + "')");
            return Convert.ToInt32(country.Rows[0][0].ToString());
        }

        public DataTable GetRegions()
        {
            return database.getTable("SELECT * FROM jobsdb_Region");
        }

        public DataTable GetCountries()
        {
            return database.getTable("SELECT * FROM jobsdb_Country");
        }

        public DataTable GetLocationsByRegionID(string regionID)
        {
            return database.getTable("SELECT * FROM jobsdb_Location WHERE Region='" + regionID + "'");
        }

        public DataTable GetTopCompanyJobCount()
        {
            return database.getTable("SELECT TOP (10) COUNT(Company) AS Count, Company FROM jobsdb_JobPost GROUP BY Company ORDER BY Count DESC");
        }

        public string GetCompanyNameByID(string id)
        {
            DataTable name = database.getTable("SELECT CompanyName FROM jobsdb_Employer WHERE ID='" + id + "'");
            return name.Rows[0]["CompanyName"].ToString();
        }

        public string GetJobCountByCompanyID(string companyID)
        {
            DataTable count = database.getTable("SELECT COUNT(*) FROM jobsdb_JobPost WHERE Company='" + companyID + "'");
            return count.Rows[0][0].ToString();
        }

        public string GetCompanyCount()
        {
            DataTable count = database.getTable("SELECT COUNT(*) FROM jobsdb_Employer");
            return count.Rows[0][0].ToString();
        }

        public Int32 CountJobseekerByRegionID(string regionID)
        {
            DataTable region = database.getTable("SELECT COUNT(*) FROM jobsdb_JobSeeker WHERE Status ='1' AND Active = 'Y' AND (Region ='" + regionID + "')");
            return Convert.ToInt32(region.Rows[0][0].ToString());
        }

        public Int32 CountJobseekerByLocationID(string locationID)
        {
            DataTable location = database.getTable("SELECT COUNT(*) FROM jobsdb_JobSeeker WHERE Status ='1' AND Active = 'Y' AND (Location ='" + locationID + "')");
            return Convert.ToInt32(location.Rows[0][0].ToString());
        }
    }
}
