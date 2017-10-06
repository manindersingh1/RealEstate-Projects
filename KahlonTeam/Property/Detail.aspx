<%@ Page Title="" Language="C#" MasterPageFile="~/Property.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="Property.Detail" %>
<%@ OutputCache Duration="15" VaryByParam="None" %>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="slider/css/bootstrap.min.css" rel="stylesheet" />
    <link href="slider/css/bootstrap.css" rel="stylesheet" />
    <link href="slider/css/bootstrap-theme.css" rel="stylesheet" />
    <link href="slider/css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="slider/css/media-queries.css" rel="stylesheet" />
    <link href="slider/css/font.css" rel="stylesheet" />
    <link href="slider/css/style.css" rel="stylesheet" />
    <link href="slider/css/ihover.css" rel="stylesheet" />
    <link href="slider/css/ihover.min.css" rel="stylesheet" />
    <link href="slider/css/font-awesome.css" rel="stylesheet" />
    
    <script src="slider/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="slider/js/jquery-1.9.1.min.js"></script>
    <!-- use jssor.slider.mini.js (40KB) instead for release -->
    <!-- jssor.slider.mini.js = (jssor.js + jssor.slider.js) -->
    <script type="text/javascript" src="js/jssor.js"></script>
    <script type="text/javascript" src="js/jssor.slider.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-12 col-sm-12 margin_0">
<div class="container">
      <div class="main_contnt_sct">
            <div class="Residential_section_bg" id="divresidential" runat="server" visible="false">
                <b>
                    <h3>
                        <asp:Label ID="lblresi" src="slider/images/school-img.png"  CssClass="header_middle_1" runat="server" Text="Residential Listings"></asp:Label></h3>
                </b>

                <div class="Residential_section">
                    <div class="Residential_section_box"> 
                        
                        <a href="../Search.aspx?Municipality=Toronto" title="Toronto">
                            <asp:HyperLink ID="hlresi1" runat="server">
                                <asp:Image ID="imgresi1" runat="server" />
                            </asp:HyperLink>
                              <asp:Label ID="resicity1" runat="server">Toronto</asp:Label>
                        </a>
                    </div>
                </div>
                <div class="Residential_section">
                    <div class="Residential_section_box">
                          <a href="../Search.aspx?Municipality=Mississauga" title="Mississauga">
                        <asp:HyperLink ID="hlresi2" runat="server">
                            <asp:Image ID="imgresi2" runat="server" />
                        </asp:HyperLink>
                         <asp:Label ID="resicity2" runat="server">Mississauga</asp:Label>
                               </a>
                    </div>
                </div>
                <div class="Residential_section">
                    <div class="Residential_section_box">
                         <a href="../Search.aspx?Municipality=Brampton" title="Brampton">
                        <asp:HyperLink ID="hlresi3" runat="server">
                            <asp:Image ID="imgresi3" runat="server" />
                        </asp:HyperLink>
                         <asp:Label ID="resicity3" runat="server">Brampton</asp:Label>
                              </a>
                    </div>
                </div>
                <div class="Residential_section">
                    <div class="Residential_section_box">
                        <a href="../Search.aspx?Municipality=Markham" title="Markham">
                        <asp:HyperLink ID="hlresi4" runat="server">
                            <asp:Image ID="imgresi4" runat="server" />
                        </asp:HyperLink>
                           <asp:Label ID="resicity4" runat="server">Markham</asp:Label>
                             </a>
                    </div>
                </div>
            </div>
            <div class="Residential_section_bg" id="divcommercial" runat="server" visible="false">
                <b>
                    <h3>
                        <asp:Label ID="Label2" runat="server" CssClass="header_middle_1" Text="Commercial Listings"></asp:Label></h3>
                </b>
                <div class="Residential_section">
                    <div class="Residential_section_box">
                          <a href="../Search.aspx?Municipality=Toronto" title="Toronto">
                        <asp:HyperLink ID="hlcom1" runat="server">
                            <asp:Image ID="imgcomm1" runat="server" />
                        </asp:HyperLink>
                      <asp:Label ID="commcity1" runat="server">Toronto</asp:Label>
                       </a>
                    </div>
                </div>
                <div class="Residential_section">
                    <div class="Residential_section_box">
                           <a href="../Search.aspx?Municipality=Mississauga" title="Mississauga">
                        <asp:HyperLink ID="hlcom2" runat="server">
                            <asp:Image ID="imgcomm2" runat="server" />
                        </asp:HyperLink>
                     <asp:Label ID="commcity2" runat="server">Mississauga</asp:Label>
                               </a>
                    </div>
                </div>
                <div class="Residential_section">
                    <div class="Residential_section_box">
                      <a href="../Search.aspx?Municipality=Brampton" title="Brampton">
                        <asp:HyperLink ID="hlcom3" runat="server">
                            <asp:Image ID="imgcomm3" src='<%# Eval("pImage")%>' runat="server" />
                        </asp:HyperLink>
                       <asp:Label ID="commcity3" runat="server">Brampton</asp:Label>
                            </a>
                    </div>
                </div>
                <div class="Residential_section">
                    <div class="Residential_section_box">
                          <a href="../Search.aspx?Municipality=Markham  "title="Markham">
                        <asp:HyperLink ID="hlcom4" runat="server">
                            <asp:Image ID="imgcomm4" runat="server" />
                        </asp:HyperLink>
                        <asp:Label ID="commcity4" runat="server">Markham</asp:Label>
                    </div>
                </div>
            </div>
            <div class="Residential_section_bg" id="divcondo" runat="server" visible="false">
                <b>
                    <h3>
                        <asp:Label ID="Label3" CssClass="header_middle_1" runat="server" Text="Condo Listings"></asp:Label></h3>
                </b>
                <div class="Residential_section">
                    <div class="Residential_section_box">
                          <a href="../Search.aspx?Municipality=Toronto" title="Toronto">
                        <asp:HyperLink ID="hlcon1" runat="server">
                            <asp:Image ID="imgcondo1" runat="server" />
                        </asp:HyperLink>
                        <asp:Label ID="condocity1" runat="server">Toronto</asp:Label></a>
                    </div>
                </div>
                <div class="Residential_section">
                    <div class="Residential_section_box">
                              <a href="../Search.aspx?Municipality=Mississauga" title="Mississauga">
                        <asp:HyperLink ID="hlcon2" runat="server">
                            <asp:Image ID="imgcondo2" src='<%# Eval("pImage")%>' runat="server" />
                        </asp:HyperLink>
                         <asp:Label ID="condocity2" runat="server">Mississauga</asp:Label></a>
                    </div>
                </div>
                <div class="Residential_section">
                    <div class="Residential_section_box">
                          <a href="../Search.aspx?Municipality=Brampton" title="Brampton">
                        <asp:HyperLink ID="hlcon3" runat="server">
                            <asp:Image ID="imgcondo3" src='<%# Eval("pImage")%>' runat="server" />
                        </asp:HyperLink>
                         <asp:Label ID="condocity3" runat="server">Brampton</asp:Label></a>
                    </div>
                </div>
                <div class="Residential_section">
                    <div class="Residential_section_box">
                        <a href="../Search.aspx?Municipality=Markham" title="Markham">
                               <asp:HyperLink ID="hlcon4" runat="server">
                                   <asp:Image ID="imgcondo4" runat="server" />
                               </asp:HyperLink>
                             <asp:Label ID="condocity4" runat="server">Markham</asp:Label></a>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </div>
</asp:Content>
