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
    public partial class ManageAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Loadbtn();
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateAdmin.aspx");
        }

        protected void SelectClick(object sender, EventArgs e)
        {
            btnEdit.Enabled = true;
            btnViewDetail.Enabled = true;

        }

        protected void Loadbtn()
        {
            btnActivate.Enabled = false;
            btnDeactivate.Enabled = false;
            btnCreate.Enabled = true;
            btnDelete.Enabled = false;
            btnEdit.Enabled = false;
            btnCancel.Enabled = false;
            btnViewDetail.Enabled = false;
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            btnDelete.Enabled = true;
            btnEdit.Enabled = false;
            btnCancel.Enabled = true;
            administrator admin = new administrator();
            string adminID = Convert.ToString(((int)GridView1.SelectedValue));
            DataTable adminTbl = admin.GetAdminByID(adminID);
            if (Convert.ToBoolean(adminTbl.Rows[0]["Active"].ToString()) == true)
            {
                btnDeactivate.Enabled = true;
                btnActivate.Enabled = false;
            }
            else if (Convert.ToBoolean(adminTbl.Rows[0]["Active"].ToString()) == false)
            {
                btnDeactivate.Enabled = false;
                btnActivate.Enabled = true;
            }
        }

        protected void btnActivate_Click(object sender, EventArgs e)
        {
            string adminID = Convert.ToString(((int)GridView1.SelectedValue));
            administrator admin = new administrator();
            bool flag = admin.ActivateAdmin(adminID);
            if (flag)
            {
                lblMessage.Text = "Successfully Activated Administrator.";
                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblMessage.Text = "Activate Administrator Failed.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
            GridView1.DataBind();
            GridView1.SelectedIndex = -1;
            

        }

        protected void btnDeactivate_Click(object sender, EventArgs e)
        {
            string adminID = Convert.ToString(((int)GridView1.SelectedValue));
            administrator admin = new administrator();
            bool flag = admin.DeactivateAdmin(adminID);
            if (flag)
            {
                lblMessage.Text = "Successfully Deactivated Administrator.";
                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblMessage.Text = "Deactivate Administrator Failed.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
            GridView1.DataBind();
            GridView1.SelectedIndex = -1;

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            string adminID = Convert.ToString(((int)GridView1.SelectedValue));
            administrator admin = new administrator();
            if (admin.GetAdminCount() > 1)
            {
                bool flag = admin.DeleteAdmin(adminID);
                if (flag)
                {
                    lblMessage.Text = "Successfully Deleted Administrator.";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblMessage.Text = "Delete Administrator Failed.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
                GridView1.DataBind();
                GridView1.SelectedIndex = -1;
            }
            else
            {
                lblMessage.Text = "Delete Administrator Failed. There must be at least 1 admninistrator.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                GridView1.SelectedIndex = -1;
            }

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Loadbtn();

            GridView1.SelectedIndex = -1;

        }

        protected void btnViewDetail_Click(object sender, EventArgs e)
        {
            string adminID = Convert.ToString(((int)GridView1.SelectedValue));
            Response.Redirect("ViewAdminDetail.aspx?id=" + adminID);
        }
    }
}
