<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EditDetails.aspx.cs" Inherits="zamjobs.Employer.EditDetails" Title="ZamJobs.com - Edit Details" EnableEventValidation="False" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
        .style3
        {
            width: 20px;
        }
        .style4
        {
            width: 145px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Edit Details</h3>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
   </asp:ScriptManager>
        <asp:Panel ID="PanelEditDetails" runat="server">
    <fieldset>
        <legend>Advertiser Details</legend>
        
        
        <table class="style2">
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    <asp:Label ID="lblCompanyID" runat="server" Text="Advertiser ID"></asp:Label>
                </td>
                <td>
                <asp:Label ID="lblIDBind" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                </td>
                <td>
                <asp:Label ID="lblEmailBind" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    <asp:Label ID="lblCompanyName" runat="server" Text="Company Name"></asp:Label>
                </td>
                <td>
                <asp:Label ID="lblCompanyNameBind" runat="server"></asp:Label>
                <asp:TextBox ID="txtCompanyName" runat="server" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvCompanyName" runat="server" 
                    ControlToValidate="txtCompanyName" Display="Dynamic" 
                    ErrorMessage="Comapany Name Required" ValidationGroup="RegistrationValidation">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    <asp:Label ID="lblContactName" runat="server" Text="Contact Name"></asp:Label>
                </td>
                <td>
                <asp:Label ID="lblContactNameBind" runat="server"></asp:Label>
                <asp:TextBox ID="txtContactName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvContactName" runat="server" 
                    ControlToValidate="txtContactName" Display="Dynamic" 
                    ErrorMessage="Contact Name Required" ValidationGroup="RegistrationValidation">*</asp:RequiredFieldValidator>
                </td>
            </tr></table>
            
             
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
        <table class="style2">
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    <asp:Label ID="lblCountry" runat="server" Text="Country"></asp:Label>
                </td>
                <td>
                <asp:Label ID="lblCountryBind" runat="server"></asp:Label>
                <asp:DropDownList ID="ddlCountry" runat="server" AppendDataBoundItems="True" 
                    DataSourceID="SqlDataSourceCountry" DataTextField="Country" 
                    DataValueField="ID">
                    <asp:ListItem Selected="True" Value="">Select Country</asp:ListItem>
                </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    <asp:Label ID="lblRegion" runat="server" Text="Region"></asp:Label>
                </td>
                <td>
                <asp:Label ID="lblRegionBind" runat="server"></asp:Label>
                <asp:Label ID="lblRegionHidden" runat="server"></asp:Label>
                <asp:DropDownList ID="ddlRegion" runat="server" AppendDataBoundItems="True" 
                    AutoPostBack="True" 
                    onselectedindexchanged="ddlRegion_SelectedIndexChanged">
                    <asp:ListItem Selected="True" Value="">Select Region</asp:ListItem>
                </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvRegion" runat="server" 
                                ControlToValidate="ddlRegion" Display="Dynamic" Enabled="False" 
                                ErrorMessage="Region Required" 
                    ValidationGroup="RegistrationValidation">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    <asp:Label ID="lblLocation" runat="server" Text="Location(Town/City)"></asp:Label>
                </td>
                <td>
                <asp:Label ID="lblLocationBind" runat="server"></asp:Label>
                    <asp:Label ID="lblLocationHidden" runat="server"></asp:Label>
                <asp:DropDownList ID="ddlLocation" runat="server" AppendDataBoundItems="True">
                    <asp:ListItem Selected="True" Value="">Select Location</asp:ListItem>
                </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvLocation" runat="server" 
                        ControlToValidate="ddlLocation" Display="Dynamic" Enabled="False" 
                        ErrorMessage="Location Required" 
                    ValidationGroup="RegistrationValidation">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            </table>
             </ContentTemplate>
                    </asp:UpdatePanel>
            
            <table class="style2">
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    <asp:Label ID="lblContactNumber" runat="server" Text="Contact Number"></asp:Label>
                </td>
                <td>
                <asp:Label ID="lblContactNumberBind" runat="server"></asp:Label>
                <asp:TextBox ID="txtContactNumber" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvContactNumber" runat="server" 
                        ControlToValidate="txtContactNumber" Display="Dynamic" 
                        ValidationGroup="RegistrationValidation">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    <asp:Label ID="lblContactNumber2" runat="server" 
                        Text="Alternate Contact Number"></asp:Label>
                </td>
                <td>
                <asp:Label ID="lblAltContactNumberBind" runat="server"></asp:Label>
                <asp:TextBox ID="txtContactNumber2" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    <asp:Label ID="lblPOBox" runat="server" Text="Postal Address"></asp:Label>
                </td>
                <td>
                <asp:Label ID="lblPostalAddressBind" runat="server"></asp:Label>
                <asp:TextBox ID="txtPostalAddress" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPostalAddress" runat="server" 
                        ControlToValidate="txtPostalAddress" Display="Dynamic" 
                        ValidationGroup="RegistrationValidation">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    <asp:Label ID="lblWebsiteURL" runat="server" Text="Website URL"></asp:Label>
                </td>
                <td>
                <asp:Label ID="lblWebsiteURLBind" runat="server"></asp:Label>
                <asp:TextBox ID="txtWebsiteURL" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    <asp:Label ID="lblCategory" runat="server" Text="Main Job Category"></asp:Label>
                </td>
                <td>
                <asp:Label ID="lblCategoryBind" runat="server"></asp:Label>
                <asp:Label ID="lblCategoryHidden" runat="server"></asp:Label>
                <asp:DropDownList ID="ddlCategory" runat="server" AppendDataBoundItems="True">
                    <asp:ListItem Selected="True" Value="">Select Category</asp:ListItem>
                </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="ddlCategory" Display="Dynamic" 
                        ValidationGroup="RegistrationValidation">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td class="style4">
                    <asp:Label ID="lblCompanyDesc" runat="server" Text="Company Overview"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblOverviewBind" runat="server"></asp:Label>
                    <asp:TextBox ID="txtCompanyDesc" runat="server" Height="120px" 
                        TextMode="MultiLine" Width="90%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCompanyDesc" runat="server" 
                        ControlToValidate="txtCompanyDesc" Display="Dynamic" 
                        ErrorMessage="RequiredFieldValidator" ValidationGroup="RegistrationValidation">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td colspan="2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td align="right" class="style5">
                    <asp:Button ID="btnCancel" runat="server" onclick="btnCancel_Click" 
                        Text="Cancel" Width="60px" />
                    <asp:Button ID="btnDelete" runat="server" Text="Delete Account" Width="120px" />
                </td>
                <td>
                    <asp:Button ID="btnEdit" runat="server" onclick="btnEdit_Click" Text="Edit" 
                        Width="60px" />
                    <asp:Button ID="btnUpdate" runat="server" onclick="btnUpdate_Click" 
                        Text="Update" Width="60px" ValidationGroup="RegistrationValidation" />
                </td>
            </tr>
        </table>
       
                <asp:SqlDataSource ID="SqlDataSourceCountry" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
                    SelectCommand="SELECT [ID], [Country] FROM [jobsdb_Country] ORDER BY [Country]">
                </asp:SqlDataSource>
            
            
    </fieldset>

    </asp:Panel>
</asp:Content>
