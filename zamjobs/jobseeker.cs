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
using System.Data.SqlClient;

namespace zamjobs
{
    public class jobseeker
    {
        private SqlConnection connString = new SqlConnection(ConfigurationManager.ConnectionStrings["ZamJobsConnString"].ConnectionString);

        public DataTable GetApplications(string Email)
        {
               dataAccess database = new dataAccess();
               string queryString = @"SELECT jobsdb_JobPost.ID AS JobPostID, jobsdb_JobPost.Title, jobsdb_Employer.ID AS CompanyID, jobsdb_Employer.CompanyName, jobsdb_JobPost.PostDate, 
                            jobsdb_JobPost.ExpireDate
                            FROM jobsdb_JobSeeker INNER JOIN
                            jobsdb_Application ON jobsdb_JobSeeker.ID = jobsdb_Application.JobseekerID INNER JOIN
                            jobsdb_JobPost ON jobsdb_Application.JobPostID = jobsdb_JobPost.ID INNER JOIN
                            jobsdb_Employer ON jobsdb_JobPost.Company = jobsdb_Employer.ID
                            WHERE (jobsdb_JobSeeker.Email ='" + Email + "')";
               DataTable application = database.getTable(queryString);
               return application;
        }

        public Byte[] GetCV(string JobseekerEmail)
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT CV FROM jobsdb_JobSeeker WHERE Email ='" + JobseekerEmail + "'", connString);
            SqlCommandBuilder cb = new SqlCommandBuilder(da);
            DataSet ds = new DataSet();

            // Get binary data from database
            connString.Open();
            da.Fill(ds, "jobsdb_JobSeeker");
            DataRow dr;
            dr = ds.Tables["jobsdb_JobSeeker"].Rows[0];
            Byte[] data;
            data = (byte[])dr["CV"];
            return data;
        }

        public bool UploadCV(Byte[] CV, string email)
        {

            bool flag = false;
            string updateString = "UPDATE jobsdb_JobSeeker SET CV=@CV WHERE Email ='" + email + "'";
            SqlCommand cmd = new SqlCommand(updateString, connString);
            cmd.Parameters.Add(new SqlParameter("@CV", (object)CV));
            try
            {
                connString.Open();
                // Call ExecuteNonQuery to send command
                int rowCount = cmd.ExecuteNonQuery();
                connString.Close();
                if (rowCount == 1)
                {
                    flag = true;
                }
            }
            catch (Exception)
            {
            }

            return flag;
        }

        public DataTable GetJobseekerEmail(string Email)
        {
            dataAccess database = new dataAccess();
            string queryString = @"SELECT        ID, FirstName, LastName, Email,
                             (SELECT        Country
                               FROM            jobsdb_Country
                               WHERE        (ID = jobsdb_JobSeeker.Country)) AS Country, Country AS CountryID,
                             (SELECT        Region
                               FROM            jobsdb_Region
                               WHERE        (ID = jobsdb_JobSeeker.Region)) AS Region, Region AS RegionID,
                             (SELECT        Location
                               FROM            jobsdb_Location
                               WHERE        (ID = jobsdb_JobSeeker.Location)) AS Location, Location AS LocationID,
                             (SELECT        Nationality
                               FROM            jobsdb_Nationality
                               WHERE        (ID = jobsdb_JobSeeker.Nationality)) AS Nationality, Nationality AS NationalityID, ID_Passport, ContactNumber,
                             (SELECT        Category
                               FROM            jobsdb_JobCategory
                               WHERE        (ID = jobsdb_JobSeeker.JobCategory)) AS Category, JobCategory AS CategoryID , Experience,
                             (SELECT        EducationLevel
                               FROM            jobsdb_Education
                               WHERE        (ID = jobsdb_JobSeeker.Education)) AS Education, Education AS EducationID,(SELECT Status FROM jobsdb_AccountStatus WHERE (jobsdb_JobSeeker.Status = ID))AS Status, Status AS StatusID
                              FROM            jobsdb_JobSeeker WHERE Email ='" + Email + "'";
            DataTable jobseekerTbl = database.getTable(queryString);
            return jobseekerTbl;
        }
    }
}
