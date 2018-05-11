<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PurchasedJobseekers.aspx.cs" Inherits="zamjobs.Employer.PurchasedJobseekers" Title="ZamJobs.com - Purchased Jobseekers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h3>Purchased Jobseekers</h3>
<p>Click on Jobseeker ID to view details and download CV</p>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" 
        CellPadding="4"  OnPageIndexChanging="GridView1_OnPageIndexChanging"
        ForeColor="#333333" GridLines="None" Width="100%">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="ID" 
                DataNavigateUrlFormatString="JobseekerDetails.aspx?JobseekerID={0}" 
                DataTextField="ID" DataTextFormatString="ZS{0:000000}" HeaderText="ID" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" 
                SortExpression="LastName" />
            <asp:BoundField DataField="ContactNumber" HeaderText="ContactNumber" 
                SortExpression="ContactNumber" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    
</asp:Content>
