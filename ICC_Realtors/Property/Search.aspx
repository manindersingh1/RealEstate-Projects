<%@ Page Title="" Language="C#" MasterPageFile="~/PropertyNew.Master" AutoEventWireup="true"
    ValidateRequest="false" CodeBehind="Search.aspx.cs" Inherits="Property.Search" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<%@ Register TagName="PropertySearch" TagPrefix="uc" Src="~/Controls/PropertySearch.ascx" %>
<%@ Register TagName="ContactInfo" TagPrefix="uc" Src="~/Controls/ContactInfo.ascx" %>
<%@ Register TagName="SearchControl" TagPrefix="uc" Src="~/Controls/SearchControl.ascx" %>
<%@ Register TagName="SearchBar" TagPrefix="uc" Src="~/Controls/SearchBar.ascx" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ajaxtoolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </ajaxtoolkit:ToolkitScriptManager>
    <div>
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
