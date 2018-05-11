<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuickSearch.ascx.cs" Inherits="zamjobs.ControlForms.QuickSearch" %>
<style type="text/css">
    .style1
    {
        width: 39px;
    }
</style>

<asp:Panel ID="PanelQuickSearch" runat="server">


<table style="width: 100%; border: solid 1px #3399cc;">
    <tr>
        <td colspan="2">
            
            <h4>Quick Job Search</h4>
            
            <asp:Label ID="lblSearchJobTitle" runat="server" Text="Search Job Title"></asp:Label>
            <br />
            <asp:TextBox ID="txtSearch" runat="server" ValidationGroup="Search" 
                Width="150px"></asp:TextBox>
            <br />
            <asp:Label ID="lblCategory" runat="server" Text="Category"></asp:Label>
            <br />
            <asp:DropDownList ID="ddlCategory" runat="server" ValidationGroup="Search" 
                Width="150px" DataSourceID="SqlDataSourceCategory" DataTextField="Category" 
                    DataValueField="ID" AppendDataBoundItems="True">
                    <asp:ListItem Selected="True" Value="" Text="Any Category"></asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Label ID="lblRegion" runat="server" Text="Region"></asp:Label>
            <br />
            <asp:DropDownList ID="ddlRegion" runat="server" AppendDataBoundItems="True" 
                DataSourceID="SqlDataSourceRegion" DataTextField="Region" DataValueField="ID" 
                ValidationGroup="Search" Width="150px">
                <asp:ListItem Selected="True" Text="Any Region" Value=""></asp:ListItem>
            </asp:DropDownList>
            
                              
        </td>
    </tr>
    <tr>
        <td class="style1">
            </td>
        <td>
                                <asp:Button ID="btnSearch" runat="server" onclick="btnSearch_Click" 
                        Text="Search" CausesValidation="False" BackColor="#D4F1FF" 
                        BorderColor="#3399CC" BorderStyle="Solid" />
                        
        </td>
    </tr><tr><td align="center" colspan="2"><asp:HyperLink ID="HyperLink1" NavigateUrl="~/JobSearch.aspx" Text="Advanced Job Search" runat="server"></asp:HyperLink></td></tr>
    </table>
<asp:SqlDataSource ID="SqlDataSourceRegion" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
    SelectCommand="SELECT [ID], [Region] FROM [jobsdb_Region] ORDER BY [Region]">
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSourceCategory" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ZamJobsConnString %>" 
    SelectCommand="SELECT [ID], [Category] FROM [jobsdb_JobCategory] ORDER BY [Category]">
</asp:SqlDataSource>

</asp:Panel>
