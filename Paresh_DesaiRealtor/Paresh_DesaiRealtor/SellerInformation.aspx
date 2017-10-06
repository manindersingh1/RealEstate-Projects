<%@ Page Title="" Language="C#" MasterPageFile="~/PropertyNew.Master" AutoEventWireup="true"
    CodeBehind="SellerInformation.aspx.cs" Inherits="Property.SellerInformation" %>
<%@ Register TagName="SearchBar" TagPrefix="uc" Src="~/Controls/SearchBar.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
     <link rel="stylesheet" href="slider/css/default.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="slider/css/light.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="slider/css/dark.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="slider/css/bar.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="slider/css/nivo-slider.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="slider/css/style.css" type="text/css" media="screen" />
    <link href="slider/css/jquery.bxslider.css" rel="stylesheet" />
    <link href="slider/css/media-queries.css" rel="stylesheet" />
    <link href="slider/css/ihover.min.css" rel="stylesheet" />
    <link href="slider/css/ihover.css" rel="stylesheet" />
    <link href="slider/css/font.css" rel="stylesheet" />
    <link href="slider/css/font-awesome.css" rel="stylesheet" />
    <link href="slider/css/bootstrap.min.css" rel="stylesheet" />
    <link href="slider/css/bootstrap.css" rel="stylesheet" />
    <link href="slider/css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="slider/css/bootstrap-theme.css" rel="stylesheet" />
    <link href="slider/css/style.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/style_002.css" rel="stylesheet" />
    <link href="css/shortcodes.css" rel="stylesheet" />
     <div>
        <%--  <div class="property-search-container">
               <uc:SearchBar ID="SearchBar" runat="server" />
    </div>--%>
         <div class="wrapper_new">
    <div class="Free-Home_new">

         
        <div class="sell_house">
            <h3>
                <a href="SellingyourHouse.aspx" target="_blank">Selling your House</a></h3>
            <p>
                Completing a Listing AgreementWhat is a Listing Agreement? It is a contract between
                you and the brokerage company that the agent represents.It is a framework for subsequent
                forms and negotiations. It’...</p>
            <a href="SellingyourHouse.aspx" target="_blank">...Detail</a></div>
        <div class="sell_house">
            <h3>
                <a href="RenovatingResale.aspx" target="_blank">Renovating for resale</a></h3>
            <p>
                The money invested in improving your home will not always translate into an equivalent
                return in the selling price of your home. So careful planning is important if you
                want to increase the salability...</p>
            <a href="RenovatingResale.aspx" target="_blank">...Detail</a>
        </div>
        <div class="sell_house">
            <h3>
                <a href="CommonSellingMistakes.aspx" target="_blank">Common Selling Mistakes</a></h3>
            <p>
                Incorrect PricingEvery seller naturally wants to get the most money for his or her
                product. The most common mistake that causes sellers to get less than they hope
                for, however, is listing too high. L...</p>
            <a href="CommonSellingMistakes.aspx" target="_blank">...Detail</a></div>
    </div>
             </div>
         </div>
</asp:Content>
