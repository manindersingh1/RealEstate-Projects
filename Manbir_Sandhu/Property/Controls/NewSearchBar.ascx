<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewSearchBar.ascx.cs" Inherits="Property.Controls.NewSearchBar" %>
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

    <div class="property-search-container">
        <div class="dt-sc-tabs-container" style="width: 100%;">
         
            <div style="display: block;" class="dt-sc-tabs-frame-content">
                <div class="property-type-module medium-module">
                    <label>Type any City, MLS ID or Postal Code</label>
                    <asp:TextBox CssClass="MainContentSearchBar" ID="txtSearch" runat="server" AutoComplete="off"></asp:TextBox>
                         <ajaxtoolkit:FilteredTextBoxExtender ID="fltrtitle" runat="server" TargetControlID="txtSearch" FilterMode="InvalidChars" FilterType="LowercaseLetters,UppercaseLetters,custom" ValidChars="<,>" ></ajaxtoolkit:FilteredTextBoxExtender>
                    <ajaxtoolkit:AutoCompleteExtender ID="AutoCompleteExtender1" CompletionSetCount="10"
                        TargetControlID="txtSearch" UseContextKey="True" CompletionInterval="0" ServiceMethod="GetAutoCompleteData"
                        CompletionListCssClass="AutoExtender" CompletionListItemCssClass="AutoExtenderList"
                        CompletionListHighlightedItemCssClass="AutoExtenderHighlight" MinimumPrefixLength="2"
                        Enabled="True" runat="server">
                    </ajaxtoolkit:AutoCompleteExtender>    
                </div>
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
            </div>
        </div>
    </div>
  
