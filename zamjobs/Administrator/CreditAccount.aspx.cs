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
    public partial class CreditAccount : System.Web.UI.Page
    {
        public dataAccess database = new dataAccess();
        public DataTable orderNumTbl;
       
        protected void Page_Load(object sender, EventArgs e)
        {

            FillTable("", "");
            LoadBtn();
            GridView1.PageSize = Convert.ToInt32(ddlRecordsPerPage.SelectedValue);
            administrator order = new administrator();
            DataTable orderTbl = order.GetOrders();
            lblOrderCount.Text = orderTbl.Rows.Count.ToString();
            orderNumTbl =  database.getTable("SELECT OrderNum FROM jobsdb_UnitOrder");

        
        }


        protected void FillTable(string companyID, string filter)
        {
            string selectString = "SELECT OrderNum, Employer AS CompanyID, (SELECT CompanyName FROM jobsdb_Employer WHERE (ID = jobsdb_UnitOrder.Employer)) AS CompanyName, UnitAmount, UnitQty, CAST(UnitAmount AS int) * CAST(UnitQty AS int) AS Total, Date, Paid, Credited, Active FROM jobsdb_UnitOrder ";

            if (companyID != "" && filter != "")
            {
                selectString = "SELECT OrderNum, Employer AS CompanyID, (SELECT CompanyName FROM jobsdb_Employer WHERE (ID = jobsdb_UnitOrder.Employer)) AS CompanyName, UnitAmount, UnitQty, CAST(UnitAmount AS int) * CAST(UnitQty AS int) AS Total, Date, Paid, Credited, Active FROM jobsdb_UnitOrder WHERE Employer='" + companyID + "' AND OrderNum='" + filter + "'";
            }
            else if (companyID == "" && filter != "")
            {
                selectString = "SELECT OrderNum, Employer AS CompanyID, (SELECT CompanyName FROM jobsdb_Employer WHERE (ID = jobsdb_UnitOrder.Employer)) AS CompanyName, UnitAmount, UnitQty, CAST(UnitAmount AS int) * CAST(UnitQty AS int) AS Total, Date, Paid, Credited, Active FROM jobsdb_UnitOrder WHERE OrderNum='" + filter + "'";
            }
            else if (companyID != "" && filter == "")
            {
                selectString = "SELECT OrderNum, Employer AS CompanyID, (SELECT CompanyName FROM jobsdb_Employer WHERE (ID = jobsdb_UnitOrder.Employer)) AS CompanyName, UnitAmount, UnitQty, CAST(UnitAmount AS int) * CAST(UnitQty AS int) AS Total, Date, Paid, Credited, Active FROM jobsdb_UnitOrder WHERE Employer='" + companyID + "'";
            }
            SqlDataSourceOrders.SelectCommand = selectString;
            
            GridView1.DataBind();
            GridView1.SelectedIndex = -1;



        }

        protected void FillEditTable(string companyID, string filter)
        {
            string selectString = "SELECT OrderNum, Employer AS CompanyID, (SELECT CompanyName FROM jobsdb_Employer WHERE (ID = jobsdb_UnitOrder.Employer)) AS CompanyName, UnitAmount, UnitQty, CAST(UnitAmount AS int) * CAST(UnitQty AS int) AS Total, Date, Paid, Credited, Active FROM jobsdb_UnitOrder ";

            if (companyID != "" && filter != "")
            {
                selectString = "SELECT OrderNum, Employer AS CompanyID, (SELECT CompanyName FROM jobsdb_Employer WHERE (ID = jobsdb_UnitOrder.Employer)) AS CompanyName, UnitAmount, UnitQty, CAST(UnitAmount AS int) * CAST(UnitQty AS int) AS Total, Date, Paid, Credited, Active FROM jobsdb_UnitOrder WHERE Employer='" + companyID + "' AND OrderNum='" + filter + "'";
            }
            else if (companyID == "" && filter != "")
            {
                selectString = "SELECT OrderNum, Employer AS CompanyID, (SELECT CompanyName FROM jobsdb_Employer WHERE (ID = jobsdb_UnitOrder.Employer)) AS CompanyName, UnitAmount, UnitQty, CAST(UnitAmount AS int) * CAST(UnitQty AS int) AS Total, Date, Paid, Credited, Active FROM jobsdb_UnitOrder WHERE OrderNum='" + filter + "'";
            }
            else if (companyID != "" && filter == "")
            {
                selectString = "SELECT OrderNum, Employer AS CompanyID, (SELECT CompanyName FROM jobsdb_Employer WHERE (ID = jobsdb_UnitOrder.Employer)) AS CompanyName, UnitAmount, UnitQty, CAST(UnitAmount AS int) * CAST(UnitQty AS int) AS Total, Date, Paid, Credited, Active FROM jobsdb_UnitOrder WHERE Employer='" + companyID + "'";
            }
            SqlDataSourceOrders.SelectCommand = selectString;

            GridView1.DataBind();



        }

        protected void selectClick(object sender, EventArgs e)
        {
            btnEdit.Enabled = true;

        }

        protected void LoadBtn()
        {
            
            btnCredit.Enabled = false;
            btnActivate.Enabled = false;
            btnDeactivate.Enabled = false;
            btnEdit.Enabled = false;
            btnCancel.Enabled = false;

        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {

            GridView1.SelectedIndex = Convert.ToInt32(lblIndexHidden.Text.ToString());

            string OrderNum = Convert.ToString((int)GridView1.SelectedValue);
            administrator order = new administrator();
            //DataTable selectedOrderTbl = database.getTable(SqlDataSourceOrders.SelectCommand);
            //string OrderNum = selectedOrderTbl.Rows[GridView1.SelectedIndex]["OrderNum"].ToString();

            DataTable orderTbl = order.GetOrdersByOrderNum(OrderNum);
            btnCancel.Enabled = true;
            if (orderTbl.Rows[0]["Paid"].ToString() == "N")
            {
                
                btnCredit.Enabled = true;
            }
            else if (orderTbl.Rows[0]["Paid"].ToString() == "Y" && orderTbl.Rows[0]["Credited"].ToString() == "N")
            {
                
                btnCredit.Enabled = true;
            }
            else if (orderTbl.Rows[0]["Paid"].ToString() == "Y" && orderTbl.Rows[0]["Credited"].ToString() == "Y")
            {
                btnCredit.Enabled = false;
            }

            if (orderTbl.Rows[0]["Active"].ToString() == "Y")
            {
                btnDeactivate.Enabled = true;
            }
            else
            {
                btnActivate.Enabled = true;
            }

            FillEditTable(ddlCompany.SelectedValue.ToString(), txtOrderFilter.Text.ToString());
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            FillTable(ddlCompany.SelectedValue.ToString(), txtOrderFilter.Text.ToString());
            lblIndexHidden.Text = "-1";
            LoadBtn();
        }

        protected void btnCredit_Click(object sender, EventArgs e)
        {
            bool flag = false;
            GridView1.SelectedIndex = Convert.ToInt32(lblIndexHidden.Text.ToString());

            string orderNum = Convert.ToString((int)GridView1.SelectedValue);

            administrator order = new administrator();
            order.UpdateOrderPaid(orderNum);
            flag = order.CreditAdvertiser(orderNum);
            if (flag)
            {
                order.UpdateOrderCredit(orderNum);
                FillTable(ddlCompany.SelectedValue.ToString(), txtOrderFilter.Text.ToString());
                lblMessage.Text = "Successfully Credited " + order.GetAdvertiserName() + " with " + order.GetUnitQty() + " Units.";
                lblMessage.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                lblMessage.Text = "Failed to Credit Account";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void ddlRecordsPerPage_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.PageSize = Convert.ToInt32(ddlRecordsPerPage.SelectedValue);
            FillTable(ddlCompany.SelectedValue.ToString(), txtOrderFilter.Text.ToString());
        }

        protected void btnActivate_Click(object sender, EventArgs e)
        {
            GridView1.SelectedIndex = Convert.ToInt32(lblIndexHidden.Text.ToString());
            string OrderNum = Convert.ToString((int)GridView1.SelectedValue);
            administrator order = new administrator();
            order.UpdateOrderActivate(OrderNum);
            FillTable(ddlCompany.SelectedValue.ToString(), txtOrderFilter.Text.ToString());
            lblIndexHidden.Text = "-1";
        }

        protected void btnDeactivate_Click(object sender, EventArgs e)
        {
            GridView1.SelectedIndex = Convert.ToInt32(lblIndexHidden.Text.ToString());
            string OrderNum = Convert.ToString((int)GridView1.SelectedValue);
            administrator order = new administrator();
            order.UpdateOrderDeActivate(OrderNum);
            FillTable(ddlCompany.SelectedValue.ToString(), txtOrderFilter.Text.ToString());
            lblIndexHidden.Text = "-1";
        }


        protected void btnCancelFilter_Click(object sender, EventArgs e)
        {
            txtOrderFilter.Text = "";
            lblOrderNumHidden.Text = "";
            lblCompanyIDHidden.Text = "";
            ddlCompany.SelectedValue = "";

            
        }

        protected void btnOrderFilter_Click(object sender, EventArgs e)
        {
            //if(txtOrderFilter.Text == "";)
            //{
            //    txtOrderFilter.Text = "%";
            //}
            FillTable(ddlCompany.SelectedValue.ToString(), txtOrderFilter.Text.ToString());
            lblOrderNumHidden.Text = txtOrderFilter.Text.ToString();
            lblCompanyIDHidden.Text = ddlCompany.SelectedValue.ToString();
        }

        protected void txtOrderFilter_TextChanged(object sender, EventArgs e)
        {
           

        }


        protected void GridView1_OnPageIndexChanging(Object sender, GridViewPageEventArgs e)
        {
            FillTable(ddlCompany.SelectedValue.ToString(), lblOrderNumHidden.Text);
            GridView1.PageIndex = e.NewPageIndex; 
        }

        protected void GridView1_OnSelectedIndexChanging(Object sender, GridViewSelectEventArgs e)
        {
            lblIndexHidden.Text = Convert.ToString( e.NewSelectedIndex);
            FillTable(ddlCompany.SelectedValue.ToString(), txtOrderFilter.Text.ToString());
            Response.Write("Event taking place e.index:" + e.NewSelectedIndex.ToString() + ", index=" + lblIndexHidden.Text);
            if (e.NewSelectedIndex != -1)
            {
                btnEdit.Enabled = true;
            }
        }

        
        
    }
}
