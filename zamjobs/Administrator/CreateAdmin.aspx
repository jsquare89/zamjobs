<%@ Page Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="CreateAdmin.aspx.cs" Inherits="zamjobs.Administrator.CreateAdmin" Title="ZamJobs.com - Create Admin Account" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h3>Create New Admin Account</h3>
    <p>
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
    </p>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        ValidationGroup="RegistrationValidation" />
    <asp:Panel ID="PanelRegistration" runat="server" DefaultButton="btnCreate">
    
    <table style="Width:100%">
        <tr>
            <td>
            </td>
            <td>
                <asp:Label ID="lblFName" runat="server" Text="First Name"></asp:Label>
            </td>
            <td>
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
                        <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                        ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email Required" 
                        ValidationGroup="RegistrationValidation">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                        ControlToValidate="txtEmail" Display="Dynamic" 
                        ErrorMessage="Email is not valid" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ValidationGroup="RegistrationValidation">*</asp:RegularExpressionValidator>
                    <asp:Label ID="lblInvalidEmailMarker" runat="server" ForeColor="Red" 
                        Visible="False">*</asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Label ID="lblConfirmEmail" runat="server" Text="Confirm Email"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtConfirmEmail" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvConfirmEmail" runat="server" 
                            ControlToValidate="txtConfirmEmail" Display="Dynamic" 
                            ErrorMessage="Email Confirmation Required" 
                            ValidationGroup="RegistrationValidation">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cvaEmail" runat="server" ControlToCompare="txtEmail" 
                            ControlToValidate="txtConfirmEmail" Display="None" 
                            ErrorMessage="Emails do not match" ValidationGroup="RegistrationValidation"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                            ControlToValidate="txtPassword" Display="Dynamic" 
                            ErrorMessage="Password Required" ValidationGroup="RegistrationValidation">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revPassword" runat="server" 
                            ControlToValidate="txtPassword" Display="Dynamic" 
                            ErrorMessage="Password should contain alphanumeric characters, does not allow special characters and requires between 7-15 characters" 
                            ValidationExpression="(?!^[0-9]*$)(?!^[a-zA-Z]*$)^([a-zA-Z0-9]{7,15})$" 
                            ValidationGroup="RegistrationValidation">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" 
                            ControlToValidate="txtConfirmPassword" Display="Dynamic" 
                            ErrorMessage="Password Confirmation Required" 
                            ValidationGroup="RegistrationValidation">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cvaPassword" runat="server" 
                            ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" 
                            Display="None" ErrorMessage="Passwords do not match" 
                            ValidationGroup="RegistrationValidation"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Label ID="lblContactNumber" runat="server" Text="Contact Number"></asp:Label>
                    </td>
                    <td>
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
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="btnCreate" runat="server" Text="Create" 
                            onclick="btnCreate_Click" ValidationGroup="RegistrationValidation" />
                    </td>
                </tr>
        </table></asp:Panel>
</asp:Content>
