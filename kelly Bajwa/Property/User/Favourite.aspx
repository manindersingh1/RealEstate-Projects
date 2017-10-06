<%@ Page Title="" Language="C#" MasterPageFile="~/Property.Master" AutoEventWireup="true"
    CodeBehind="Favourite.aspx.cs" Inherits="Property.User.Favourite" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../css/shortcodes.css" rel="stylesheet" />
    <link href="../css/style_002.css" rel="stylesheet" />
    <link href="slider/css/style.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <div class="wrapper_new">
        <div class="property-search-container">
            <div class="dt-sc-tabs-container" style="width: 100%;">
                <ul class="dt-sc-tabs-frame">
                    <li><a class="current" href="#">Favourite Properties</a></li>
                </ul>
                <div style="display: block; padding: 23px 2% 28px" class="dt-sc-tabs-frame-content">
                    <asp:GridView ID="grdFavourite" AllowPaging="true" AllowSorting="true" AutoGenerateColumns="False"
                        runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%"
                        OnPageIndexChanging="grdFavourite_PageIndexChanging">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="MLSID" HeaderText="Property MLSID">
                                <ItemStyle HorizontalAlign="Left" />
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
