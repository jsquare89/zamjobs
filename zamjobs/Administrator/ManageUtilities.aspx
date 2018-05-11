<%@ Page Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ManageUtilities.aspx.cs" Inherits="zamjobs.Administrator.ManageUtilities" Title="ZamJobs.com - Manage Utilities" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
        .style3
        {
            width: 196px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Manage Utilities</h3>
    <fieldset><legend>
        Unit Amount</legend><asp:Panel ID="PanelUnitAmount" runat="server">
         
        <table class="style2">
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style3">
                    <asp:Label ID="lblUnitAmount" runat="server" Text="Unit Amount (Kwacha)"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblUnitAmountBind" runat="server"></asp:Label>
                    <asp:TextBox ID="txtUnitAmount" runat="server" Width="150px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                                    <td>
                                        <asp:Button ID="btnUnitAmountCancel" runat="server" Text="Cancel" 
                                            onclick="btnUnitAmountCancel_Click" />
                                        <asp:Button ID="btnUnitAmountUpdate" runat="server" Text="Update" 
                                            onclick="btnUnitAmountUpdate_Click" />
                                        <asp:Button ID="btnUnitAmountEdit" runat="server" Text="Edit" 
                                            onclick="btnUnitAmountEdit_Click" />
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                            </asp:Panel>
                        </fieldset>
         <fieldset><legend>Edit Job Category
         </legend><asp:Panel ID="PanelJobCategory" runat="server">
         <table class="style2">
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style3">
                    <asp:Label ID="lblCategory" runat="server" 
                        Text="List of existing Job Categories"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlCategory" runat="server" 
                        DataSourceID="SqlDataSourceCategory" DataTextField="Category" DataValueField="ID" 
                        Width="150px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceCategory" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
                        SelectCommand="SELECT * FROM [jobsdb_JobCategory] ORDER BY [Category]">
                    </asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
             <tr>
                 <td>
                     &nbsp;</td>
                 <td class="style3">
                     <asp:Label ID="lblNewCategory" runat="server" Text="Add new Job Category"></asp:Label>
                 </td>
                 <td>
                     <asp:TextBox ID="txtNewCategory" runat="server" Width="150px"></asp:TextBox>
                 </td>
                 <td>
                     &nbsp;</td>
             </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    <asp:Label ID="lblCategoryMessage" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                                    <td>
                                        <asp:Button ID="btnCategoryUpdate" runat="server" Text="Update" 
                                            onclick="btnCategoryUpdate_Click" />
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
         
         
             </asp:Panel></fieldset>
             <fieldset><legend>Edit Country
         </legend><asp:Panel ID="Panel1" runat="server">
         <table class="style2">
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style3">
                    <asp:Label ID="lblCountry" runat="server" Text="List of existing Countries"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlCountry" runat="server" 
                        DataSourceID="SqlDataSourceCountry" DataTextField="Country" DataValueField="ID" 
                        Width="150px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceCountry" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
                        SelectCommand="SELECT * FROM [jobsdb_Country] ORDER BY [Country]">
                    </asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
             <tr>
                 <td>
                     &nbsp;</td>
                 <td class="style3">
                     <asp:Label ID="lblNewCountry" runat="server" Text="Add new Country"></asp:Label>
                 </td>
                 <td>
                     <asp:TextBox ID="txtNewCountry" runat="server" Width="150px"></asp:TextBox>
                 </td>
                 <td>
                     &nbsp;</td>
             </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                                    <td>
                                        <asp:Button ID="btnCountryUpdate" runat="server" Text="Update" 
                                            onclick="btnCountryUpdate_Click" />
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
         
         
             </asp:Panel></fieldset>
</asp:Content>
