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
using System.Drawing.Imaging;

namespace zamjobs.Employer
{
    public partial class EditDetails : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

            loadData();
           
            //(SELECT Country FROM jobsdb_Country WHERE (ID = jobsdb_Employer.Country)) AS CountryName
            //"(SELECT Region FROM jobsdb_Region WHERE (ID = jobsdb_Employer.Region)) AS RegionName," +
            //"(SELECT Location FROM jobsdb_Location WHERE (ID = jobsdb_Employer.Location)) AS LocationName," +
            
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            btnCancel.Visible = true;
            btnCancel.Enabled = true;
            btnUpdate.Visible = true;
            btnUpdate.Enabled = true;
            btnEdit.Visible = false;
            btnEdit.Enabled = false;
            btnDelete.Visible = false;
            btnDelete.Enabled = false;

            txtCompanyName.Text = lblCompanyNameBind.Text.ToString();
            txtContactName.Text = lblContactNameBind.Text.ToString();
            ddlCountry.SelectedItem.Text = lblCountryBind.Text.ToString();
            ddlRegion.SelectedValue = popRegion(lblRegionHidden.Text.ToString());
            ddlLocation.SelectedValue = popLocation(lblLocationHidden.Text.ToString(),ddlRegion.SelectedValue.ToString());
            txtContactNumber.Text = lblContactNumberBind.Text.ToString();
            txtContactNumber2.Text = lblAltContactNumberBind.Text.ToString();
            txtPostalAddress.Text = lblPostalAddressBind.Text.ToString();
            txtWebsiteURL.Text = lblWebsiteURLBind.Text.ToString();
            ddlCategory.SelectedValue = popCategory(lblCategoryHidden.Text.ToString());
            txtCompanyDesc.Text = lblOverviewBind.Text.ToString();
            editLoadItems();

            
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Employer/EditDetails.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            
            string updateString = "UPDATE jobsdb_Employer SET CompanyName = '" + txtCompanyName.Text.ToString() +
                "', ContactName = '" + txtContactName.Text.ToString() +
                "', Region ='" + ddlRegion.SelectedValue +
                "', Location ='" + ddlLocation.SelectedValue +
                "', ContactNumber ='" + txtContactNumber.Text.ToString() +
                "', AltContactNumber ='" + txtContactNumber2.Text.ToString() +
                "', PostalAddress ='" + txtPostalAddress.Text.ToString() +
                "', WebsiteURL ='" + txtWebsiteURL.Text.ToString() +
                "', Category ='" + ddlCategory.SelectedValue +
                "', Description ='" + txtCompanyDesc.Text.ToString() +
                "' WHERE (Email = '" + User.Identity.Name + "')";
            SqlConnection connString = new SqlConnection(ConfigurationManager.ConnectionStrings["ZamJobsConnString"].ConnectionString);

            SqlCommand cmd = new SqlCommand(updateString, connString);
            
            connString.Open();
            // Call ExecuteNonQuery to send command
            int i = cmd.ExecuteNonQuery();
            
