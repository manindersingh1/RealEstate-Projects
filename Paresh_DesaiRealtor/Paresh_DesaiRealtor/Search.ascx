<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Search.ascx.cs" Inherits="Property.Search1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<%@ Register TagName="FeaturedProperties" TagPrefix="uc" Src="~/Controls/FeaturedProperties.ascx" %>

<style type="text/css">
        .AutoExtender
        {
            background: none repeat scroll 0 0 hsl(0, 0%, 96%);
            border: 1px solid #ccc;
            font-family: Verdana,Arial Black;
            font-size: 12px;
            font-weight: normal;
            height: auto;
            line-height: 20px;
            margin-top: -1px;
            position: absolute;
            width: 265px !important;
            z-index: 600001;
            padding-bottom: 10px;
            padding-top: 10px;
        }
        .AutoExtenderList
        {
            cursor: pointer;
            color: Black;
            width: 257px;
            padding-left: 7px;
        }
        .AutoExtenderHighlight
        {
            color: White;
            background-color: #006699;
            cursor: pointer;
            width: 257px;
            padding-left: 7px;
        }
    </style>
   <ajaxtoolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </ajaxtoolkit:ToolkitScriptManager>
    <div class="property-search-container">
        <div class="dt-sc-tabs-container" style="width: 100%;">
            <ul class="dt-sc-tabs-frame">
                <li><a class="current" href="#">For Residential</a></li>
                <li><a href="#">For Commercial</a></li>
                <li><a href="#">For Condo</a></li>
            </ul>
            <div style="display: block;" class="dt-sc-tabs-frame-content">
                <div class="property-type-module medium-module">
                    <span>Type any City, MLS ID or Postal Code</span>
                    <asp:TextBox ID="txtSearch" runat="server" AutoComplete="off"></asp:TextBox>
                    <ajaxtoolkit:AutoCompleteExtender ID="AutoCompleteExtender1" CompletionSetCount="10"
                        TargetControlID="txtSearch" UseContextKey="True" CompletionInterval="0" ServiceMethod="GetAutoCompleteData"
                        CompletionListCssClass="AutoExtender" CompletionListItemCssClass="AutoExtenderList"
                        CompletionListHighlightedItemCssClass="AutoExtenderHighlight" MinimumPrefixLength="2"
                        Enabled="True" runat="server">
                    </ajaxtoolkit:AutoCompleteExtender>
                </div>
                <div class="beds-module small-module">
                    <label>
                        Type of Home</label>
                    <asp:DropDownList ID="ddlPropertyType" runat="server">
                    </asp:DropDownList>
                </div>
                <div class="baths-module small-module">
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
                <div class="floors-module small-module">
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
                <div class="garages-module small-module">
                    <label>
                        Min Price</label>
                    <asp:DropDownList ID="ddlMinPrice" runat="server">
                        <asp:ListItem Value="">Min Price</asp:ListItem>
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
                        <asp:ListItem Value="2000000">$2,000,000</asp:ListItem>
                        <asp:ListItem Value="2500000">$2,500,000</asp:ListItem>
                        <asp:ListItem Value="3000000">$3,000,000</asp:ListItem>
                        <asp:ListItem Value="3500000">$3,500,000</asp:ListItem>
                        <asp:ListItem Value="4000000">$4,000,000</asp:ListItem>
                        <asp:ListItem Value="4500000">$4,500,000</asp:ListItem>
                        <asp:ListItem Value="5000000">$5,000,000</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="garages-module small-module">
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
                        <asp:ListItem Value="2000000">$2,000,000</asp:ListItem>
                        <asp:ListItem Value="2500000">$2,500,000</asp:ListItem>
                        <asp:ListItem Value="3000000">$3,000,000</asp:ListItem>
                        <asp:ListItem Value="3500000">$3,500,000</asp:ListItem>
                        <asp:ListItem Value="4000000">$4,000,000</asp:ListItem>
                        <asp:ListItem Value="4500000">$4,500,000</asp:ListItem>
                        <asp:ListItem Value="5000000">$5,000,000</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="garages-module small-module">
                    <label>
                        Status</label>
                    <asp:DropDownList ID="ddlType" runat="server">
                    </asp:DropDownList>
                </div>
                <asp:CompareValidator runat="server" ID="cmpNumberss" CssClass="clsCompare" ControlToValidate="ddlMaxPrice"
                    ControlToCompare="ddlMinPrice" Operator="GreaterThan" Type="Integer" ErrorMessage="Price greater than minimum price  " />
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
            </div>
            <div style="display: none;" class="dt-sc-tabs-frame-content">
                <div class="property-type-module medium-module">
                    <span>Type any City, MLS ID or Postal Code</span>
                    <asp:TextBox ID="txtCommSearch" runat="server" AutoComplete="off"></asp:TextBox>
                    <ajaxtoolkit:AutoCompleteExtender ID="AutoCompleteExtender2" CompletionSetCount="10"
                        TargetControlID="txtCommSearch" UseContextKey="True" CompletionInterval="0" ServiceMethod="GetAutoCompleteData_Comm"
                        CompletionListCssClass="AutoExtender" CompletionListItemCssClass="AutoExtenderList"
                        CompletionListHighlightedItemCssClass="AutoExtenderHighlight" MinimumPrefixLength="2"
                        Enabled="True" runat="server">
                    </ajaxtoolkit:AutoCompleteExtender>
                </div>
                <div class="beds-module small-module">
                    <label>
                        Type of Property</label>
                    <asp:DropDownList ID="ddlCommHome" runat="server">
                    </asp:DropDownList>
                </div>
                <div class="floors-module small-module">
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
                <div class="garages-module small-module">
                    <label>
                        Min Price</label>
                    <asp:DropDownList ID="ddlCommMinPrice" runat="server">
                        <asp:ListItem Value="">Min Price</asp:ListItem>
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
                        <asp:ListItem Value="2000000">$2,000,000</asp:ListItem>
                        <asp:ListItem Value="2500000">$2,500,000</asp:ListItem>
                        <asp:ListItem Value="3000000">$3,000,000</asp:ListItem>
                        <asp:ListItem Value="3500000">$3,500,000</asp:ListItem>
                        <asp:ListItem Value="4000000">$4,000,000</asp:ListItem>
                        <asp:ListItem Value="4500000">$4,500,000</asp:ListItem>
                        <asp:ListItem Value="5000000">$5,000,000</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="garages-module small-module">
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
                        <asp:ListItem Value="2000000">$2,000,000</asp:ListItem>
                        <asp:ListItem Value="2500000">$2,500,000</asp:ListItem>
                        <asp:ListItem Value="3000000">$3,000,000</asp:ListItem>
                        <asp:ListItem Value="3500000">$3,500,000</asp:ListItem>
                        <asp:ListItem Value="4000000">$4,000,000</asp:ListItem>
                        <asp:ListItem Value="4500000">$4,500,000</asp:ListItem>
                        <asp:ListItem Value="5000000">$5,000,000</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="garages-module small-module">
                    <label>
                        Status</label>
                    <asp:DropDownList ID="ddlCommSaleRent" runat="server">
                    </asp:DropDownList>
                </div>
                <asp:CompareValidator runat="server" CssClass="clsCompare" ID="cpvComm" ControlToValidate="ddlCommMaxPrice"
                    ControlToCompare="ddlCommMinPrice" Operator="GreaterThan" Type="Integer" ErrorMessage="Price greater than minimum price  " />
                <asp:Button ID="btnCommSearch" runat="server" Text="Search" OnClick="btnCommSearch_Click" />
            </div>
            <div style="display: none;" class="dt-sc-tabs-frame-content">
                <div class="property-type-module medium-module">
                    <span>Type any City, MLS ID or Postal Code</span>
                    <asp:TextBox ID="txtCondoSearch" runat="server" AutoComplete="off"></asp:TextBox>
                    <ajaxtoolkit:AutoCompleteExtender ID="AutoCompleteExtender3" CompletionSetCount="10"
                        TargetControlID="txtCondoSearch" UseContextKey="True" CompletionInterval="0"
                        ServiceMethod="GetAutoCompleteData_Condo" CompletionListCssClass="AutoExtender"
                        CompletionListItemCssClass="AutoExtenderList" CompletionListHighlightedItemCssClass="AutoExtenderHighlight"
                        MinimumPrefixLength="2" Enabled="True" runat="server">
                    </ajaxtoolkit:AutoCompleteExtender>
                </div>
                <div class="beds-module small-module">
                    <label>
                        Property Type</label>
                    <asp:DropDownList ID="ddlCondoHome" runat="server">
                    </asp:DropDownList>
                </div>
                <div class="baths-module small-module">
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
                <div class="floors-module small-module">
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
                <div class="garages-module small-module">
                    <label>
                        Min Price</label>
                    <asp:DropDownList ID="ddlCondoMinPrice" runat="server">
                        <asp:ListItem Value="">Min Price</asp:ListItem>
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
                        <asp:ListItem Value="2000000">$2,000,000</asp:ListItem>
                        <asp:ListItem Value="2500000">$2,500,000</asp:ListItem>
                        <asp:ListItem Value="3000000">$3,000,000</asp:ListItem>
                        <asp:ListItem Value="3500000">$3,500,000</asp:ListItem>
                        <asp:ListItem Value="4000000">$4,000,000</asp:ListItem>
                        <asp:ListItem Value="4500000">$4,500,000</asp:ListItem>
                        <asp:ListItem Value="5000000">$5,000,000</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="garages-module small-module">
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
                        <asp:ListItem Value="2000000">$2,000,000</asp:ListItem>
                        <asp:ListItem Value="2500000">$2,500,000</asp:ListItem>
                        <asp:ListItem Value="3000000">$3,000,000</asp:ListItem>
                        <asp:ListItem Value="3500000">$3,500,000</asp:ListItem>
                        <asp:ListItem Value="4000000">$4,000,000</asp:ListItem>
                        <asp:ListItem Value="4500000">$4,500,000</asp:ListItem>
                        <asp:ListItem Value="5000000">$5,000,000</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="garages-module small-module">
                    <label>
                        Status</label>
                    <asp:DropDownList ID="ddlCondoType" runat="server">
                    </asp:DropDownList>
                </div>
                <asp:CompareValidator runat="server" CssClass="clsCompare" ID="cpvCondo" ControlToValidate="ddlCondoMaxPrice"
                    ControlToCompare="ddlCondoMinPrice" Operator="GreaterThan" Type="Integer" ErrorMessage="Price greater than minimum price  " />
                <asp:Button ID="btnCondoSearch" runat="server" Text="Search" OnClick="btnCondoSearch_Click" />
            </div>
        </div>
    </div>
    <div class="left_section">
        <%--  <div class="left-section-up">
            <div class="box1">
                <span>What are Pre-foreclosures ? </span>
                <img src="images/real-estate-2_21.png" alt="Pre-forclosures"  title="Pre-forclosures" />
            </div>
        </div>--%>
        <div class="left-section-bottom">
            <div class="box4">
                <span style="border-bottom: 1px solid #1E707E;">Listing Searches</span>
                <div class="listing_box">
                    <div class="box_in">
                        <span>Toronto</span> <a href="../Search.aspx?Municipality=Toronto" title="Toronto">
                            <img src="../images/real-estate-2_30.png" alt="Toronto" title="Toronto" />
                            <p>
                                Search</p>
                        </a>
                    </div>
                    <div class="box_in">
                        <span>Mississauga</span> <a href="../Search.aspx?Municipality=Mississauga" title="Mississauga">
                            <img src="../images/real-estate-2_32.png" alt="Mississauga" title="Mississauga" />
                            <p>
                                Search</p>
                        </a>
                    </div>
                    <div class="box_in">
                        <span>Brampton</span> <a href="../Search.aspx?Municipality=Brampton" title="Brampton">
                            <img src="../images/real-estate-2_34.png" alt="Brampton" title="Brampton" />
                            <p>
                                Search</p>
                        </a>
                    </div>
                    <div class="box_in">
                        <span>Oakville</span> <a href="../Search.aspx?Municipality=Oakville" title="Oakville">
                            <img src="../images/real-estate-2_42.png" alt="Oakville" title="Oakville" />
                            <p>
                                Search</p>
                        </a>
                    </div>
                    <div class="box_in">
                        <span>Hamilton</span> <a href="../Search.aspx?Municipality=Hamilton" title="Hamilton">
                            <img src="../images/real-estate-2_30.png" alt="Hamilton" title="Hamilton" />
                            <p>
                                Search</p>
                        </a>
                    </div>
                    <div class="box_in">
                        <span>Markham</span> <a href="../Search.aspx?Municipality=Markham" title="Markham">
                            <img src="../images/real-estate-2_44.png" alt="Markham" title="Markham" />
                            <p>
                                Search</p>
                        </a>
                    </div>
                    <div class="box_in">
                        <span>Wasaga Beach</span> <a href="../Search.aspx?Municipality=Wasaga Beach" title="Wasaga Beach">
                            <img src="../images/real-estate-2_46.png" alt="Wasaga Beach" title="Wasaga Beach" />
                            <p>
                                Search</p>
                        </a>
                    </div>
                    <div class="box_in">
                        <span>Oshawa</span> <a href="../Search.aspx?Municipality=Oshawa" title="Oshawa">
                            <img src="../images/real-estate-2_53.png" alt="Oshawa" title="Oshawa" />
                            <p>
                                Search</p>
                        </a>
                    </div>
                    <div class="box_in">
                        <span>Richmond Hill</span> <a href="../Search.aspx?Municipality=Richmond Hill" title="Richmond Hill">
                            <img src="../images/real-estate-2_56.png" alt="Richmond Hill" title="Richmond Hill" />
                            <p>
                                Search</p>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="new_right">
        <div class="feature_new_1">
            <uc:FeaturedProperties ID="FeaturedProperties" runat="server" />
        </div>
        <div class="clear">
        </div>
        <div class="right_section">
            <div class="image-row">
                <div class="image-set">
                    <a class="example-image-link" href="../images/img-1.jpg" data-lightbox="example-set"
                        data-title="" title='Image'>
                        <img class="example-image" src="../images/img-1.jpg" alt="Alliance" title="Alliance" /></a>
                </div>
            </div>
        </div>
        <div class="right_section">
            <div class="image-row">
                <div class="image-set">
                    <a class="example-image-link" href="../images/img-2.jpg" data-lightbox="example-set"
                        data-title="" title='Image'>
                        <img class="example-image" src="../images/img-2.jpg" alt="Investment" title="Investment" /></a>
                </div>
            </div>
        </div>
        <script src="../js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="../js/lightbox.js" type="text/javascript"></script>
    </div>