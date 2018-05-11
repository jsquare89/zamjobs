<%@ Page Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="EditDetails.aspx.cs" Inherits="zamjobs.Administrator.EditDetails" Title="ZamJobs.com - Edit Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h3>Edit Details</h3>

    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        ValidationGroup="RegistrationValidation" />
    <asp:Panel ID="PanelRegistration" runat="server" DefaultButton="btnUpdate">
    
    <table style="Width:100%">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="lblAdminId" runat="server" Text="Administrator ID"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblAdminIdBind" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblEmailBind" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Label ID="lblFName" runat="server" Text="First Name"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblFNameBind" runat="server"></asp:Label>
                <asp:TextBox ID="txtFName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvFName" runat="server" 
                    ControlToValidate="txtFName" Display="Dynamic" 
                    ErrorMessage="First Name Required" ValidationGroup="RegistrationValidation">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Label ID="lblLName" runat="server" Text="Last Name"></asp:Label>
            </td>
            <td>
                <asp:Label ID="lblLNameBind" runat="server"></asp:Label>
                <asp:TextBox ID="txtLName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvLName" runat="server" 
                    ControlToValidate="txtLName" Display="Dynamic" 
                    ErrorMessage="Last Name Required" ValidationGroup="RegistrationValidation">*</asp:RequiredFieldValidator>
            </td>
        </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Label ID="lblContactNumber" runat="server" Text="Contact Number"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblContactNumBind" runat="server"></asp:Label>
                        <asp:TextBox ID="txtContactNum" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revPhoneNumber" runat="server" 
                            ControlToValidate="txtContactNum" Display="Dynamic" 
                            ErrorMessage="Please enter  contact number in the form xxxxxxxxxx" 
                            ValidationExpression="\d{10}" ValidationGroup="RegistrationValidation">*</asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="rfvContactNumber" runat="server" 
                            ControlToValidate="txtContactNum" Display="Dynamic" 
                            ErrorMessage="Contact Number Required" ValidationGroup="RegistrationValidation">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Label ID="lblPassportID" runat="server" Text="Passport/ID Number"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblPassportIDBind" runat="server"></asp:Label>
                        <asp:TextBox ID="txtPassportID" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPassportID" runat="server" 
                            ControlToValidate="txtPassportID" Display="Dynamic" 
                            ErrorMessage="Pasword/Id Number Required" 
                            ValidationGroup="RegistrationValidation">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Label ID="lblPhysicalAddress" runat="server" Text="Physical Address"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblAddressBind" runat="server"></asp:Label>
                        <asp:TextBox ID="txtPhysicalAddress" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPhysicalAddress" runat="server" 
                            ControlToValidate="txtPhysicalAddress" Display="Dynamic" 
                            ErrorMessage="Physical Address Required" 
                            ValidationGroup="RegistrationValidation">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
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
                    <td>
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
                    </td>
                    <td>
                        <asp:Button ID="btnEdit" runat="server" Text="Edit" onclick="btnEdit_Click" />
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" 
                            onclick="btnUpdate_Click" ValidationGroup="RegistrationValidation" />
                    </td>
                </tr>
        </table></asp:Panel>
</asp:Content>
