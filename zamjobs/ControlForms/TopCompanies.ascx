<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopCompanies.ascx.cs" Inherits="zamjobs.ControlForms.TopCompanies" %>
<div>
<table style="width: 100%; border: solid 1px #3399cc;"><tr><td>
<%
    zamjobs.jobsearch jobs = new zamjobs.jobsearch();
    System.Data.DataTable top = jobs.GetTopCompanyJobCount();
    
    Response.Write("<h4>Top Advertisers</h4>");
    for (int i = 0; i < top.Rows.Count; i++)
    {
        HyperLink hyp = new HyperLink();
        hyp.Text = jobs.GetCompanyNameByID(top.Rows[i]["Company"].ToString());
        hyp.NavigateUrl = "~/CompanyDetail.aspx?id=" + top.Rows[i]["Company"].ToString();

        TableRow row = new TableRow();
        TableCell cell = new TableCell();
        cell.Controls.Add(hyp);
        row.Controls.Add(cell);
        Table1.Controls.Add(row);
    }

    
     %><asp:Table ID="Table1" runat="server">
    </asp:Table>

    <br/></td></tr></table>
</div>