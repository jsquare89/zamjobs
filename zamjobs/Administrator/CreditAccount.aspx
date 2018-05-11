<%@ Page Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="CreditAccount.aspx.cs" Inherits="zamjobs.Administrator.CreditAccount" Title="ZamJobs.com - Manage Advertiser Units" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 138px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h3>Manage Advertiser Units<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    </h3>
    <asp:Panel ID="PanelCreditAccount" runat="server" DefaultButton="btnOrderFilter">
    
    <table class="style1">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="btnEdit" runat="server" onclick="btnEdit_Click" Text="Edit" />
                <asp:Button ID="btnCancel" runat="server" onclick="btnCancel_Click" 
                    Text="Cancel" />
            </td>
            <td>
                &nbsp;</td>
            <td>
        <asp:Button ID="btnCredit" runat="server" onclick="btnCredit_Click" 
                    Text="Paid &amp; Credit" />
            </td>
            <td>
                &nbsp;</td>
            <td>
        <asp:Button ID="btnActivate" runat="server" Text="Activate" 
                    onclick="btnActivate_Click" />
        <asp:Button ID="btnDeactivate" runat="server" Text="Deactivate" 
                    onclick="btnDeactivate_Click" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td colspan="3" rowspan="3">
            
               
                <table class="style1">
                    <tr>
                        <td class="style2">
                <asp:Label ID="lblOrderReference" runat="server" Text="Order Reference (ZJ)"></asp:Label>
                        </td>
                        <td>
                <asp:TextBox ID="txtOrderFilter" runat="server" Width="150px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="lblCompany" runat="server" Text="Company"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlCompany" runat="server" 
                                DataSourceID="SqlDataSourceCompany" DataTextField="CompanyName" 
                                DataValueField="ID" Width="150px" AppendDataBoundItems="True">
                                <asp:ListItem Selected="True" Value="" Text="Any Company"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceCompany" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
                                SelectCommand="SELECT [ID], [CompanyName] FROM [jobsdb_Employer] ORDER BY [CompanyName]">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:Label ID="lblOrderNumHidden" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="lblCompanyIDHidden" runat="server" Visible="False"></asp:Label>
                        </td>
                        <td>
                            <asp:Button ID="btnOrderFilter" runat="server" onclick="btnOrderFilter_Click" 
                                Text="Filter" />
                            <asp:Button ID="btnCancelFilter" runat="server" onclick="btnCancelFilter_Click" 
                                Text="Remove Filter" />
                        </td>
                    </tr>
                </table>
                
            </td>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="lblRecordsPerPage" runat="server" Text="Records Per Page"></asp:Label>
                <asp:DropDownList ID="ddlRecordsPerPage" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddlRecordsPerPage_SelectedIndexChanged">
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem Selected="True">20</asp:ListItem>
                    <asp:ListItem>50</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="lblTotalRecords" runat="server" Text="Total Records"></asp:Label>
                <asp:Label ID="lblOrderCount" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
        <br />
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
    
        <asp:Label ID="lblIndexHidden" runat="server"></asp:Label>
        <p>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" AutoGenerateSelectButton="True" 
                CellPadding="4" DataKeyNames="OrderNum" DataSourceID="SqlDataSourceOrders" 
                ForeColor="#333333" GridLines="None" 
                OnPageIndexChanging="GridView1_OnPageIndexChanging" 
                OnSelectedIndexChanging="GridView1_OnSelectedIndexChanging" PageSize="20" 
                Width="100%">
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
                    <asp:BoundField DataField="OrderNum" DataFormatString="ZJ{0:000000}" 
                        HeaderText="Order Reference" InsertVisible="False" ReadOnly="True" 
                        SortExpression="OrderNum" />
                    <asp:BoundField DataField="CompanyName" HeaderText="Company" ReadOnly="True" 
                        SortExpression="CompanyName" />
                    <asp:BoundField DataField="UnitAmount" HeaderText="Unit Amount" ReadOnly="True" 
                        SortExpression="UnitAmount" />
                    <asp:BoundField DataField="UnitQty" HeaderText="Unit Qty" ReadOnly="True" 
                        SortExpression="UnitQty" />
                    <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
                    <asp:BoundField DataField="Date" DataFormatString="{0:dd/MM/yyyy}" 
                        HeaderText="Date" ReadOnly="True" SortExpression="Date" />
                    <asp:TemplateField HeaderText="Paid" SortExpression="Paid">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlPaid" runat="server" Text='<%# Bind("Paid") %>'>
                                <asp:ListItem Text="Pending" Value="N"></asp:ListItem>
                                <asp:ListItem Text="Paid" Value="Y"></asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Paid") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Credited" SortExpression="Credited">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlCredited" runat="server" 
                                Text='<%# Bind("Credited") %>'>
                                <asp:ListItem Text="Pending" Value="N"></asp:ListItem>
                                <asp:ListItem Text="Credited" Value="Y"></asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Credited") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Active" SortExpression="Active">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlActive" runat="server" Text='<%# Bind("Active") %>'>
                                <asp:ListItem Text="Inactive" Value="N"></asp:ListItem>
                                <asp:ListItem Text="Active" Value="Y"></asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Active") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceOrders" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
                SelectCommand="SELECT OrderNum, Employer AS CompanyID, (SELECT CompanyName FROM jobsdb_Employer WHERE (ID = jobsdb_UnitOrder.Employer)) AS CompanyName, UnitAmount, UnitQty, CAST(UnitAmount AS int) * CAST(UnitQty AS int) AS Total, Date, Paid, Credited, Active FROM jobsdb_UnitOrder " UpdateCommand="UPDATE jobsdb_UnitOrder SET Paid = @Paid, Credited = @Credited, Active = @Active
WHERE OrderNum =@OrderNum">
                <UpdateParameters>
                    <asp:Parameter Name="Paid" />
                    <asp:Parameter Name="Credited" />
                    <asp:Parameter Name="Active" />
                    <asp:Parameter Name="OrderNum" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>
<br />

</asp:Panel>
</asp:Content>
