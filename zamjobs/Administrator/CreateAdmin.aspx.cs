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

namespace zamjobs.Administrator
{
    public partial class CreateAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            dataAccess database = new dataAccess();
            Format format = new Format();
            DataTable dt = database.getTable("SELECT Email from aspnet_Membership WHERE Email = '" + txtEmail.Text.ToLower() + "'");
            if (dt.Rows.Count == 0) // Check for existing email in database. If not zero email exists. Display invalid email
            {

                bool flag = false;
                string fname = format.capitalizeStart(txtFName.Text.ToString());
                string lname = format.capitalizeStart(txtLName.Text.ToString());
                string contactNum = txtContactNum.Text.ToString();
                string passportID = txtPassportID.Text.ToString();
                string email = txtEmail.Text.ToString();
                string address = txtPhysicalAddress.Text.ToString();
                string password = txtPassword.Text.ToString();


                string insertString = "INSERT INTO jobsdb_Administrator (FirstName, LastName, ContactNumber,Email, PhysicalAddress, PassportID, Active) VALUES ('" + fname + "','" + lname + "','" + contactNum + "','" + email + "','" + address + "','" + passportID + "','True')";
                try
                {
                    flag = database.insertData(insertString);
                    if (flag)
                    {
                        //Creste user with Email and Password given
                        Membership.CreateUser(email, password, email);

                        //Assign user admin role
                        Roles.AddUserToRole(email, ConfigurationSettings.AppSettings["AdminRoleName"]);
                    }

                }
                catch (Exception)
                {
                }

                if (flag)
                {
                    Response.Redirect("RegistrationSuccessful.aspx");
                }
                else
                {
                    Response.Redirect("RegistrationUnsuccessful.aspx");
                }
            }
            else
            {
                lblMessage.Text = "Email already exists. Please use another";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}
