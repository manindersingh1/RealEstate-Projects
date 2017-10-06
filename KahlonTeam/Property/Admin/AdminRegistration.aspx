<%@ Page Title="" Language="C#" MasterPageFile="~/Property.Master" AutoEventWireup="true"
    CodeBehind="AdminRegistration.aspx.cs" Inherits="Property.Admin.AdminRegistration" %>
<%@ Register TagName="AdminRegistration" TagPrefix="uc" Src="~/Controls/Registration.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">      
    <uc:AdminRegistration ID="AdminReg" runat="server">
    </uc:AdminRegistration>
</asp:Content>
