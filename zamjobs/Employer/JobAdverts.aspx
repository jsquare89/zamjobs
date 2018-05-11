<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="JobAdverts.aspx.cs" Inherits="zamjobs.Employer.JobAdverts" Title="ZamJobs.com - View Posted Job Adverts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h3>View Posted Job Adverts</h3>
    <table class="style2">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="btnViewDetail" runat="server" Text="View Detail" 
                    onclick="btnViewDetail_Click" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                        <asp:DropDownList ID="ddlAdvertLength" runat="server">
                            <asp:ListItem Text="Select Length" Value="" Selected="True"></asp:ListItem>
                            <asp:ListItem Value="15" Text="15 Day (1 Unit)"></asp:ListItem>
                            <asp:ListItem Value="30" Text="30 Day (2 Units)"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="ddlAdvertLength" Display="Dynamic" 
                            ValidationGroup="PostValidation">*</asp:RequiredFieldValidator>
                    </td>
            <td>
                <asp:Button ID="btnExtendAdvert" runat="server" Text="Extend Advert" 
                    ValidationGroup="PostValidation" onclick="btnExtendAdvert_Click" />
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
    </table><br />

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="ID" AllowPaging="True" AllowSorting="True" 
        AutoGenerateSelectButton="True" CellPadding="4" 
        DataSourceID="SqlDataSourceJobAdvert" ForeColor="#333333" GridLines="None" 
        Width="100%" OnSelectedIndexChanged="OnSelectedIndexChanged">
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" DataFormatString="ZP{0:000000}" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="PostDate" HeaderText="PostDate" 
                SortExpression="PostDate" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="ExpireDate" HeaderText="ExpireDate" 
                SortExpression="ExpireDate" DataFormatString="{0:dd/MM/yyyy}" />
        </Columns>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSourceJobAdvert" runat="server">
    </asp:SqlDataSource>

</asp:Content>
