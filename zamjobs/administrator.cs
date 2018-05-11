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
    public class administrator
    {
        private string advertiserName = "";
        private string UnitQty = "";
        SqlConnection connString = new SqlConnection(ConfigurationManager.ConnectionStrings["ZamJobsConnString"].ConnectionString);

        public int GetAdminCount()
        {
            dataAccess database = new dataAccess();
            DataTable count = database.getTable("SELECT COUNT(*) FROM jobsdb_Administrator");
            return Convert.ToInt32(count.Rows[0][0].ToString());
        }

        public string GetUnitAmount()
        {
            string UnitAmount = "";
            dataAccess database = new dataAccess();
            string selectQuery = "SELECT * FROM jobsdb_StoredValues WHERE Description = 'Unit Amount' ";
            DataTable UnitAmountTbl = database.getTable(selectQuery);
            UnitAmount = UnitAmountTbl.Rows[0]["Value"].ToString();
            return UnitAmount;
        }

        public void UpdateUnitAmount(string unitAmount)
        {
            dataAccess database = new dataAccess();
            database.updateData("UPDATE jobsdb_StoredValues SET Value = '" + unitAmount + "' WHERE Description = 'Unit Amount'");
            
        }

        public DataTable GetOrders()
        {
            dataAccess database = new dataAccess();
            string selectQuery = @"SELECT OrderNum, Employer AS CompanyID,
                             (SELECT CompanyName
                               FROM jobsdb_Employer
                               WHERE (ID = jobsdb_UnitOrder.Employer)) AS CompanyName, UnitAmount, UnitQty, Date, Paid, Credited, Active
                               FROM jobsdb_UnitOrder";
            DataTable orders = database.getTable(selectQuery);
            return orders;
        }

        public DataTable GetOrdersByOrderNum(string orderNum)
        {
            dataAccess database = new dataAccess();
            string selectQuery = @"SELECT OrderNum, Employer AS CompanyID,
                             (SELECT CompanyName
                               FROM jobsdb_Employer
                               WHERE (ID = jobsdb_UnitOrder.Employer)) AS CompanyName, UnitAmount, UnitQty, Date, Paid, Credited, Active
                               FROM jobsdb_UnitOrder WHERE OrderNum='" + orderNum + "'";
            DataTable orders = database.getTable(selectQuery);
            return orders;
        }

        public bool UpdateOrderPaid(string orderNum)
        {
            string updateString = "UPDATE jobsdb_UnitOrder SET Paid = 'Y' WHERE OrderNum='" + orderNum + "'";
            bool flag = false;
            dataAccess database = new dataAccess();
            flag = database.updateData(updateString);

            return flag;
        }

        public bool UpdateOrderCredit(string orderNum)
        {
            string updateString = "UPDATE jobsdb_UnitOrder SET Credited = 'Y' WHERE OrderNum='" + orderNum + "'";
            bool flag = false;
            dataAccess database = new dataAccess();
            flag = database.updateData(updateString);

            return flag;
        }

        public bool UpdateOrderActivate(string orderNum)
        {
            string updateString = "UPDATE jobsdb_UnitOrder SET Active = 'Y' WHERE OrderNum='" + orderNum + "'";
            bool flag = false;
            dataAccess database = new dataAccess();
            flag = database.updateData(updateString);

            return flag;
        }

        public bool UpdateOrderDeActivate(string orderNum)
        {
            string updateString = "UPDATE jobsdb_UnitOrder SET Active = 'N' WHERE OrderNum='" + orderNum + "'";
            bool flag = false;
            dataAccess database = new dataAccess();
            flag = database.updateData(updateString);

            return flag;
        }

        public bool CreditAdvertiser(string orderNum)
        {
            bool flag = false;
            
            dataAccess database = new dataAccess();
            string selectAdvertiser = "SELECT Employer, UnitQty FROM jobsdb_UnitOrder  WHERE OrderNum='" + orderNum + "'";
            DataTable advertiser = database.getTable(selectAdvertiser);
            string advertiserID =  advertiser.Rows[0]["Employer"].ToString();
            string selectCompanyName = "SELECT CompanyName,Units FROM jobsdb_Employer WHERE ID='" + advertiserID +"'";
            DataTable companyRecord = database.getTable(selectCompanyName);
            SetAdvertiserName(companyRecord.Rows[0]["CompanyName"].ToString());
            string unitQty = advertiser.Rows[0]["UnitQty"].ToString();
            SetUnitQty(unitQty);
            Int32 unitValue = Convert.ToInt32(companyRecord.Rows[0]["Units"].ToString()) + Convert.ToInt32(unitQty);
            string updateString = "UPDATE jobsdb_Employer SET Units='" + unitValue + "'  WHERE ID ='" + advertiserID + "'";
            
            flag = database.updateData(updateString);

            return flag;
        }

        protected void SetAdvertiserName(string name)
        {
            advertiserName = name;
        }

        public string GetAdvertiserName()
        {
            return advertiserName;
        }

        protected void SetUnitQty(string Qty)
        {
            UnitQty = Qty;
        }

        public string GetUnitQty()
        {
            return UnitQty;
        }


        public DataTable GetAdminByID(string adminID)
        {
            dataAccess database = new dataAccess();
            string selectQuery = @"SELECT * FROM jobsdb_Administrator WHERE ID='" + adminID + "'";
            DataTable admins = database.getTable(selectQuery);
            return admins;
        }

        public DataTable GetAdminByEmail(string email)
        {
            dataAccess database = new dataAccess();
            string adminID = GetAdminIDByEmail(email);
            string selectQuery = @"SELECT * FROM jobsdb_Administrator WHERE ID='" + adminID + "'";
            DataTable admins = database.getTable(selectQuery);
            return admins;
        }

        public string GetAdminIDByEmail(string email)
        {
            dataAccess database = new dataAccess();
            DataTable adminIDTbl = database.getTable("SELECT ID FROM jobsdb_Administrator WHERE Email='" + email + "'");
            return adminIDTbl.Rows[0]["ID"].ToString();
        }

        public bool DeactivateAdmin(string adminID)
        {
            bool flag = false;
            dataAccess database = new dataAccess();
            string email = GetAdminEmail(adminID);
            flag = database.updateData("UPDATE jobsdb_Administrator SET Active = 'False' WHERE ID='" + adminID + "'");
            database.updateData("UPDATE aspnet_Membership SET IsLockedOut = 'True' WHERE Email='" + email + "'");
            return flag;
        }

        public bool ActivateAdmin(string adminID)
        {
            bool flag = false;
            dataAccess database = new dataAccess();
            string email = GetAdminEmail(adminID);
            flag = database.updateData("UPDATE jobsdb_Administrator SET Active = 'True' WHERE ID='" + adminID + "'");
            database.updateData("UPDATE aspnet_Membership SET IsLockedOut = 'False' WHERE Email='" + email + "'");
            return flag;
        }

        public string GetAdminEmail(string adminID)
        {
            dataAccess database = new dataAccess();
            DataTable emailTbl = database.getTable("SELECT Email FROM jobsdb_Administrator WHERE ID ='" + adminID + "'");
            return emailTbl.Rows[0]["Email"].ToString();
        }
        
         public bool DeleteAdmin(string adminID)
        {
            bool flag = false;
            bool deleteAdmin = false;
            bool deleteMembership = false;
            dataAccess database = new dataAccess();
            string email = GetAdminEmail(adminID);
            try
            {
                deleteAdmin = database.DeleteData("DELETE FROM jobsdb_Administrator WHERE ID='" + adminID + "'");
                
                Roles.RemoveUserFromRole(email, "admin");
             
                deleteMembership = Membership.DeleteUser(email,true);
                if (deleteAdmin && deleteMembership)
                {
                    flag = true;
                }
            }
            catch (Exception)
            {
            }

            return flag;
        }

        public bool UpdateAdmin(string updateString)
        {
            bool flag = false;
            SqlCommand cmd = new SqlCommand(updateString, connString);
            try
            {

                connString.Open();
                // Call ExecuteNonQuery to send command
                int i = cmd.ExecuteNonQuery();

                connString.Close();
                if (i == 1)
                {
                    flag = true;
                }
            }
            catch(SqlException)
            {
            }
            return flag;
        }

        public Byte[] GetCVByJobseekerID(string jobseekerID)
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT CV FROM jobsdb_JobSeeker WHERE ID ='" + jobseekerID + "'", connString);
            SqlCommandBuilder cb = new SqlCommandBuilder(da);
            DataSet ds = new DataSet();
            Byte[] data = null;
            try
            {
                // Get binary data from database
                connString.Open();
                da.Fill(ds, "jobsdb_JobSeeker");
                DataRow dr;
                dr = ds.Tables["jobsdb_JobSeeker"].Rows[0];
                
                data = (byte[])dr["CV"];
            }
            catch (Exception)
            {
            }
            return data;
        }

        public string GetJobseekerName(string jobseekerID)
        {
            dataAccess database = new dataAccess();
            Format format = new Format();
            DataTable jobseeker = database.getTable("SELECT FirstName, LastName FROM jobsdb_JobSeeker WHERE ID='" + jobseekerID +"'");
            string name = format.GetJobseekerIdFormat(jobseekerID) + "_" + jobseeker.Rows[0]["FirstName"].ToString() + "_" + jobseeker.Rows[0]["LastName"].ToString();
            return name;
        }


        public DataTable GetJobCategoryTable()
        {
            dataAccess database = new dataAccess();
            return database.getTable("SELECT * FROM jobsdb_JobCategory");
        }

    }
}
