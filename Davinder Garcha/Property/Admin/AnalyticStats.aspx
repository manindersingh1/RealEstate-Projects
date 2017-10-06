<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true"
    CodeBehind="AnalyticStats.aspx.cs" Inherits="Property.Admin.AnalyticStats" %>

<%@ Register Assembly="Google Analytics Desbord Controls" Namespace="GADCAPI" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="margin: 15px 0 0 30px">
        <cc1:VisitorsOverview ID="VisitorsOverview1" runat="server">
        </cc1:VisitorsOverview>
    </div>
    <br />
    <br />
    <br />
    <div style="margin: 15px 0 0 30px">
        <cc1:ContentOverview ID="ContentOverview1" runat="server" BackColor="White" 
            BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            FromDate="" ToDate="12/31/9999 23:59:59">
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </cc1:ContentOverview>
    </div>
    <br />
    <br />
    <br />
    <div style="margin: 15px 0 0 30px">
        <cc1:TrafficSourcesOverview ID="TrafficSourceOverview1" runat="server">
        </cc1:TrafficSourcesOverview>
    </div>
    <br />
    <br />
    <br />
    <div style="margin: 15px 0 0 30px">
        <cc1:WorldMap ID="WorldMap1" runat="server">
        </cc1:WorldMap>
    </div>
</asp:Content>