            connString.Close();
            //Response.Redirect(i.ToString());
            loadData();
        }

        protected void loadData()
        {
            btnCancel.Visible = false;
            btnCancel.Enabled = false;
            btnUpdate.Visible = false;
            btnUpdate.Enabled = false;
            btnEdit.Visible = true;
            btnEdit.Enabled = true;
            btnDelete.Visible = true;
            btnDelete.Enabled = true;
            Format formatObj = new Format();
            string UserID = User.Identity.Name;
            dataAccess details = new dataAccess();
            DataTable advitisor = details.getTable(@"SELECT ID, CompanyName, ContactName, Email,
                              (SELECT        Country
                               FROM            jobsdb_Country
                               WHERE        (ID = jobsdb_Employer.Country)) AS Country,
                             (SELECT        Region
                               FROM            jobsdb_Region
                               WHERE        (ID = jobsdb_Employer.Region)) AS Region, Region as RegionID,
                             (SELECT        Location
                               FROM            jobsdb_Location
                               WHERE        (ID = jobsdb_Employer.Location)) AS Location, Location AS LocationID, ContactNumber, AltContactNumber, PostalAddress, WebsiteURL,
                              (SELECT        Category
                               FROM            jobsdb_JobCategory
                               WHERE        (ID = jobsdb_Employer.Category)) AS Category, Category AS CategoryID, Description 
                             FROM jobsdb_Employer WHERE Email = '" + UserID + "'");

            lblIDBind.Text = formatObj.GetAdvertiserIdFormat(advitisor.Rows[0]["ID"].ToString());
            lblIDBind.Visible = true;
            //txtCompanyID.Text = advitisor.Rows[0]["ID"].ToString();
            lblEmailBind.Text = advitisor.Rows[0]["Email"].ToString();
            lblEmailBind.Visible = true;
            //txtEmail.Text = advitisor.Rows[0]["Email"].ToString();

            //txtCompanyName.Text = advitisor.Rows[0]["CompanyName"].ToString() ;
            lblCompanyNameBind.Text = advitisor.Rows[0]["CompanyName"].ToString();
            lblCompanyNameBind.Visible = true;
            txtCompanyName.Visible = false;
            //txtContactName.Text = advitisor.Rows[0]["ContactName"].ToString();
            lblContactNameBind.Text = advitisor.Rows[0]["ContactName"].ToString();
            lblContactNameBind.Visible = true;
            txtContactName.Visible = false;
            //ddlCountry.SelectedValue = advitisor.Rows[0]["Country"].ToString();
            lblCountryBind.Text = advitisor.Rows[0]["Country"].ToString();
            lblCountryBind.Visible = true;
            ddlCountry.Visible = false;
            //ddlRegion.SelectedValue = advitisor.Rows[0]["RegionID"].ToString();
            lblRegionBind.Text = advitisor.Rows[0]["Region"].ToString();
            lblRegionBind.Visible = true;
            ddlRegion.Visible = false;
            lblRegionHidden.Visible = false;
            lblRegionHidden.Text = advitisor.Rows[0]["RegionID"].ToString();
            //ddlLocation.SelectedItem.Text = advitisor.Rows[0]["Location"].ToString();
            lblLocationBind.Text = advitisor.Rows[0]["Location"].ToString();
            lblLocationBind.Visible = true;
            ddlLocation.Visible = false;
            lblLocationHidden.Text = advitisor.Rows[0]["LocationID"].ToString();
            lblLocationHidden.Visible = false;
            //txtContactNumber.Text = advitisor.Rows[0]["ContactNumber"].ToString();
            lblContactNumberBind.Text = advitisor.Rows[0]["ContactNumber"].ToString();
            lblContactNumberBind.Visible = true;
            txtContactNumber.Visible = false;
            //txtContactNumber2.Text = advitisor.Rows[0]["AltContactNumber"].ToString();
            lblAltContactNumberBind.Text = advitisor.Rows[0]["AltContactNumber"].ToString();
            lblAltContactNumberBind.Visible = true;
            txtContactNumber2.Visible = false;
            //txtPostalAddress.Text = advitisor.Rows[0]["PostalAddress"].ToString();
            lblPostalAddressBind.Text = advitisor.Rows[0]["PostalAddress"].ToString();
            lblPostalAddressBind.Visible = true;
            txtPostalAddress.Visible = false;
            //txtWebsiteURL.Text = advitisor.Rows[0]["WebsiteURL"].ToString();
            lblWebsiteURLBind.Text = advitisor.Rows[0]["WebsiteURL"].ToString();
            lblWebsiteURLBind.Visible = true;
            txtWebsiteURL.Visible = false;
            //ddlCategory.SelectedItem.Text = advitisor.Rows[0]["Category"].ToString();
            lblCategoryBind.Text = advitisor.Rows[0]["Category"].ToString();
            lblCategoryBind.Visible = true;
            ddlCategory.Visible = false;
            lblCategoryHidden.Text = advitisor.Rows[0]["CategoryID"].ToString();
            lblCategoryHidden.Visible = false;
            //txtCompanyDesc.Text = advitisor.Rows[0]["Description"].ToString();
            lblOverviewBind.Text = advitisor.Rows[0]["Description"].ToString();
            lblOverviewBind.Visible = true;
            txtCompanyDesc.Visible = false;


            
        }

        protected string popRegion(string AdvertiserRegion)
        {
            dataAccess database = new dataAccess();
            DataTable RegTbl = database.getTable("SELECT * FROM jobsdb_Region ORDER BY Region");

            int arraySize = RegTbl.Rows.Count + 1;
            ListItem[] item = new ListItem[arraySize];
            ddlRegion.Items.Clear();
            ddlRegion.Enabled = true;
            
            //Populate ddlRegion with Regions from jobsdb_Region specific to the Region
            item[0] = new ListItem();
            item[0].Text = "Select Region";
            item[0].Value = "";
            ddlRegion.Items.Add(item[0]);
            for (int i = 0; i < RegTbl.Rows.Count; i++)
            {
                item[i + 1] = new ListItem();
                item[i + 1].Text = RegTbl.Rows[i]["Region"].ToString();
                item[i + 1].Value = RegTbl.Rows[i]["ID"].ToString();
                ddlRegion.Items.Add(item[i + 1]);
            }
            return AdvertiserRegion;

        }

        protected string popLocation(string advertiserLocation,string regionID)
        {
            dataAccess Location = new dataAccess();
            DataTable LocTbl = Location.getTable("SELECT * FROM jobsdb_Location WHERE Region = '" + regionID + "' ORDER BY Location");

            int arraySize = LocTbl.Rows.Count + 1;
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
            for (int i = 0; i < LocTbl.Rows.Count; i++)
            {
                item[i + 1] = new ListItem();
                item[i + 1].Text = LocTbl.Rows[i]["Location"].ToString();
                item[i + 1].Value = LocTbl.Rows[i]["ID"].ToString();
                ddlLocation.Items.Add(item[i + 1]);
            }
            return advertiserLocation;
        }

        protected void ddlRegion_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblRegionBind.Visible = false;
            ddlRegion.SelectedValue = popRegion(ddlRegion.SelectedValue.ToString());
            ddlRegion.Visible = true;
            lblLocationBind.Visible = false;
            ddlLocation.SelectedValue = popLocation( "" ,ddlRegion.SelectedValue.ToString());
            ddlLocation.Visible = true;
            editLoadItems();
            rfvLocation.Enabled = true;
            rfvRegion.Enabled = true;
        }


        protected string popCategory(string advertiserCategory)
        {
            dataAccess database = new dataAccess();
            DataTable CatTbl = database.getTable("SELECT * FROM jobsdb_JobCategory ORDER BY Category");

            int arraySize = CatTbl.Rows.Count + 1;
            ListItem[] item = new ListItem[arraySize];
            ddlCategory.Items.Clear();
            ddlCategory.Enabled = true;
            
            //Populate ddlRegion with Regions from jobsdb_Region specific to the Region
            item[0] = new ListItem();
            item[0].Text = "Select Category";
            item[0].Value = "";
            ddlCategory.Items.Add(item[0]);
            for (int i = 0; i < CatTbl.Rows.Count; i++)
            {
                item[i + 1] = new ListItem();
                item[i + 1].Text = CatTbl.Rows[i]["Category"].ToString();
                item[i + 1].Value = CatTbl.Rows[i]["ID"].ToString();
                ddlCategory.Items.Add(item[i + 1]);
            }
            return advertiserCategory;

        }

        protected void editLoadItems()
        {
            lblCompanyNameBind.Visible = false;
            txtCompanyName.Visible = true;
            lblContactNameBind.Visible = false;
            txtContactName.Visible = true;
            lblCountryBind.Visible = false;
            ddlCountry.Enabled = false;
            ddlCountry.Visible = true;
            lblRegionBind.Visible = false;
            ddlRegion.Visible = true;
            lblLocationBind.Visible = false;
            ddlLocation.Visible = true;
            lblContactNumberBind.Visible = false;
            txtContactNumber.Visible = true;
            lblAltContactNumberBind.Visible = false;
            txtContactNumber2.Visible = true;
            lblPostalAddressBind.Visible = false;
            txtPostalAddress.Visible = true;
            lblWebsiteURLBind.Visible = false;
            txtWebsiteURL.Visible = true;
            lblCategoryBind.Visible = false;
            ddlCategory.Visible = true;
            lblOverviewBind.Visible = false;
            txtCompanyDesc.Visible = true;

            
        }

    }
}
