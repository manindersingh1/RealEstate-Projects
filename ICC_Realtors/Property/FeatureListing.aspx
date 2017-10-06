<%@ Page Title="" Language="C#" MasterPageFile="~/PropertyNew.Master" AutoEventWireup="true"
    CodeBehind="FeatureListing.aspx.cs" Inherits="Property.FeatureListing" %>
<%@ Register TagName="SearchBar" TagPrefix="uc" Src="~/Controls/SearchBar.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
       <link href="slider/css/style.css" rel="stylesheet" />
    <link href="css/style_002.css" rel="stylesheet" />
    <link href="css/shortcodes.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="FeatureId" visible="false" runat="server">
        <div class="left_section_in_5">
            <div class="box5">
                <h2>Featured Properties</h2>
                <asp:DataList ID="dlFeatured" runat="server" RepeatColumns="3" RepeatLayout="Flow"
                    OnItemCommand="dlFeatured_ItemCommand1">
                    <ItemTemplate>
                        <div class="search_boxx_list_5">
                            <div class="search_boxx_right_bg">
                                <a href='PropertyDetails.aspx?MLSID=<%# Eval("MLS")%>&PropertyType=<%#Eval("pType") %>'>
                                    <div class="search_boxx_left">
                                        <img src='<%# Eval("pImage")%>' alt="FeaturedProperty" title="Featured Property" />
                                    </div>
                                </a><span><a href='PropertyDetails.aspx?MLSID=<%# Eval("MLS")%>&PropertyType=<%#Eval("pType") %>'
                                    title="Property Detail">
                                    <%# Eval("Address") %>,<%# Eval("PostalCode")%></a></span><div class="para">
                                        <p>
                                            <%# GetText(Eval("RemarksForClients").ToString())%>
                                        </p>
                                    </div>
                            </div>
                            <div class="search_boxx_right_bg_2">
                                <span>$<%# Eval("ListPrice")%></span><br />
                                <div class="detl">
                                    <ul>
                                        <li><b>MLS:</b> #<%# Eval("MLS") %></li>
                                        <li><b>Status:</b>
                                            <%# Eval("SaleLease")%></li>
                                        <li><b>Type:</b>
                                            <%# Eval("TypeOwn1Out")%>
                                        </li>
                                        <li><b>Beds:</b>
                                            <%# Eval("Bedrooms")%><li>
                                                <li><b>Baths:</b><%# Eval("Washrooms")%></li>
                                                <li><b>Area:</b>
                                                    <asp:Panel ID="Panel1" runat="server" Visible='<%# Eval("ApproxSquareFootage").ToString() != "null"?true:false%>'>
                                                        <%# Eval("ApproxSquareFootage")%>
                                                    </asp:Panel>
                                                    Sq Ft</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="favorate">
                                <div class="inform_list">
                                    <div class="infor_list">
                                        <p><a href="#"><i class="fa fa-pencil-square-o"></i></a></p>
                                        <span>
                                            <a href="ScheduleAppointment.aspx" title="Appointment">Appointment</a>
                                        </span>
                                    </div>
                                    <div class="infor_list_2">
                                        <p><a href="#"><i class="fa fa-star"></i></a></p>
                                        <span id="favouriteSpan" runat="server">Add to Favourite</span>
                                    </div>
                                    <div class="infor_list_3">
                                        <p><a href="#"><i class="fa fa-envelope-o"></i></a></p>
                                        <span><a href="../Email_Listing.aspx?MLSID=<%# Eval("MLS") %>&PropertyType=<%# Eval("pType") %>"
                                            title="Send Email">Email</a></span>
                                    </div>
                                    <div class="infor_list_3">
                                        <p><a href="#"><i class="fa fa-info-circle"></i></a></p>
                                        <span><a href="../PropertyDetails.aspx?MLSID=<%# Eval("MLS") %>&PropertyType=<%# Eval("pType") %>"
                                            title="More Details..">More..</a></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
    </div>
</asp:Content>
