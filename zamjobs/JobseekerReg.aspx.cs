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
using System.Data.Sql;
using System.Data.SqlClient;


namespace zamjobs
{
    public partial class JobseekerReg : System.Web.UI.Page
    {
               
        protected void Page_Load(object sender, EventArgs e)
        {
            PanelJobSeekerRegistration.DefaultButton = btnRegister.ID;
            HttpCookie cookie = Request.Cookies["zamjobs_authcookie"];

           if (cookie != null) // then redirect user to already registered page
           {
               Response.Redirect("~/alreadyregistered.aspx");
           }

           ddlRegion.Enabled = false;
           ddlLocation.Enabled = false;
                       
        }
  
       

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            lblInvalidEmail.Visible = false;
            lblInvalidEmailMarker.Visible = false;
            lblInvalidTerms.Visible = false;
            lblInvalidTermsMarker.Visible = false;
            dataAccess User = new dataAccess();
            Format format = new Format();
            DataTable dt = User.getTable("SELECT Email from aspnet_Membership WHERE Email = '" + txtEmail.Text.ToLower() + "'");
            if (dt.Rows.Count == 0) // Check for existing email in database. If not zero email exists. Display invalid email
            {
                if (cbxTermsConditions.Checked == true)
                {
                    if ((Convert.ToInt32(fiuCV.PostedFile.ContentLength.ToString()) < 131072) && fiuCV.PostedFile.FileName.EndsWith(".doc"))
                    {
                        SqlConnection connString = new SqlConnection(ConfigurationManager.ConnectionStrings["ZamJobsConnString"].ConnectionString);

                        string FirstName = format.capitalizeStart(txtFName.Text);
                        string LastName = format.capitalizeStart(txtLName.Text);
                        string Email = txtEmail.Text;
                        string Password = txtPassword.Text;
                        Int16 Country = Convert.ToInt16(ddlCountry.SelectedValue);
                        Int16 Region = 0;
                        if (ddlRegion.SelectedValue != "")
                        {
                            Region = Convert.ToInt16(ddlRegion.SelectedValue);
                        }
                        Int16 Location = 0;
                        if (ddlLocation.SelectedValue != "")
                        {
                            Location = Convert.ToInt16(ddlLocation.SelectedValue);
                        }
                        Int16 Nationality = Convert.ToInt16(ddlNationality.SelectedValue);
                        string ID_Passport = txtIDPassport.Text;
                        string ContactNumber = txtContactNumber.Text;
                        Int16 JobCategory = Convert.ToInt16(ddlDesiredCategory.SelectedValue);
                        Int16 Experience = Convert.ToInt16(ddlWorkExperience.SelectedValue);
                        Int16 Education = Convert.ToInt16(ddlEducation.SelectedValue);
                        byte[] CV = fiuCV.FileBytes;
                        Int16 Status = Convert.ToInt16(rblStatus.SelectedValue);

                        // create query string to insert data in database
                        string insertString = @"
                    insert into jobsdb_Jobseeker
                    (FirstName, LastName, Email, Country, Region, Location, Nationality,ID_Passport,
                    ContactNumber, JobCategory,Experience, Education, CV, Status, Active)
                    values ('" + FirstName + "','" + LastName + "','" + Email + "','" + Country + "','" + Region + "','" + Location +
                        "','" + Nationality + "','" + ID_Passport + "','" + ContactNumber + "','" + JobCategory + "','" +
                        Experience + "','" + Education + "', @CV ,'" + Status + "','Y')";



                        SqlCommand cmd = new SqlCommand(insertString, connString);
                        cmd.Parameters.Add(new SqlParameter("@CV", (object)CV));

                        try
                        {

                            connString.Open();
                            // Call ExecuteNonQuery to send command
                            cmd.ExecuteNonQuery();
                            connString.Close();

                            //Creste user with Email and Password given
                            Membership.CreateUser(Email, Password, Email);
                            //Assign user a role
                            Roles.AddUserToRole(Email, ConfigurationSettings.AppSettings["JobseekerRoleName"]);
                            //Redirect user to success page
                            Response.Redirect("~/RegistrationSuccess.aspx");
                        }
                        catch (SqlException)
                        {
                            Response.Redirect("~/InvalidPageRequest.aspx");
                        }
                    }
                    else
                    {
                        lblMessage.Text = "CV upload failed. CV is Required. Please ensure CV file is of type MS Word 2003 .doc format and smaller than 128kb.";
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        lblMessage.Visible = true;
                    }
                }
                else
                {
                    lblInvalidTerms.Text = "Agreement to Terms and Conditions is Required";
                    lblInvalidTerms.Visible = true;
                    lblInvalidTermsMarker.Visible = true;
                }
            }
            else
            {
                lblInvalidEmail.Text = "Sorry, Email already registered. Please choose another";
                lblInvalidEmail.Visible = true;
                lblInvalidEmailMarker.Visible = true;
                txtConfirmEmail.Text = null;
                txtEmail.Text = null;
            }
           
        }


        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Enable province selection on selecetion of Zambia in ddlCountry            
            if (ddlCountry.SelectedItem.ToString() == "Zambia")
            {

                ddlRegion.Enabled = true;
                ddlRegion.SelectedValue = "";
                rfvRegion.Enabled = true;
            }
            else
            {
                ddlRegion.Enabled = true;
                ddlRegion.SelectedValue = "";
                ddlRegion.Enabled = false;
                ddlLocation.Enabled = true;
                ddlLocation.SelectedValue = "";
                ddlLocation.Enabled = false;
                rfvRegion.Enabled = false;
                rfvLocation.Enabled = false;
            }
        }

        protected void ddlRegion_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Changes ddlLocation acording to region
            if (ddlRegion.SelectedValue.ToString() != "" && ddlCountry.SelectedItem.ToString() == "Zambia")
            {
                //Get table of location for specific region selected in ddlRegion
                dataAccess Location = new dataAccess();
                DataTable LocTbl = Location.getTable("SELECT * FROM jobsdb_Location WHERE Region = " + ddlRegion.SelectedValue + "ORDER BY Location");

                int arraySize = LocTbl.Rows.Count + 1;
                ListItem[] item = new ListItem[arraySize];
                ddlLocation.Items.Clear();
                ddlLocation.Enabled = true;
                ddlRegion.Enabled = true;
                rfvLocation.Enabled = true;

                //Populate ddlLocation with locations from jobsdb_Location specific to the Region
                item[0] = new ListItem();
                item[0].Text = "Select Location";
                item[0].Value = "";
                ddlLocation.Items.Add(item[0]);
                for (int i = 0; i < LocTbl.Rows.Count; i++)
                {
                    item[i + 1] = new ListItem();
                    item[i + 1].Text = LocTbl.Rows[i]["Location"].ToString();
                    item[i + 1].Value = LocTbl.Rows[i]["ID"].ToString();
                    ddlLocation.Items.Add(item[i + 1]);
                }
            }
            else
            {
                ddlLocation.Enabled = false;
                ddlRegion.Enabled = true;
                ddlLocation.SelectedValue = "";
                rfvLocation.Enabled = false;
            }
        }
        

        
    }
}
