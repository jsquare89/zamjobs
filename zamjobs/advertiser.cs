using System;
using System.Data;
using System.Data.SqlClient;
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
    public class advertiser
    {
        private SqlConnection connString = new SqlConnection(ConfigurationManager.ConnectionStrings["ZamJobsConnString"].ConnectionString);


        public DataTable getApplications(string Email)
        {
            dataAccess database = new dataAccess();
            string queryString = @"SELECT jobsdb_Application.JobPostID, jobsdb_JobPost.Title, jobsdb_JobPost.PostDate, jobsdb_JobPost.ExpireDate, jobsdb_Application.JobseekerID, 
                         jobsdb_JobSeeker.FirstName, jobsdb_JobSeeker.LastName, jobsdb_JobSeeker.Email, jobsdb_JobSeeker.ContactNumber
                         FROM jobsdb_JobSeeker INNER JOIN
                         jobsdb_Application ON jobsdb_JobSeeker.ID = jobsdb_Application.JobseekerID INNER JOIN
                         jobsdb_JobPost ON jobsdb_Application.JobPostID = jobsdb_JobPost.ID WHERE jobsdb_JobPost.Company ='" + getCompanyID(Email) + "' ORDER BY jobsdb_Application.JobPostID";
            DataTable application = database.getTable(queryString);
            return application;
        }

        public int getApplicationsCount(string Email)
        {
            dataAccess database = new dataAccess();
            string queryString = @"SELECT JobPostID, JobseekerID
                         FROM jobsdb_Application, jobsdb_JobPost 
                         WHERE jobsdb_Application.JobPostID = jobsdb_JobPost.ID 
                         AND jobsdb_JobPost.Company ='" + getCompanyID(Email) + "'";
            DataTable application = database.getTable(queryString);
            return application.Rows.Count;
        }

        public string getCompanyID(string Email)
        {
            dataAccess database = new dataAccess();
            string queryString = "SELECT ID FROM jobsdb_Employer WHERE Email ='" + Email + "'";
            DataTable companyTable = database.getTable(queryString);
            return companyTable.Rows[0]["ID"].ToString();
        }

        public DataTable getJobPost(string Email)
        {
            dataAccess database = new dataAccess();
            string queryString = @"SELECT jobsdb_Application.JobPostID,jobsdb_JobPost.Title, jobsdb_JobPost.PostDate, jobsdb_JobPost.ExpireDate
                        FROM jobsdb_Application INNER JOIN
                        jobsdb_JobPost ON jobsdb_Application.JobPostID = jobsdb_JobPost.ID
                        WHERE (jobsdb_JobPost.Company = '" + getCompanyID(Email) + @"')
                        GROUP BY jobsdb_Application.JobPostID, jobsdb_JobPost.Title, jobsdb_JobPost.PostDate, jobsdb_JobPost.ExpireDate";
            DataTable jobPost = database.getTable(queryString);
            return jobPost;
        }

        public DataTable getJobPostIDByCompanyEmail(string Email)
        {
            dataAccess database = new dataAccess();
            string queryString = @"SELECT ID FROM jobsdb_JobPost WHERE (Company ='" + getCompanyID(Email) + "')";
            DataTable jobPost = database.getTable(queryString);
            return jobPost;
        }

        public DataTable getJobSeeker(string jobPostID)
        {
            dataAccess database = new dataAccess();
            string queryString = @"SELECT jobsdb_Application.JobseekerID, jobsdb_JobSeeker.FirstName, jobsdb_JobSeeker.LastName, jobsdb_JobSeeker.Email, jobsdb_JobSeeker.ContactNumber
                         FROM jobsdb_Application INNER JOIN
                         jobsdb_JobSeeker ON jobsdb_Application.JobseekerID = jobsdb_JobSeeker.ID
                         WHERE (jobsdb_Application.JobPostID = '" + jobPostID + "')";
            DataTable jobSeeker = database.getTable(queryString);
            return jobSeeker;

        }

        public DataTable getJobSeekerDetails(string jobSeekerID)
        {
            dataAccess database = new dataAccess();
            string queryString = @"SELECT * FROM jobsdb_Jobseeker 
                         WHERE (ID = '" + jobSeekerID + "')";
            DataTable jobSeekerDetails = database.getTable(queryString);
            return jobSeekerDetails;

        }

        public DataTable getJobPostDetail(string PostID)
        {
            dataAccess database = new dataAccess();
            string queryString = @"SELECT ID, Title, Overview, (SELECT CompanyName FROM jobsdb_Employer WHERE (jobsdb_JobPost.Company = ID)) AS Company,
                        (SELECT Country FROM jobsdb_Country WHERE (ID = jobsdb_JobPost.Country)) AS Country, 
                        (SELECT Region FROM jobsdb_Region WHERE (ID = jobsdb_JobPost.Region)) AS Region, 
                        (SELECT Location FROM jobsdb_Location WHERE (ID = jobsdb_JobPost.Location)) AS Location, 
                        (SELECT Category FROM jobsdb_JobCategory WHERE (ID = jobsdb_JobPost.Category)) AS Category, 
                        (SELECT JobType FROM jobsdb_JobType WHERE (ID = jobsdb_JobPost.Type)) AS Type, WorkExperience, WorkExperienceComment, 
                        (SELECT EducationLevel FROM jobsdb_Education WHERE (ID = jobsdb_JobPost.EducationLevel)) AS EducationLevel,
                        EducationLevelComment, PersonalAttributes, Competencies, PostDate, ExpireDate FROM jobsdb_JobPost WHERE (ID = '" + PostID + "')";
      
            DataTable jobPostDetail= database.getTable(queryString);
            return jobPostDetail;
              }

        public DataTable getOrderNum(string companyID)
        {
            dataAccess database = new dataAccess();
            string queryString = "SELECT OrderNum FROM jobsdb_UnitOrder WHERE Employer='" + companyID + "'";
            DataTable orderNums = database.getTable(queryString);
            return orderNums;
        }

        public bool CheckUserRoleAdvertiser(string User)
        {
            string[] userRole = Roles.GetRolesForUser(); // gets user role
               bool flag = false;
               switch (userRole[0]) // switch based on user roles to direct logged in client to correct account type
               {
                   case "jobseeker":
                       {
                           flag = false;
                       }
                       break;
                   case "employer":
                       {
                           flag = true;
                       }
                       break;
                   case "admin":
                       {
                           flag = false;
                       }
                       break;
                   default:
                       {
                           flag = false;
                       }
                       break;
               }
               return flag;
        }

        public bool updateLogo(Byte[] logo, string ID)
        {
            
            bool flag = false;
            string updateString = "UPDATE jobsdb_Employer SET Logo=@logo WHERE ID ='" + ID + "'";
            SqlCommand cmd = new SqlCommand(updateString, connString);
            cmd.Parameters.Add(new SqlParameter("@logo", (object)logo));
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

        public bool validateLogoDimensions(FileUpload logo)
        {
            bool validImage = false;
            int width = 150;
            int height = 100;
            try
            {

                System.IO.Stream stream = logo.PostedFile.InputStream;
                System.Drawing.Image imgData = System.Drawing.Image.FromStream(stream);
                stream.Flush();
                Int16 imgWidth = Convert.ToInt16(imgData.PhysicalDimension.Width);
                Int16 imgHeight = Convert.ToInt16(imgData.PhysicalDimension.Height);
                if ((imgWidth == width) && (imgHeight == height) && (logo.PostedFile.ContentType == "image/jpeg"))
                {
                    validImage = true;
                }
            }
            catch (Exception)
            {
            }
            return validImage;


        }

        public Byte[] getCV(string JobseekerID)
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT CV FROM jobsdb_JobSeeker WHERE id ='" + JobseekerID + "'", connString);
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

        public bool checkJobseeker(string ID)
        {
            bool flag = false;
            string selectQuery = "SELECT ID FROM jobsdb_JobSeeker WHERE ID ='" + ID + "'";
            SqlDataAdapter dataAdapt = new SqlDataAdapter(selectQuery, connString);
            DataSet dataS = new DataSet();
            try
            {
                connString.Open();
                dataAdapt.Fill(dataS);
                connString.Close();
                if (dataS.Tables[0].Rows[0]["ID"].ToString() != "")
                {
                    flag = true;
                }
                else
                {
                    flag = false;
                }
                
            }
            catch (SqlException)
            {
            }
            return flag;  

        }

        public bool checkUserAccessToJobseeker(string email, string jobseekerID) // checks to see whether advertiser has purchased jobseeker or jobseeker applied for job. return bool
        {
            bool flag = false;
            string companyID = getCompanyID(email);
            dataAccess database = new dataAccess();
            DataTable purchasedTbl = database.getTable("SELECT COUNT(*) FROM jobsdb_PurchaseJobseeker WHERE Company='" + companyID +  "' AND Jobseeker='" + jobseekerID + "'");
            DataTable appliedTbl = database.getTable("SELECT COUNT(*) FROM jobsdb_JobPost INNER JOIN jobsdb_Application ON jobsdb_JobPost.ID = jobsdb_Application.JobPostID WHERE (jobsdb_JobPost.Company='" + companyID + "') AND (jobsdb_Application.JobseekerID='" + jobseekerID + "')");
            if (purchasedTbl.Rows[0][0].ToString() == "1" || appliedTbl.Rows[0][0].ToString() == "1")
            {
                flag = true;
            }
            
            return flag;

        }

        public string getUnitAmount()
        {
            string UnitAmount = "";
            dataAccess database = new dataAccess();
            string selectQuery = "SELECT * FROM jobsdb_StoredValues WHERE Description = 'Unit Amount' ";
            DataTable UnitAmountTbl =  database.getTable(selectQuery);
            UnitAmount = UnitAmountTbl.Rows[0]["Value"].ToString();
            return UnitAmount;
        }

        public string GetJobseekerName(string jobseekerID)
        {
            dataAccess database = new dataAccess();
            Format format = new Format();
            DataTable jobseeker = database.getTable("SELECT FirstName, LastName FROM jobsdb_JobSeeker WHERE ID='" + jobseekerID + "'");
            string name = format.GetJobseekerIdFormat(jobseekerID) + "_" + jobseeker.Rows[0]["FirstName"].ToString() + "_" + jobseeker.Rows[0]["LastName"].ToString();
            return name;
        }

        public string GetUnitCountByEmail(string email)
        {
            dataAccess database = new dataAccess();
            string queryString = "SELECT Units FROM jobsdb_Employer WHERE Email='" + email + "'";
            DataTable unitTbl = database.getTable(queryString);
            return unitTbl.Rows[0][0].ToString();
        }

        public bool DepleteUnitsByEmail(int amount, string email)
        {
            dataAccess database = new dataAccess();
            bool flag = false;
            DataTable advertiserUnitTbl = database.getTable("SELECT Units FROM jobsdb_Employer WHERE Email='" + email + "'");
            Int32 units = Convert.ToInt32(advertiserUnitTbl.Rows[0][0].ToString());
            if (amount <= units)
            {
                units = units - amount;
                flag = database.updateData("Update jobsdb_Employer SET Units='" + units + "' WHERE Email='" + email + "'");
            }
            return flag;
        }

        public DateTime GetExpireDateByJobPostID(string jobPostID)
        {
            dataAccess database = new dataAccess();
            DataTable date = database.getTable("SELECT ExpireDate From jobsdb_JobPost WHERE ID='" + jobPostID + "'");
            return Convert.ToDateTime(string.Format("{0:dd/MM/YYYY}",date.Rows[0][0].ToString()));
        }

        public bool PurchaseJobseeker(string jobseekerID, string email)
        {
            string id = getCompanyID(email);
            dataAccess database = new dataAccess();
            return database.insertData("INSERT INTO jobsdb_PurchaseJobseeker (Company,Jobseeker) VALUES (" + id + "," + jobseekerID + ")");
        }

         public bool CheckExistingPurchaseJobseeker(string jobseekerID, string email) // true if user exists
        {
            string id = getCompanyID(email);
            dataAccess database = new dataAccess();
             bool flag = false;
            DataTable count = database.getTable("SELECT COUNT(*) FROM jobsdb_PurchaseJobseeker WHERE Company='" + id + "' AND Jobseeker='" + jobseekerID + "'");
            if (count.Rows[0][0].ToString() == "1")
            {
                flag = true;
            }
            return flag;

        }

         public bool CheckJobseekerStatus(string jobseekerID)// return true if jobseeker is active and visible
         {
             
             dataAccess database = new dataAccess();
             bool flag = false;
             DataTable count = database.getTable("SELECT COUNT(*) FROM jobsdb_JobSeeker WHERE Active='Y' AND Status='1' AND ID='" + jobseekerID + "'");
             if (count.Rows[0][0].ToString() == "1")
             {
                 flag = true;
             }
             return flag;

         }

    }
}
