<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AdvertiserReg.aspx.cs" Inherits="zamjobs.AdvertiserReg" Title="ZamJobs.com - Advertiser Registration" %>
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
        .style4
        {
            width: 155px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="PanelAdvertiserRegistration" runat="server">
   
    <div>
<h1>Advertiser Registration</h1>


</div>
    <div>
        <p>
            Register for free to gain access to our database of job seekers. Once registered 
            you will have the ability to post job advertisements and search through eager 
            job seekers.</p>
        <p>
            Just fill in the details form below and your ready to log in and make use of 
            your account.
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
        </p>
        <p>
                            <asp:Label ID="lblInvalidEmail" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        </p>
        <p>
            <asp:Label ID="lblInvalidCountry" runat="server" ForeColor="Red" 
                Visible="False"></asp:Label>
        </p>
        <p>
                            <asp:Label ID="lblInvalidTerms" runat="server" ForeColor="Red" 
                                Visible="False"></asp:Label>
        </p>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
            ValidationGroup="RegistrationValidation"/>
        <fieldset><legend>Advertiser Details</legend>
       
            <table class="style2">
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td class="style4">
                        <asp:Label ID="lblCompanyName" runat="server" Text="Company Name"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtCompanyName" runat="server"></asp:TextBox>
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
                        <asp:TextBox ID="txtContactName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvContactName" runat="server" 
                            ControlToValidate="txtContactName" Display="Dynamic" 
                            ErrorMessage="Contact Name Required" ValidationGroup="RegistrationValidation">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td class="style4">
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
                    <td class="style4">
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
                    <td class="style4">
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
                    <td class="style4">
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
                    <td class="style4">
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
                    <td class="style4">
                        <asp:Label ID="lblRegion" runat="server" Text="Region"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlRegion" runat="server" AppendDataBoundItems="true" 
                            AutoPostBack="True" DataSourceID="SqlDataSourceRegion" DataTextField="Region" 
                            DataValueField="ID" 
                            onselectedindexchanged="ddlRegion_SelectedIndexChanged" Enabled="False">
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
                    <td class="style4">
                        <asp:Label ID="lblLocation" runat="server" Text="Location(Town/City)"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlLocation" runat="server" AppendDataBoundItems="True" 
                            Enabled="False">
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
                    <td class="style4">
                        <asp:Label ID="lblContactNumber" runat="server" Text="Contact Number"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtContactNumber" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvContactNumber" runat="server" 
                            ControlToValidate="txtContactNumber" Display="Dynamic" 
                            ErrorMessage="Contact Number Required" ValidationGroup="RegistrationValidation">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revPhoneNumber" runat="server" 
                            ControlToValidate="txtContactNumber" Display="Dynamic" 
                            ErrorMessage="Please enter  contact number in the form xxxxxxxxxx" 
                            ValidationExpression="\d{10}" 
                            ValidationGroup="RegistrationValidation">*</asp:RegularExpressionValidator>
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
                        <asp:TextBox ID="txtContactNumber2" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revPhoneNumberAlt" runat="server" 
                            ControlToValidate="txtContactNumber2" Display="Dynamic" 
                            ErrorMessage="Please enter alternate contact number in the form xxxxxxxxxx" 
                            ValidationExpression="\d{10}" ValidationGroup="RegistrationValidation">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td class="style4">
                        <asp:Label ID="lblPOBox" runat="server" Text="Postal Address"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPostalAddress" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPostalAddress" runat="server" 
                            ControlToValidate="txtPostalAddress" Display="Dynamic" 
                            ErrorMessage="Postal Address Required" ValidationGroup="RegistrationValidation">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td class="style4">
                        <asp:Label ID="lblWebsiteURL" runat="server" Text="Website URL"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtWebsiteURL" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="revWebsiteURL" runat="server" 
                            ControlToValidate="txtWebsiteURL" Display="Dynamic" 
                            ErrorMessage="Website URL Format not accepted" 
                            ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" 
                            ValidationGroup="RegistrationValidation">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td class="style4">
                        <asp:Label ID="lblCategory" runat="server" Text="Main Job Category"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlCategory" runat="server" AppendDataBoundItems="true" 
                            DataSourceID="SqlDataSourceCategory" DataTextField="Category" 
                            DataValueField="ID">
                            <asp:ListItem Selected="True" Value="">Select Category</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvCategory" runat="server" 
                            ControlToValidate="ddlCategory" Display="Dynamic" 
                            ErrorMessage="Job Category Required" ValidationGroup="RegistrationValidation">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td class="style4">
                        <asp:Label ID="lblCompanyDesc" runat="server" Text="Company Overview"></asp:Label>
                        <asp:RequiredFieldValidator ID="rfvOverview" runat="server" 
                            ControlToValidate="txtCompanyDesc" Display="Dynamic" 
                            ErrorMessage="Company Overview Required" 
                            ValidationGroup="RegistrationValidation">*</asp:RequiredFieldValidator>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td colspan="2">
                        <asp:TextBox ID="txtCompanyDesc" runat="server" Height="120px" 
                            TextMode="MultiLine" Width="90%"></asp:TextBox>
                    </td>
                </tr>
                 </table>
                 <asp:UpdatePanel ID="UpdatePanelLogo" runat="server">
                        <ContentTemplate>
                <table class="style2">
                <tr>
                    <td class="style3">
                        &nbsp;</td>
                    <td class="style4">
                        <asp:Label ID="lblLogo" runat="server" Text="Company Logo"></asp:Label>
                    </td>
                    <td>
                        <asp:FileUpload ID="fiuLogo" runat="server" Width="200px" />
                        <asp:Button ID="btnClear" runat="server" onclick="btnClear_Click" Text="Clear" 
                            Width="50px" />
                    </td>
                </tr>
            </table>
            </ContentTemplate>
            </asp:UpdatePanel>
            
                
                    <asp:SqlDataSource ID="SqlDataSourceCountry" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
                        SelectCommand="SELECT [ID], [Country] FROM [jobsdb_Country] ORDER BY [Country]">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceRegion" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
                        SelectCommand="SELECT [ID], [Region] FROM [jobsdb_Region] ORDER BY [Region]">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceCategory" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
                    
                    SelectCommand="SELECT [ID], [Category] FROM [jobsdb_JobCategory] ORDER BY [Category]">
                </asp:SqlDataSource>
              </fieldset>
        <br />
        <fieldset>
        <ul>
            <li>
                <asp:CheckBox ID="cbxTermsConditions" runat="server" 
                    Text="Yes, I agree to the Terms &amp; Conditions (Acceptance is Required)" 
                    TextAlign="Left" CausesValidation="True" 
                    ValidationGroup="RegistrationValidation" />
                            <asp:Label ID="lblInvalidTermsMarker" runat="server" 
                    ForeColor="Red" Visible="False">*</asp:Label>
                <asp:ObjectDataSource ID="ObjectDataSourceGetEmailCount" runat="server" 
                    DataObjectTypeName="System.Guid" DeleteMethod="Delete" InsertMethod="Insert" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetCountByEmail" 
                    TypeName="ZamJobsTableAdapters.aspnet_MembershipTableAdapter" 
                    UpdateMethod="Update">
                    <UpdateParameters>
                        <asp:Parameter DbType="Guid" Name="ApplicationId" />
                        <asp:Parameter Name="Password" Type="String" />
                        <asp:Parameter Name="PasswordFormat" Type="Int32" />
                        <asp:Parameter Name="PasswordSalt" Type="String" />
                        <asp:Parameter Name="MobilePIN" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="LoweredEmail" Type="String" />
                        <asp:Parameter Name="PasswordQuestion" Type="String" />
                        <asp:Parameter Name="PasswordAnswer" Type="String" />
                        <asp:Parameter Name="IsApproved" Type="Boolean" />
                        <asp:Parameter Name="IsLockedOut" Type="Boolean" />
                        <asp:Parameter Name="CreateDate" Type="DateTime" />
                        <asp:Parameter Name="LastLoginDate" Type="DateTime" />
                        <asp:Parameter Name="LastPasswordChangedDate" Type="DateTime" />
                        <asp:Parameter Name="LastLockoutDate" Type="DateTime" />
                        <asp:Parameter Name="FailedPasswordAttemptCount" Type="Int32" />
                        <asp:Parameter Name="FailedPasswordAttemptWindowStart" Type="DateTime" />
                        <asp:Parameter Name="FailedPasswordAnswerAttemptCount" Type="Int32" />
                        <asp:Parameter Name="FailedPasswordAnswerAttemptWindowStart" Type="DateTime" />
                        <asp:Parameter Name="Comment" Type="String" />
                        <asp:Parameter DbType="Guid" Name="Original_UserId" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtEmail" Name="Email" PropertyName="Text" 
                            Type="String" />
                    </SelectParameters>
                    <InsertParameters>
                        <asp:Parameter DbType="Guid" Name="ApplicationId" />
                        <asp:Parameter DbType="Guid" Name="UserId" />
                        <asp:Parameter Name="Password" Type="String" />
                        <asp:Parameter Name="PasswordFormat" Type="Int32" />
                        <asp:Parameter Name="PasswordSalt" Type="String" />
                        <asp:Parameter Name="MobilePIN" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="LoweredEmail" Type="String" />
                        <asp:Parameter Name="PasswordQuestion" Type="String" />
                        <asp:Parameter Name="PasswordAnswer" Type="String" />
                        <asp:Parameter Name="IsApproved" Type="Boolean" />
                        <asp:Parameter Name="IsLockedOut" Type="Boolean" />
                        <asp:Parameter Name="CreateDate" Type="DateTime" />
                        <asp:Parameter Name="LastLoginDate" Type="DateTime" />
                        <asp:Parameter Name="LastPasswordChangedDate" Type="DateTime" />
                        <asp:Parameter Name="LastLockoutDate" Type="DateTime" />
                        <asp:Parameter Name="FailedPasswordAttemptCount" Type="Int32" />
                        <asp:Parameter Name="FailedPasswordAttemptWindowStart" Type="DateTime" />
                        <asp:Parameter Name="FailedPasswordAnswerAttemptCount" Type="Int32" />
                        <asp:Parameter Name="FailedPasswordAnswerAttemptWindowStart" Type="DateTime" />
                        <asp:Parameter Name="Comment" Type="String" />
                    </InsertParameters>
                </asp:ObjectDataSource>
            </li>
        </ul></fieldset>
        <table align="right">
                <tr>
                    <td align="right">
            <asp:Button ID="btnRegister" runat="server" onclick="btnRegister_Click" 
                    Text="Register" ValidationGroup="RegistrationValidation"/>
            
                    </td>
                </tr>
            </table>
    </div>
 </asp:Panel>
</asp:Content>
