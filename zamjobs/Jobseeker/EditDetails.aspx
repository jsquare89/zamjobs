<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EditDetails.aspx.cs" Inherits="zamjobs.Jobseeker.EditDetails" Title="ZamJobs.com - Edit Details" EnableEventValidation="false" %>
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
        .style5
        {
            height: 41px;
        }
        .style8
        {
            width: 150px;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Edit Details</h3>
    <asp:ScriptManager ID="ScriptManager1" 
                    runat="server">
                </asp:ScriptManager>
                                <p>
                                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </p>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                HeaderText="Please correct the following" 
                ValidationGroup="RegistrationValidation" />
            <fieldset><legend>Job Seeker Details</legend>
                <table class="style2">
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style8">
                            <asp:Label ID="lblJobseekerID" runat="server" Text="Jobseeker ID"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblJobseekerIDBind" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            </td>
                        <td class="style8">
                            <asp:Label ID="lblEmail" runat="server" Text="Email"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblEmailBind" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style8">
                            <asp:Label ID="lblFName" runat="server" Text="First Name"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblFNameBind" runat="server"></asp:Label>
                            <asp:TextBox ID="txtFName" runat="server" 
                                ToolTip="Enter your first name (Forename) only"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvFName" runat="server" 
                                ControlToValidate="txtFName" Display="Dynamic" 
                                ErrorMessage="First Name Required" ValidationGroup="RegistrationValidation">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style8">
                            <asp:Label ID="lblLName" runat="server" Text="Last Name"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblLNameBind" runat="server"></asp:Label>
                            <asp:TextBox ID="txtLName" runat="server" 
                                ToolTip="Enter your last name (Surname) only"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvLName" runat="server" 
                                ControlToValidate="txtLName" Display="Dynamic" 
                                ErrorMessage="Last Name Required" ValidationGroup="RegistrationValidation">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    </table>
                    
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                           
                     <table class="style2">
                    <tr>
                        <td class="style3">
                            </td>
                        <td class="style8">
                            <asp:Label ID="lblCountry" runat="server" Text="Country"></asp:Label>
                        </td>
                        <td class="style5">
                            <asp:Label ID="lblCountryBind" runat="server"></asp:Label>
                            <asp:Label ID="lblCountryHidden" runat="server" Visible="False"></asp:Label>
                            <asp:DropDownList ID="ddlCountry" runat="server" AppendDataBoundItems="True" 
                                AutoPostBack="True" 
                                onselectedindexchanged="ddlCountry_SelectedIndexChanged">
                                <asp:ListItem Selected="True" Value="">Select Country</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvCountry" runat="server" 
                                ControlToValidate="ddlCountry" Display="Dynamic" 
                                ErrorMessage="Country Required" ValidationGroup="RegistrationValidation">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style8">
                            <asp:Label ID="lblRegion" runat="server" Text="Region"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblRegionBind" runat="server"></asp:Label>
                            <asp:Label ID="lblRegionHidden" runat="server" Visible="False"></asp:Label>
                            <asp:DropDownList ID="ddlRegion" runat="server" AppendDataBoundItems="True" 
                                AutoPostBack="True" onselectedindexchanged="ddlRegion_SelectedIndexChanged">
                                <asp:ListItem Selected="True" Value="">Select Region</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvRegion" runat="server" 
                                ControlToValidate="ddlRegion" Display="Dynamic" Enabled="False" 
                                ErrorMessage="Region Required" ValidationGroup="RegistrationValidation">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style8">
                            <asp:Label ID="lblLocation" runat="server" Text="Location(Town/City)"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblLocationBind" runat="server"></asp:Label>
                            <asp:Label ID="lblLocationHidden" runat="server" Visible="False"></asp:Label>
                            <asp:DropDownList ID="ddlLocation" runat="server" AppendDataBoundItems="True">
                                <asp:ListItem Selected="True" Value="">Select Location</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvLocation" runat="server" 
                                ControlToValidate="ddlLocation" Display="Dynamic" Enabled="False" 
                                ErrorMessage="Location Required" ValidationGroup="RegistrationValidation">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    </table>
                    </ContentTemplate>
                            </asp:UpdatePanel>
                           <table class="style2">  
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style8">
                            <asp:Label ID="lblNationality" runat="server" Text="Nationality"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblNationalityBind" runat="server"></asp:Label>
                            <asp:Label ID="lblNationalityHidden" runat="server" Visible="False"></asp:Label>
                            <asp:DropDownList ID="ddlNationality" runat="server" 
                                AppendDataBoundItems="True">
                                <asp:ListItem Selected="True" Value="">Select Nationality</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvNationality" runat="server" 
                                ControlToValidate="ddlNationality" Display="Dynamic" 
                                ErrorMessage="Nationality Required" ValidationGroup="RegistrationValidation">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style8">
                            <asp:Label ID="lblIDPassport" runat="server" Text="ID/Passport Number"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblPassportIDBind" runat="server"></asp:Label>
                            <asp:TextBox ID="txtIDPassport" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvIDPassport" runat="server" 
                                ControlToValidate="txtIDPassport" Display="Dynamic" 
                                ErrorMessage="ID/Passport Number Required" 
                                ValidationGroup="RegistrationValidation">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style8">
                            <asp:Label ID="lblContactNumber" runat="server" Text="Preferred Contact Number"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblContactNumberBind" runat="server"></asp:Label>
                            <asp:TextBox ID="txtContactNumber" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvContact" runat="server" 
                                ControlToValidate="txtContactNumber" Display="Dynamic" 
                                ErrorMessage="Contact Number Required" ValidationGroup="RegistrationValidation">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revPhoneNumber" runat="server" 
                                ControlToValidate="txtContactNumber" Display="Dynamic" 
                                ErrorMessage="Please enter phone number in the form xxxxxxxxxx" 
                                ValidationExpression="\d{10}" ValidationGroup="RegistrationValidation">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                </table>
                       
                            
            </fieldset>
            <br />
            <fieldset><legend>CV Details</legend>
                <table class="style2">
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style8">
                            <asp:Label ID="lblDesiredCategory" runat="server" Text="Desired Job Category"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblDesiredJobCategoryBind" runat="server"></asp:Label>
                            <asp:Label ID="lblDesiredJobCategoryHidden" runat="server" Visible="False"></asp:Label>
                            <asp:DropDownList ID="ddlDesiredCategory" runat="server" 
                                AppendDataBoundItems="True">
                                <asp:ListItem Selected="True" Value="">Select Category</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvJobCategory" runat="server" 
                                ControlToValidate="ddlDesiredCategory" Display="Dynamic" 
                                ErrorMessage="Job Category Required" ValidationGroup="RegistrationValidation">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style8">
                            <asp:Label ID="lblWorkExperience" runat="server" 
                                Text="Total Work Experience (Years)"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblWorkExperienceBind" runat="server"></asp:Label>
                            <asp:Label ID="lblWorkExperienceHidden" runat="server" Visible="False"></asp:Label>
                            <asp:DropDownList ID="ddlWorkExperience" runat="server" 
                                AppendDataBoundItems="True">
                                <asp:ListItem Value="">Select Years</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvWorkExperience" runat="server" 
                                ControlToValidate="ddlWorkExperience" Display="Dynamic" 
                                ErrorMessage="Total Work Experience Required" 
                                ValidationGroup="RegistrationValidation">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style8">
                            <asp:Label ID="lblEducation" runat="server" Text="Highest Education Level"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblEducationBind" runat="server"></asp:Label>
                            <asp:Label ID="lblEducationHidden" runat="server"></asp:Label>
                            <asp:DropDownList ID="ddlEducation" runat="server" AppendDataBoundItems="True">
                                <asp:ListItem Selected="True" Value="">Select Education</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvEducation" runat="server" 
                                ControlToValidate="ddlEducation" Display="Dynamic" 
                                ErrorMessage="Highest Education Level Required" 
                                ValidationGroup="RegistrationValidation">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                   
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style8">
                    <asp:Label ID="lblStatus" runat="server" Text="Job Seeker Status"></asp:Label>
                        </td>
                        <td>
                    <asp:Label ID="lblJobseekerStatusBind" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="lblJobseekerStatusHidden" runat="server" Visible="False"></asp:Label>
                    <asp:DropDownList ID="ddlStatus" runat="server">
                    </asp:DropDownList>
                        </td>
                    </tr>
                   
                </table>
                    
            </fieldset>
            <br />
            
           <table style="width:100%;">
                       <tr>
                <td class="style3">
                    &nbsp;</td>
                <td align="right" style="width:200px;">
                    <asp:Button ID="btnCancel" runat="server" onclick="btnCancel_Click" 
                        Text="Cancel" Width="60px" />
                    <asp:Button ID="btnDelete" runat="server" Text="Delete Account" Width="120px" 
                        onclick="btnDelete_Click" />
                </td>
                <td>
                    <asp:Button ID="btnEdit" runat="server" onclick="btnEdit_Click" Text="Edit" 
                        Width="60px" />
                    <asp:Button ID="btnUpdate" runat="server" onclick="btnUpdate_Click" 
                        Text="Update" Width="60px" ValidationGroup="RegistrationValidation" />
                </td><td></td>
            </tr>
        </table>
</asp:Content>
