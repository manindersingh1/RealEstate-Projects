<%@ Page Title="" Language="C#" MasterPageFile="~/Property.Master" AutoEventWireup="true" CodeBehind="Searchbar.aspx.cs" Inherits="Property.Searchbar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">


<%@ Register TagName="SearchBar" TagPrefix="uc" Src="~/Controls/SearchBar.ascx" %>


<html xmlns="http://www.w3.org/1999/xhtml">
        <link href="slider/css/style.css" rel="stylesheet" />
    <link href="css/style_002.css" rel="stylesheet" />
    <link href="css/shortcodes.css" rel="stylesheet" />
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
   <div class="property-search-container">
               <uc:SearchBar ID="SearchBar" runat="server" />
    </div>
    </div>
    </form>
</body>
</html>

</asp:Content>

