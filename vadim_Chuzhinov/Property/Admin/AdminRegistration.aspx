<%@ Page Title="" Language="C#" MasterPageFile="~/Property.Master" AutoEventWireup="true"
    CodeBehind="AdminRegistration.aspx.cs" Inherits="Property.Admin.AdminRegistration" %>
<%@ Register TagName="AdminRegistration" TagPrefix="uc" Src="~/Controls/Registration.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
  <%-- <link href="../css/style_002.css" rel="stylesheet" />--%>
    <link href="../slider/css/style.css" rel="stylesheet" />
    <link href="../css/shortcodes.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">      
    <uc:AdminRegistration ID="AdminReg" runat="server">
    </uc:AdminRegistration>
</asp:Content>
