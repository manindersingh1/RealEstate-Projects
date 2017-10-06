<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true"
    CodeBehind="AdminPanel.aspx.cs" Inherits="Property.Admin.AdminPanel" %>

<%@ Register TagName="FeaturedProperties" TagPrefix="uc" Src="~/Controls/FeaturedProperties.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

       <link href="../css/shortcodes.css" rel="stylesheet" />
    <link href="../css/style_002.css" rel="stylesheet" />
    <link href="slider/css/style.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <div class="slider_bg">
        <div class="wrapper_new">
            <div class="property-search-container">
                <div class="dt-sc-tabs-container" style="width: 100%;">
                    <ul class="dt-sc-tabs-frame">
                        <li><a class="current" href="#">For Residential</a></li>
                        <li><a href="#">For Commercial</a></li>
                        <li><a href="#">For Condo</a></li>
                    </ul>
                    <div style="display: block;" class="dt-sc-tabs-frame-content">
                        <div class="property-type-module medium-module">
                            <label>
                                Type city, community or Address</label>
                            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                        </div>
                        <div class="beds-module small-module">
                            <label>
                                Type of Home</label>
                            <asp:DropDownList ID="ddlPropertyType" runat="server">
                                <asp:ListItem Value="0" Selected="True">Any</asp:ListItem>
                                <asp:ListItem Value="Detached">Detached Home</asp:ListItem>
                                <asp:ListItem Value="Semi-Detached">Semi-Detached Home</asp:ListItem>
                                <asp:ListItem Value="Att/Row/Twnhouse">Townhouse</asp:ListItem>
                                <asp:ListItem Value="Condo Townhouse">Condo Townhouse</asp:ListItem>
                                <asp:ListItem Value="Condo Apt">Condo Apartment</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="beds-module small-module">
                            <label>
                                Beds</label>
                            <asp:DropDownList ID="ddlBeds" runat="server">
                                <asp:ListItem Value="0" Selected="True">Any</asp:ListItem>
                                <asp:ListItem Value="1">1+</asp:ListItem>
                                <asp:ListItem Value="2">2+</asp:ListItem>
                                <asp:ListItem Value="3">3+</asp:ListItem>
                                <asp:ListItem Value="4">4+</asp:ListItem>
                                <asp:ListItem Value="5">5+</asp:ListItem>
                                <asp:ListItem Value="6">6+</asp:ListItem>
                                <asp:ListItem Value="7">7+</asp:ListItem>
                                <asp:ListItem Value="8">8+</asp:ListItem>
                                <asp:ListItem Value="9">9+</asp:ListItem>
                                <asp:ListItem Value="10">10+</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="beds-module small-module">
                            <label>
                                Baths</label>
                            <asp:DropDownList ID="ddlBaths" runat="server">
                                <asp:ListItem Value="0" Selected="True">Any</asp:ListItem>
                                <asp:ListItem Value="1">1+</asp:ListItem>
                                <asp:ListItem Value="2">2+</asp:ListItem>
                                <asp:ListItem Value="3">3+</asp:ListItem>
                                <asp:ListItem Value="4">4+</asp:ListItem>
                                <asp:ListItem Value="5">5+</asp:ListItem>
                                <asp:ListItem Value="6">6+</asp:ListItem>
                                <asp:ListItem Value="7">7+</asp:ListItem>
                                <asp:ListItem Value="8">8+</asp:ListItem>
                                <asp:ListItem Value="9">9+</asp:ListItem>
                                <asp:ListItem Value="10">10+</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="beds-module small-module">
                            <label>
                                Min Price</label>
                            <asp:DropDownList ID="ddlMinPrice" runat="server">
                                <asp:ListItem Value="0">Min Price</asp:ListItem>
                                <asp:ListItem Value="100000">$100,000</asp:ListItem>
                                <asp:ListItem Value="125000">$125,000</asp:ListItem>
                                <asp:ListItem Value="150000">$150,000</asp:ListItem>
                                <asp:ListItem Value="175000">$175,000</asp:ListItem>
                                <asp:ListItem Value="200000">$200,000</asp:ListItem>
                                <asp:ListItem Value="225000">$225,000</asp:ListItem>
                                <asp:ListItem Value="250000">$250,000</asp:ListItem>
                                <asp:ListItem Value="275000">$275,000</asp:ListItem>
                                <asp:ListItem Value="300000">$300,000</asp:ListItem>
                                <asp:ListItem Value="325000">$325,000</asp:ListItem>
                                <asp:ListItem Value="350000">$350,000</asp:ListItem>
                                <asp:ListItem Value="375000">$375,000</asp:ListItem>
                                <asp:ListItem Value="400000">$400,000</asp:ListItem>
                                <asp:ListItem Value="425000">$425,000</asp:ListItem>
                                <asp:ListItem Value="450000">$450,000</asp:ListItem>
                                <asp:ListItem Value="475000">$475,000</asp:ListItem>
                                <asp:ListItem Value="500000">$500,000</asp:ListItem>
                                <asp:ListItem Value="525000">$525,000</asp:ListItem>
                                <asp:ListItem Value="550000">$550,000</asp:ListItem>
                                <asp:ListItem Value="575000">$575,000</asp:ListItem>
                                <asp:ListItem Value="600000">$600,000</asp:ListItem>
                                <asp:ListItem Value="625000">$625,000</asp:ListItem>
                                <asp:ListItem Value="650000">$650,000</asp:ListItem>
                                <asp:ListItem Value="675000">$675,000</asp:ListItem>
                                <asp:ListItem Value="700000">$700,000</asp:ListItem>
                                <asp:ListItem Value="725000">$725,000</asp:ListItem>
                                <asp:ListItem Value="750000">$750,000</asp:ListItem>
                                <asp:ListItem Value="775000">$775,000</asp:ListItem>
                                <asp:ListItem Value="800000">$800,000</asp:ListItem>
                                <asp:ListItem Value="825000">$825,000</asp:ListItem>
                                <asp:ListItem Value="850000">$850,000</asp:ListItem>
                                <asp:ListItem Value="875000">$875,000</asp:ListItem>
                                <asp:ListItem Value="900000">$900,000</asp:ListItem>
                                <asp:ListItem Value="925000">$925,000</asp:ListItem>
                                <asp:ListItem Value="950000">$950,000</asp:ListItem>
                                <asp:ListItem Value="975000">$975,000</asp:ListItem>
                                <asp:ListItem Value="1000000">$1,000,000</asp:ListItem>
                                <asp:ListItem Value="1050000">$1,050,000</asp:ListItem>
                                <asp:ListItem Value="1100000">$1,100,000</asp:ListItem>
                                <asp:ListItem Value="1150000">$1,150,000</asp:ListItem>
                                <asp:ListItem Value="1200000">$1,200,000</asp:ListItem>
                                <asp:ListItem Value="1250000">$1,250,000</asp:ListItem>
                                <asp:ListItem Value="1300000">$1,300,000</asp:ListItem>
                                <asp:ListItem Value="1350000">$1,350,000</asp:ListItem>
                                <asp:ListItem Value="1400000">$1,400,000</asp:ListItem>
                                <asp:ListItem Value="1450000">$1,450,000</asp:ListItem>
                                <asp:ListItem Value="1500000">$1,500,000</asp:ListItem>
                                <asp:ListItem Value="1550000">$1,550,000</asp:ListItem>
                                <asp:ListItem Value="1600000">$1,600,000</asp:ListItem>
                                <asp:ListItem Value="1650000">$1,650,000</asp:ListItem>
                                <asp:ListItem Value="1700000">$1,700,000</asp:ListItem>
                                <asp:ListItem Value="1750000">$1,750,000</asp:ListItem>
                                <asp:ListItem Value="1800000">$1,800,000</asp:ListItem>
                                <asp:ListItem Value="1850000">$1,850,000</asp:ListItem>
                                <asp:ListItem Value="1900000">$1,900,000</asp:ListItem>
                                <asp:ListItem Value="1950000">$1,950,000</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="beds-module small-module">
                            <label>
                                Max Price</label>
                            <asp:DropDownList ID="ddlMaxPrice" runat="server">
                                <asp:ListItem Value="0">Max Price</asp:ListItem>
                                <asp:ListItem Value="100000">$100,000</asp:ListItem>
                                <asp:ListItem Value="125000">$125,000</asp:ListItem>
                                <asp:ListItem Value="150000">$150,000</asp:ListItem>
                                <asp:ListItem Value="175000">$175,000</asp:ListItem>
                                <asp:ListItem Value="200000">$200,000</asp:ListItem>
                                <asp:ListItem Value="225000">$225,000</asp:ListItem>
                                <asp:ListItem Value="250000">$250,000</asp:ListItem>
                                <asp:ListItem Value="275000">$275,000</asp:ListItem>
                                <asp:ListItem Value="300000">$300,000</asp:ListItem>
                                <asp:ListItem Value="325000">$325,000</asp:ListItem>
                                <asp:ListItem Value="350000">$350,000</asp:ListItem>
                                <asp:ListItem Value="375000">$375,000</asp:ListItem>
                                <asp:ListItem Value="400000">$400,000</asp:ListItem>
                                <asp:ListItem Value="425000">$425,000</asp:ListItem>
                                <asp:ListItem Value="450000">$450,000</asp:ListItem>
                                <asp:ListItem Value="475000">$475,000</asp:ListItem>
                                <asp:ListItem Value="500000">$500,000</asp:ListItem>
                                <asp:ListItem Value="525000">$525,000</asp:ListItem>
                                <asp:ListItem Value="550000">$550,000</asp:ListItem>
                                <asp:ListItem Value="575000">$575,000</asp:ListItem>
                                <asp:ListItem Value="600000">$600,000</asp:ListItem>
                                <asp:ListItem Value="625000">$625,000</asp:ListItem>
                                <asp:ListItem Value="650000">$650,000</asp:ListItem>
                                <asp:ListItem Value="675000">$675,000</asp:ListItem>
                                <asp:ListItem Value="700000">$700,000</asp:ListItem>
                                <asp:ListItem Value="725000">$725,000</asp:ListItem>
                                <asp:ListItem Value="750000">$750,000</asp:ListItem>
                                <asp:ListItem Value="775000">$775,000</asp:ListItem>
                                <asp:ListItem Value="800000">$800,000</asp:ListItem>
                                <asp:ListItem Value="825000">$825,000</asp:ListItem>
                                <asp:ListItem Value="850000">$850,000</asp:ListItem>
                                <asp:ListItem Value="875000">$875,000</asp:ListItem>
                                <asp:ListItem Value="900000">$900,000</asp:ListItem>
                                <asp:ListItem Value="925000">$925,000</asp:ListItem>
                                <asp:ListItem Value="950000">$950,000</asp:ListItem>
                                <asp:ListItem Value="975000">$975,000</asp:ListItem>
                                <asp:ListItem Value="1000000">$1,000,000</asp:ListItem>
                                <asp:ListItem Value="1050000">$1,050,000</asp:ListItem>
                                <asp:ListItem Value="1100000">$1,100,000</asp:ListItem>
                                <asp:ListItem Value="1150000">$1,150,000</asp:ListItem>
                                <asp:ListItem Value="1200000">$1,200,000</asp:ListItem>
                                <asp:ListItem Value="1250000">$1,250,000</asp:ListItem>
                                <asp:ListItem Value="1300000">$1,300,000</asp:ListItem>
                                <asp:ListItem Value="1350000">$1,350,000</asp:ListItem>
                                <asp:ListItem Value="1400000">$1,400,000</asp:ListItem>
                                <asp:ListItem Value="1450000">$1,450,000</asp:ListItem>
                                <asp:ListItem Value="1500000">$1,500,000</asp:ListItem>
                                <asp:ListItem Value="1550000">$1,550,000</asp:ListItem>
                                <asp:ListItem Value="1600000">$1,600,000</asp:ListItem>
                                <asp:ListItem Value="1650000">$1,650,000</asp:ListItem>
                                <asp:ListItem Value="1700000">$1,700,000</asp:ListItem>
                                <asp:ListItem Value="1750000">$1,750,000</asp:ListItem>
                                <asp:ListItem Value="1800000">$1,800,000</asp:ListItem>
                                <asp:ListItem Value="1850000">$1,850,000</asp:ListItem>
                                <asp:ListItem Value="1900000">$1,900,000</asp:ListItem>
                                <asp:ListItem Value="1950000">$1,950,000</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="beds-module small-module">
                            <label>
                                Type</label>
                            <asp:DropDownList ID="ddlType" runat="server">
                                <asp:ListItem Value="Sale" Selected="True">For Sale</asp:ListItem>
                                <asp:ListItem Value="Lease">For Rent</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div>
                            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                        </div>
                    </div>
                    <div style="display: none;" class="dt-sc-tabs-frame-content">
                        <div class="property-type-module medium-module">
                            <label>
                                Type city, community or Address</label>
                            <asp:TextBox ID="txtCommSearch" runat="server"></asp:TextBox>
                        </div>
                        <div class="beds-module small-module">
                            <label>
                                Type of Home</label>
                            <asp:DropDownList ID="ddlCommHome" runat="server">
                                <asp:ListItem Value="0" Selected="True">Any</asp:ListItem>
                                <asp:ListItem Value="Detached">Detached Home</asp:ListItem>
                                <asp:ListItem Value="Semi-Detached">Semi-Detached Home</asp:ListItem>
                                <asp:ListItem Value="Att/Row/Twnhouse">Townhouse</asp:ListItem>
                                <asp:ListItem Value="Condo Townhouse">Condo Townhouse</asp:ListItem>
                                <asp:ListItem Value="Condo Apt">Condo Apartment</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="beds-module small-module">
                            <label>
                                Baths</label>
                            <asp:DropDownList ID="ddlCommBaths" runat="server">
                                <asp:ListItem Value="0" Selected="True">Any</asp:ListItem>
                                <asp:ListItem Value="1">1+</asp:ListItem>
                                <asp:ListItem Value="2">2+</asp:ListItem>
                                <asp:ListItem Value="3">3+</asp:ListItem>
                                <asp:ListItem Value="4">4+</asp:ListItem>
                                <asp:ListItem Value="5">5+</asp:ListItem>
                                <asp:ListItem Value="6">6+</asp:ListItem>
                                <asp:ListItem Value="7">7+</asp:ListItem>
                                <asp:ListItem Value="8">8+</asp:ListItem>
                                <asp:ListItem Value="9">9+</asp:ListItem>
                                <asp:ListItem Value="10">10+</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="beds-module small-module">
                            <label>
                                Min Price</label>
                            <asp:DropDownList ID="ddlCommMinPrice" runat="server">
                                <asp:ListItem Value="0">Min Price</asp:ListItem>
                                <asp:ListItem Value="100000">$100,000</asp:ListItem>
                                <asp:ListItem Value="125000">$125,000</asp:ListItem>
                                <asp:ListItem Value="150000">$150,000</asp:ListItem>
                                <asp:ListItem Value="175000">$175,000</asp:ListItem>
                                <asp:ListItem Value="200000">$200,000</asp:ListItem>
                                <asp:ListItem Value="225000">$225,000</asp:ListItem>
                                <asp:ListItem Value="250000">$250,000</asp:ListItem>
                                <asp:ListItem Value="275000">$275,000</asp:ListItem>
                                <asp:ListItem Value="300000">$300,000</asp:ListItem>
                                <asp:ListItem Value="325000">$325,000</asp:ListItem>
                                <asp:ListItem Value="350000">$350,000</asp:ListItem>
                                <asp:ListItem Value="375000">$375,000</asp:ListItem>
                                <asp:ListItem Value="400000">$400,000</asp:ListItem>
                                <asp:ListItem Value="425000">$425,000</asp:ListItem>
                                <asp:ListItem Value="450000">$450,000</asp:ListItem>
                                <asp:ListItem Value="475000">$475,000</asp:ListItem>
                                <asp:ListItem Value="500000">$500,000</asp:ListItem>
                                <asp:ListItem Value="525000">$525,000</asp:ListItem>
                                <asp:ListItem Value="550000">$550,000</asp:ListItem>
                                <asp:ListItem Value="575000">$575,000</asp:ListItem>
                                <asp:ListItem Value="600000">$600,000</asp:ListItem>
                                <asp:ListItem Value="625000">$625,000</asp:ListItem>
                                <asp:ListItem Value="650000">$650,000</asp:ListItem>
                                <asp:ListItem Value="675000">$675,000</asp:ListItem>
                                <asp:ListItem Value="700000">$700,000</asp:ListItem>
                                <asp:ListItem Value="725000">$725,000</asp:ListItem>
                                <asp:ListItem Value="750000">$750,000</asp:ListItem>
                                <asp:ListItem Value="775000">$775,000</asp:ListItem>
                                <asp:ListItem Value="800000">$800,000</asp:ListItem>
                                <asp:ListItem Value="825000">$825,000</asp:ListItem>
                                <asp:ListItem Value="850000">$850,000</asp:ListItem>
                                <asp:ListItem Value="875000">$875,000</asp:ListItem>
                                <asp:ListItem Value="900000">$900,000</asp:ListItem>
                                <asp:ListItem Value="925000">$925,000</asp:ListItem>
                                <asp:ListItem Value="950000">$950,000</asp:ListItem>
                                <asp:ListItem Value="975000">$975,000</asp:ListItem>
                                <asp:ListItem Value="1000000">$1,000,000</asp:ListItem>
                                <asp:ListItem Value="1050000">$1,050,000</asp:ListItem>
                                <asp:ListItem Value="1100000">$1,100,000</asp:ListItem>
                                <asp:ListItem Value="1150000">$1,150,000</asp:ListItem>
                                <asp:ListItem Value="1200000">$1,200,000</asp:ListItem>
                                <asp:ListItem Value="1250000">$1,250,000</asp:ListItem>
                                <asp:ListItem Value="1300000">$1,300,000</asp:ListItem>
                                <asp:ListItem Value="1350000">$1,350,000</asp:ListItem>
                                <asp:ListItem Value="1400000">$1,400,000</asp:ListItem>
                                <asp:ListItem Value="1450000">$1,450,000</asp:ListItem>
                                <asp:ListItem Value="1500000">$1,500,000</asp:ListItem>
                                <asp:ListItem Value="1550000">$1,550,000</asp:ListItem>
                                <asp:ListItem Value="1600000">$1,600,000</asp:ListItem>
                                <asp:ListItem Value="1650000">$1,650,000</asp:ListItem>
                                <asp:ListItem Value="1700000">$1,700,000</asp:ListItem>
                                <asp:ListItem Value="1750000">$1,750,000</asp:ListItem>
                                <asp:ListItem Value="1800000">$1,800,000</asp:ListItem>
                                <asp:ListItem Value="1850000">$1,850,000</asp:ListItem>
                                <asp:ListItem Value="1900000">$1,900,000</asp:ListItem>
                                <asp:ListItem Value="1950000">$1,950,000</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="beds-module small-module">
                            <label>
                                Max Price</label>
                            <asp:DropDownList ID="ddlCommMaxPrice" runat="server">
                                <asp:ListItem Value="0">Max Price</asp:ListItem>
                                <asp:ListItem Value="100000">$100,000</asp:ListItem>
                                <asp:ListItem Value="125000">$125,000</asp:ListItem>
                                <asp:ListItem Value="150000">$150,000</asp:ListItem>
                                <asp:ListItem Value="175000">$175,000</asp:ListItem>
                                <asp:ListItem Value="200000">$200,000</asp:ListItem>
                                <asp:ListItem Value="225000">$225,000</asp:ListItem>
                                <asp:ListItem Value="250000">$250,000</asp:ListItem>
                                <asp:ListItem Value="275000">$275,000</asp:ListItem>
                                <asp:ListItem Value="300000">$300,000</asp:ListItem>
                                <asp:ListItem Value="325000">$325,000</asp:ListItem>
                                <asp:ListItem Value="350000">$350,000</asp:ListItem>
                                <asp:ListItem Value="375000">$375,000</asp:ListItem>
                                <asp:ListItem Value="400000">$400,000</asp:ListItem>
                                <asp:ListItem Value="425000">$425,000</asp:ListItem>
                                <asp:ListItem Value="450000">$450,000</asp:ListItem>
                                <asp:ListItem Value="475000">$475,000</asp:ListItem>
                                <asp:ListItem Value="500000">$500,000</asp:ListItem>
                                <asp:ListItem Value="525000">$525,000</asp:ListItem>
                                <asp:ListItem Value="550000">$550,000</asp:ListItem>
                                <asp:ListItem Value="575000">$575,000</asp:ListItem>
                                <asp:ListItem Value="600000">$600,000</asp:ListItem>
                                <asp:ListItem Value="625000">$625,000</asp:ListItem>
                                <asp:ListItem Value="650000">$650,000</asp:ListItem>
                                <asp:ListItem Value="675000">$675,000</asp:ListItem>
                                <asp:ListItem Value="700000">$700,000</asp:ListItem>
                                <asp:ListItem Value="725000">$725,000</asp:ListItem>
                                <asp:ListItem Value="750000">$750,000</asp:ListItem>
                                <asp:ListItem Value="775000">$775,000</asp:ListItem>
                                <asp:ListItem Value="800000">$800,000</asp:ListItem>
                                <asp:ListItem Value="825000">$825,000</asp:ListItem>
                                <asp:ListItem Value="850000">$850,000</asp:ListItem>
                                <asp:ListItem Value="875000">$875,000</asp:ListItem>
                                <asp:ListItem Value="900000">$900,000</asp:ListItem>
                                <asp:ListItem Value="925000">$925,000</asp:ListItem>
                                <asp:ListItem Value="950000">$950,000</asp:ListItem>
                                <asp:ListItem Value="975000">$975,000</asp:ListItem>
                                <asp:ListItem Value="1000000">$1,000,000</asp:ListItem>
                                <asp:ListItem Value="1050000">$1,050,000</asp:ListItem>
                                <asp:ListItem Value="1100000">$1,100,000</asp:ListItem>
                                <asp:ListItem Value="1150000">$1,150,000</asp:ListItem>
                                <asp:ListItem Value="1200000">$1,200,000</asp:ListItem>
                                <asp:ListItem Value="1250000">$1,250,000</asp:ListItem>
                                <asp:ListItem Value="1300000">$1,300,000</asp:ListItem>
                                <asp:ListItem Value="1350000">$1,350,000</asp:ListItem>
                                <asp:ListItem Value="1400000">$1,400,000</asp:ListItem>
                                <asp:ListItem Value="1450000">$1,450,000</asp:ListItem>
                                <asp:ListItem Value="1500000">$1,500,000</asp:ListItem>
                                <asp:ListItem Value="1550000">$1,550,000</asp:ListItem>
                                <asp:ListItem Value="1600000">$1,600,000</asp:ListItem>
                                <asp:ListItem Value="1650000">$1,650,000</asp:ListItem>
                                <asp:ListItem Value="1700000">$1,700,000</asp:ListItem>
                                <asp:ListItem Value="1750000">$1,750,000</asp:ListItem>
                                <asp:ListItem Value="1800000">$1,800,000</asp:ListItem>
                                <asp:ListItem Value="1850000">$1,850,000</asp:ListItem>
                                <asp:ListItem Value="1900000">$1,900,000</asp:ListItem>
                                <asp:ListItem Value="1950000">$1,950,000</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="beds-module small-module">
                            <label>
                                Type</label>
                            <asp:DropDownList ID="ddlCommSaleRent" runat="server">
                                <asp:ListItem Value="Sale" Selected="True">For Sale</asp:ListItem>
                                <asp:ListItem Value="Lease">For Rent</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div>
                            <asp:Button ID="btnCommSearch" runat="server" Text="Search" OnClick="btnCommSearch_Click" />
                        </div>
                    </div>
                    <div style="display: none;" class="dt-sc-tabs-frame-content">
                        <div class="property-type-module medium-module">
                            <label>
                                Type and city commity of Address</label>
                            <asp:TextBox ID="txtCondoSearch" runat="server"></asp:TextBox>
                        </div>
                        <div class="beds-module small-module">
                            <label>
                                Type of Home</label>
                            <asp:DropDownList ID="ddlCondoHome" runat="server">
                                <asp:ListItem Value="0" Selected="True">Any</asp:ListItem>
                                <asp:ListItem Value="Detached">Detached Home</asp:ListItem>
                                <asp:ListItem Value="Semi-Detached">Semi-Detached Home</asp:ListItem>
                                <asp:ListItem Value="Att/Row/Twnhouse">Townhouse</asp:ListItem>
                                <asp:ListItem Value="Condo Townhouse">Condo Townhouse</asp:ListItem>
                                <asp:ListItem Value="Condo Apt">Condo Apartment</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="beds-module small-module">
                            <label>
                                Beds</label>
                            <asp:DropDownList ID="ddlCondoBeds" runat="server">
                                <asp:ListItem Value="0" Selected="True">Any</asp:ListItem>
                                <asp:ListItem Value="1">1+</asp:ListItem>
                                <asp:ListItem Value="2">2+</asp:ListItem>
                                <asp:ListItem Value="3">3+</asp:ListItem>
                                <asp:ListItem Value="4">4+</asp:ListItem>
                                <asp:ListItem Value="5">5+</asp:ListItem>
                                <asp:ListItem Value="6">6+</asp:ListItem>
                                <asp:ListItem Value="7">7+</asp:ListItem>
                                <asp:ListItem Value="8">8+</asp:ListItem>
                                <asp:ListItem Value="9">9+</asp:ListItem>
                                <asp:ListItem Value="10">10+</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="beds-module small-module">
                            <label>
                                Baths</label>
                            <asp:DropDownList ID="ddlCondoBaths" runat="server">
                                <asp:ListItem Value="0" Selected="True">Any</asp:ListItem>
                                <asp:ListItem Value="1">1+</asp:ListItem>
                                <asp:ListItem Value="2">2+</asp:ListItem>
                                <asp:ListItem Value="3">3+</asp:ListItem>
                                <asp:ListItem Value="4">4+</asp:ListItem>
                                <asp:ListItem Value="5">5+</asp:ListItem>
                                <asp:ListItem Value="6">6+</asp:ListItem>
                                <asp:ListItem Value="7">7+</asp:ListItem>
                                <asp:ListItem Value="8">8+</asp:ListItem>
                                <asp:ListItem Value="9">9+</asp:ListItem>
                                <asp:ListItem Value="10">10+</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="beds-module small-module">
                            <label>
                                Min Price</label>
                            <asp:DropDownList ID="ddlCondoMinPrice" runat="server">
                                <asp:ListItem Value="0">Min Price</asp:ListItem>
                                <asp:ListItem Value="100000">$100,000</asp:ListItem>
                                <asp:ListItem Value="125000">$125,000</asp:ListItem>
                                <asp:ListItem Value="150000">$150,000</asp:ListItem>
                                <asp:ListItem Value="175000">$175,000</asp:ListItem>
                                <asp:ListItem Value="200000">$200,000</asp:ListItem>
                                <asp:ListItem Value="225000">$225,000</asp:ListItem>
                                <asp:ListItem Value="250000">$250,000</asp:ListItem>
                                <asp:ListItem Value="275000">$275,000</asp:ListItem>
                                <asp:ListItem Value="300000">$300,000</asp:ListItem>
                                <asp:ListItem Value="325000">$325,000</asp:ListItem>
                                <asp:ListItem Value="350000">$350,000</asp:ListItem>
                                <asp:ListItem Value="375000">$375,000</asp:ListItem>
                                <asp:ListItem Value="400000">$400,000</asp:ListItem>
                                <asp:ListItem Value="425000">$425,000</asp:ListItem>
                                <asp:ListItem Value="450000">$450,000</asp:ListItem>
                                <asp:ListItem Value="475000">$475,000</asp:ListItem>
                                <asp:ListItem Value="500000">$500,000</asp:ListItem>
                                <asp:ListItem Value="525000">$525,000</asp:ListItem>
                                <asp:ListItem Value="550000">$550,000</asp:ListItem>
                                <asp:ListItem Value="575000">$575,000</asp:ListItem>
                                <asp:ListItem Value="600000">$600,000</asp:ListItem>
                                <asp:ListItem Value="625000">$625,000</asp:ListItem>
                                <asp:ListItem Value="650000">$650,000</asp:ListItem>
                                <asp:ListItem Value="675000">$675,000</asp:ListItem>
                                <asp:ListItem Value="700000">$700,000</asp:ListItem>
                                <asp:ListItem Value="725000">$725,000</asp:ListItem>
                                <asp:ListItem Value="750000">$750,000</asp:ListItem>
                                <asp:ListItem Value="775000">$775,000</asp:ListItem>
                                <asp:ListItem Value="800000">$800,000</asp:ListItem>
                                <asp:ListItem Value="825000">$825,000</asp:ListItem>
                                <asp:ListItem Value="850000">$850,000</asp:ListItem>
                                <asp:ListItem Value="875000">$875,000</asp:ListItem>
                                <asp:ListItem Value="900000">$900,000</asp:ListItem>
                                <asp:ListItem Value="925000">$925,000</asp:ListItem>
                                <asp:ListItem Value="950000">$950,000</asp:ListItem>
                                <asp:ListItem Value="975000">$975,000</asp:ListItem>
                                <asp:ListItem Value="1000000">$1,000,000</asp:ListItem>
                                <asp:ListItem Value="1050000">$1,050,000</asp:ListItem>
                                <asp:ListItem Value="1100000">$1,100,000</asp:ListItem>
                                <asp:ListItem Value="1150000">$1,150,000</asp:ListItem>
                                <asp:ListItem Value="1200000">$1,200,000</asp:ListItem>
                                <asp:ListItem Value="1250000">$1,250,000</asp:ListItem>
                                <asp:ListItem Value="1300000">$1,300,000</asp:ListItem>
                                <asp:ListItem Value="1350000">$1,350,000</asp:ListItem>
                                <asp:ListItem Value="1400000">$1,400,000</asp:ListItem>
                                <asp:ListItem Value="1450000">$1,450,000</asp:ListItem>
                                <asp:ListItem Value="1500000">$1,500,000</asp:ListItem>
                                <asp:ListItem Value="1550000">$1,550,000</asp:ListItem>
                                <asp:ListItem Value="1600000">$1,600,000</asp:ListItem>
                                <asp:ListItem Value="1650000">$1,650,000</asp:ListItem>
                                <asp:ListItem Value="1700000">$1,700,000</asp:ListItem>
                                <asp:ListItem Value="1750000">$1,750,000</asp:ListItem>
                                <asp:ListItem Value="1800000">$1,800,000</asp:ListItem>
                                <asp:ListItem Value="1850000">$1,850,000</asp:ListItem>
                                <asp:ListItem Value="1900000">$1,900,000</asp:ListItem>
                                <asp:ListItem Value="1950000">$1,950,000</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="beds-module small-module">
                            <label>
                                Max Price</label>
                            <asp:DropDownList ID="ddlCondoMaxPrice" runat="server">
                                <asp:ListItem Value="0">Max Price</asp:ListItem>
                                <asp:ListItem Value="100000">$100,000</asp:ListItem>
                                <asp:ListItem Value="125000">$125,000</asp:ListItem>
                                <asp:ListItem Value="150000">$150,000</asp:ListItem>
                                <asp:ListItem Value="175000">$175,000</asp:ListItem>
                                <asp:ListItem Value="200000">$200,000</asp:ListItem>
                                <asp:ListItem Value="225000">$225,000</asp:ListItem>
                                <asp:ListItem Value="250000">$250,000</asp:ListItem>
                                <asp:ListItem Value="275000">$275,000</asp:ListItem>
                                <asp:ListItem Value="300000">$300,000</asp:ListItem>
                                <asp:ListItem Value="325000">$325,000</asp:ListItem>
                                <asp:ListItem Value="350000">$350,000</asp:ListItem>
                                <asp:ListItem Value="375000">$375,000</asp:ListItem>
                                <asp:ListItem Value="400000">$400,000</asp:ListItem>
                                <asp:ListItem Value="425000">$425,000</asp:ListItem>
                                <asp:ListItem Value="450000">$450,000</asp:ListItem>
                                <asp:ListItem Value="475000">$475,000</asp:ListItem>
                                <asp:ListItem Value="500000">$500,000</asp:ListItem>
                                <asp:ListItem Value="525000">$525,000</asp:ListItem>
                                <asp:ListItem Value="550000">$550,000</asp:ListItem>
                                <asp:ListItem Value="575000">$575,000</asp:ListItem>
                                <asp:ListItem Value="600000">$600,000</asp:ListItem>
                                <asp:ListItem Value="625000">$625,000</asp:ListItem>
                                <asp:ListItem Value="650000">$650,000</asp:ListItem>
                                <asp:ListItem Value="675000">$675,000</asp:ListItem>
                                <asp:ListItem Value="700000">$700,000</asp:ListItem>
                                <asp:ListItem Value="725000">$725,000</asp:ListItem>
                                <asp:ListItem Value="750000">$750,000</asp:ListItem>
                                <asp:ListItem Value="775000">$775,000</asp:ListItem>
                                <asp:ListItem Value="800000">$800,000</asp:ListItem>
                                <asp:ListItem Value="825000">$825,000</asp:ListItem>
                                <asp:ListItem Value="850000">$850,000</asp:ListItem>
                                <asp:ListItem Value="875000">$875,000</asp:ListItem>
                                <asp:ListItem Value="900000">$900,000</asp:ListItem>
                                <asp:ListItem Value="925000">$925,000</asp:ListItem>
                                <asp:ListItem Value="950000">$950,000</asp:ListItem>
                                <asp:ListItem Value="975000">$975,000</asp:ListItem>
                                <asp:ListItem Value="1000000">$1,000,000</asp:ListItem>
                                <asp:ListItem Value="1050000">$1,050,000</asp:ListItem>
                                <asp:ListItem Value="1100000">$1,100,000</asp:ListItem>
                                <asp:ListItem Value="1150000">$1,150,000</asp:ListItem>
                                <asp:ListItem Value="1200000">$1,200,000</asp:ListItem>
                                <asp:ListItem Value="1250000">$1,250,000</asp:ListItem>
                                <asp:ListItem Value="1300000">$1,300,000</asp:ListItem>
                                <asp:ListItem Value="1350000">$1,350,000</asp:ListItem>
                                <asp:ListItem Value="1400000">$1,400,000</asp:ListItem>
                                <asp:ListItem Value="1450000">$1,450,000</asp:ListItem>
                                <asp:ListItem Value="1500000">$1,500,000</asp:ListItem>
                                <asp:ListItem Value="1550000">$1,550,000</asp:ListItem>
                                <asp:ListItem Value="1600000">$1,600,000</asp:ListItem>
                                <asp:ListItem Value="1650000">$1,650,000</asp:ListItem>
                                <asp:ListItem Value="1700000">$1,700,000</asp:ListItem>
                                <asp:ListItem Value="1750000">$1,750,000</asp:ListItem>
                                <asp:ListItem Value="1800000">$1,800,000</asp:ListItem>
                                <asp:ListItem Value="1850000">$1,850,000</asp:ListItem>
                                <asp:ListItem Value="1900000">$1,900,000</asp:ListItem>
                                <asp:ListItem Value="1950000">$1,950,000</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="beds-module small-module">
                            <label>
                                Type</label>
                            <asp:DropDownList ID="ddlCondoType" runat="server">
                                <asp:ListItem Value="Sale" Selected="True">For Sale</asp:ListItem>
                                <asp:ListItem Value="Lease">For Rent</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div>
                            <asp:Button ID="btnCondoSearch" runat="server" Text="Search" OnClick="btnCondoSearch_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="wrapper_new">
        <section class="top_new_section">
          <h3>Why to Pay Upfront Charges</h3>
          <p>To List Your Home When You Have Better Options With Lowest Commission Package To Pay At The Time Of Closing.</p>
         
           </section>
        <section class="middle_Section_new">
            <section class="prorety_main">
             <div class="property_box">
             <h4>See Designs</h4>
             <img alt="#" src="../images/caption-image1.jpg">
             <p>You can choose from 100's of beautiful designs ?</p>
             
                 </div>
            </section>
            <section class="prorety_main">
             <div class="property_box">
             <h4>Get a website</h4>
             <img alt="#" src="../images/caption-image2.jpg">
             <p>Creating a website is for your business made easy...</p>
             
                 </div>
            </section>
            <section class="prorety_main">
             <div class="property_box">
             <h4>Our Packages</h4>
             <img alt="#" src="../images/caption-image3.jpg">
             <p>Looking to buy your new dream home?</p>
             
                 </div>
            </section>
            <section class="prorety_main">
             <div class="property_box">
             <h4>Contact Us</h4>
             <img alt="#" src="../images/caption-image4.jpg">
             <p>Fill a simple form and we will call you?</p>
             
                 </div>
            </section>
     </section>
        <section class="featured_product">
          <uc:FeaturedProperties id="FeaturedProperties" runat="Server" ></uc:FeaturedProperties>
     </section>
    </div>
</asp:Content>
