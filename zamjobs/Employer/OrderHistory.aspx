<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="OrderHistory.aspx.cs" Inherits="zamjobs.Employer.OrderHistory" Title="ZamJobs - Order/Purchase History" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h3>Order/Purchase History</h3>
<%
    zamjobs.dataAccess order = new zamjobs.dataAccess();
    zamjobs.advertiser company = new zamjobs.advertiser();
    zamjobs.Format format = new zamjobs.Format();
    string companyID = company.getCompanyID(User.Identity.Name);

    string selectString = @"SELECT * FROM jobsdb_UnitOrder WHERE Employer='" + companyID + "' AND Active='Y'";
    System.Data.DataTable orderTbl = order.getTable(selectString);

    //Int64 unitAmount = Convert.ToInt64(company.getUnitAmount());
    if (orderTbl.Rows.Count != 0)
    {
        Response.Write("<table id='applications_table'>");
        Response.Write("<tr>");
        Response.Write("<td>Order Number (Bank Reference)</td>");
        Response.Write("<td>Unit Qty</td>");
        Response.Write("<td>Unit Amount (Kwacha)</td>");
        Response.Write("<td>Total</td>");
        Response.Write("<td>Date</td>");
        Response.Write("<td>Payment</td>");
        Response.Write("<td>Credited</td>");
        Response.Write("</tr>");
        
        for (int i = 0; i < orderTbl.Rows.Count; i++)
        {
            Int64 units = Convert.ToInt64(orderTbl.Rows[i]["UnitQty"].ToString());
            Int64 unitAmount = Convert.ToInt64(orderTbl.Rows[i]["UnitAmount"].ToString());
            DateTime date = Convert.ToDateTime(orderTbl.Rows[i]["Date"].ToString());
            Response.Write("<tr>");
            Response.Write("<td><a href='order.aspx?OrderID=" + orderTbl.Rows[i]["OrderNum"].ToString() + "'>" + format.GetOrderNumFormat (orderTbl.Rows[i]["OrderNum"].ToString()) + "</a></td>");
            Response.Write("<td>" + Convert.ToString(units) + "</td>");
            Response.Write("<td>" + Convert.ToString(unitAmount) + "</td>");
            Response.Write("<td>K" + Convert.ToString(units * unitAmount) + "</td>");
            Response.Write("<td>" + date.ToShortDateString() + "</td>");
            if (orderTbl.Rows[i]["Paid"].ToString() == "N")
            {
                Response.Write("<td>Pending</td>");
            }
            else if (orderTbl.Rows[i]["Paid"].ToString() == "Y")
            {
                Response.Write("<td style='color: Green;'>Paid</td>");
            }
            else
            {
                Response.Write("<td>N/A</td>");
            }
            if (orderTbl.Rows[i]["Credited"].ToString() == "N")
            {
                Response.Write("<td>Pending</td>");
            }
            else if (orderTbl.Rows[i]["Credited"].ToString() == "Y")
            {
                Response.Write("<td style='color: Green;'>Credited</td>");
            }
            else
            {
                Response.Write("<td>N/A</td>");
            }
            Response.Write("</tr>");
        }
        Response.Write("</table>");
    }
    else
    {
        Response.Redirect("~/InvalidPageRequest.aspx");
    }

    
     %>
</asp:Content>
