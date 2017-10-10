<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Print_Property_Detail.ascx.cs" Inherits="Property.Controls.Print_Property_Detail" %>

<%@ Register TagName="GoogleMap" TagPrefix="uc" Src="~/Controls/GoogleMap.ascx" %>
<%@ Register TagName="PropertySearch" TagPrefix="uc" Src="~/Controls/PropertySearch.ascx" %>
<%@ Register TagName="ContactInfo" TagPrefix="uc" Src="~/Controls/ContactInfo.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>

<script src="../js/jssor.slider.js"></script>
<link href="../css/style_002.css" rel="stylesheet" />
<link href="../slider/css/style.css" rel="stylesheet" />
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <script>

      $(document).ready(function () {
          $('#pnlmap').hide();
          $(".map").click(function () {

              $(this).text(function (i, v) {
                  if (v == "View Map") {
                      $('#pnlImages').hide();
                      $('#pnlmap').show();
                  }
                  else {
                      $('#pnlImages').show();
                      $('#pnlmap').hide();
                  }
                  return v === 'View Map' ? 'View Image' : 'View Map'
              })
          });
      });
    </script>
<div class="row">
    <div class="col-md-12 col-sm-12">
        <div class="property_top_inner_bg">
            <div class="col-md-2 col-sm-2">
                <div class="propert_header_img">
                    <input id="btnprint" type="button" onclick="PrintDiv()" value="Print" />
                </div>
                <img alt="" src="images/banner-inner.jpg" />
            </div>
        </div>
    </div>
