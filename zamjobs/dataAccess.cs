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
    public class dataAccess
    {
        private SqlConnection connString = new SqlConnection(ConfigurationManager.ConnectionStrings["ZamJobsConnString"].ConnectionString);

        public DataTable getTable(string selectQuery)
        {
            SqlDataAdapter dataAdapt = new SqlDataAdapter(selectQuery, connString);
            DataSet dataS = new DataSet();
            connString.Open();
            dataAdapt.Fill(dataS);
            connString.Close();
            return dataS.Tables[0];         
        }

        public DataSet getSet(string selectQuery)
        {
            SqlDataAdapter dataAdapt = new SqlDataAdapter(selectQuery, connString);
            DataSet dataS = new DataSet();
            connString.Open();
            dataAdapt.Fill(dataS);
            connString.Close();
            return dataS;
        }

        public bool insertData(string insertQuery)
        {
            bool flag = false;
            try
            {
                SqlCommand cmd = new SqlCommand(insertQuery, connString);

                connString.Open();
                // Call ExecuteNonQuery to send command
                cmd.ExecuteNonQuery();
                connString.Close();
                flag = true;
            }
            catch (SqlException)
            {
                 flag = false;
            }

            return flag;
                
        }

       /* public void updateData(string updateQuery)
        {
            SqlCommand cmd = new SqlCommand(updateQuery, connString);

            connString.Open();
            // Call ExecuteNonQuery to send command
            int i = cmd.ExecuteNonQuery();

            connString.Close();
        }*/

        public bool updateData(string updateQuery)
        {
            SqlCommand cmd = new SqlCommand(updateQuery, connString);
            bool flag = false;
            try
            {
                connString.Open();
                // Call ExecuteNonQuery to send command
                int i = cmd.ExecuteNonQuery();

                connString.Close();
                flag = true;
            }
            catch (SqlException)
            {
            }
            return flag;
        }


        public Int64 insertData_ReturnID(string insertQuery)
        {
            Int64 identifier;
            SqlCommand cmd = new SqlCommand(insertQuery, connString);

            connString.Open();
            // Call ExecuteNonQuery to send command
            //cmd.ExecuteNonQuery();
            identifier = Convert.ToInt64(cmd.ExecuteScalar());
            connString.Close();
            
            
            return identifier;
        }

        public bool DeleteData(string deleteQuery)
        {
            SqlCommand cmd = new SqlCommand(deleteQuery, connString);
            bool flag = false;
            try
            {
                connString.Open();
                // Call ExecuteNonQuery to send command
                int i = cmd.ExecuteNonQuery();
                connString.Close();
                flag = true;
            }
            catch (SqlException)
            {
            }
            return flag;

        }

        
    }
}
