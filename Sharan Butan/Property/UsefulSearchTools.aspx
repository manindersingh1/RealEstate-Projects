<%@ Page Title="" Language="C#" MasterPageFile="~/Property_New.Master" AutoEventWireup="true"
    CodeBehind="UsefulSearchTools.aspx.cs" Inherits="Property.UsefulSearchTools" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="slider/css/style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="wrapper_new">
        <div class="Free-Home_new">
            <div class="SearchTool">
                <h2>Useful Search Tools</h2>
            </div>
            <ul>
                <li>
                    <a target="_blank" href="http://www.canadapost.ca/cpotools/apps/fpc/personal/findAnAddress?execution=e3s1">Postal Code to Address</a>
                </li>
                <li>
                    <a target="_blank" href="http://www.canadapost.ca/cpotools/apps/fpc/personal/findByCity?execution=e1s1">Find a Postal Code</a>
                </li>
                <li>
                    <a target="_blank" href="http://www.tdsb.on.ca/about_us/street_guide/street.asp">Toronto
                    Find Your School</a>
                </li>
                <li>
                    <a target="_blank" href="http://www.tdsb.on.ca/about_us/street_guide/street.asp">Toronto
                    Find School Attendance Area</a>
                </li>
                <li>
                    <a target="_blank" href="http://www.canada411.ca/postal-code-lookup/">Postal Code to
                    Telephone</a>
                </li>
                <li>
                    <a target="_blank" href="http://www.canada411.ca/search/address.html">Reverse Address
                    Lookup to Telephone</a>
                </li>
            </ul>
        </div>
    </div>
</asp:Content>
