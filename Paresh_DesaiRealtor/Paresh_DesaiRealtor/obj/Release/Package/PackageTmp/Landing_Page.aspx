<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/landing_master.Master" CodeBehind="landing_page.aspx.cs" Inherits="Property.landing_page" %>

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
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDxw4-H4Y1ig9brfwS9Qwt8wCNE96ueVhE&libraries=places,geometry"></script>
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
            <div  class="main-container bg clearfix ">
                <div style="padding-top: 76.2px;" class="addre-box-header">
                    <div class="landing_logo">
                          <figure class="logo">
                    <uc:Logo ID="logo" runat="server" />
                </figure>
                    </div>
                    <h1 id="siteLiveHomePageMainTitle">Want to know what your neighbours are selling!</h1>
                    <div class="header-addre-form">
                         <input type="text" id="search" class="MainContentSearchBar" runat="server" placeholder="Enter a location" />
                        <asp:Button ID="addre_submit" runat="server" OnClick="addre_submit_Click"  Text="Submit" class="green-btn large" />
                    </div>
                    <h2 id="siteLiveHomePageSmallerTitle">Want to know when your neighbours are selling &amp; for how much, we'll tell you as soon as it goes on the market.</h2>
                </div>
            </div>
        </div>

</asp:Content>