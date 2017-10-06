<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PropertySearch.ascx.cs"
    Inherits="Property.SearchControl" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
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
            width: 250px !important;
            z-index: 600001;
            padding-bottom:10px;
            padding-top:10px;
        }
        .AutoExtenderList
        {
            cursor: pointer;
            color: Black;
            width: 247px;
            padding-left: 7px;
        }
        .AutoExtenderHighlight
        {
            color: White;
            background-color: #3498DB;
            cursor: pointer;
            width: 247px;
            padding-left: 7px;
        }
    </style>

    <ajaxtoolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </ajaxtoolkit:ToolkitScriptManager>
<% if (Session["SearchType"].ToString().Contains("Residential"))
   { 
%>
<div class="property_search">
    <p>Type any City, MLS ID or Postal Code</p>
    <asp:TextBox ID="txtSearch" runat="server" CssClass="new_1" Text=""></asp:TextBox>
    <ajaxtoolkit:AutoCompleteExtender ID="AutoCompleteExtender1" CompletionSetCount="10"
        TargetControlID="txtSearch" UseContextKey="true" CompletionInterval="0" ServiceMethod="GetAutoCompleteData"
        CompletionListCssClass="AutoExtender" CompletionListItemCssClass="AutoExtenderList"
        CompletionListHighlightedItemCssClass="AutoExtenderHighlight" MinimumPrefixLength="2"
        Enabled="True" runat="server">
    </ajaxtoolkit:AutoCompleteExtender>
</div>
<div class="property_search">
    <asp:DropDownList ID="ddlPropertyType" CssClass="new_1" runat="server">
    </asp:DropDownList>
</div>
<div class="property_search">
    <asp:DropDownList ID="ddlBeds" CssClass="new_2" runat="server">
        <asp:ListItem Value="0" Selected="True">Beds</asp:ListItem>
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
    <asp:DropDownList ID="ddlBaths" CssClass="new_2" runat="server">
        <asp:ListItem Value="0" Selected="True">Baths</asp:ListItem>
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
<div class="property_search">
    <asp:DropDownList ID="ddlMinPrice" runat="server" CssClass="new_2">
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
    <asp:DropDownList ID="ddlMaxPrice" runat="server" CssClass="new_2">
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
<div class="property_search">
    <asp:DropDownList ID="ddlType" CssClass="new_2" runat="server">
    </asp:DropDownList>
</div>
<div>
    <asp:Button ID="btnSearch" runat="server" Text="Search" Style="margin-left: 99px;"
        OnClick="btnSearch_Click" />
</div>
<%
    }
   else if (Session["SearchType"].ToString().Contains("Commercial"))
   {
%>
<h3>
    Property Search</h3>
<div class="property_search">
    Type any City, MLS ID or Postal Code
    <asp:TextBox ID="txtCommSearch" AutoComplete="off" runat="server" CssClass="new_1" Text=""></asp:TextBox>
     <ajaxtoolkit:AutoCompleteExtender ID="AutoCompleteExtender2" CompletionSetCount="10"
        TargetControlID="txtCommSearch" UseContextKey="false" CompletionInterval="0" ServiceMethod="GetAutoCompleteData_Comm"
        CompletionListCssClass="AutoExtender" CompletionListItemCssClass="AutoExtenderList"
        CompletionListHighlightedItemCssClass="AutoExtenderHighlight" MinimumPrefixLength="2"
        Enabled="True" runat="server">
    </ajaxtoolkit:AutoCompleteExtender>
</div>
<div class="property_search">
    <asp:DropDownList ID="ddlCommHome" CssClass="new_1" runat="server">
    </asp:DropDownList>
</div>
<div class="property_search">
    <asp:DropDownList ID="ddlCommBaths" CssClass="new_2" runat="server">
        <asp:ListItem Value="0" Selected="True">Baths</asp:ListItem>
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
    <asp:DropDownList ID="ddlCommMinPrice" runat="server" CssClass="new_2">
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
<div class="property_search">
    <asp:DropDownList ID="ddlCommMaxPrice" runat="server" CssClass="new_2">
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
    <asp:DropDownList ID="ddlCommSaleRent" CssClass="new_2" runat="server">
    </asp:DropDownList>
</div>
<div>
    <asp:Button ID="btnCommSearch" runat="server" Text="Search" Style="margin-left: 99px;"
        OnClick="btnCommSearch_Click" />
</div>
<%
    }
   else if (Session["SearchType"].ToString().Contains("Condo"))
   {
%>
<h3>
    Property Search</h3>
<div class="property_search">
    Type any City, MLS ID or Postal Code
    <asp:TextBox ID="txtCondoSearch" AutoComplete="off" runat="server" CssClass="new_1" Text=""></asp:TextBox>
     <ajaxtoolkit:AutoCompleteExtender ID="AutoCompleteExtender3" CompletionSetCount="10"
        TargetControlID="txtCondoSearch" UseContextKey="false" CompletionInterval="0" ServiceMethod="GetAutoCompleteData_Condo"
        CompletionListCssClass="AutoExtender" CompletionListItemCssClass="AutoExtenderList"
        CompletionListHighlightedItemCssClass="AutoExtenderHighlight" MinimumPrefixLength="2"
        Enabled="True" runat="server">
    </ajaxtoolkit:AutoCompleteExtender>
</div>
<div class="property_search">
    <asp:DropDownList ID="ddlCondoHome" CssClass="new_1" runat="server">
    </asp:DropDownList>
</div>
<div class="property_search">
    <asp:DropDownList ID="ddlCondoBeds" CssClass="new_2" runat="server">
        <asp:ListItem Value="0" Selected="True">Beds</asp:ListItem>
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
    <asp:DropDownList ID="ddlCondoBaths" CssClass="new_2" runat="server">
        <asp:ListItem Value="0" Selected="True">Baths</asp:ListItem>
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
<div class="property_search">
    <asp:DropDownList ID="ddlCondoMinPrice" runat="server" CssClass="new_2">
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
    <asp:DropDownList ID="ddlCondoMaxPrice" runat="server" CssClass="new_2">
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
<div class="property_search">
    <asp:DropDownList ID="ddlCondoType" CssClass="new_2" runat="server">
    </asp:DropDownList>
</div>
<div>
    <asp:Button ID="btnCondoSearch" runat="server" Text="Search" Style="margin-left: 99px;"
        OnClick="btnCondoSearch_Click" />
</div>
<%
    } %>
