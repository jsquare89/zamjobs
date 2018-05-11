<%@ Page Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ManageAdmin.aspx.cs" Inherits="zamjobs.Administrator.ManageAdmin" Title="ZamJobs.com - Manage Administrators" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="PanelManageAdmin" runat="server">
    <h3>Manage Administrators</h3><br />
        <table class="style1">
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnCreate" runat="server" onclick="btnCreate_Click" 
                        Text="Create Admin" />
                </td>
                <td>
                    <asp:Button ID="btnViewDetail" runat="server" onclick="btnViewDetail_Click" 
                        Text="View Detail" />
                    <asp:Button ID="btnEdit" runat="server" onclick="btnEdit_Click" Text="Edit" />
                    <asp:Button ID="btnCancel" runat="server" onclick="btnCancel_Click" 
                        Text="Cancel" />
                </td>
                <td>
                    <asp:Button ID="btnActivate" runat="server" onclick="btnActivate_Click" 
                        Text="Activate" />
                    <asp:Button ID="btnDeactivate" runat="server" onclick="btnDeactivate_Click" 
                        Text="Deactivate" />
                </td>
                <td>
                    <asp:Button ID="btnDelete" runat="server" onclick="btnDelete_Click" 
                        Text="Delete" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td colspan="4">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td colspan="4">
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
     <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                DataKeyNames="ID" DataSourceID="SqlDataSourceAdmin" ForeColor="#333333" 
                GridLines="None" Width="100%">
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                CommandName="Select" Text="Select" OnClick="SelectClick"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ID" DataFormatString="ZM{0:000000}" HeaderText="ID" 
                        InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" 
                        SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" 
                        SortExpression="LastName" />
                    <asp:BoundField DataField="ContactNumber" HeaderText="Contact Number" 
                        SortExpression="ContactNumber" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:CheckBoxField DataField="Active" HeaderText="Active" 
                        SortExpression="Active" />
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceAdmin" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
                
            SelectCommand="SELECT [ID], [FirstName], [LastName], [ContactNumber], [Email], [Active] FROM [jobsdb_Administrator]"></asp:SqlDataSource>
    </asp:Panel>
</asp:Content>
