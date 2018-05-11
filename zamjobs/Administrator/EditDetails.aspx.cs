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
    public partial class EditDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadLabels();
            
        }

        protected void Edit()
        {
            txtFName.Text = lblFNameBind.Text.ToString();
            lblFNameBind.Visible = false;
            txtFName.Visible = true;
            txtLName.Text = lblLNameBind.Text.ToString();
            lblLNameBind.Visible = false;
            txtLName.Visible = true;
            txtContactNum.Text = lblContactNumBind.Text.ToString();
            lblContactNumBind.Visible = false;
            txtContactNum.Visible = true;
            txtPassportID.Text = lblPassportIDBind.Text.ToString();
            lblPassportIDBind.Visible = false;
            txtPassportID.Visible = true;
            txtPhysicalAddress.Text = lblAddressBind.Text.ToString();
            lblAddressBind.Visible = false;
            txtPhysicalAddress.Visible = true;



            btnEdit.Enabled = false;
            btnUpdate.Enabled = true;
            btnCancel.Enabled = true;

        }

        protected void LoadLabels()
        {
            administrator admin = new administrator();
            DataTable adminTbl = admin.GetAdminByEmail(User.Identity.Name);
            lblAdminIdBind.Text = string.Format( "ZM{0:000000}" , Convert.ToInt32(adminTbl.Rows[0]["ID"].ToString()));
            lblAdminIdBind.Visible = true;
            lblEmailBind.Text = adminTbl.Rows[0]["Email"].ToString();
            lblEmailBind.Visible = true;
            lblFNameBind.Text = adminTbl.Rows[0]["FirstName"].ToString();
            lblFNameBind.Visible = true;
            lblLNameBind.Text = adminTbl.Rows[0]["LastName"].ToString();
            lblLNameBind.Visible = true;
            lblContactNumBind.Text = adminTbl.Rows[0]["ContactNumber"].ToString();
            lblContactNumBind.Visible = true;
            lblPassportIDBind.Text = adminTbl.Rows[0]["PassportID"].ToString();
            lblPassportIDBind.Visible = true;
            lblAddressBind.Text = adminTbl.Rows[0]["PhysicalAddress"].ToString();
            lblAddressBind.Visible = true;

            txtFName.Visible = false;
            txtLName.Visible = false;
            txtContactNum.Visible = false;
            txtPassportID.Visible = false;
            txtPhysicalAddress.Visible = false;
            btnCancel.Enabled = false;
            btnUpdate.Enabled = false;
            btnEdit.Enabled = true;

        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Edit();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            administrator admin = new administrator();
            string updateString = "UPDATE jobsdb_Administrator SET FirstName='" + txtFName.Text.ToString() + "', LastName ='" + txtLName.Text.ToString() + "', ContactNumber='" + txtContactNum.Text.ToString() + "', PassportID='" + txtPassportID.Text.ToString() + "', PhysicalAddress='" + txtPhysicalAddress.Text.ToString() + "' WHERE ID='" + admin.GetAdminIDByEmail(User.Identity.Name) + "'";
            bool flag = admin.UpdateAdmin(updateString);
            LoadLabels();
        }
    }
}
