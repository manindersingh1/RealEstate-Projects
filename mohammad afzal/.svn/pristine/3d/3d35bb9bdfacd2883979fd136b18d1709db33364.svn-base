<%@ Page Title="" Language="C#" MasterPageFile="~/PropertyNew.Master" AutoEventWireup="true" CodeBehind="View_Testimonials.aspx.cs" Inherits="Property.View_Testimonials" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="css/font.css" rel="stylesheet" />
    <link href="css/font-awesome.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/shortcodes.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="js/shortcodes.js"></script>
    <script type="text/javascript" src="js/jquery_009.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="wrapper_new">
            <div class="property-search-container">
                <div class="dt-sc-tabs-container" style="width: 100%;">
                    <ul class="dt-sc-tabs-frame">
                        <li><a class="current" href="#">Testimonials</a></li>
                    </ul>
                    <div style="display: block;" class="dt-sc-tabs-frame-content">
                        <div class="Free-Home_new">
                            <div id="divcominr" runat="server" class="comin_soon">
                                <img alt="" src="images/cming_soon.png" />
                            </div>
                            <asp:Repeater ID="grdBanfdsfsnerShow" runat="server" OnItemDataBound="grdTestimonials_ItemDataBound">
                                <HeaderTemplate>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <div class="test_bg">
                                        <div class="comments">
                                            <asp:Label ID="lbllink" CssClass="lblcomment" Text='<%# Eval("comments") %>' runat="server"></asp:Label>
                                        </div>
                                        <div class="name">
                                            <asp:Label ID="lblby" Text="By" runat="server"></asp:Label>
                                            <asp:Label ID="lblname" CssClass="lblname" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
