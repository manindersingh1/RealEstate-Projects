<%@ Page Title="" Language="C#" MasterPageFile="~/Property.Master" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="Property.WebForm3" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<%@ Register TagName="FeaturedProperties" TagPrefix="uc" Src="~/Controls/FeaturedProperties.ascx" %>
<%@ Register TagName="SearchBar" TagPrefix="uc" Src="~/Controls/SearchBar.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

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
   

 
        <div class="col-md-12 col-sm-12 margin_0">
            <div class="col-md-9 col-sm-9">
                <div class="wrapper_top">
                    <div class="top_section_services">
                        <div class="ih-item square effect4">
                            <a href="#">
                                <div class="img"><img src="slider/images/search-img.png" alt=""></div>
                                <div class="mask1"></div>
                                <div class="mask2"></div>
                                <div class="info">
                                    <h3>Search Propeties</h3>
                                    <p>These are three dimensional letters and are usually illuminated</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="top_section_services">
                        <div class="ih-item square effect4">
                            <a href="#">
                              
                                <div class="img">
                                    <img src="slider/images/calculator-img.png" alt="">
                                </div>
                                <div class="mask1"></div>
                                <div class="mask2"></div>
                                <div class="info">
                                    <h3>Calculator</h3>
                                    <p>These are three dimensional letters and are usually illuminated</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="top_section_services">
                        <div class="ih-item square effect4">
                            <a href="#">
                                <div class="img"><img src="slider/images/school-img.png" alt=""></div>
                                <div class="mask1"></div>
                                <div class="mask2"></div>
                                <div class="info">
                                    <h3>Search Propeties</h3>
                                    <p>These are three dimensional letters and are usually illuminated</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="Residential_section_bg">
                    <div class="Residential_section">
                           <h3>
                        <asp:Label ID ="residential" runat="server" Text="Residential Listings"></asp:Label>
                     </h3>
                     <asp:DataList ID="ddlresidential" runat="server" RepeatColumns="3" RepeatLayout="Flow" >
    <ItemTemplate>
        <asp:Label ID="lblname" runat="server" Text='<%# Eval("GarageSpaces")%>'></asp:Label>
         </ItemTemplate>
        <ItemTemplate>
        <asp:Label ID="lblname" runat="server" Text='<%# Eval("GarageSpaces")%>'></asp:Label>
         </ItemTemplate>
                           <ItemTemplate>
        <asp:Label ID="lblname" runat="server" Text='<%# Eval("GarageSpaces")%>'></asp:Label>
         </ItemTemplate>
   
