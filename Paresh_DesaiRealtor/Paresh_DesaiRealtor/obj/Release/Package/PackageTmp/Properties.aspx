<%@ Page Title="" Language="C#" MasterPageFile="~/Property.Master" AutoEventWireup="true"
    CodeBehind="Properties.aspx.cs" Inherits="Property.Properties" %>

<%@ Register TagName="PropertySearch" TagPrefix="uc" Src="~/Controls/PropertySearch.ascx" %>
<%@ Register TagName="ContactInfo" TagPrefix="uc" Src="~/Controls/ContactInfo.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <div class="wrapper_new">
        <div class="Contact_US">
            <div class="dt-sc-tabs-frame">
                <h2 class="head_1 "  style="margin: 9px 0px 2px 40px;">
                    <span>Featured Properties</span></h2>
            </div>
            <div class="search_in" style="margin: 10px 0 0 0px">
                <asp:Repeater ID="rptFeaturedProperties" runat="server">
                    <HeaderTemplate>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="search_bg">
                            <div class="top_section">
                                <span><a href='PropertyDetails.aspx?MLSID=<%# Eval("MLS")%>&PropertyType=<%#Eval("pType") %>'>
                                    <%# Eval("Style")%>
                                    in
                                    <%# Eval("Area")%></a></span>
                                <p>
                                    <%# Eval("Address") %>,
                                    <%# Eval("StreetName") %>,<%# Eval("PostalCode")%></p>
                                <a href='PropertyDetails.aspx?MLSID=<%# Eval("MLS")%>&PropertyType=<%#Eval("pType") %>'>$<%# Eval("ListPrice")%></a>
                            </div>
                            <div class="middle_Section">
                                <div class="img_box">
                                    <a href='PropertyDetails.aspx?MLSID=<%# Eval("MLS")%>&PropertyType=<%#Eval("pType") %>'>
                                        <img height="150px" src='<%# Eval("pImage")%>' alt='<%# Eval("Style")%> in <%# Eval("Area")%>'></a>
                                </div>
                                <div class="img_content">
                                    <p>
                                        <%# GetPropertyDetails(Eval("Extras").ToString(), Eval("MLS").ToString()) %></p>
                                </div>
                                <div class="area">
                                    <span>
                                        <%# Eval("ApproxSquareFootage")%>/m<sup>2</sup></span>
                                    <p>
                                        Area</p>
                                </div>
                                <div class="area">
                                    <span>
                                        <%# Eval("Bedrooms")%></span>
                                    <p>
                                        Beds</p>
                                </div>
                                <div class="area">
                                    <span>
                                        <%# Eval("Washrooms")%></span>
                                    <p>
                                        Baths</p>
                                </div>
                                <div class="area">
                                    <span>
                                        <%# Eval("FamilyRoom")%></span>
                                    <p>
                                        Room</p>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                   
                    <AlternatingItemTemplate>
                        <div class="search_bg1">
                            <div class="top_section">
                                <span><a href='PropertyDetails.aspx?MLSID=<%# Eval("MLS")%>&PropertyType=<%#Eval("pType") %>'>
                                    <%# Eval("Style")%>
                                    in
                                    <%# Eval("Area")%></a></span>
                                <p>
                                    <%# Eval("Address") %>,
                                    <%# Eval("StreetName") %>,<%# Eval("PostalCode")%></p>
                                <a href='PropertyDetails.aspx?MLSID=<%# Eval("MLS")%>&PropertyType=<%#Eval("pType") %>'>$<%# Eval("ListPrice")%></a>
                            </div>
                            <div class="middle_Section">
                                <div class="img_box">
                                    <a href='PropertyDetails.aspx?MLSID=<%# Eval("MLS")%>&PropertyType=<%#Eval("pType") %>'>
                                        <img height="150px" src='<%# Eval("pImage")%>' alt='<%# Eval("Style")%> in <%# Eval("Area")%>' title="Area"></a>
                                </div>
                                <div class="img_content">
                                    <p>
                                        <%# GetPropertyDetails(Eval("Extras").ToString(), Eval("MLS").ToString()) %></p>
                                </div>
                                <div class="area">
                                    <span>
                                        <%# Eval("ApproxSquareFootage")%>/m<sup>2</sup></span>
                                    <p>
                                        Area</p>
                                </div>
                                <div class="area">
                                    <span>
                                        <%# Eval("Bedrooms")%></span>
                                    <p>
                                        Beds</p>
                                </div>
                                <div class="area">
                                    <span>
                                        <%# Eval("Washrooms")%></span>
                                    <p>
                                        Baths</p>
                                </div>
                                <div class="area">
                                    <span>
                                        <%# Eval("FamilyRoom")%></span>
                                    <p>
                                        Room</p>
                                </div>
                            </div>
                            <span>
                                <%# CheckVirtualTour(Eval("VirtualTourURL").ToString()) %>
                            </span>
                        </div>
                    </AlternatingItemTemplate>
                </asp:Repeater>
            </div>
            <div class="search_right_new">
                <section class="search_right_Property">
            <uc:PropertySearch id="PropertySearch" runat="Server"></uc:PropertySearch>           
        </section>
         <%--       <section class="search_right_Property">
            <uc:ContactInfo id="ContactInfo" runat="Server"></uc:ContactInfo>
        </section>--%>
            </div>
        </div>
    </div>
</asp:Content>
