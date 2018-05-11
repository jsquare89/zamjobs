<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="zamjobs.Employer.Order" Title="ZamJobs.com - ZamJobs Units Order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h3>ZamJobs Units Order</h3>
<%
    zamjobs.Format format = new zamjobs.Format();
    string orderID = "";
    try
    {
        orderID = Request.QueryString["OrderID"].ToString();
    }
    catch (NullReferenceException)
    {
        Response.Redirect("~/InvalidPageRequest.aspx");
    }

    zamjobs.dataAccess order = new zamjobs.dataAccess();
    zamjobs.advertiser company = new zamjobs.advertiser();
    string companyID = company.getCompanyID(User.Identity.Name);
    string selectOrderNum = "SELECT OrderNum FROM jobsdb_UnitOrder";
    bool flag = false;
    
    System.Data.DataTable orderNums = company.getOrderNum(companyID);
    for (int i = 0; i < orderNums.Rows.Count; i++)
    {
        if(orderID == orderNums.Rows[i]["OrderNum"].ToString())
        {
            flag = true;
        }
        
    }

    if (flag)
    {
        string selectString = @"SELECT * FROM jobsdb_UnitOrder WHERE OrderNum='" + orderID + "' AND Employer='" + companyID + "' AND Active='Y'";
        System.Data.DataTable orderTbl = order.getTable(selectString);
        if (orderTbl.Rows.Count != 0)
        {
            string units = (orderTbl.Rows[0]["UnitQty"].ToString());
            string unitAmount = (orderTbl.Rows[0]["UnitAmount"].ToString());
            DateTime date = Convert.ToDateTime( orderTbl.Rows[0]["Date"].ToString());
            if (orderTbl.Rows[0]["Paid"].ToString() == "Y")
            {
                Response.Write("<p>Thankyou for purchasing ZamJob Units.</p>");
            }
            else
            {
                Response.Write("<p>Thankyou for ordering ZamJob Units.</p>");
            }
            Response.Write("<table id='applications_table'>");
            Response.Write("<tr>");
            Response.Write("<td>Order Number(Bank Reference)</td>");
            Response.Write("<td>" + format.GetOrderNumFormat(orderTbl.Rows[0]["OrderNum"].ToString()) + "</td>");
            Response.Write("</tr>");
            Response.Write("<tr>");
            Response.Write("<td>Date</td>");
            Response.Write("<td>" + date.ToShortDateString() + "</td>");
            Response.Write("</tr>");
            Response.Write("<tr>");
            Response.Write("<td>Zambjobs Units</td>");
            Response.Write("<td>" + units + "</td>");
            Response.Write("</tr>");
            Response.Write("<tr>");
            Response.Write("<td>Unit Amount</td>");
            Response.Write("<td>K" + unitAmount + " /unit</td>");
            Response.Write("</tr>");
            Response.Write("<tr>");
            Response.Write("<td>Total Amount</td>");
            Response.Write("<td>K" + Convert.ToString((Convert.ToInt64(units) * Convert.ToInt64(unitAmount))) + "</td>");
            Response.Write("</tr>");
            Response.Write("<tr>");
            Response.Write("<td>Payment</td>");
            if (orderTbl.Rows[0]["Paid"].ToString() == "N")
            {
                Response.Write("<td>Pending</td>");
            }
            else if (orderTbl.Rows[0]["Paid"].ToString() == "Y")
            {
                Response.Write("<td>Paid</td>");
            }
            else
            {
                Response.Write("<td>N/A</td>");
            }
            Response.Write("</tr>");

            if (orderTbl.Rows[0]["Paid"].ToString() == "Y")
            {
                Response.Write("<tr>");
                Response.Write("<td>Credited</td>");
                if (orderTbl.Rows[0]["Credited"].ToString() == "N")
                {
                    Response.Write("<td>Pending</td>");
                }
                else if (orderTbl.Rows[0]["Credited"].ToString() == "Y")
                {
                    Response.Write("<td>Credited</td>");
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

        if (orderTbl.Rows[0]["Paid"].ToString() == "N")
        {
            Response.Write(@"<h4>Bank Details</h4>
             <p>
             Bank: FNB Zambia <br />
             Branch: Ndola (260006)<br />
             Account Name: dynamicdimensions <br />
             Account Number: 62271230642
             </p>
             
             <p>Please make and Electronic Fund Transefer or Bank Deposit to our account for the amount billed in order for your account to be credited with ZamJob Units.</p>
             <p>Once the transaction is made please allow for 24-48 hours for your account to be credited. Please feel free to contact us for help</p>");
        }
        else
        {
            if (orderTbl.Rows[0]["Credited"].ToString() == "N")
            {
                Response.Write("<p>Please allow for 24-48 hours for your account to be credited. Please feel free to contact us for help</p>");
            }
        }
    }
    else
    {
        Response.Redirect("~/InvalidPageRequest.aspx");
    }
     %>
     
</asp:Content>
