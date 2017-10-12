<%@ Page Title="" Language="C#" MasterPageFile="~/landing_master.Master" AutoEventWireup="true" CodeBehind="Find_Home_Worth.aspx.cs" Inherits="Property.Find_Home_Worth" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<%@ Register TagName="Logo" TagPrefix="uc" Src="~/Controls/logo.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
 <link id="favicon" runat="server" rel="shortcut icon" type="image/x-icon" />
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>
        <asp:Literal ID="siteTitle" runat="server"></asp:Literal></title>
    <link rel="stylesheet" href="css/main.css" />
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
    <script type="text/javascript">
        google.maps.event.addDomListener(window, 'load', function () {
            var places = new google.maps.places.Autocomplete(document.getElementById('MainContent_search'));
            google.maps.event.addListener(places, 'place_changed', function () {
            });
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="main-wrap" class="clearfix">
        <div class="main-container bg clearfix ">
            <div style="padding-top: 76.2px;" class="addre-box-header">
                <div class="landing_logo">
                    <figure class="logo">
                        <uc:Logo ID="logo" runat="server" />
                    </figure>
                </div>
                <h1 id="siteLiveHomePageMainTitle">What Is your House Worth</h1>
                <h3>Get instant Free Online Home Evaluation</h3>
                <h2><span class="line">&nbsp;</span><span id="siteLiveHomePageSmallerTitle1">Home Prices are Up 19%</span><span class="line">&nbsp;</span></h2>
                <div class="header-addre-form">
                    <input type="text" id="search" class="MainContentSearchBar" runat="server" placeholder="Type your address and submit" />
                    <asp:Button ID="addre_submit" runat="server" OnClick="addre_submit_Click" Text="Submit" CssClass="green-btn large" />
                </div>
                <h2 id="siteLiveHomePageSmallerTitle">See your Zestimate and recently sold properties like yours.</h2>
            </div>
        </div>
    </div>
</asp:Content>
