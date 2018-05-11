<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="JobseekerReg.aspx.cs" Inherits="zamjobs.JobseekerReg" Title="ZamJobs.com - Jobseeker Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
        .style3
        {
            width: 38px;
        }
        .style5
        {
            width: 160px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="PanelJobSeekerRegistration" runat="server">
    
    <div>
<h1>Jobseeker Registration</h1>
        <div>
            <p>
                Register and upload your CV to be recognised by companies in Zambia. First 
                complete the details form and then the account information form to create an 
                account.</p>
            <p>
                *Please ensure you have your CV in Microsoft Word&#39;s .doc format to upload. Once 
                you have applied successfully and logged in you will be able to make changes to 
                your details.
            </p>
            <p>
                *Click here to view our privacy policy.
                
                <asp:ScriptManager ID="ScriptManager1" 
                    runat="server">
                </asp:ScriptManager>
            </p>
                                <p>
                            <asp:Label ID="lblInvalidEmail" runat="server" ForeColor="Red" Visible="False"></asp:Label>
            </p>
                                <p>
            <asp:Label ID="lblInvalidTerms" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                                    <asp:Label ID="lblMessage" runat="server" Visible="False"></asp:Label>
            </p>
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                HeaderText="Please correct the following" 
                ValidationGroup="RegistrationValidation" />
            <fieldset><legend>Job Seeker Details</legend>
           
                <table class="style2">
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style5">
                            <asp:Label ID="lblFName" runat="server" Text="First Name"></asp:Label>
                        </td>
                        <td>
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
                        <td class="style5">
                            <asp:Label ID="lblLName" runat="server" Text="Last Name"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtLName" runat="server" 
                                ToolTip="Enter your last name (Surname) only"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvLName" runat="server" 
                                ControlToValidate="txtLName" Display="Dynamic" 
                                ErrorMessage="Last Name Required" ValidationGroup="RegistrationValidation">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style5">
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
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style5">
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
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style5">
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
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style5">
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
                    </table>
                    
                     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                        
                    <table class="style2">
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style5">
                            <asp:Label ID="lblCountry" runat="server" Text="Country"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlCountry" runat="server" AppendDataBoundItems="true" 
                                AutoPostBack="True" DataSourceID="SqlDataSourceCountry" DataTextField="Country" 
                                DataValueField="ID" onselectedindexchanged="ddlCountry_SelectedIndexChanged">
                                <asp:ListItem Selected="True" Value="">Select Country</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvCountry" runat="server" 
                                ControlToValidate="ddlCountry" Display="Dynamic" 
                                ErrorMessage="Country Required" ValidationGroup="RegistrationValidation">*</asp:RequiredFieldValidator>
                            <asp:Label ID="lblInvalidCountryMarker" runat="server" ForeColor="Red" 
                                Visible="False">*</asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style5">
                            <asp:Label ID="lblRegion" runat="server" Text="Region"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlRegion" runat="server" AppendDataBoundItems="true" 
                                AutoPostBack="True" DataSourceID="SqlDataSourceRegion" DataTextField="Region" 
                                DataValueField="ID" onselectedindexchanged="ddlRegion_SelectedIndexChanged">
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
                        <td class="style5">
                            <asp:Label ID="lblLocation" runat="server" Text="Location(Town/City)"></asp:Label>
                        </td>
                        <td>
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
                        <td class="style5">
                            <asp:Label ID="lblNationality" runat="server" Text="Nationality"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlNationality" runat="server" 
                                AppendDataBoundItems="true" DataSourceID="SqlDataSourceNationality" 
                                DataTextField="Nationality" DataValueField="ID">
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
                        <td class="style5">
                            <asp:Label ID="lblIDPassport" runat="server" Text="ID/Passport Number"></asp:Label>
                        </td>
                        <td>
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
                        <td class="style5">
                            <asp:Label ID="lblContactNumber" runat="server" Text="Preferred Contact Number"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtContactNumber" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvContact" runat="server" 
                                ControlToValidate="txtContactNumber" Display="Dynamic" 
                                ErrorMessage="Contact Number Required" ValidationGroup="RegistrationValidation">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revPhoneNumber" runat="server" 
                                ControlToValidate="txtContactNumber" Display="Dynamic" 
                                ErrorMessage="Please enter phone number in the form xxx-xxxxxxx" 
                                ValidationExpression="\d{10}" ValidationGroup="RegistrationValidation">*</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                </table>
                 
                       
                            
                                <asp:SqlDataSource ID="SqlDataSourceCountry" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
                                    SelectCommand="SELECT [ID], [Country] FROM [jobsdb_Country] ORDER BY [Country]">
                                </asp:SqlDataSource>
                            
                                <asp:SqlDataSource ID="SqlDataSourceRegion" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
                                    SelectCommand="SELECT [ID], [Region] FROM [jobsdb_Region] ORDER BY [Region]">
                                </asp:SqlDataSource>
                      
                        <asp:SqlDataSource ID="SqlDataSourceNationality" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
                            SelectCommand="SELECT [ID], [Nationality] FROM [jobsdb_Nationality]">
                        </asp:SqlDataSource>
            </fieldset>
            <br />
            <fieldset><legend>CV Details</legend>
                <table class="style2">
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style5">
                            <asp:Label ID="lblDesiredCategory" runat="server" Text="Desired Job Category"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlDesiredCategory" runat="server" 
                                AppendDataBoundItems="true" DataSourceID="SqlDataSourceCategory" 
                                DataTextField="Category" DataValueField="ID">
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
                        <td class="style5">
                            <asp:Label ID="lblWorkExperience" runat="server" Text="Total Work Experience"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlWorkExperience" runat="server" 
                                AppendDataBoundItems="True" DataSourceID="SqlDataSourceExperience" 
                                DataTextField="Years" DataValueField="Years">
                                <asp:ListItem Value="">Select Years</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvWorkExperience" runat="server" 
                                ControlToValidate="ddlWorkExperience" Display="Dynamic" 
                                ErrorMessage="Total Work Experience Required" 
                                ValidationGroup="RegistrationValidation">*</asp:RequiredFieldValidator>
                            <asp:SqlDataSource ID="SqlDataSourceExperience" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
                                SelectCommand="SELECT [Years] FROM [jobsdb_Experience] ORDER BY [Years]">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style5">
                            <asp:Label ID="lblEducation" runat="server" Text="Highest Education Level"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlEducation" runat="server" AppendDataBoundItems="true" 
                                DataSourceID="SqlDataSourceEducation" DataTextField="EducationLevel" 
                                DataValueField="ID">
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
                        <td class="style5">
                            <asp:Label ID="lblUploadCV" runat="server" Text="Upload CV"></asp:Label>
                        </td>
                        <td>
                            <asp:FileUpload ID="fiuCV" runat="server" EnableViewState="true" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            &nbsp;</td>
                        <td class="style5">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
                        <asp:SqlDataSource ID="SqlDataSourceCategory" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
                            SelectCommand="SELECT [ID], [Category] FROM [jobsdb_JobCategory] ORDER BY [Category]">
                        </asp:SqlDataSource>
                    
                        <asp:SqlDataSource ID="SqlDataSourceCurrency" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
                            SelectCommand="SELECT [ID], [Currency] FROM [jobsdb_Currency] ORDER BY [Currency]">
                        </asp:SqlDataSource>
                    
                        <asp:SqlDataSource ID="SqlDataSourceSalaryPeriod" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
                            SelectCommand="SELECT [ID], [Period] FROM [jobsdb_SalaryPeriod] ORDER BY [Period]">
                        </asp:SqlDataSource>
                    
                        <asp:SqlDataSource ID="SqlDataSourceJobType" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
                            SelectCommand="SELECT [ID], [JobType] FROM [jobsdb_JobType] ORDER BY [JobType]">
                        </asp:SqlDataSource>
                    
                        <asp:SqlDataSource ID="SqlDataSourceEducation" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
                            SelectCommand="SELECT [ID], [EducationLevel] FROM [jobsdb_Education] ORDER BY [ID]">
                        </asp:SqlDataSource>
                    
            </fieldset>
            <br />
            <fieldset>
            <ul>
                <li>
                    <asp:Label ID="lblStatus" runat="server" Text="Job Seeker Status"></asp:Label>
                    <asp:RadioButtonList ID="rblStatus" runat="server" 
                        DataSourceID="SqlDataSourceStatus" DataTextField="Status" 
                        DataValueField="ID" 
                        ToolTip="Status indicated whether you would like advertisers to search and view your details abd CV.">
                    </asp:RadioButtonList>
                    <asp:SqlDataSource ID="SqlDataSourceStatus" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
                        SelectCommand="SELECT [ID], [Status] FROM [jobsdb_AccountStatus]">
                    </asp:SqlDataSource>
                </li>
                <li>
                    <asp:CheckBox ID="cbxTermsConditions" runat="server" 
                        Text="Yes, I agree to the Terms &amp; Conditions (Acceptance is Required)" 
                        TextAlign="Left" CausesValidation="True" 
                        ValidationGroup="RegistrationValidation" />
                            <asp:Label ID="lblInvalidTermsMarker" runat="server" 
                    ForeColor="Red" Visible="False">*</asp:Label>
                    <asp:SqlDataSource ID="SqlDataSourceJobseeker" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
                        SelectCommand="SELECT * FROM [jobsdb_JobSeeker]"></asp:SqlDataSource>
                </li>
                 </ul>
            
           </fieldset>
           <table align="right">
                <tr>
                    <td align="right">
                    <asp:Button ID="btnRegister" runat="server" onclick="btnRegister_Click" 
                    Text="Register" ValidationGroup="RegistrationValidation"/>
                    </td>
                </tr>
            </table>
            
        </div>
        <p>&nbsp;</p>
</div>

</asp:Panel>
</asp:Content>
