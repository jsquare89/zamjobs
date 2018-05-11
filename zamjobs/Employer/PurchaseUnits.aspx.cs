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

namespace zamjobs.Employer
{
    public partial class PurchaseUnits : System.Web.UI.Page
    {
        protected Int64 unitAmount;
        protected const Int64 halfMonthRatio = 1;
        protected const Int64 fullMonthRatio = 2;
        protected const Int64 viewDetailsRatio = 2;
        protected Int64 halfMonthAmount, fullMonthAmount, viewDetailsAmount;



        protected void Page_Load(object sender, EventArgs e)
        {
            unitAmount = getUnitAmount();

            lbl15DayAmt.Text = Convert.ToString(unitAmount * halfMonthRatio );
            lbl30DayAmt.Text =  Convert.ToString(unitAmount * fullMonthRatio );
            lblViewAmt.Text = Convert.ToString(unitAmount * viewDetailsRatio);
            halfMonthAmount = halfMonthRatio * unitAmount;
            fullMonthAmount = fullMonthRatio * unitAmount;
            viewDetailsAmount = viewDetailsRatio * unitAmount;
            btnCheckout.Enabled = false;

           
            
        }

        protected void ddl15DayAdvert_SelectedIndexChanged(object sender, EventArgs e)
        {
            txt15DaySub.Text = Convert.ToString(Convert.ToInt64(ddl15DayAdvert.SelectedValue) * halfMonthAmount);
            txt15DaySub_TextChanged();
        }

        protected void ddl30DayAdvert_SelectedIndexChanged(object sender, EventArgs e)
        {
            txt30DaySub.Text = Convert.ToString(Convert.ToInt64(ddl30DayAdvert.SelectedValue) * fullMonthAmount);
            txt30DaySub_TextChanged();
        }

        protected void ddlViewJobseekerDetails_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtViewSeekerSub.Text = Convert.ToString(Convert.ToInt64(ddlViewJobseekerDetails.SelectedValue) * viewDetailsAmount );
            txtViewSeekerSub_TextChanged();
        }

        protected void txt15DaySub_TextChanged(object sender, EventArgs e)
        {
            txtTotal.Text = Convert.ToString(Convert.ToInt64(txt15DaySub.Text.ToString()) + Convert.ToInt64(txt30DaySub.Text.ToString()) + Convert.ToInt64(txtViewSeekerSub.Text.ToString()));
            txtTotal_TextChanged();
        }

        protected void txt30DaySub_TextChanged(object sender, EventArgs e)
        {
            txtTotal.Text = Convert.ToString(Convert.ToInt64(txt15DaySub.Text.ToString()) + Convert.ToInt64(txt30DaySub.Text.ToString()) + Convert.ToInt64(txtViewSeekerSub.Text.ToString()));
            txtTotal_TextChanged();
        }

        protected void txtViewSeekerSub_TextChanged(object sender, EventArgs e)
        {
            txtTotal.Text = Convert.ToString(Convert.ToInt64(txt15DaySub.Text.ToString()) + Convert.ToInt64(txt30DaySub.Text.ToString()) + Convert.ToInt64(txtViewSeekerSub.Text.ToString()));
            txtTotal_TextChanged();
        }

        protected void txtTotal_TextChanged(object sender, EventArgs e)
        {
            txtTotalUnits.Text = Convert.ToString(Convert.ToInt64(txtTotal.Text.ToString()) / unitAmount);

        }

        // Overloaded functions

        protected void txt15DaySub_TextChanged()
        {
            txtTotal.Text = Convert.ToString(Convert.ToInt64(txt15DaySub.Text.ToString()) + Convert.ToInt64(txt30DaySub.Text.ToString()) + Convert.ToInt64(txtViewSeekerSub.Text.ToString()));
            txtTotal_TextChanged();
        }

        protected void txt30DaySub_TextChanged()
        {
            txtTotal.Text = Convert.ToString(Convert.ToInt64(txt15DaySub.Text.ToString()) + Convert.ToInt64(txt30DaySub.Text.ToString()) + Convert.ToInt64(txtViewSeekerSub.Text.ToString()));
            txtTotal_TextChanged();
        }

        protected void txtViewSeekerSub_TextChanged()
        {
            txtTotal.Text = Convert.ToString(Convert.ToInt64(txt15DaySub.Text.ToString()) + Convert.ToInt64(txt30DaySub.Text.ToString()) + Convert.ToInt64(txtViewSeekerSub.Text.ToString()));
            txtTotal_TextChanged();
        }

        protected void txtTotal_TextChanged()        
        {
            txtTotalUnits.Text = Convert.ToString(Convert.ToInt64(txtTotal.Text.ToString()) / unitAmount);
            txtTotalUnits_TextChanged();
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            dataAccess database = new dataAccess();
            advertiser purchaseUnts = new advertiser();
            Int64 ID = 0;
            string insertString = "INSERT INTO jobsdb_UnitOrder (Employer, UnitQty, UnitAmount, Date, Paid, Credited, Active) VALUES ('" + purchaseUnts.getCompanyID(User.Identity.Name) +
                "','" + txtTotalUnits.Text.ToString() + "','" + unitAmount + "',GETDATE(),'N','N','Y'); SELECT SCOPE_IDENTITY()";
            ID = database.insertData_ReturnID(insertString);
            
            Response.Redirect("Order.aspx?OrderID=" + ID);

            
        }

        protected void txtTotalUnits_TextChanged()
        {
            if (txtTotalUnits.Text.ToString() != "" && txtTotalUnits.Text.ToString() != "0")
            {
                btnCheckout.Enabled = true;
            }
            else
            {
                btnCheckout.Enabled = false;
            }
        }

        protected Int64 getUnitAmount()
        {
            advertiser unitAmt = new advertiser();
            return Convert.ToInt64(unitAmt.getUnitAmount());
        }

    }
}