</asp:DataList>

                        <%--<div class="Residential_section_box">
                            <img src="slider/images/property-1.png" />
                            <h6><asp:Label ID="Label9" runat="server" ></asp:Label></h6>
                            <p><asp:Label ID="lblresi1" runat="server" ></asp:Label></p>
                            <div class="property_area">
                                <span>MLS#:      </span>
                                <span><asp:Label ID="lblmlsresidential1" runat="server" ></asp:Label></span>

                            </div>
                            <div class="property_area">
                                <span>Status:       </span>
                                <span>Sold       </span>

                            </div>
                            <div class="property_area">
                                <span>Type:       </span>
                                <span>Condominium      </span>

                            </div>
                            <div class="view_detail">
                                <a class="btn btn-primary"  href="../Search.aspx?Municipality=Toronto" title="Toronto">View Details</a>

                            </div>


                        </div>
                        <div class="Residential_section_box">
                            <img src="slider/images/property-8.png" />
                            <h6>70 - 735 Sheppard Ave</h6>
                           <p><asp:Label ID="lblresi2" runat="server" ></asp:Label></p>
                            <div class="property_area">
                                <span>MLS#:      </span>
                            <span><asp:Label ID="lblmlsresidential2" runat="server" ></asp:Label></span>    

                            </div>
                            <div class="property_area">
                                <span>Status:       </span>
                                <span>Sold       </span>

                            </div>
                            <div class="property_area">
                                <span>Type:       </span>
                                <span>Condominium      </span>

                            </div>

                            <div class="view_detail">
                                <a class="btn btn-primary" href="../Search.aspx?Municipality=Mississauga" title="Mississauga">View Details</a>
                            </div>                      

                        </div>
                        <div class="Residential_section_box">
                            <img src="slider/images/property-9.png" />
                            <h6>
                           <p><asp:Label ID="lblresi3" runat="server" ></asp:Label></p></h6>
                            <div class="property_area">
                                <span>MLS#:      </span>
                                 <span><asp:Label ID="lblmlsresidential3" runat="server" ></asp:Label></span>    

                            </div>
                            <div class="property_area">
                                <span>Status:       </span>
                                <span>Sold       </span>

                            </div>
                            <div class="property_area">
                                <span>Type:       </span>
                                <span>Condominium      </span>

                            </div>
                            <div class="view_detail">
                                <a class="btn btn-primary" href="../Search.aspx?Municipality=Brampton" title="Brampton">View Details</a>
                            </div>    


                        </div>--%>

                    </div>

                </div>
                <div class="Residential_section_bg">
                    <div class="Residential_section">
                        <h3>Condo Listings</h3>
                        <div class="Residential_section_box">
                            <img src="slider/images/property-8.png" />
                            <h6>70 - 735 Sheppard Ave</h6>
                            <p><asp:Label ID="Label3" runat="server"></asp:Label> </p>
                            <div class="property_area">
                                <span>MLS#:      </span>
                                <span>E3183695        </span>

                            </div>
                            <div class="property_area">
                                <span>Status:       </span>
                                <span>Sold       </span>

                            </div>
                            <div class="property_area">
                                <span>Type:       </span>
                                <span>Condominium      </span>

                            </div>
                            <div class="view_detail">
                                <a class="btn btn-primary" href="../Search.aspx?Municipality=Oakville" title="Oakville">View Details</a>
                            </div>    


                        </div>
                        <div class="Residential_section_box">
                            <img src="slider/images/property-2.png" />
                            <h6>70 - 735 Sheppard Ave</h6>
                           <p><asp:Label ID="Label4" runat="server"></asp:Label> </p>
                            <div class="property_area">
                                <span>MLS#:      </span>
                                <span>E3183695        </span>

                            </div>
                            <div class="property_area">
                                <span>Status:       </span>
                                <span>Sold       </span>

                            </div>
                            <div class="property_area">
                                <span>Type:       </span>
                                <span>Condominium      </span>

                            </div>
                            <div class="view_detail">
                                <a class="btn btn-primary" href="../Search.aspx?Municipality=Hamilton" title="Hamilton">View Details</a>
                            </div>   


                        </div>
                        <div class="Residential_section_box">
                            <img src="slider/images/property-3.png" />
                            <h6>70 - 735 Sheppard Ave</h6>
                            <p><asp:Label ID="Label5" runat="server" ></asp:Label> </p>
                            <div class="property_area">
                                <span>MLS#:      </span>
                                <span>E3183695        </span>

                            </div>
                            <div class="property_area">
                                <span>Status:       </span>
                                <span>Sold       </span>

                            </div>
                            <div class="property_area">
                                <span>Type:       </span>
                                <span>Condominium      </span>

                            </div>
                            <div class="view_detail">
                                <a class="btn btn-primary" href="../Search.aspx?Municipality=Markham" title="Markham">View Details</a>
                            </div>   


                        </div>

                    </div>

                </div>
                <div class="Residential_section_bg">
                    <div class="Residential_section">
                        <h3>Commercial Listings</h3>
                        <div class="Residential_section_box">
                            <img  alt="" src="slider/images/property-4.png" />
                            <h6>70 - 735 Sheppard Ave</h6>
                           <p><asp:Label ID="Label6" runat="server" ></asp:Label> </p>
                            <div class="property_area">
                                <span>MLS#:      </span>
                                <span>E3183695        </span>

                            </div>
                            <div class="property_area">
                                <span>Status:       </span>
                                <span>Sold       </span>

                            </div>
                            <div class="property_area">
                                <span>Type:       </span>
                                <span>Condominium      </span>

                            </div>
                            <div class="view_detail">
                                <a class="btn btn-primary" href="../Search.aspx?Municipality=Wasaga Beach" title="Wasaga Beach">View Details</a>
                            </div>   


                        </div>
                        <div class="Residential_section_box">
                            <img src="slider/images/property-5.png" />
                            <h6>70 - 735 Sheppard Ave</h6>
                           <p><asp:Label ID="Label7" runat="server"></asp:Label> </p>
                            <div class="property_area">
                                <span>MLS#:      </span>
                                <span>E3183695        </span>

                            </div>
                            <div class="property_area">
                                <span>Status:       </span>
                                <span>Sold       </span>

                            </div>
                            <div class="property_area">
                                <span>Type:       </span>
                                <span>Condominium      </span>

                            </div>
                            <div class="view_detail">
                                <a class="btn btn-primary" href="../Search.aspx?Municipality=Oshawa" title="Oshawa">View Details</a>
                            </div>   


                        </div>
                        <div class="Residential_section_box">
                            <img src="slider/images/property-6.png" />
                            <h6>70 - 735 Sheppard Ave</h6>
                            <p><asp:Label ID="Label8" runat="server" ></asp:Label> </p>
                            <div class="property_area">
                                <span>MLS#:      </span>
                                <span>E3183695        </span>

                            </div>
                            <div class="property_area">
                                <span>Status:       </span>
                                <span>Sold       </span>

                            </div>
                            <div class="property_area">
                                <span>Type:       </span>
                                <span>Condominium      </span>

                            </div>
                            <div class="view_detail">
                                <a class="btn btn-primary" href="../Search.aspx?Municipality=Richmond Hill" title="Richmond Hill">View Details</a>
                            </div>   

                        </div>

                    </div>

                </div>


            </div>
            <div class="col-md-3 col-sm-3">
                <div class="feature_listing">
                    <h3>Feature Listings</h3>
                    <div class="feature_section_box">
                      
                       <div>
            <uc:FeaturedProperties ID="FeaturedProperties" runat="server" />
          
        </div>
                       
                        <div class="view_detail">
                            <button class="btn btn-primary" type="button" style="background:#ffcb05; color:black;">View Details</button>

                        </div>


                    </div>
                    <div class="feature_section_box">
                        <img src="slider/images/property-10.png" />
                        <h6>Nullam Semp $90.00</h6>
                        <div class="property_area">
                            <span>MLS#:      </span>
                            <span>E3183695        </span>

                        </div>
                        <div class="property_area">
                            <span>Status:       </span>
                            <span>Sold       </span>

                        </div>
                        <div class="property_area">
                            <span>Type:       </span>
                            <span>Condominium      </span>

                        </div>
                        <div class="view_detail">
                            <button class="btn btn-primary" type="button" style="background:#ffcb05; color:black;">View Details</button>

                        </div>


                    </div>
                    <div class="feature_section_box">
                        <img src="slider/images/property-11.png" />
                        <h6>Nullam Semp $90.00</h6>
                        <div class="property_area">
                            <span>MLS#:      </span>
                            <span>E3183695        </span>

                        </div>
                        <div class="property_area">
                            <span>Status:       </span>
                            <span>Sold       </span>

                        </div>
                        <div class="property_area">
                            <span>Type:       </span>
                            <span>Condominium      </span>

                        </div>
                        <div class="view_detail">
                            <button class="btn btn-primary" type="button" style="background:#ffcb05; color:black;">View Details</button>

                        </div>


                    </div>


                   <%-- <div class="helpning_section">

                        <img src="slider/images/dreamsfindyou.png" alt="" title="" />

                    </div>--%>
                    <div class="facebook">
                        <img src="slider/images/facebook.png" alt="" title="" />
                    </div>


                </div>

            </div>

            <%--<div class="new_right">
        <div class="feature_new_1">
            <uc:FeaturedProperties ID="FeaturedProperties" runat="server" />
          
        </div>
        <div class="clear">
        </div>
        <div class="right_section">
            <div class="image-row">
                <div class="image-set">
                    <a class="example-image-link" href="../images/img-1.jpg" data-lightbox="example-set"
                        data-title="" title='Image'>
                        <img class="example-image" src="../images/img-1.jpg" alt="Alliance" title="Alliance" /></a>
                </div>
            </div>
        </div>
        <div class="right_section">
            <div class="image-row">
                <div class="image-set">
                    <a class="example-image-link" href="../images/img-2.jpg" data-lightbox="example-set"
                        data-title="" title='Image'>
                        <img class="example-image" src="../images/img-2.jpg" alt="Investment" title="Investment" /></a>
                </div>
            </div>
        </div>
        <script src="../js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="../js/lightbox.js" type="text/javascript"></script>
    </div>--%>

        </div>

      </div>

    
</asp:Content>
