using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

namespace zamjobs.Jobseeker
{
    public partial class EditDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadLabels();
        }


        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblCountryBind.Visible = false;
            lblRegionBind.Visible = false;
            lblLocationBind.Visible = false;
            ddlCountry.Visible = true;
            ddlRegion.Visible = true;
            ddlLocation.Visible = true;
            // Enable province selection on selecetion of Zambia in ddlCountry  

            
            if (ddlCountry.SelectedItem.ToString() == "Zambia") //Zambia
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
            lblCountryBind.Visible = false;
            lblRegionBind.Visible = false;
            lblLocationBind.Visible = false;
            ddlCountry.Visible = true;
            ddlRegion.Visible = true;
            ddlLocation.Visible = true;

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

        protected void LoadLabels()
        {
            jobseeker seekerDetails = new jobseeker();
            DataTable jobseekerTbl = seekerDetails.GetJobseekerEmail(User.Identity.Name);
            Format format = new Format();
            
            lblJobseekerIDBind.Text =  format.GetJobseekerIdFormat(jobseekerTbl.Rows[0]["ID"].ToString());
            lblJobseekerIDBind.Visible = true;
            lblEmailBind.Text = jobseekerTbl.Rows[0]["Email"].ToString();
            lblEmailBind.Visible = true;
            lblFNameBind.Text = jobseekerTbl.Rows[0]["FirstName"].ToString();
            lblFNameBind.Visible = true;
            lblLNameBind.Text = jobseekerTbl.Rows[0]["LastName"].ToString();
            lblLNameBind.Visible = true;
            lblCountryBind.Text = jobseekerTbl.Rows[0]["Country"].ToString();
            lblCountryBind.Visible = true;
            lblCountryHidden.Text = jobseekerTbl.Rows[0]["CountryID"].ToString();
            lblCountryHidden.Visible = false;
            lblRegionBind.Text = jobseekerTbl.Rows[0]["Region"].ToString();
            lblRegionBind.Visible = true;
            lblRegionHidden.Text = jobseekerTbl.Rows[0]["RegionID"].ToString(); ;
            lblRegionHidden.Visible = false;
            lblLocationBind.Text = jobseekerTbl.Rows[0]["Location"].ToString();
            lblLocationBind.Visible = true;
            lblLocationHidden.Text = jobseekerTbl.Rows[0]["LocationID"].ToString();
            lblLocationHidden.Visible = false;
            lblNationalityBind.Text = jobseekerTbl.Rows[0]["Nationality"].ToString();
            lblNationalityBind.Visible = true;
            lblNationalityHidden.Text = jobseekerTbl.Rows[0]["NationalityID"].ToString();
            lblNationalityHidden.Visible = false;
            lblContactNumberBind.Text = jobseekerTbl.Rows[0]["ContactNumber"].ToString();
            lblContactNumberBind.Visible = true;
            lblPassportIDBind.Text = jobseekerTbl.Rows[0]["ID_Passport"].ToString();
            lblPassportIDBind.Visible = true;
            lblDesiredJobCategoryBind.Text = jobseekerTbl.Rows[0]["Category"].ToString();
            lblDesiredJobCategoryBind.Visible = true;
            lblDesiredJobCategoryHidden.Text = jobseekerTbl.Rows[0]["CategoryID"].ToString();
            lblDesiredJobCategoryHidden.Visible = false;
            lblEducationBind.Text = jobseekerTbl.Rows[0]["Education"].ToString();
            lblEducationBind.Visible = true;
            lblEducationHidden.Text = jobseekerTbl.Rows[0]["EducationID"].ToString();
            lblEducationHidden.Visible = false;
            lblWorkExperienceBind.Text = jobseekerTbl.Rows[0]["Experience"].ToString();
            lblWorkExperienceBind.Visible = true; 
            lblJobseekerStatusBind.Text = jobseekerTbl.Rows[0]["Status"].ToString();
            lblJobseekerStatusBind.Visible = true;
            lblJobseekerStatusHidden.Text = jobseekerTbl.Rows[0]["StatusID"].ToString();
            lblJobseekerStatusHidden.Visible = false;
            
           

            txtFName.Visible = false;
            txtLName.Visible = false;
            ddlCountry.Visible = false;
            ddlRegion.Visible = false;
            ddlLocation.Visible = false;
            ddlNationality.Visible = false;
            txtContactNumber.Visible = false;
            txtIDPassport.Visible = false;
            ddlDesiredCategory.Visible = false;
            ddlEducation.Visible = false;
            ddlWorkExperience.Visible = false;
            ddlStatus.Visible = false;

            btnCancel.Enabled = false;
            btnDelete.Enabled = true;
            btnEdit.Enabled = true;
            btnUpdate.Enabled = false;

        }

        protected void LoadEdit()
        {
            btnUpdate.Enabled = true;
            btnDelete.Enabled = true;
            btnCancel.Enabled = true;
            btnEdit.Enabled = false;
            lblMessage.Text = "";

            lblFNameBind.Visible = false;
            lblLNameBind.Visible = false;
            lblCountryBind.Visible = false;
            lblRegionBind.Visible = false;
            lblLocationBind.Visible = false;
            lblNationalityBind.Visible = false;
            lblContactNumberBind.Visible = false;
            lblPassportIDBind.Visible = false;
            lblDesiredJobCategoryBind.Visible = false;
            lblEducationBind.Visible = false;
            lblWorkExperienceBind.Visible = false;
            lblJobseekerStatusBind.Visible = false;


            txtFName.Text = lblFNameBind.Text.ToString();
            txtLName.Text = lblLNameBind.Text.ToString();
            ddlCountry.SelectedValue = popCountry(lblCountryHidden.Text.ToString(), lblCountryBind.Text.ToString());
            ddlRegion.SelectedValue = popRegion(lblRegionHidden.Text.ToString());
            ddlLocation.SelectedValue = popLocation(lblLocationHidden.Text.ToString(), ddlRegion.SelectedValue.ToString());
            ddlNationality.SelectedValue = popNationality(lblNationalityHidden.Text.ToString());
            
            txtIDPassport.Text = lblPassportIDBind.Text.ToString();
            txtContactNumber.Text = lblContactNumberBind.Text.ToString();

            
            txtFName.Visible = true;
            txtLName.Visible = true;
            ddlCountry.Visible = true;
            ddlRegion.Visible = true;
            ddlLocation.Visible = true;
            ddlNationality.Visible = true;
            txtContactNumber.Visible = true;
            txtIDPassport.Visible = true;
            ddlDesiredCategory.Visible = true;
            ddlEducation.Visible = true;
            ddlWorkExperience.Visible = true;
            ddlStatus.Visible = true;

            ddlDesiredCategory.SelectedValue = popCategory(lblDesiredJobCategoryHidden.Text.ToString());
            ddlEducation.SelectedValue = popEducation(lblEducationHidden.Text.ToString());
            ddlStatus.SelectedValue = popStatus(lblJobseekerStatusHidden.Text.ToString());
            ddlWorkExperience.SelectedValue = popExperience( lblWorkExperienceBind.Text.ToString());
            

            

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            LoadEdit();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            bool flag = false;
            Format format = new Format();
            dataAccess database = new dataAccess();
            string updateString = "UPDATE jobsdb_JobSeeker SET FirstName = '" + format.capitalizeStart(txtFName.Text.ToString()) +
                "', LastName = '" + format.capitalizeStart(txtLName.Text.ToString()) +
                "', Country ='" + ddlCountry.SelectedValue +
                "', Region ='" + ddlRegion.SelectedValue +
                "', Location ='" + ddlLocation.SelectedValue +
                "', ContactNumber ='" + txtContactNumber.Text.ToString() +
                "', Nationality ='" + ddlNationality.SelectedValue.ToString() +
                "', ID_Passport ='" + txtIDPassport.Text.ToString() +
                "', JobCategory ='" + ddlDesiredCategory.SelectedValue.ToString() +
                "', Experience ='" + ddlWorkExperience.SelectedValue.ToString() +
                "', Education ='" + ddlEducation.SelectedValue.ToString() +
                "', Status ='" + ddlStatus.SelectedValue.ToString() +
                "' WHERE (Email = '" + User.Identity.Name + "')";
            
            flag = database.updateData(updateString);
            if (flag)
            {
                lblMessage.Text = "Successfully updated details";
                lblMessage.ForeColor = System.Drawing.Color.Green;
                LoadLabels();
            }
            else
            {
                lblMessage.Text = "Failed to update details";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }




        protected string popCountry(string countryID, string country)
        {
            dataAccess database = new dataAccess();
            DataTable countryTbl = database.getTable("SELECT * FROM jobsdb_Country ORDER BY Country");

            int arraySize = countryTbl.Rows.Count + 1;
            ListItem[] item = new ListItem[arraySize];
            ddlCountry.Items.Clear();
            ddlCountry.Enabled = true;

            //Populate ddlRegion with Regions from jobsdb_Region specific to the Region
            item[0] = new ListItem();
            item[0].Text = "Select Country";
            item[0].Value = "";
            ddlCountry.Items.Add(item[0]);
            for (int i = 0; i < countryTbl.Rows.Count; i++)
            {
                item[i + 1] = new ListItem();
                item[i + 1].Text = countryTbl.Rows[i]["Country"].ToString();
                item[i + 1].Value = countryTbl.Rows[i]["ID"].ToString();
                ddlCountry.Items.Add(item[i + 1]);
                
            }
            if (country != "Zambia")
            {
                ddlLocation.Enabled = false;
                ddlRegion.Enabled = false;
            }
            return countryID;

        }





        protected string popRegion(string region)
        {
            dataAccess database = new dataAccess();
            DataTable regTbl = database.getTable("SELECT * FROM jobsdb_Region ORDER BY Region");

            int arraySize = regTbl.Rows.Count + 1;
            ListItem[] item = new ListItem[arraySize];
            ddlRegion.Items.Clear();
            ddlRegion.Enabled = true;

            //Populate ddlRegion with Regions from jobsdb_Region specific to the Region
            item[0] = new ListItem();
            item[0].Text = "Select Region";
            item[0].Value = "";
            ddlRegion.Items.Add(item[0]);
            for (int i = 0; i < regTbl.Rows.Count; i++)
            {
                item[i + 1] = new ListItem();
                item[i + 1].Text = regTbl.Rows[i]["Region"].ToString();
                item[i + 1].Value = regTbl.Rows[i]["ID"].ToString();
                ddlRegion.Items.Add(item[i + 1]);
            }
            if (region == "0")
            {
                ddlRegion.SelectedValue = "";
                ddlRegion.Enabled = false;
                region = "";
            }
            
            
            return region;

        }

        protected string popLocation(string location, string regionID)
        {
            dataAccess database = new dataAccess();
            DataTable locTbl = database.getTable("SELECT * FROM jobsdb_Location WHERE Region = '" + regionID + "' ORDER BY Location");

            int arraySize = locTbl.Rows.Count + 1;
            ListItem[] item = new ListItem[arraySize];
            ddlLocation.Items.Clear();
            ddlLocation.Enabled = true;
            ddlRegion.Enabled = true;
            //rfvLocation.Enabled = true;


            //Populate ddlLocation with locations from jobsdb_Location specific to the Region
            item[0] = new ListItem();
            item[0].Text = "Select Location";
            item[0].Value = "";
            ddlLocation.Items.Add(item[0]);
            for (int i = 0; i < locTbl.Rows.Count; i++)
            {
                item[i + 1] = new ListItem();
                item[i + 1].Text = locTbl.Rows[i]["Location"].ToString();
                item[i + 1].Value = locTbl.Rows[i]["ID"].ToString();
                ddlLocation.Items.Add(item[i + 1]);
            }
            if (ddlRegion.SelectedValue.ToString() == "")
            {
                ddlRegion.Enabled = false;
            }
            if (location == "0")
            {
                ddlLocation.SelectedValue = "";
                location = "";
                ddlLocation.Enabled = false;
            }
            return location;
        }

        protected string popNationality(string nationality)
        {
            dataAccess database = new dataAccess();
            DataTable natTbl = database.getTable("SELECT * FROM jobsdb_Nationality");

            int arraySize = natTbl.Rows.Count + 1;
            ListItem[] item = new ListItem[arraySize];
            ddlNationality.Items.Clear();
            ddlNationality.Enabled = true;

            //Populate ddlRegion with Regions from jobsdb_Region specific to the Region
            item[0] = new ListItem();
            item[0].Text = "Select Nationality";
            item[0].Value = "";
            ddlNationality.Items.Add(item[0]);
            for (int i = 0; i < natTbl.Rows.Count; i++)
            {
                item[i + 1] = new ListItem();
                item[i + 1].Text = natTbl.Rows[i]["Nationality"].ToString();
                item[i + 1].Value = natTbl.Rows[i]["ID"].ToString();
                ddlNationality.Items.Add(item[i + 1]);

            }
            return nationality;

        }

     protected string popCategory(string category)
        {
            dataAccess database = new dataAccess();
            DataTable CatTbl = database.getTable("SELECT * FROM jobsdb_JobCategory ORDER BY Category");

            int arraySize = CatTbl.Rows.Count + 1;
            ListItem[] item = new ListItem[arraySize];
            ddlDesiredCategory.Items.Clear();
            ddlDesiredCategory.Enabled = true;
         
            //Populate ddlRegion with Regions from jobsdb_Region specific to the Region
            item[0] = new ListItem();
            item[0].Text = "Select Job Category";
            item[0].Value = "";
            ddlDesiredCategory.Items.Add(item[0]);
            for (int i = 0; i < CatTbl.Rows.Count; i++)
            {
                item[i + 1] = new ListItem();
                item[i + 1].Text = CatTbl.Rows[i]["Category"].ToString();
                item[i + 1].Value = CatTbl.Rows[i]["ID"].ToString();
                ddlDesiredCategory.Items.Add(item[i + 1]);
            }
            return category;

        }

     protected string popEducation(string education)
     {
         dataAccess database = new dataAccess();
         DataTable eduTbl = database.getTable("SELECT * FROM jobsdb_Education");

         int arraySize = eduTbl.Rows.Count + 1;
         ListItem[] item = new ListItem[arraySize];
         ddlEducation.Items.Clear();
         ddlEducation.Enabled = true;

         //Populate ddlRegion with Regions from jobsdb_Region specific to the Region
         item[0] = new ListItem();
         item[0].Text = "Select Education Level";
         item[0].Value = "";
         ddlEducation.Items.Add(item[0]);
         for (int i = 0; i < eduTbl.Rows.Count; i++)
         {
             item[i + 1] = new ListItem();
             item[i + 1].Text = eduTbl.Rows[i]["EducationLevel"].ToString();
             item[i + 1].Value = eduTbl.Rows[i]["ID"].ToString();
             ddlEducation.Items.Add(item[i + 1]);
         }
         return education;

     }

     protected string popExperience(string experience)
     {
         dataAccess database = new dataAccess();
         DataTable expTbl = database.getTable("SELECT * FROM jobsdb_Experience");

         int arraySize = expTbl.Rows.Count + 1;
         ListItem[] item = new ListItem[arraySize];
         ddlWorkExperience.Items.Clear();
         ddlWorkExperience.Enabled = true;

         //Populate ddlRegion with Regions from jobsdb_Region specific to the Region
         item[0] = new ListItem();
         item[0].Text = "Select Experience";
         item[0].Value = "";
         ddlWorkExperience.Items.Add(item[0]);
         for (int i = 0; i < expTbl.Rows.Count; i++)
         {
             item[i + 1] = new ListItem();
             item[i + 1].Text = expTbl.Rows[i]["Years"].ToString() + " years";
             item[i + 1].Value = expTbl.Rows[i]["Years"].ToString();
             ddlWorkExperience.Items.Add(item[i + 1]);
         }
         return experience;

     }

     protected string popStatus(string status)
     {
         ListItem[] item = new ListItem[2];
         ddlStatus.Items.Clear();
         ddlStatus.Enabled = true;
         //Populate ddl status
         item[0] = new ListItem();
         item[0].Text = "Visible";
         item[0].Value = "1";
         ddlStatus.Items.Add(item[0]);

         item[1] = new ListItem();
         item[1].Text = "Hidden";
         item[1].Value = "2";
         ddlStatus.Items.Add(item[1]);
         return status;

     }

    }
}
