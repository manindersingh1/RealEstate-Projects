<%@ Page Title="" Language="C#" MasterPageFile="~/property_landing_page.Master" AutoEventWireup="true" CodeBehind="SearchProperty.aspx.cs" Inherits="Property.SearchProperty" %>
<%@ Register TagName="NewSearchBar" TagPrefix="uc"  Src="~/Controls/NewSearchBar.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <link href="slider/css/bootstrap.min.css" rel="stylesheet" />
    <link href="slider/css/bootstrap.css" rel="stylesheet" />
    <link href="slider/css/bootstrap-theme.css" rel="stylesheet" />
    <link href="slider/css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="slider/css/media-queries.css" rel="stylesheet" />
    <link href="slider/css/font.css" rel="stylesheet" />
    <link href="slider/css/ihover.css" rel="stylesheet" />
    <link href="slider/css/ihover.min.css" rel="stylesheet" />
    <link href="slider/css/font-awesome.css" rel="stylesheet" />
    <script src="slider/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="slider/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="js/jssor.js"></script>
    <script type="text/javascript" src="js/jssor.slider.js"></script>
    <script type="text/javascript" src="slider/js/jquery-1.9.1.min.js"></script>
    <ajaxtoolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </ajaxtoolkit:ToolkitScriptManager>
        <div class="left_section_bg">
               
        <div>
            <div>
               <div class="In_bg">
        <uc:NewSearchBar ID="NewSearchBar" runat="server" />
    </div>
               
            </div>
        </div>
    </div>
</asp:Content>
