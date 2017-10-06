<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="landing_page.aspx.cs" Inherits="Property.landing_page" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<%@ Register TagName="Logo" TagPrefix="uc" Src="~/Controls/logo.ascx" %>
<!DOCTYPE html>
<html class="no-js"><!--<![endif]-->
<head>
  <link id="favicon" runat="server" rel="shortcut icon" type="image/x-icon" />
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><asp:Literal ID="siteTitle" runat="server"></asp:Literal></title> 
    <link rel="stylesheet" href="css/main.css">
    <style type="text/css">
    .AutoExtender {
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
    .AutoExtenderList {
        cursor: pointer;
        color: Black;
        width: 257px;
        padding-left: 7px;
        list-style-type:none;
    }
    .AutoExtenderHighlight {
        color: White;
        background-color: #006699;
        cursor: pointer;
        width: 257px;
        padding-left: 7px;
    }
</style>
</head>
<body>
    <form id="jj" runat="server">
        <div id="main-wrap" class="clearfix">
            <ajaxtoolkit:ToolkitScriptManager ID="fdsf" runat="server"></ajaxtoolkit:ToolkitScriptManager>
            <div class="main-container bg clearfix ">
                <div style="padding-top: 76.2px;" class="addre-box-header">
                    <div class="landing_logo">
                        <figure class="logo">
                            <uc:Logo ID="logo" runat="server" />
                        </figure>
                    </div>
                    <h1 id="siteLiveHomePageMainTitle">Want to know what your neighbours are selling!</h1>
                    <div class="header-addre-form">
                        <asp:TextBox CssClass="MainContentSearchBar" ID="search_term" runat="server" AutoComplete="off"></asp:TextBox>
                        <ajaxtoolkit:AutoCompleteExtender ID="AutoCompleteExtender1" CompletionSetCount="10"
                            TargetControlID="search_term" UseContextKey="True" CompletionInterval="0" ServiceMethod="GetAutoCompleteData"
                            CompletionListCssClass="AutoExtender" CompletionListItemCssClass="AutoExtenderList"
                            CompletionListHighlightedItemCssClass="AutoExtenderHighlight" MinimumPrefixLength="2"
                            Enabled="True" runat="server">
                        </ajaxtoolkit:AutoCompleteExtender>
                        <asp:Button ID="addre_submit" runat="server" OnClick="addre_submit_Click" Text="Submit" class="green-btn large" />
                    </div>
                    <h2 id="siteLiveHomePageSmallerTitle">Want to know when your neighbours are selling &amp; for how much, we'll tell you as soon as it goes on the market.</h2>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
