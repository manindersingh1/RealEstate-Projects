<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PropertyDetailsControl.ascx.cs" Inherits="Property.Controls.PropertyDetailsControl" %>

<%@ Register TagName="GoogleMap" TagPrefix="uc" Src="~/Controls/GoogleMap.ascx" %>
<%@ Register TagName="PropertySearch" TagPrefix="uc" Src="~/Controls/PropertySearch.ascx" %>
<%@ Register TagName="ContactInfo" TagPrefix="uc" Src="~/Controls/ContactInfo.ascx" %>

 <link href="../css/style.css" rel="stylesheet" />

   <link href="../slider/css/style.css" rel="stylesheet" />
<div class="Detail_Left">
 <asp:Label ID="lblAddressBar1" runat="server" Text=""></asp:Label>
</div>
    <div class="Detail_Email">
        <asp:Button ID="btnEmail" runat="server" Text="Email" OnClick="btnEmail_Click" Style="margin: 14px 11px 0 0;" />

        <input id="btnprint" type="button" onclick="PrintDiv()" value="Print" /></div>
    <div id="printarea">
        <div class="left_section_in_5">
            <ul class="dt-sc-tabs-frame">
                <li><a class="current" href="#">Overview</a></li>
                <li><a class="" href="#">Map</a></li>
                <li><a class="" href="#">Images</a></li>
               
            </ul>
            <div style="display: none" class="dt-sc-tabs-frame-content">
                <div class="product_head_bg">
                    <ul class="single-property-info">
                        <li><span style="color:#3498DB">
                            <asp:Label ID="lblStyle" runat="server" Text=""></asp:Label></span></li>
                        <li>MLS# <span style="color:#3498DB">
                            <asp:Label ID="lblMLS" runat="server" Text=""></asp:Label></span></li>
                        <li>List Price:<span style="color:#3498DB">
                            <asp:Label ID="lblListPrice" runat="server" Text=""></asp:Label></span></li>
                             <li>Taxes: $<span style="color:#3498DB">
                           <asp:Label ID="lblTaxes" runat="server" Text=""></asp:Label> /
                            <asp:Label ID="lblTaxesYr" runat="server" Text=""></asp:Label></span></li>

                           
                            
                           
                    </ul>
                </div>
                <div class="seaarch_Property_in" style="border: none;">
                    <div class="product_slider" id="sliderDiv" runat="server">
                        <!-- Jssor Slider Begin -->
                        <!-- You can move inline styles to css file or css block. -->
                        <div id="slider1_container" style="position: relative; top: 0px; left: 0px; width: 800px;
                            float: left; height: 456px;  overflow: hidden;">
                            <!-- Loading Screen -->
                            <div u="loading" style="position: absolute; top: 0px; left: 0px;">
                                <div style="filter: alpha(opacity=70); opacity: 0.7; position: absolute; display: block;
                                    background-color: #000000; top: 0px; left: 0px; width: 100%; height: 100%;">
                                </div>
                                <div style="position: absolute; display: block; background: url(../img/loading.gif) no-repeat center center;
                                    top: 0px; left: 0px; width: 100%; height: 100%;">
                                </div>
                            </div>
                            <!-- Slides Container -->
                            <div u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width: 800px;
                                height: 360px; overflow: hidden;">
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
                                .jssora05l, .jssora05r, .jssora05ldn, .jssora05rdn
                                {
                                    position: absolute;
                                    cursor: pointer;
                                    display: block;
                                    background: url(img/a17.png) no-repeat;
                                    overflow: hidden;
                                }
                                .jssora05l
                                {
                                    background-position: -10px -40px;
                                }
                                .jssora05r
                                {
                                    background-position: -70px -40px;
                                }
                                .jssora05l:hover
                                {
                                    background-position: -130px -40px;
                                }
                                .jssora05r:hover
                                {
                                    background-position: -190px -40px;
                                }
                                .jssora05ldn
                                {
                                    background-position: -250px -40px;
                                }
                                .jssora05rdn
                                {
                                    background-position: -310px -40px;
                                }
                            </style>
                            <!-- Arrow Left -->
                            <span u="arrowleft" class="jssora05l" style="width: 40px; height: 40px; top: 158px;
                                left: 8px;"></span>
                            <!-- Arrow Right -->
                            <span u="arrowright" class="jssora05r" style="width: 40px; height: 40px; top: 158px;
                                right: 8px"></span>
                            <!-- Arrow Navigator Skin End -->
                            <!-- Thumbnail Navigator Skin Begin -->
                            <div u="thumbnavigator" class="jssort01" style="position: absolute; width: 800px;
                                height: 100px; left: 0px; bottom: 0px; background:black;">
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
                                    .jssort01 .w
                                    {
                                        position: absolute;
                                        top: 0px;
                                        left: 0px;
                                        width: 100%;
                                        height: 100%;
                                    }
                                    
                                    .jssort01 .c
                                    {
                                        position: absolute;
                                        top: 0px;
                                        left: 0px;
                                        width: 68px;
                                        height: 68px;
                                        border: #000 2px solid;
                                    }
                                    
                                    .jssort01 .p:hover .c, .jssort01 .pav:hover .c, .jssort01 .pav .c
                                    {
                                        background: url(img/t01.png) center center;
                                        border-width: 0px;
                                        top: 2px;
                                        left: 2px;
                                        width: 68px;
                                        height: 68px;
                                    }
                                    
                                    .jssort01 .p:hover .c, .jssort01 .pav:hover .c
                                    {
                                        top: 0px;
                                        left: 0px;
                                        width: 70px;
                                        height: 70px;
                                        border: #fff 1px solid;
                                    }
                                </style>
                                <div u="slides" style="cursor: move;">
                                    <div u="prototype" class="p" style="position: absolute; width: 72px; height: 72px;
                                        top: 0; left: 0;">
                                        <div class="w">
                                            <thumbnailtemplate style="width: 100%; height: 100%; border: none; position: absolute;
                                                top: 0; left: 0;"></thumbnailtemplate>
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
                <div class="property_new_details">
                    <div>
                        <asp:Label ID="lbladdrss" runat="server" Text=""></asp:Label><br />
                     
                          <asp:Label ID="lblMunicipality" runat="server" Text=""></asp:Label>,
                               <asp:Label ID="lblPostalCode" runat="server" Text=""></asp:Label>,
                           
                        <asp:Label ID="lblprovince" runat="server" Text=""></asp:Label>
                      
                      
                   
                    </div>
                    <div style="margin: 10px 0 0 0">
                        <b>
                            <asp:Label ID="lblPrice" runat="server" Text=""></asp:Label>&nbsp For
                            <asp:Label ID="lblSale" runat="server" Text=""></asp:Label>
                        </b>
                    </div>
                    <div style="margin: 15px 0 0 0">
                        <%--      <asp:Label ID="lblCommunity" runat="server" Text=""></asp:Label><br />
                    <asp:Label ID="lblLegalDescription" runat="server" Text=""></asp:Label>
                    <br />--%>
                        <br />
                        <%-- <asp:Label ID="lblSPIS" runat="server" Text=""></asp:Label>--%>
                    </div>

                    <div style="margin: 10px 0 0 0">
                       <div class="infor_list">
                      <asp:ImageButton ID="ImgAppointment" ImageUrl="~/images/date2.png" CommandName="Appointment"
                                                                runat="server" ToolTip="Schedule Appointment"  OnClick="AddAppointment_Click "></asp:ImageButton>
                                                            <span><a href="ScheduleAppointment.aspx" title="Appointment">Appointment</a></span>
                                                            </div>
                                                        <div class="infor_list_2">
                                                               <asp:ImageButton ID="ImgFavourite" ImageUrl="~/images/favorite.png" CommandName="AddFavourite"
                                                                ToolTip="Add to Favourite"  runat="server" OnClick="AddFavourite_Click ">
                                                            </asp:ImageButton>
                                                            <span runat="server" id="FavouriteSpan" class="add_to_favourite" title="Add to Favourite"><a href="#">Add to
                                                                Favourite</a></span>
                                                                </div>
                    </div>

                </div>
                <div class="right_section_new">
             
            <div class="seller_new_list">
            <img alt="" src="../images/icons/dream-home.png">
               <p><a href="../search-for-your-dream-home.aspx">Your Dream Home</a></p>
                    </div>
    <div class="seller_new_list">
     <img alt="" src="../images/icons/free-home.png">
               <p><a href="../Free-home-evaluation.aspx">Free Home Evaluation</a></p>

               </div>
               <div class="seller_new_list">
                <img alt="News Strips&lt;" src="../images/icons/news.png">
               <p><a href="../RealEstateNews.aspx"> News Strips</a></p>
                </div>
                <div class="seller_new_list">
                   <img alt="Neighbourhood Report" src="../images/icons/neighbour-report.png">
                <p><a target="_blank" href=" http://www.torontorealestateboard.com/about_GTA/Neighbourhood/index.html">Neighbourhood Report</a></p>
                </div>
                <div class="seller_new_list">
                    <img alt="School Reports" src="../images/icons/school-report.png">
              <p> <a target="_blank" href="http://www.edu.gov.on.ca/">School Reports</a> </p>
               </div>
             
                  
                   <div class="seller_new_list">
                  <img alt="" src="../images/icons/featured-listing.png">
               <p><a href="../Featured_Properties.aspx">Feature Listing</a> </p>
                </div>
                  <div class="seller_new_list">
                  <img alt="" src="../images/icons/calculator.png">
               <p><a href="../Calculators.aspx">Calculator</a> </p>
                </div>            
             
        </div>
                <div class="new_detail_bg">
                    <div class="detail_left_section">
                        <span><b>General Information</b> </span>
                        <br />
                        <div class="detail_left_Section_top">
                            <asp:Label ID="lblSubTypeofhome" runat="server" Text=""></asp:Label>
                            <br />
                            <asp:Label ID="lblStorey" runat="server" Text=""></asp:Label><br />
                            <b>Dir/Cross St:</b>
                            <asp:Label ID="lblDirCrossSt" runat="server" Text=""></asp:Label>
                            <br />
                            <asp:Label ID="lblLot" runat="server" Text=""></asp:Label>
                            <br />
                            <b>MLS#:</b>
                            <asp:Label ID="lblMLS1" runat="server" Text=""></asp:Label>
                            
                        </div>
                        
                        <div id="room" runat="server">
                            <div class="detail_span" runat="server" id="Fronting">
                                <asp:Label ID="lblfronting" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="detail_span" runat="server" id="condo_gen">
                                <asp:Label ID="lblUnit" runat="server" Text=""></asp:Label>
                                <asp:Label ID="lblCorp" runat="server" Text=""></asp:Label>
                                <asp:Label ID="lblLevel" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="detail_span">
                                <b>Rooms :</b>
                                <asp:Label ID="lblroom" runat="server" Text=""></asp:Label>
                                <br />
                                <b>Beds :</b>
                                <asp:Label ID="lblBedroom" runat="server" Text=""></asp:Label>
                                <br />
                                <b>Baths :</b>
                                <asp:Label ID="lblWashRooms" runat="server" Text=""></asp:Label><br />
                            </div>
                        </div>
                        
                        <div id="Commercial" runat="server">
                            <div class="detail_span">
                                <b>Basement:</b>
                                <asp:Label ID="lblBasement1" runat="server" Text=""></asp:Label>
                                <br />
                                <b>Heat :</b>
                                <asp:Label ID="lblHeat1" runat="server" Text=""></asp:Label>
                                <br />
                                <b>Apx Age :</b>
                                <asp:Label ID="lblApxAge1" runat="server" Text=""></asp:Label></div>
                            <div class="Detail_span">
                                <b>Water :</b>
                                <asp:Label ID="lblWater1" runat="server" Text=""></asp:Label>
                                <br />
                                <b>Sewers :</b>
                                <asp:Label ID="lblSewers1" runat="server" Text=""></asp:Label>
                                <br />
                                <b>GarType/Spaces :</b>
                                <asp:Label ID="lblGarageTypes1" runat="server" Text=""></asp:Label>
                                <br />
                                <b>Parking Spaces :</b>
                                <asp:Label ID="lblParking1" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                           <div id="Div1" runat="server">
                            <div class="bob_clsses" runat="server" id="Div2">
                                <img class="image1" src="../images/Rocco.png" />
                                <h5>Gurminder Ahluwalia</h5>
                                <span><i class="fa fa-phone" style="margin: 0 6px 0 0;"></i>416-500-9331</span>
                            </div>

                        </div>
                    </div>
                    <div class="detail_left_section" id="AdditionFeatures" runat="server">
                        <div class="Detail_section">
                            <b>Kitchen :</b>
                            <asp:Label ID="lblKitchen" runat="server" Text=""></asp:Label>
                            <br />
                            <b>Family Room :</b>
                            <asp:Label ID="lblfamilyrm" runat="server" Text=""></asp:Label>
                            <br />
                            <b>Basement:</b>
                            <asp:Label ID="lblBasement" runat="server" Text=""></asp:Label>
                            <br />
                            <b>Fireplace/Stv:</b>
                            <asp:Label ID="lblFireplaces" runat="server" Text=""></asp:Label>
                            <br />
                            <b>Heat :</b>
                            <asp:Label ID="lblHeat" runat="server" Text=""></asp:Label>
                            <br />
                            <b>Apx Age :</b>
                            <asp:Label ID="lblApxAge" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="Detail_section">
                            <b>Exterior :</b>
                            <asp:Label ID="lblExterior" runat="server" Text=""></asp:Label><br />
                            <asp:Label ID="lblDrive" runat="server" Text=""></asp:Label>
                            <br />
                            <b>GarType/Spaces :</b>
                            <asp:Label ID="lblGarageType" runat="server" Text=""></asp:Label>
                            <br />
                            <b>Parking Spaces :</b>
                            <asp:Label ID="lblParking" runat="server" Text=""></asp:Label>
                            <br />
                            <asp:Label ID="lblPool" runat="server" Text=""></asp:Label>
                            <div id="PropertyFeature1" runat="server" visible="false">
                                <asp:Label ID="lblPropertyFeature1" runat="server" Text=""></asp:Label></div>
                            <div id="PropertyFeature2" runat="server" visible="false">
                                <asp:Label ID="lblPropertyFeature2" runat="server" Text=""></asp:Label></div>
                            <div id="PropertyFeature3" runat="server" visible="false">
                                <asp:Label ID="lblPropertyFeature3" runat="server" Text=""></asp:Label></div>
                            <div id="PropertyFeature4" runat="server" visible="false">
                                <asp:Label ID="lblPropertyFeature4" runat="server" Text=""></asp:Label></div>
                            <div id="PropertyFeature5" runat="server" visible="false">
                                <asp:Label ID="lblPropertyFeature5" runat="server" Text=""></asp:Label></div>
                            <div id="PropertyFeature6" runat="server" visible="false">
                                <asp:Label ID="lblPropertyFeature6" runat="server" Text=""></asp:Label></div>
                        </div>
                        <div class="Detail_section">
                            <div id="propertyData" runat="server">
                                <b>Water :</b>
                                <asp:Label ID="lblWater" runat="server" Text=""></asp:Label>
                                <br />
                                <asp:Label ID="lblSewers" runat="server" Text=""></asp:Label>
                                <br />
                                <b>Specific Design :</b>
                                <asp:Label ID="lblSpecificDesignation" runat="server" Text=""></asp:Label>
                            </div>
                            <div id="condo" runat="server">
                                <b>Parking Inc:</b>
                                <asp:Label ID="LblParkingInc" runat="server" Text=""></asp:Label>&nbsp <b>Balcony:</b>
                                <asp:Label ID="lblBalcony" runat="server" Text=""></asp:Label>
                                <br />
                                <b>EnsLaundry:</b>
                                <asp:Label ID="lblEnsLaundry" runat="server" Text=""></asp:Label>
                                <br />
                                <b>LaundryLevel:</b>
                                <asp:Label ID="lblLaundryLevel" runat="server" Text=""></asp:Label>
                                <br />
                                <b>Parking Type</b>
                                <asp:Label ID="lblParkingType" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                    </div>
                    
                 <div id="RoomDescription" runat="server" class="detail_left_section table-responsive">
                    <asp:ListView ID="LVroom" runat="server" >
                        <LayoutTemplate>
                            <table class="table">
                                <thead class="tble_hdng_clr">
                                    <tr>
                                        <th>Room</th>
                                        <th>Level</th>
                                        <th>Dimension</th>
                                        <th>Features</th>
                                       
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                                </tbody>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <%# Eval("Room") %>
                                </td>
                                <td>
                                    <%# Eval("Level") %>
                                </td>
                                <td>
                                    <%# Eval("RoomDim") %>
                                </td>
                                <td>
                                    <%# Eval("RoomDesc") %>
                                </td>
                               
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
</div>
                    <div class="detail_left_section">
                        <div style="width: 100%;">
                            <b style="float: left; width:143px;">Remarks For Clients:</b>
                            <div style="margin: 0 0 0 96px; min-height: 75px;">
                                <asp:Label ID="lblPropertyDescription" runat="server" Text=""></asp:Label></div>
                        </div>
                        <div style="margin: 3px 0px 0px 0px; font-size: 12px; float: right; letter-spacing: normal;">
                            <asp:Label ID="lblListBrokerage" runat="server" Text=""></asp:Label>
                        </div>
                        <%-- <asp:Label ID="lblExtraInformation" runat="server" Text=""></asp:Label>--%>
                    </div>
                </div>
            </div>
            <div style="display: block" class="dt-sc-tabs-frame-content">
                <uc:GoogleMap ID="GoogleMap" runat="Server"></uc:GoogleMap>
            </div>
            <div style="display: none" class="dt-sc-tabs-frame-content">
                <asp:Repeater ID="rptPropertyImages" runat="server">
                    <ItemTemplate>
                        <div class="Images">
                            <div class="image-row">
                                <div class="image-set">
                                    <a class="example-image-link" href='<%#Eval("MLSImage") %>' data-lightbox="example-set"
                                        data-title="" title='Image'>
                                        <img class="example-image" src='<%#Eval("MLSImage") %>' alt="Image" title="Image" /></a>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
            <script src="js/lightbox.js" type="text/javascript"></script>

        </div>
    </div>