</div>

    <div id="printarea">
        <div class="left_section_slider_new_demo">
            <div class="cls_tab_cntent_prprty_dtl">
                <asp:Panel ID="pnlImages">
                    <div class="col-md-6 col-sm-6">
                        <div class="col-md-3 col-sm-3">
                            <ul>
                                <li>
                                    <a target="_blank" href="http://www.cfc.forces.gc.ca/"><asp:label ID="lblBedLabel" runat="server"></asp:label>Bedromm</a>
                                </li>
                                 <li>
                                    <a target="_blank" href="http://www.cfc.forces.gc.ca/"><asp:label ID="lblbath" runat="server"></asp:label>Bath</a>
                                </li>
                                 <li>
                                    <a target="_blank" href="http://www.cfc.forces.gc.ca/"><asp:label ID="Label3" runat="server"></asp:label>Fireplace</a>
                                </li>
                                 <li>
                                    <a target="_blank" href="http://www.cfc.forces.gc.ca/"><asp:label ID="Label2" runat="server"></asp:label>Pani Windows</a>
                                </li>
                                   <li>
                                    <a target="_blank" href="http://www.cfc.forces.gc.ca/"><asp:label ID="Label1" runat="server"></asp:label>HardWods</a>
                                </li>
                                 <li>
                                    <a target="_blank" href="http://www.cfc.forces.gc.ca/"><asp:label ID="lblgarage" runat="server"></asp:label>Garage</a>
                                </li>
                            </ul>
                        </div>
                          <div class="col-md-3 col-sm-3">
                         <div class="detail_left_section_new">
                          <asp:Label ID="lblPropertyDescription" runat="server" Text=""></asp:Label>
                             </div></div>
                        </div>
                   <div class="col-md-6 col-sm-6">
                        <div class="seaarch_Property_slider_new_demo">
                            <div class="product_slider" id="sliderDiv" runat="server">
                                <!-- Jssor Slider Begin -->
                                <!-- You can move inline styles to css file or css block. -->
                                <div id="slider1_container" style="position: relative; top: 0px; left: 0px; width: 800px; float: left; height: 656px; overflow: hidden;">
                                    <!-- Loading Screen -->
                                    <div u="loading" style="position: absolute; top: 0px; left: 0px;">
                                        <div style="filter: alpha(opacity=70); opacity: 0.7; position: absolute; display: block; background-color: #000000; top: 0px; left: 0px; width: 100%; height: 100%;">
                                        </div>
                                        <div style="position: absolute; display: block; background: url(../img/loading.gif) no-repeat center center; top: 0px; left: 0px; width: 100%; height: 100%;">
                                        </div>
                                    </div>
                                    <!-- Slides Container -->
                                    <div u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width: 800px; height: 560px; overflow: hidden;">
                                        <asp:Repeater ID="rptImages" runat="server">
                                            <ItemTemplate>
                                                <div>
                                                    <img u="image" src='<%#Eval("MLSImage")  %>' alt="" />
                                                    <img u="thumb" src='<%#Eval("MLSImage") %>' alt="" />
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                    <!-- Arrow Navigator Skin Begin -->
                                    <style>
                                        /* jssor slider arrow navigator skin 05 css */
                                        /*
                                        .jssora05l              (normal)
                                        .jssora05r              (normal)
                                        .jssora05l:hover        (normal mouseover)
                                        .jssora05r:hover        (normal mouseover)
                                        .jssora05ldn            (mousedown)
                                        .jssora05rdn            (mousedown)
                                        */
                                        .jssora05l, .jssora05r, .jssora05ldn, .jssora05rdn {
                                            position: absolute;
                                            cursor: pointer;
                                            display: block;
                                            background: url(img/a17.png) no-repeat;
                                            overflow: hidden;
                                        }

                                        .jssora05l {
                                            background-position: -10px -40px;
                                        }

                                        .jssora05r {
                                            background-position: -70px -40px;
                                        }

                                        .jssora05l:hover {
                                            background-position: -130px -40px;
                                        }

                                        .jssora05r:hover {
                                            background-position: -190px -40px;
                                        }

                                        .jssora05ldn {
                                            background-position: -250px -40px;
                                        }

                                        .jssora05rdn {
                                            background-position: -310px -40px;
                                        }
                                    </style>
                                    <!-- Arrow Left -->
                                    <span u="arrowleft" class="jssora05l" style="width: 40px; height: 40px; top: 158px; left: 8px;"></span>
                                    <!-- Arrow Right -->
                                    <span u="arrowright" class="jssora05r" style="width: 40px; height: 40px; top: 158px; right: 8px"></span>
                                    <!-- Arrow Navigator Skin End -->
                                    <!-- Thumbnail Navigator Skin Begin -->
                                    <div u="thumbnavigator" class="jssort01" style="position: absolute; width: 800px; height: 100px; left: 0px; bottom: 0px; background: black;">
                                        <!-- Thumbnail Item Skin Begin -->
                                        <style>
                                            /* jssor slider thumbnail navigator skin 01 css */
                                            /*
                                            .jssort01 .p           (normal)
                                            .jssort01 .p:hover     (normal mouseover)
                                            .jssort01 .pav           (active)
                                            .jssort01 .pav:hover     (active mouseover)
                                            .jssort01 .pdn           (mousedown)
                                            */
                                            .jssort01 .w {
                                                position: absolute;
                                                top: 0px;
                                                left: 0px;
                                                width: 100%;
                                                height: 100%;
                                            }

                                            .jssort01 .c {
                                                position: absolute;
                                                top: 0px;
                                                left: 0px;
                                                width: 68px;
                                                height: 68px;
                                                border: #000 2px solid;
                                            }

                                            .jssort01 .p:hover .c, .jssort01 .pav:hover .c, .jssort01 .pav .c {
                                                background: url(img/t01.png) center center;
                                                border-width: 0px;
                                                top: 2px;
                                                left: 2px;
                                                width: 68px;
                                                height: 68px;
                                            }

                                            .jssort01 .p:hover .c, .jssort01 .pav:hover .c {
                                                top: 0px;
                                                left: 0px;
                                                width: 70px;
                                                height: 70px;
                                                border: #fff 1px solid;
                                            }
                                        </style>
                                        <div u="slides" style="cursor: move;">
                                            <div u="prototype" class="p" style="position: absolute; width: 72px; height: 72px; top: 0; left: 0;">
                                                <div class="w">
                                                    <thumbnailtemplate style="width: 100%; height: 100%; border: none; position: absolute; top: 0; left: 0;"></thumbnailtemplate>
                                                </div>
                                                <div class="c">
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Thumbnail Item Skin End -->
                                    </div>
                                    <!-- Thumbnail Navigator Skin End -->
                                    <a style="display: none" href="http://www.jssor.com">slideshow html</a>
                                    <!-- Trigger -->
                                    <script>
                                        jssor_slider1_starter('slider1_container');
                                    </script>
                                </div>
                                <!-- Jssor Slider End -->
                                <img width="0" height="0" />
                            </div>
                            <asp:Image ID="sliderImageEmpty" Visible="false" runat="server" ImageUrl="~/images/no-image.gif" />
                        </div>
                        <div class="propert_top_details_scnd">
                            <div class="property_top_box_sctn">
                                <a href="../RealEstateNews.aspx"><i class="fa fa-file-o"></i>
                                    <h3>News</h3>
                                </a>
                            </div>
                            <div class="property_top_box_sctn">
                                <a target="_blank" href=" http://www.torontorealestateboard.com/about_GTA/Neighbourhood/index.html"><i class="fa fa-home"></i>
                                    <h3>Neighbourhood</h3>
                                </a>
                            </div>
                            <div class="property_top_box_sctn">
                                <a target="_blank" href="http://www.edu.gov.on.ca/"><i class="fa fa-graduation-cap"></i>
                                    <h3>School</h3>
                                </a>
                            </div>
                            <div class="property_top_box_sctn">
                                <a href="tel:647-668-2278"><i class="fa fa-phone"></i>
                                    <h3>Contact</h3>
                                </a>
                            </div>

                            <div class="property_top_box_sctn">
                                <a href="#"><i class="fa fa-heart"></i>
                                    <h3>Favorite</h3>
                                </a>
                            </div>

                        </div>
                    </div>
                </asp:Panel>
                  </div>
                    </div>
        <div class="propert_header_cntntt">
                    <h2><asp:Label ID="lblAddressBar1" runat="server" Text=""></asp:Label></h2>
                    <div class="propert_header_cntntt_box">
                        <h3>Price:</h3>
                        <span><asp:Label ID="lblListPrice" runat="server" Text=""></asp:Label></span>
                    </div>
                    <div class="propert_header_cntntt_box">
                        <h3>Status:</h3>
                        <span><asp:Label ID="lblStyle" runat="server" Text=""></asp:Label></span>
                    </div>
                    <div class="propert_header_cntntt_box">
                        <h3>MLS#:</h3>
                        <span><asp:Label ID="lblMLS" runat="server" Text=""></asp:Label></span>
                    </div>
                </div>
            <script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
            <script src="js/lightbox.js" type="text/javascript"></script>

        </div>

