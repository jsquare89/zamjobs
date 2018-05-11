<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="PurchaseUnits.aspx.cs" Inherits="zamjobs.Employer.PurchaseUnits" Title="ZamJobs.com - Purchase Units" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style2
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h3>Purchase Units</h3>
<p>Purchase ZamJob Units in order to post job adverts and view details of searched 
    jobseekers</p>
    <p>Note: The ZamJobs units calculator calculates units for our advertisers estimated 
        use of services. These units can be used interchangeably for the different 
        services on offer.</p>
    
    <asp:Panel ID="PanelPurchaseUnits" runat="server" DefaultButton="">
    
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
     <ContentTemplate>
    <table class="style2">
        <tr>
            <td align="center" colspan="4">
                <b>ZamJob Units Calculator</b></td>
        </tr>
        <tr>
            <td align="center" colspan="4">
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Service</td>
            <td>
                Cost(Kwacha)</td>
            <td>
                Qty</td>
            <td>
                SubTotal</td>
        </tr>
        <tr>
            <td>
                15 Day Advert (1 Unit)</td>
            <td>
                <asp:Label ID="lbl15DayAmt" runat="server"></asp:Label>
            </td>
                                <td>
                                    <asp:DropDownList ID="ddl15DayAdvert" runat="server" AutoPostBack="True" 
                                        onselectedindexchanged="ddl15DayAdvert_SelectedIndexChanged">
                                        <asp:ListItem Selected="True">0</asp:ListItem>
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                        <asp:ListItem>6</asp:ListItem>
                                        <asp:ListItem>7</asp:ListItem>
                                        <asp:ListItem>8</asp:ListItem>
                                        <asp:ListItem>9</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                        <asp:ListItem>11</asp:ListItem>
                                        <asp:ListItem>12</asp:ListItem>
                                        <asp:ListItem>13</asp:ListItem>
                                        <asp:ListItem>14</asp:ListItem>
                                        <asp:ListItem>15</asp:ListItem>
                                        <asp:ListItem>16</asp:ListItem>
                                        <asp:ListItem>17</asp:ListItem>
                                        <asp:ListItem>18</asp:ListItem>
                                        <asp:ListItem>19</asp:ListItem>
                                        <asp:ListItem>20</asp:ListItem>
                                        <asp:ListItem>21</asp:ListItem>
                                        <asp:ListItem>22</asp:ListItem>
                                        <asp:ListItem>23</asp:ListItem>
                                        <asp:ListItem>24</asp:ListItem>
                                        <asp:ListItem>25</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt15DaySub" runat="server" AutoPostBack="True" 
                                       OnTextChanged="txt15DaySub_TextChanged" Text="0" Enabled="False"></asp:TextBox>
            </td>
                            </tr>
                            <tr>
                                <td>
                                    30 Day Advert (2 Units)</td>
            <td>
                <asp:Label ID="lbl30DayAmt" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddl30DayAdvert" runat="server" AutoPostBack="True" 
                                        onselectedindexchanged="ddl30DayAdvert_SelectedIndexChanged">
                                        <asp:ListItem Selected="True">0</asp:ListItem>
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                        <asp:ListItem>6</asp:ListItem>
                                        <asp:ListItem>7</asp:ListItem>
                                        <asp:ListItem>8</asp:ListItem>
                                        <asp:ListItem>9</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                        <asp:ListItem>11</asp:ListItem>
                                        <asp:ListItem>12</asp:ListItem>
                                        <asp:ListItem>13</asp:ListItem>
                                        <asp:ListItem>14</asp:ListItem>
                                        <asp:ListItem>15</asp:ListItem>
                                        <asp:ListItem>16</asp:ListItem>
                                        <asp:ListItem>17</asp:ListItem>
                                        <asp:ListItem>18</asp:ListItem>
                                        <asp:ListItem>19</asp:ListItem>
                                        <asp:ListItem>20</asp:ListItem>
                                        <asp:ListItem>21</asp:ListItem>
                                        <asp:ListItem>22</asp:ListItem>
                                        <asp:ListItem>23</asp:ListItem>
                                        <asp:ListItem>24</asp:ListItem>
                                        <asp:ListItem>25</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:TextBox ID="txt30DaySub" runat="server" AutoPostBack="True" 
                                        ontextchanged="txt30DaySub_TextChanged" Text="0" Enabled="False"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    View Jobseeker Details (2 Units)</td>
            <td>
                <asp:Label ID="lblViewAmt" runat="server"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlViewJobseekerDetails" runat="server" 
                                        AutoPostBack="True" 
                                        onselectedindexchanged="ddlViewJobseekerDetails_SelectedIndexChanged">
                                        <asp:ListItem Selected="True">0</asp:ListItem>
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                        <asp:ListItem>6</asp:ListItem>
                                        <asp:ListItem>7</asp:ListItem>
                                        <asp:ListItem>8</asp:ListItem>
                                        <asp:ListItem>9</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                        <asp:ListItem>11</asp:ListItem>
                                        <asp:ListItem>12</asp:ListItem>
                                        <asp:ListItem>13</asp:ListItem>
                                        <asp:ListItem>14</asp:ListItem>
                                        <asp:ListItem>15</asp:ListItem>
                                        <asp:ListItem>16</asp:ListItem>
                                        <asp:ListItem>17</asp:ListItem>
                                        <asp:ListItem>18</asp:ListItem>
                                        <asp:ListItem>19</asp:ListItem>
                                        <asp:ListItem>20</asp:ListItem>
                                        <asp:ListItem>21</asp:ListItem>
                                        <asp:ListItem>22</asp:ListItem>
                                        <asp:ListItem>23</asp:ListItem>
                                        <asp:ListItem>24</asp:ListItem>
                                        <asp:ListItem>25</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtViewSeekerSub" runat="server" AutoPostBack="True" 
                                        ontextchanged="txtViewSeekerSub_TextChanged" Text="0" Enabled="False"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Total</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                <asp:TextBox ID="txtTotal" runat="server" ontextchanged="txtTotal_TextChanged" 
                    AutoPostBack="True" Enabled="False"></asp:TextBox>
                                </td>
        </tr>
                            <tr>
                                <td>
                                    Total Units</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                <asp:TextBox ID="txtTotalUnits" runat="server" Enabled="False"
                    ></asp:TextBox>
                                </td>
        </tr>
        <tr>
            <td align="right" colspan="4">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" colspan="4">
                <asp:Button ID="btnCheckout" runat="server" Text="Checkout" 
                    onclick="btnCheckout_Click" />
            </td>
        </tr>
    </table>
    </ContentTemplate>
    </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
