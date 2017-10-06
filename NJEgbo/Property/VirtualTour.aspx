<%@ Page Title="" Language="C#" MasterPageFile="~/PropertyNew.Master" AutoEventWireup="true" CodeBehind="VirtualTour.aspx.cs" Inherits="Property.VirtualTour" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="css/style.css" rel="stylesheet" />
<link href="css/style_002.css" rel="stylesheet" />
<link href="slider/css/style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <div class="vrtual_bg" id="repeater" runat="server" visible="false">
            <div>
                <div class="dt-sc-tabs-container" style="width: 100%;">
                    <ul class="dt-sc-tabs-frame">
                        <li><a class="current" href="#">Virtual Tour</a></li>
                    </ul>
                    <div style="display: block;" class="dt-sc-tabs-frame-content">
                        <div class="Free-Home_Virtual">
                            <asp:Repeater ID="grdvirtual" runat="server">
                                <HeaderTemplate>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <div class="Virtual_cmnt">
                                        <h2>
                                            <asp:HyperLink Target="_blank" ID="lbllink" CommandName="create" NavigateUrl='<%# Eval("Link") %>' Text='<%# Eval("Name") %>' runat="server"></asp:HyperLink>
                                        </h2>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>

                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="vrtual_bg" id="cmnsoon" runat="server" visible="false">
            <div>
                <div class="dt-sc-tabs-container" style="width: 100%;">
                    <ul class="dt-sc-tabs-frame">
                        <li><a class="current" href="#">Virtual Tour</a></li>
                    </ul>
                    <div style="display: block;" class="dt-sc-tabs-frame-content">
                        <div class="virtual_cmng_soon">
                            <img alt="" class="virtl_image_cmgsoon" src="images/cming_soon.png" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>



