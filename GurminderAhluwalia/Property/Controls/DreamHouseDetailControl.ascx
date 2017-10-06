<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DreamHouseDetailControl.ascx.cs" Inherits="Property.Controls.DreamHouseDetailControl" %>

<%--<%@ Register TagName="GoogleMap" TagPrefix="uc" Src="~/Controls/GoogleMap.ascx" %>
<%@ Register TagName="PropertySearch" TagPrefix="uc" Src="~/Controls/PropertySearch.ascx" %>
<%@ Register TagName="ContactInfo" TagPrefix="uc" Src="~/Controls/ContactInfo.ascx" %>--%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>

<link href="../css/style_002.css" rel="stylesheet" />
<link href="../slider/css/style.css" rel="stylesheet" />
<%--<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">--%>
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

</div>
    <div id="printarea">
        <div class="left_section_slider_new_demo">
            <div class="cls_tab_cntent_prprty_dtl">
                <asp:Panel ID="pnlImage">
                    <div class="col-md-7 col-sm-7">
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
                                                    <img u="image" src='/admin/uploadfiles/<%#Eval("ImageUrl")  %>' alt="" />
                                                    <img u="thumb" src='/admin/uploadfiles/<%#Eval("ImageUrl") %>' alt="" />
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
                                <a target="_blank" href="http://www.edu.gov.on.ca/"><i class="fa fa-group"></i>
                                    <h3>School</h3>
                                </a>
                            </div>
                            <div class="property_top_box_sctn">
                                <a href="ScheduleAppointment.aspx"><i class="fa fa-phone"></i>
                                    <h3>Appointment</h3>
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
                <asp:Panel ID="pnlmap" Visible="false">
                   
                </asp:Panel>
              <div class="col-md-5 col-sm-5">
               
                <div class="property_inner_cntnt">
                     <h2>
                    <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label>&nbsp</h2>
                    <div class="property_price_box">

                        <div class="prprty_inner_box_row">
                            <div class="col-md-12 col-sm-12">
                                <div class="property_community_new">
                                    <h3>Price:</h3>
                                    <asp:Label ID="lblPrice" runat="server" Text="" CssClass="cnstrctn_deatil_price"></asp:Label>&nbsp
                                        
                                </div>
                            </div>
                        </div>
                        <div class="prprty_inner_box_row" style="border:none">
                            <div class="col-md-12 col-sm-12">
                                <div class="property_community_new">
                                    <h3>Address:</h3>
                                    <asp:Label ID="lblAddress" runat="server" Text=""  CssClass="cnstrctn_deatil_address"></asp:Label>&nbsp
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class ="construction_detail"><asp:Label ID="lblDescription" runat="server" Text=""></asp:Label>&nbsp</div>
                    
                </div>
            </div>
            

                    <div class="detail_left_section_new2">
                        <div>
                            <h2></h2>
                            <asp:Label ID="lblSubTypeofhome" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblStorey" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblDirCrossSt" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblMLS1" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblfronting" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblBedroom" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblWashRooms" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblBasement1" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblHeat1" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblApxAge1" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblWater1" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblSewers1" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblGarageTypes1" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblParking1" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblKitchen" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblfamilyrm" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblBasement" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblExterior" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblGarageType" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblParking" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblPool" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblWater" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblSewers" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblSpecificDesignation" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="LblParkingInc" runat="server" Text=""></asp:Label>&nbsp
                            <asp:Label ID="lblBalcony" runat="server" Text=""></asp:Label>&nbsp
                        </div>
                    </div>
                        </div>
                  <div class="col-md-12 col-sm-12">
                  <div class="construction_intrested_hdng">
                  <h2>I am Interested</h2>
                  </div>
                <div class="rocco_cntct_info_profile">
                    <div class="col-md-4 col-sm-4">
                        <div class="roco_pro_img">
                            <img src="../images/client_img.png" />

                        </div>
                        <div class="roco_pro_info">
                            <h2 style="font-size:19px !important">
                                <asp:Label ID="lblname"  runat="server"></asp:Label>Gurminder Ahluwalia</h2>
                            <p>Sales Representative</p>
                            <asp:Label CssClass="email_profile_r" ID="lblemail" runat="server"></asp:Label>
                            <asp:Label CssClass="email_profile_r" ID="lblmobile" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div class="col-md-8 col-sm-8">
                        <div class="roco_cnts_us">
                            <div class="row">
                                <div class="col-md-6 col-sm-6">
                            <div class="agent_input_prprty_dtl">
                                <p>First Name:</p>
                                <asp:RequiredFieldValidator ID="reqFirstName" runat="server" ErrorMessage="*"
                                    ControlToValidate="txtFirstName" ValidationGroup="SaveContactInfo" ForeColor="Red"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txtFirstName" CssClass="CTextBox" runat="server" PlaceHolder="First Name" MaxLength="20"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="FreeHome" runat="server" Display="Dynamic" ControlToValidate="txtFirstName" ErrorMessage="FirstName required" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                    ControlToValidate="txtFirstName" ErrorMessage="Only alphabets are allowed"
                                    ForeColor="Red" Display="Dynamic" ValidationExpression="^[a-zA-Z ]+$"> </asp:RegularExpressionValidator>
                            </div>
                                     </div>
                                <div class="col-md-6 col-sm-6">
                                    <div class="agent_input_prprty_dtl">
                                        <p>
                                            Last Name:
                                        </p>
                                        <asp:RequiredFieldValidator ID="reqLastName" runat="server" ErrorMessage="*" ControlToValidate="txtLastName"
                                            ValidationGroup="SaveContactInfo" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>

                                        <asp:TextBox ID="txtLastName" CssClass="CTextBox" MaxLength="20" runat="server" PlaceHolder="Last Name"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ValidationGroup="FreeHome" runat="server" Display="Dynamic" ControlToValidate="txtLastName" ErrorMessage="LastName required" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                            ControlToValidate="txtLastName" ErrorMessage="Only alphabets are allowed"
                                            ForeColor="Red" Display="Dynamic" ValidationExpression="^[a-zA-Z ]+$"> </asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                </div>
                            <div class="row">
                                   <div class="col-md-6 col-sm-6">
                            <div class="agent_input_prprty_dtl">
                                <p>
                                    E-mail:
                                </p>
                                <asp:TextBox ID="txtEmail" CssClass="CTextBox" runat="server" PlaceHolder="Email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ValidationGroup="FreeHome" Display="Dynamic" ControlToValidate="txtEmail" ErrorMessage="EmailID required" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="rgeEmail" runat="server" ValidationGroup="FreeHome" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Invalid email address." />
                            </div>
                                </div>
                                <div class="col-md-6 col-sm-6">
                                    <div class="agent_input_prprty_dtl">
                                        <p>
                                            Phone Number:   
                                        </p>
                                        <asp:TextBox ID="txtPhoneno" CssClass="CTextBox" runat="server" PlaceHolder="Phone Number"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ValidationGroup="FreeHome" Display="Dynamic" ControlToValidate="txtPhoneno" ErrorMessage="Phone No. required" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="regPhone" ValidationGroup="DreamHome" runat="server" ControlToValidate="txtPhoneno"
                                            ValidationExpression="^(\(\d{3}\) \d{3}-\d{4}|\d{3}-\d{3}-\d{4}|\d{10})$"
                                            Text="Enter a valid phone number" Display="Dynamic" ForeColor="Red" />
                                    </div>
                                </div>
                            </div>
                             <div class="row">
                                  <div class="col-md-12 col-sm-12">
                            <div class="agent_input_prprty_dtl">
                                <p>
                                    Message
                                </p>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                                    ControlToValidate="txtMessage" ValidationGroup="SaveContactInfo" ForeColor="Red"
                                    Display="Dynamic"></asp:RequiredFieldValidator>

                                <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Height="90px" PlaceHolder="Message"></asp:TextBox>
                            </div>
                                 </div>
                                 </div>

                            <div class="row">
                                 <div class="col-md-12 col-sm-12">
                                <div class="agent_input_prprty_dtl_3">
                                    <asp:Label ID="lblResult" runat="server" ForeColor="Red"></asp:Label>
                                    <asp:Button ID="btnSend" runat="server" Text="Send" CssClass="Sendbutton" Width="24%"
                                        UseSubmitBehavior="false" ValidationGroup="SaveContactInfo" OnClick="btnSend_Click" />
                                </div>
                                     </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
            <script src="js/lightbox.js" type="text/javascript"></script>
                    </div>

           

        </div>
    </div>
