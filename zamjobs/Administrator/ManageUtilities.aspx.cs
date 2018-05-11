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
    public partial class ManageUtilities : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            unitAmountLoad();

        }

        protected string getUnitAmount()
        {
            administrator unitAmt = new administrator();
            return unitAmt.GetUnitAmount();
        }

        protected void unitAmountLoad()
        {
            lblUnitAmountBind.Visible = true;
            lblUnitAmountBind.Text = getUnitAmount();
            txtUnitAmount.Visible = false;
            btnUnitAmountCancel.Visible = false;
            btnUnitAmountUpdate.Visible = false;
            btnUnitAmountEdit.Visible = true;
        }

        protected void unitAmountEdit()
        {
            lblUnitAmountBind.Visible = false;
            txtUnitAmount.Text = lblUnitAmountBind.Text;
            txtUnitAmount.Visible = true;
            btnUnitAmountCancel.Visible = true;
            btnUnitAmountEdit.Visible = false;
            btnUnitAmountUpdate.Visible = true;

        }

        protected void btnUnitAmountEdit_Click(object sender, EventArgs e)
        {
            unitAmountEdit();
        }

        protected void btnUnitAmountCancel_Click(object sender, EventArgs e)
        {
            unitAmountLoad();
        }

        protected void btnUnitAmountUpdate_Click(object sender, EventArgs e)
        {
            administrator unitAmount = new administrator();
            unitAmount.UpdateUnitAmount(txtUnitAmount.Text.ToString());
            unitAmountLoad();
        }

        protected void btnCategoryUpdate_Click(object sender, EventArgs e)
        {
            administrator admin = new administrator();
            dataAccess database = new dataAccess();
            Format format = new Format();
            bool flag = false;
            bool exists = false;
            DataTable jobCatTbl = admin.GetJobCategoryTable();
            for(int i = 0; i<jobCatTbl.Rows.Count;i++)
            {
                if (jobCatTbl.Rows[i]["Category"].ToString().ToLower() == txtNewCategory.Text.ToString().ToLower())
                {
                    exists = true;
                }
            }

            if (exists == false)
            {
                flag = database.insertData("INSERT INTO jobsdb_JobCategory (Category) VALUES ('" + format.capitalizeStart(txtNewCategory.Text.ToString()) + "')");
            }

            if (flag)
            {
                lblCategoryMessage.Text = txtNewCategory.Text.ToString() + " successfully inserted";
                lblCategoryMessage.ForeColor = System.Drawing.Color.Green;
                ddlCategory.DataBind();
            }
            else
            {
                if (exists)
                {
                    lblCategoryMessage.Text = txtNewCategory.Text + " already exists";
                    lblCategoryMessage.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    lblCategoryMessage.Text = "Unable to insert request";
                    lblCategoryMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
            txtNewCategory.Text = "";
        }

        protected void btnCountryUpdate_Click(object sender, EventArgs e)
        {

        }

    }



}
