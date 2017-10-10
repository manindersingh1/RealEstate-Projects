<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Landing_control.ascx.cs" Inherits="Property.Controls.Landing_control" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>

<link href="../slider/css/style.css" rel="stylesheet" />
<link href="../css/style_002.css" rel="stylesheet" />
<link href="../css/style.css" rel="stylesheet" />
<link href="../css/shortcodes.css" rel="stylesheet" />

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

<script src="../js/jquery-1.11.1.min.js"></script>
  <script type="text/javascript" src="js/jquery_009.js"></script>
    <script type="text/javascript" src="js/shortcodes.js"></script>
<script>
    $(document).ready(function () {

        var PropertyType = GetParameterValues('PropertyType');
        var Searchtype = GetParameterValues('Searchtype');
        var residential = $('#TabResidential');
        var commercial = $('#TabCommercial');
        var condo = $('#TabCondo');
        divresidential = $('#divresidential');
        divcommercial = $('#divcommercial');
        divcondo = $('#divcondo');
        if (PropertyType == 'Residential' || Searchtype == 'Residential') {
            divresidential.show();
            divcommercial.hide();
            divcondo.hide();
            residential.addClass('current');
            commercial.removeClass('current');
            condo.removeClass('current');
        }
        else if (PropertyType == 'Commercial' || Searchtype == 'Commercial') {
            divresidential.hide();
            divcommercial.show();
            divcondo.hide();
            commercial.addClass('current')
            residential.removeClass('current');
            condo.removeClass('current');
        }
        else if (PropertyType == 'Condo' || Searchtype == 'Condo') {
            divresidential.hide();
            divcommercial.hide();
            divcondo.show();
            condo.addClass('current')
            commercial.removeClass('current')
            residential.removeClass('current');

        }
        alert("Hello " + name + " your ID is " + id);
        function GetParameterValues(param) {
            var url = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
            for (var i = 0; i < url.length; i++) {
                var urlparam = url[i].split('=');
                if (urlparam[0] == param) {
                    return urlparam[1];
                }
            }
        }
    });
</script>  
<div class="property-search-container">
    <div class="dt-sc-tabs-container" style="width: 100%;">
        <div id="divresidential" style="display: block;" class="dt-sc-tabs-frame-content">
            <div class="property-type-module medium-module">
                <label>Type any City, MLSID or PostalCode</label>
                <asp:TextBox CssClass="MainContentSearchBar" ID="txtSearch" runat="server" AutoComplete="off"></asp:TextBox>
                <ajaxtoolkit:AutoCompleteExtender ID="AutoCompleteExtender1" CompletionSetCount="10"
                    TargetControlID="txtSearch" UseContextKey="True" CompletionInterval="0" ServiceMethod="GetAutoCompleteData"
                    CompletionListCssClass="AutoExtender" CompletionListItemCssClass="AutoExtenderList"
                    CompletionListHighlightedItemCssClass="AutoExtenderHighlight" MinimumPrefixLength="2"
                    Enabled="True" runat="server">
                </ajaxtoolkit:AutoCompleteExtender>
            </div>
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" class="searchButton" />
        </div>
    </div>
</div>
  