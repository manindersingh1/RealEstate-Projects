<%@ Page Title="" Language="C#" MasterPageFile="~/PropertyNew.Master" AutoEventWireup="true"
    ValidateRequest="false" CodeBehind="Search.aspx.cs" Inherits="Property.Search" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<%@ Register TagName="PropertySearch" TagPrefix="uc" Src="~/Controls/PropertySearch.ascx" %>
<%@ Register TagName="ContactInfo" TagPrefix="uc" Src="~/Controls/ContactInfo.ascx" %>
<%@ Register TagName="SearchControl" TagPrefix="uc" Src="~/Controls/SearchControl.ascx" %>
<%@ Register TagName="SearchBar" TagPrefix="uc" Src="~/Controls/SearchBar.ascx" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<%--    <link href="slider/css/bootstrap.min.css" rel="stylesheet" />
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
    <script type="text/javascript" src="js/jssor.slider.js"></script>--%>
    <%--<ajaxtoolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </ajaxtoolkit:ToolkitScriptManager>--%>
        <div >
    <div class="left_section_bg">

        <div class="left_section_in_5">
            <div class="box5">
 
                <div class="In_bg">
                    <uc:SearchBar ID="SearchBar" runat="server" />
                </div>
             
                <div class="In_bg">
                    <uc:SearchControl ID="SearchControl" runat="server" />
                </div>
            </div>
        </div>
    </div>
            </div>
</asp:Content>
