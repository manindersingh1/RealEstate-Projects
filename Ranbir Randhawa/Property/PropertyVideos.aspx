<%@ Page Title="" Language="C#" MasterPageFile="~/PropertyNew.Master" AutoEventWireup="true"
    CodeBehind="PropertyVideos.aspx.cs" Inherits="Property.PropertyVideos" %>

<%@ Register Src="~/Controls/PropertyVideo.ascx" TagPrefix="uc1" TagName="PropertyVideo" %>



<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <uc1:PropertyVideo runat="server" id="PropertyVideo" />

    </div>
</asp:Content>
