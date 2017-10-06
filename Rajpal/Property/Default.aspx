<%@ Page Title="" Language="C#" MasterPageFile="~/Property.Master" AutoEventWireup="true"
    ValidateRequest="false" CodeBehind="Default.aspx.cs" Inherits="Property.Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<%@ Register TagName="FeaturedProperties" TagPrefix="uc" Src="~/Controls/FeaturedProperties.ascx" %>
<%@ Register TagName="SearchBar" TagPrefix="uc" Src="~/Controls/SearchBar.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <link href="css/style.css" rel="stylesheet" />
    <link href="css/style_002.css" rel="stylesheet" />
    <link href="css/shortcodes.css" rel="stylesheet" />
    <link href="slider/css/style.css" rel="stylesheet" />
    <script src="js/shortcodes.js"></script>



    <!-- use jssor.slider.mini.js (40KB) instead for release -->
    <!-- jssor.slider.mini.js = (jssor.js + jssor.slider.js) -->

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
        }

        .AutoExtenderHighlight {
            color: White;
            background-color: #006699;
            cursor: pointer;
            width: 257px;
            padding-left: 7px;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <ajaxtoolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </ajaxtoolkit:ToolkitScriptManager>
    <div class="col-md-12 col-sm-12 margin_1">
        <div class="col-md-12 col-sm-12">
              <div class="col-md-9 col-sm-9">
           
                  </div>
            <%--  <div class="col-md-3 col-sm-3">
            <div class="feature_listing">
                <h3>Featured Listings</h3>
                <div class="feature_section_box">
                    <div>
                        <uc:FeaturedProperties ID="FeaturedProperties" runat="server" />
                    </div>                   
                </div>
            </div>
        </div>--%>
            <div class="Residential_section_bg">
                <b>
                    <h3>
                        <asp:Label ID="lblresi" src="slider/images/school-img.png" Style="margin-left: 20px; font-size: larger;" runat="server" Text="Residential Listings"></asp:Label></h3>
                </b>
                <div class="Residential_section">
                    <div class="Residential_section_box">
                        <asp:HyperLink ID="hlresi1" runat="server">
                            <asp:Image ID="imgresi1" runat="server" /> </asp:HyperLink>
                        <h6>
                            <asp:Label ID="lbladdressresi1" runat="server"></asp:Label></h6>
                        <p>
                            <asp:Label ID="resiRemarksForClients1" runat="server"></asp:Label>
                        </p>
                        <div class="property_area">
                            <span>MLS#:      </span>
                            <span>
                                <asp:Label ID="lblresimls1" runat="server"></asp:Label></span>
                        </div>
                        <div class="property_area">
                            <span>Status:       </span>
                            <span>
                                <asp:Label ID="lblresistatus1" runat="server"></asp:Label>
                            </span>
                        </div>
                        <div class="property_area">
                            <span>Type:       </span>
                            <span>
                                <asp:Label ID="lblresitype1" runat="server"></asp:Label>
                            </span>
                        </div>
                        <div class="property_area">
                            <span>List Price:       </span>
                            <span>&nbsp<asp:Label ID="lblresiprice1" runat="server"></asp:Label>
                            </span>
                        </div>

                        <div class="view_detail">
                           
                           <asp:HyperLink  CssClass="btn btn-primary" ID="btnResview1" runat="server">View Details</asp:HyperLink>
                        </div>
                    </div>
                </div>
                <div class="Residential_section">
                    <div class="Residential_section_box">
                       <asp:HyperLink ID="hlresi2" runat="server">
                            <asp:Image ID="imgresi2" runat="server" /></asp:HyperLink>
                        <%--      <asp:ImageButton ID="imgresi1" runat="server" />--%>
                        <h6>
                            <asp:Label ID="lbladdressresi2" runat="server"></asp:Label></h6>
                        <p>
                            <asp:Label ID="resiRemarksForClients2" runat="server"></asp:Label>
                        </p>
                        <div class="property_area">
                            <span>MLS#:      </span>
                            <span>
                                <asp:Label ID="lblresimls2" runat="server"></asp:Label></span>
                        </div>
                        <div class="property_area">
                            <span>Status:       </span>
                            <span>
                                <asp:Label ID="lblresistatus2" runat="server"></asp:Label>
                            </span>
                        </div>
                        <div class="property_area">
                            <span>Type:       </span>
                            <span>
                                <asp:Label ID="lblresitype2" runat="server"></asp:Label>
                            </span>
                        </div>
                        <div class="property_area">
                            <span>List Price:       </span>
                            <span>&nbsp<asp:Label ID="lblresiprice2" runat="server"></asp:Label>
                            </span>
                        </div>

                        <div class="view_detail">
                           <asp:HyperLink  CssClass="btn btn-primary" ID="btnResview2" runat="server">View Details</asp:HyperLink>
                        </div>
                    </div>
                </div>
                <div class="Residential_section">
                    <div class="Residential_section_box">
                       <asp:HyperLink ID="hlresi3" runat="server">
                            <asp:Image ID="imgresi3" runat="server" /></asp:HyperLink>
                        <%--    <asp:Image ID="imgresi3" src='<%# Eval("pImage")%>' runat="server" />--%>
                        <%--      <asp:ImageButton ID="imgresi1" runat="server" />--%>
                        <h6>
                            <asp:Label ID="lbladdressresi3" runat="server"></asp:Label></h6>
                        <p>
                            <asp:Label ID="resiRemarksForClients3" runat="server"></asp:Label>
                        </p>
                        <div class="property_area">
                            <span>MLS#:      </span>
                            <span>
                                <asp:Label ID="lblresimls3" runat="server"></asp:Label></span>
                        </div>
                        <div class="property_area">
                            <span>Status:       </span>
                            <span>
                                <asp:Label ID="lblresistatus3" runat="server"></asp:Label>
                            </span>
                        </div>
                        <div class="property_area">
                            <span>Type:       </span>
                            <span>
                                <asp:Label ID="lblresitype3" runat="server"></asp:Label>
                            </span>
                        </div>
                        <div class="property_area">
                            <span>List Price:       </span>
                            <span>&nbsp<asp:Label ID="lblresiprice3" runat="server"></asp:Label>
                            </span>
                        </div>

                        <div class="view_detail">
                            <asp:HyperLink  CssClass="btn btn-primary" ID="btnResview3" runat="server">View Details</asp:HyperLink>
                                  
                        </div>
                    </div>
                </div>
                <div class="Residential_section">
                    <div class="Residential_section_box">
                       <asp:HyperLink ID="hlresi4" runat="server">
                            <asp:Image ID="imgresi4" runat="server" /></asp:HyperLink>
                        <h6>
                            <asp:Label ID="lbladdressresi4" runat="server"></asp:Label></h6>
                        <p>
                            <asp:Label ID="resiRemarksForClients4" runat="server"></asp:Label>
                        </p>
                        <div class="property_area">
                            <span>MLS#:      </span>
                            <span>
                                <asp:Label ID="lblresimls4" runat="server"></asp:Label></span>
                        </div>
                        <div class="property_area">
                            <span>Status:       </span>
                            <span>
                                <asp:Label ID="lblresistatus4" runat="server"></asp:Label>
                            </span>
                        </div>
                        <div class="property_area">
                            <span>Type:       </span>
                            <span>
                                <asp:Label ID="lblresitype4" runat="server"></asp:Label>
                            </span>
                        </div>
                        <div class="property_area">
                            <span>List Price:       </span>
                            <span>&nbsp<asp:Label ID="lblresiprice4" runat="server"></asp:Label>
                            </span>
                        </div>

                        <div class="view_detail">
                            <asp:HyperLink  CssClass="btn btn-primary" ID="btnResview4" runat="server">View Details</asp:HyperLink>
                                  
                        </div>
                    </div>
                </div>
           </div>
             </div>
            <div class="Residential_section_bg">
                <b>
                    <h3>
                        <asp:Label ID="Label2" runat="server" Style="margin-left: 20px; font-size: larger;" Text="Commercial Listings"></asp:Label></h3>
                </b>
                <div class="Residential_section">

                    <div class="Residential_section_box">
                       <asp:HyperLink ID="hlcom1" runat="server">
                            <asp:Image ID="imgcomm1" runat="server" /> </asp:HyperLink>
                        <h6>
                            <asp:Label ID="commaddress1" runat="server"></asp:Label>
                        </h6>
                        <p>
                            <asp:Label ID="commRemarksForClients1" runat="server"></asp:Label>
                        </p>
                        <div class="property_area">
                            <span>MLS#:      </span>
                            <span>
                                <asp:Label ID="commmls1" runat="server"></asp:Label>
                            </span>

                        </div>
                        <div class="property_area">
                            <span>Status:       </span>
                            <span>
                                <asp:Label ID="commstatus1" runat="server"></asp:Label>
                            </span>

                        </div>
                        <div class="property_area">
                            <span>Type:       </span>
                            <span>
                                <asp:Label ID="commtype1" runat="server"></asp:Label>
                            </span>

                        </div>
                        <div class="property_area">
                            <span>List Price:       </span>
                            <span>&nbsp<asp:Label ID="commprice1" runat="server"></asp:Label>
                            </span>
                        </div>


                        <div class="view_detail">
                            <asp:HyperLink  CssClass="btn btn-primary" ID="btnComview1" runat="server">View Details</asp:HyperLink>
                            
                           
                        </div>


                    </div>
                </div>
                <div class="Residential_section">


                    <div class="Residential_section_box">
                       <asp:HyperLink ID="hlcom2" runat="server">
                            <asp:Image ID="imgcomm2" runat="server" /></asp:HyperLink>
                        <h6>
                            <asp:Label ID="commaddress2" runat="server"></asp:Label>
                        </h6>
                        <p>
                            <asp:Label ID="commRemarksForClients2" runat="server"></asp:Label>
                        </p>
                        <div class="property_area">
                            <span>MLS#:      </span>
                            <span>
                                <asp:Label ID="commmls2" runat="server"></asp:Label>
                            </span>

                        </div>
                        <div class="property_area">
                            <span>Status:       </span>
                            <span>
                                <asp:Label ID="commstatus2" runat="server"></asp:Label>
                            </span>

                        </div>
                        <div class="property_area">
                            <span>Type:       </span>
                            <span>
                                <asp:Label ID="commtype2" runat="server"></asp:Label>
                            </span>

                        </div>
                        <div class="property_area">
                            <span>List Price:       </span>
                            <span>&nbsp<asp:Label ID="commprice2" runat="server"></asp:Label>
                            </span>
                        </div>

                        <div class="view_detail">
                            <asp:HyperLink  CssClass="btn btn-primary" ID="btnComview2" runat="server">View Details</asp:HyperLink>
                        </div>


                    </div>


                </div>
                <div class="Residential_section">


                    <div class="Residential_section_box">
                       <asp:HyperLink ID="hlcom3" runat="server">
                            <asp:Image ID="imgcomm3" src='<%# Eval("pImage")%>' runat="server" /></asp:HyperLink>
                        <h6>
                            <asp:Label ID="commaddress3" runat="server"></asp:Label>
                        </h6>
                        <p>
                            <asp:Label ID="commRemarksForClients3" runat="server"></asp:Label>
                        </p>
                        <div class="property_area">
                            <span>MLS#:      </span>
                            <span>
                                <asp:Label ID="commmls3" runat="server"></asp:Label>
                            </span>

                        </div>
                        <div class="property_area">
                            <span>Status:       </span>
                            <span>
                                <asp:Label ID="commstatus3" runat="server"></asp:Label>
                            </span>

                        </div>
                        <div class="property_area">
                            <span>Type:       </span>
                            <span>
                                <asp:Label ID="commtype3" runat="server"></asp:Label>
                            </span>

                        </div>
                        <div class="property_area">
                            <span>List Price:       </span>
                            <span>&nbsp<asp:Label ID="commprice3" runat="server"></asp:Label>
                            </span>
                        </div>

                        <div class="view_detail">
                            <asp:HyperLink  CssClass="btn btn-primary" ID="btnComview3" runat="server">View Details</asp:HyperLink>
                        </div>


                    </div>


                </div>
                <div class="Residential_section">


                    <div class="Residential_section_box">
                       <asp:HyperLink ID="hlcom4" runat="server">
                            <asp:Image ID="imgcomm4" src='<%# Eval("pImage")%>' runat="server" /></asp:HyperLink>
                        <h6>
                            <asp:Label ID="commaddress4" runat="server"></asp:Label>
                        </h6>
                        <p>
                            <asp:Label ID="commRemarksForClients4" runat="server"></asp:Label>
                        </p>
                        <div class="property_area">
                            <span>MLS#:      </span>
                            <span>
                                <asp:Label ID="commmls4" runat="server"></asp:Label>
                            </span>

                        </div>
                        <div class="property_area">
                            <span>Status:       </span>
                            <span>
                                <asp:Label ID="commstatus4" runat="server"></asp:Label>
                            </span>

                        </div>
                        <div class="property_area">
                            <span>Type:       </span>
                            <span>
                                <asp:Label ID="commtype4" runat="server"></asp:Label>
                            </span>

                        </div>
                        <div class="property_area">
                            <span>List Price:       </span>
                            <span>&nbsp<asp:Label ID="commprice4" runat="server"></asp:Label>
                            </span>
                        </div>

                        <div class="view_detail">
                            <asp:HyperLink  CssClass="btn btn-primary" ID="btnComview4" runat="server">View Details</asp:HyperLink>
                        </div>


                    </div>


                </div>
            </div>
            <div class="Residential_section_bg">
                <b>
                    <h3>
                        <asp:Label ID="Label3" Style="margin-left: 20px; font-size: larger;" runat="server" Text="Condo Listings"></asp:Label></h3>
                </b>
                <div class="Residential_section">
                    <div class="Residential_section_box">
                       <asp:HyperLink ID="hlcon1" runat="server">
                            <asp:Image ID="imgcondo1" runat="server" /></asp:HyperLink>
                        <h6>
                            <asp:Label ID="condoaddress1" runat="server"></asp:Label>
                        </h6>
                        <p>
                            <asp:Label ID="condoRemarksForClients1" runat="server"></asp:Label>
                        </p>
                        <div class="property_area">
                            <span>MLS#:      </span>
                            <span>
                                <asp:Label ID="condomls1" runat="server"></asp:Label>
                            </span>

                        </div>
                        <div class="property_area">
                            <span>Status:       </span>
                            <span>
                                <asp:Label ID="condostatus1" runat="server"></asp:Label>
                            </span>

                        </div>
                        <div class="property_area">
                            <span>Type:       </span>
                            <span>
                                <asp:Label ID="condotype1" runat="server"></asp:Label>
                            </span>

                        </div>
                        <div class="property_area">
                            <span>List Price:       </span>
                            <span>&nbsp<asp:Label ID="condoprice1" runat="server"></asp:Label>
                            </span>
                        </div>

                        <div class="view_detail">
                           <asp:HyperLink  CssClass="btn btn-primary" ID="btnConview1" runat="server">View Details</asp:HyperLink>
                        </div>


                    </div>
                </div>
                <div class="Residential_section">
                    <div class="Residential_section_box">
                      <asp:HyperLink ID="hlcon2" runat="server">
                            <asp:Image ID="imgcondo2" src='<%# Eval("pImage")%>' runat="server" />
                          </asp:HyperLink>
                        <h6>
                            <asp:Label ID="condoaddress2" runat="server"></asp:Label>
                        </h6>
                        <p>
                            <asp:Label ID="condoRemarksForClients2" runat="server"></asp:Label>
                        </p>
                        <div class="property_area">
                            <span>MLS#:      </span>
                            <span>
                                <asp:Label ID="condomls2" runat="server"></asp:Label>
                            </span>

                        </div>
                        <div class="property_area">
                            <span>Status:       </span>
                            <span>
                                <asp:Label ID="condostatus2" runat="server"></asp:Label>
                            </span>

                        </div>
                        <div class="property_area">
                            <span>Type:       </span>
                            <span>
                                <asp:Label ID="condotype2" runat="server"></asp:Label>
                            </span>

                        </div>
                        <div class="property_area">
                            <span>List Price:       </span>
                            <span>&nbsp<asp:Label ID="condoprice2" runat="server"></asp:Label>
                            </span>
                        </div>

                        <div class="view_detail">
                             <asp:HyperLink  CssClass="btn btn-primary" ID="btnConview2" runat="server">View Details</asp:HyperLink>
                           
                        </div>


                    </div>
                </div>
                <div class="Residential_section">
                    <div class="Residential_section_box">
                        <asp:HyperLink ID="hlcon3" runat="server">
                            <asp:Image ID="imgcondo3" src='<%# Eval("pImage")%>' runat="server" />
                            </asp:HyperLink>
                        <h6>
                            <asp:Label ID="condoaddress3" runat="server"></asp:Label>
                        </h6>
                        <p>
                            <asp:Label ID="condoRemarksForClients3" runat="server"></asp:Label></p>
                        <div class="property_area">
                            <span>MLS#:      </span>
                            <span>
                                <asp:Label ID="condomls3" runat="server"></asp:Label>
                            </span>
                        </div>
                        <div class="property_area">
                            <span>Status:       </span>
                            <span>
                                <asp:Label ID="condostatus3" runat="server"></asp:Label>
                            </span>

                        </div>
                        <div class="property_area">
                            <span>Type:       </span>
                            <span>
                                <asp:Label ID="condotype3" runat="server"></asp:Label>
                            </span>
                        </div>
                        <div class="property_area">
                            <span>List Price:       </span>
                            <span>&nbsp<asp:Label ID="condoprice3" runat="server"></asp:Label>
                            </span>
                        </div>
                        <div class="view_detail">
                            <asp:HyperLink  CssClass="btn btn-primary" ID="btnConview3" runat="server">View Details</asp:HyperLink>
                           
                        </div>
                    </div>
                </div>
                <div class="Residential_section">
                    <div class="Residential_section_box">
                        <asp:HyperLink ID="hlcon4" runat="server">
                            <asp:Image ID="imgcondo4" src='<%# Eval("pImage")%>' runat="server" />
                            </asp:HyperLink>
                        <h6>
                            <asp:Label ID="condoaddress4" runat="server"></asp:Label>
                        </h6>
                        <p>
                            <asp:Label ID="condoRemarksForClients4" runat="server"></asp:Label></p>
                        <div class="property_area">
                            <span>MLS#:      </span>
                            <span>
                                <asp:Label ID="condomls4" runat="server"></asp:Label>
                            </span>
                        </div>
                        <div class="property_area">
                            <span>Status:       </span>
                            <span>
                                <asp:Label ID="condostatus4" runat="server"></asp:Label>
                            </span>

                        </div>
                        <div class="property_area">
                            <span>Type:       </span>
                            <span>
                                <asp:Label ID="condotype4" runat="server"></asp:Label>
                            </span>
                        </div>
                        <div class="property_area">
                            <span>List Price:       </span>
                            <span>&nbsp<asp:Label ID="condoprice4" runat="server"></asp:Label>
                            </span>
                        </div>
                        <div class="view_detail">
                            <asp:HyperLink  CssClass="btn btn-primary" ID="btnConview4" runat="server">View Details</asp:HyperLink>    
                        </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
