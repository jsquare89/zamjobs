<%@ Page Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ViewJobseeker.aspx.cs" Inherits="zamjobs.Administrator.ViewJobseeker" Title="ZamJobs.com - Manage Jobseekers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Manage Jobseekers</h3>
    <p>
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
    </p>
    <table class="style1">
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
                <asp:Button ID="btnViewDetail" runat="server" onclick="btnViewDetail_Click" 
                    Text="View Detail" />
            </td>
            <td>
        <asp:Button ID="btnDownloadCV" runat="server" onclick="btnDownloadCV_Click" 
            Text="Download CV" />
            </td>
        </tr>
    </table>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="ID" DataSourceID="SqlDataSourceViewJobseeker" ForeColor="#333333" 
        GridLines="None" Width="100%">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Select" Text="Select" OnClick="select_Click"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" DataFormatString="JS{0:000000}" />
            <asp:BoundField DataField="FirstName" HeaderText="First Name" 
                SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="Last Name" 
                SortExpression="LastName" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="ID_Passport" HeaderText="ID/Passport Number" 
                SortExpression="ID_Passport" />
            <asp:BoundField DataField="ContactNumber" HeaderText="Contact Number" 
                SortExpression="ContactNumber" />
            <asp:TemplateField HeaderText="Active" SortExpression="Active">
                <ItemTemplate>
                     <asp:DropDownList ID="ddlActive" runat="server" Text='<%# Bind("Active") %>' Enabled="false">
                        <asp:ListItem Text="Inactive" Value = "N"></asp:ListItem>
                        <asp:ListItem Text="Active" Value="Y"></asp:ListItem></asp:DropDownList>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlActive" runat="server" Text='<%# Bind("Active") %>' >
                        <asp:ListItem Text="Inactive" Value = "N"></asp:ListItem>
                        <asp:ListItem Text="Active" Value="Y"></asp:ListItem></asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceViewJobseeker" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
        
        SelectCommand="SELECT [ID], [FirstName], [LastName], [Email], [ID_Passport], [ContactNumber], [Active] FROM [jobsdb_JobSeeker] ORDER BY [ID]">
    </asp:SqlDataSource>
</asp:Content>
