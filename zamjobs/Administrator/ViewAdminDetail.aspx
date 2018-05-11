<%@ Page Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ViewAdminDetail.aspx.cs" Inherits="zamjobs.Administrator.ViewAdminDetail" Title="ZamJobs.com - Admin Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h3>Admin Detail</h3>
    <p>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataKeyNames="ID" DataSourceID="SqlDataSourceAdmin" Height="50px" 
        Width="100%" BorderColor="#3399CC" CellPadding="1">
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" DataFormatString="ZM{0:000000}" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" 
                SortExpression="LastName" />
            <asp:BoundField DataField="ContactNumber" HeaderText="ContactNumber" 
                SortExpression="ContactNumber" />
            <asp:BoundField DataField="Email" HeaderText="Email" 
                SortExpression="Email" />
            <asp:BoundField DataField="PhysicalAddress" HeaderText="PhysicalAddress" 
                SortExpression="PhysicalAddress" />
            <asp:BoundField DataField="PassportID" HeaderText="PassportID" 
                SortExpression="PassportID" />
            <asp:CheckBoxField DataField="Active" HeaderText="Active" 
                SortExpression="Active" />
        </Fields>
        <AlternatingRowStyle BackColor="#D4F1FF" />
    </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSourceAdmin" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
            SelectCommand="SELECT * FROM [jobsdb_Administrator] WHERE ([ID] = @ID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="ID" QueryStringField="id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    <asp:Button ID="btnBack" runat="server" onclick="btnBack_Click" 
        Text="Back" />
    </p>
</asp:Content>
