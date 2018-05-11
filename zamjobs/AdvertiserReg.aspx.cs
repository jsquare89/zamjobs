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
using System.Data.SqlClient;

namespace zamjobs
{
    public partial class AdvertiserReg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PanelAdvertiserRegistration.DefaultButton = btnRegister.ID;
            
            HttpCookie cookie = Request.Cookies["zamjobs_authcookie"];

            if (cookie != null) // then redirect user to already registered page
            {
                Response.Redirect("~/alreadyregistered.aspx");
            }

            
        }


        protected void btnRegister_Click(object sender, EventArgs e)
        {
            lblInvalidEmail.Visible = false;
            lblInvalidEmailMarker.Visible = false;
            lblInvalidCountry.Visible = false;
            lblInvalidCountryMarker.Visible = false;
            lblInvalidTerms.Visible = false;
            lblInvalidTermsMarker.Visible = false;
            dataAccess User = new dataAccess();
            Format format = new Format();
            DataTable dt = User.getTable("SELECT Email from aspnet_Membership WHERE Email = '" + txtEmail.Text.ToLower() + "'");
            if (dt.Rows.Count == 0) // Check for existing email in database. If not zero email exists. Display invalid email
            {
                if (cbxTermsConditions.Checked == true) //Ensures terms and conditions are checked. Else display error msg
                {
                    if (ddlCountry.SelectedItem.ToString() == "Zambia")//Ensures advitisor is from zambia. else dislpay error. This may be changed to international at later stage.
                    {
                        
                        SqlConnection connString = new SqlConnection(ConfigurationManager.ConnectionStrings["ZamJobsConnString"].ConnectionString);

                        string CompanyName = format.capitalizeStart(txtCompanyName.Text);
                        string ContactName = format.capitalizeStart(txtContactName.Text);
                        string Email = txtEmail.Text.ToLower();
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
                        String ContactNumber = txtContactNumber.Text;
                        String AltContactNumber = txtContactNumber2.Text;
                        String Address = txtPostalAddress.Text;
                        String WebAddress = txtWebsiteURL.Text;
                        Int16 JobCategory = Convert.ToInt16(ddlCategory.SelectedValue);
                        String Description = txtCompanyDesc.Text;
                        Byte[] logo;
                        
                        if (fiuLogo.HasFile)
                        {
                            logo = fiuLogo.FileBytes;
                        }
                        else
                        {
                            logo = null;
                          
                        }
                        string insertString = string.Empty;

                        if (logo == null)
                        {
                            insertString = @"
                        insert into jobsdb_Employer
                        (CompanyName, ContactName, Email, Country, Region, Location, ContactNumber, 
                        AltContactNumber, PostalAddress, WebsiteURL, Category, Description, Units, Active)
                        values ('" + CompanyName + "','" + ContactName + "','" + Email + "','" + Country + "','" + Region + "','" + Location +
                        "','" + ContactNumber + "','" + AltContactNumber + "','" + Address + "','" + WebAddress + "','" +
                        JobCategory + "','" + Description + "', '0', 'Y')";

                        }
                        else
                        {

                            // create query string to insert data in database
                            insertString = @"
                        insert into jobsdb_Employer
                        (CompanyName, ContactName, Email, Country, Region, Location, ContactNumber, 
                        AltContactNumber, PostalAddress, WebsiteURL, Category, Description, Logo, Units, Active)
                        values ('" + CompanyName + "','" + ContactName + "','" + Email + "','" + Country + "','" + Region + "','" + Location +
                            "','" + ContactNumber + "','" + AltContactNumber + "','" + Address + "','" + WebAddress + "','" +
                            JobCategory + "','" + Description + "', @logo, '0', 'Y')";
                        }

                        

                        SqlCommand cmd = new SqlCommand(insertString, connString);
                        if (logo != null)
                        {
                            cmd.Parameters.Add(new SqlParameter("@logo", (object)logo));
                        }
                        try
                        {
                            connString.Open();
                            // Call ExecuteNonQuery to send command
                            cmd.ExecuteNonQuery();
                            connString.Close();

                            //Creste user with Email and Password given
                            Membership.CreateUser(Email, Password, Email);

                            //Assign user a role
                            Roles.AddUserToRole(Email, ConfigurationSettings.AppSettings["EmployerRoleName"]);
                            //Redirect user to success page
                            Response.Redirect("RegistrationSuccess.aspx");
                        }
                        catch (SqlException)
                        {
                            Response.Redirect("~/InvalidPageRequest.aspx");
                        }
                    }
                    else
                    {
                        lblInvalidCountry.Text = "We regret to inform you that our services are only open to advitisors based in Zambia";
                        lblInvalidCountry.Visible = true;
                        lblInvalidCountryMarker.Visible = true;
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
                    item[i+1] = new ListItem();
                    item[i+1].Text = LocTbl.Rows[i]["Location"].ToString();
                    item[i+1].Value = LocTbl.Rows[i]["ID"].ToString();
                    ddlLocation.Items.Add(item[i+1]);
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

        protected void btnClear_Click(object sender, EventArgs e)
        {
            fiuLogo.Controls.Clear();
            ListItem zambia = new ListItem();
            

            
        }

    }
}
