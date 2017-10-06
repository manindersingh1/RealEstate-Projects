<%--<%@ Master Language="C#" AutoEventWireup="true" CodeBehind="HomeMaster.Master.cs" Inherits="Property.HomeMaster" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<%@ Register TagName="FeaturedProperties" TagPrefix="uc" Src="~/Controls/FeaturedProperties.ascx" %>
<%@ Register TagName="Logo" TagPrefix="uc" Src="~/Controls/logo.ascx" %>
<%@ Register TagName="SearchBar" TagPrefix="uc" Src="~/Controls/SearchBar.ascx" %>
<%@ Register TagName="ContactInfo" TagPrefix="uc" Src="~/Controls/ContactInfo.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link id="favicon" runat="server" rel="shortcut icon" type="image/x-icon" />
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Page-Enter" content="blendTrans(Duration=0)" />
    <meta http-equiv="Page-Exit" content="blendTrans(Duration=0)" />
    <title><asp:Literal ID="siteTitle" runat="server"></asp:Literal></title>
    <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.nivo.slider.js"></script>
    <script src="js/jquery.bxslider.min.js"></script>
    <script type="text/javascript" src="js/jquery_009.js"></script>
    <link href="css/bootstrap.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/media-queries.css" rel="stylesheet" />
    <link href="css/font.css" rel="stylesheet" />
    <link href="css/font-awesome.css" rel="stylesheet" />
    <link href="css/styleBackup.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="slider/css/media-queries.css" rel="stylesheet" />
    <link href="css/nivo-slider.css" rel="stylesheet" />
    <link href="css/shortcodes.css" rel="stylesheet" />
    <link href="css/jquery.bxslider.css" rel="stylesheet" />

    <asp:ContentPlaceHolder ID="HeadContent" runat="server">
    </asp:ContentPlaceHolder>
    <style type="text/css">
        .contact_number {
            float: left;
            height: 100px;
            padding: 20px;
            position: absolute;
            top: 512px;
            z-index: 99999;
        }

            .contact_number span {
                color: white;
                font-size: 24px;
            }

        #Homebanner {
            float: left;
            margin-bottom: 0px;
            width: 100%;
        }

        #map {
            border: 2px solid #3f6f55;
            height: 229px;
            width: 90%;
        }
    </style>
    <style type="text/css">
        blockquote {
            clear: both;
            font-style: italic;
            margin-left: 10px;
            margin-right: 10px;
            padding: 10px 10px 0 50px;
            quotes: none;
            background: url(https://dl.dropbox.com/u/96099766/RotatingTestimonial/open-quote.png) 0 0 no-repeat;
            border: 0px;
            font-size: 120%;
            line-height: 200%;
        }
    </style>
</head>
<body>
    <form runat="server" id="form">
        <%--<asp:ScriptManager ID="scrmngr" EnablePageMethods="true" runat="server">
    </asp:ScriptManager>--%>
        <!--header start-->
        <div class="header_bg">
            <div class="container">
                <div class="col-md-4 col-sm-4">
                    <div class="header_detail">
                        <h2>
                            <asp:Label ID="lblBrkrOneName" CssClass="gjfdhg" runat="server"></asp:Label>
                        </h2>
                        <p>Sales Representative</p>
						<h5>
                            <a href="tel:416-881-1599">
                                <asp:Label ID="lblphn" runat="server"></asp:Label></a></h5>
                    </div>
                </div>
				<div class="col-md-4 col-sm-4">
                    <div class="frnt_logo">
                        <uc:Logo ID="logo" runat="server" />
                    </div>
                </div>
                <div class="col-md-4 col-sm-4">
                    <div class="header_detail1">
                        
                       <!-- <h5>
                            <a href="mailto:Partapbhatti@gmail.com">
                                <asp:Label ID="lblemailid" runat="server"></asp:Label></a></h5>-->
                        <ul>
                            <li>
                                <a href="#">
                                    <img src="images/fb_icon.png" /></a>
                            </li>
                            <li>
                                <a href="#">
                                    <img src="images/gugle_icon.png" /></a>
                            </li>
                            <li>
                                <a href="#">
                                    <img src="images/linkedin_icon.png" /></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
	    <div class="frnt_menu_sct_bg">
            <div class="container">
                <div class="top_menu_bg">
                    <div class="col-md-12 col-sm-12">
                        <div class="menu_section">
                            <asp:Literal ID="dynamicmenus" runat="server"></asp:Literal>
                        </div>
                        <script type="text/javascript" src="../js/script.js"></script>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
		<div class="banner_sctn">
            <div id="Homebanner" runat="server">
                <div class="banner_section">
                    <div class="slider-wrapper theme-default">
                        <div id="slider" class="nivoSlider">
                            <asp:Literal ID="ltrImgsf" runat="server"></asp:Literal>
                        </div>
                    </div>
                </div>
                <script type="text/javascript">
                    $(window).load(function () {
                        $('#slider').nivoSlider();
                    });
                </script>
            </div>
        </div>
		</div>
        <div class="latst_srch_bg">
            <div class="container">
                <div class="row frnt_line_cls">
                    <div class="col-md-12 col-sm-12">
                        <div class="ltst_srch_sct">
						    <h2>Search Your Properties</h2>
                            <div class="input_srch_new">
                                <div class="In_bg_new">
                                    <uc:SearchBar ID="SearchBar1" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="main_sct_bg">
            <div class="container">
                <div class="main_sction">
                    <div class="row frnt_line_cls">
                        <div class="col-md-3 col-sm-3">
                            <div class="property_box_section">
                                <h2>Residential</h2>
                                <a href="Search.aspx?PropertyType=Residential"><img src="images/resi_img.jpg" alt="" /></a>
                            </div>
                        </div>
						 <div class="col-md-3 col-sm-3">
                            <div class="property_box_section">
                                <h2>Commercial</h2>
                                <a href="Search.aspx?PropertyType=Commercial"><img src="images/resi_img.jpg" alt="" /></a>
                            </div>
                        </div>
						 <div class="col-md-3 col-sm-3">
                            <div class="property_box_section">
                                <h2>Condo</h2>
                                <a href="Search.aspx?PropertyType=Condo"><img src="images/resi_img.jpg" alt="" /></a>
                            </div>
                        </div>
						 <div class="col-md-3 col-sm-3">
                            <div class="property_box_section">
                                <h2>Featured Properties</h2>
                                <a href="Featured_Properties.aspx"><img src="images/resi_img.jpg" alt="" /></a>
                            </div>
                        </div>
                    </div>
                         </div>
						  <div class="main_sction">
                    <div class="row frnt_line_cls">
                        <div class="col-md-4 col-sm-4">
                            <div class="about_section">
                                <h2>About me</h2>
                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
								<button type="button" class="btn btn-primary about_read_btn">Read more</button>
                            </div>
                        </div>
						<div class="col-md-4 col-sm-4">
                            <div class="bottom_middle_bg">
                                <div class="buyer_seller_box">
                                <a href="../Buyers.aspx"><img src="images/buyer.png" alt="" /></a>
								</div>
								  <div class="buyer_seller_box">
                                <a href="../StaticPages.aspx?PageID=22"><img src="images/seller.png" alt="" /></a>
								</div>
                            </div>
                        </div>
						 <div class="col-md-4 col-sm-4">
                            <div class="blogs_bg">
							<h2>Blogs</h2>
                                <div class="blogs_section">
								<h2>Lorem Ipsum is simply dummy text</h2>
								<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. </p>
                               <button type="button" class="btn btn-primary about_read_btn">Read more</button>
								</div>
								<div class="blogs_section">
								<h2>Lorem Ipsum is simply dummy text</h2>
								<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. </p>
                               <button type="button" class="btn btn-primary about_read_btn">Read more</button>
								</div>
                            </div>
                        </div>
                    </div>
                         </div>
            </div>
        </div>
        
    <div class="fuutr_menu_bg">
        <div class="container">
            <div class="col-md-12 col-sm-12">
                <div class="futer_mennu">
                    <ul>
                        <li><a href="../StaticPages.aspx?PageID=22">Sellers</a></li>
                        <li><a href="../Buyers.aspx">Buyers</a></li>
                        <li><a href="../Calculators.aspx">Calculators</a></li>
                        <li><a href="../Home_Worth.aspx">Home Evaluation</a></li>
                        <li><a href="../ContactUs.aspx">Contact Us</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
<div class="fuuter_bg" id="one-footer">
        <div class="container">
            <div class="futer_sctnn">
                <div class="col-md-6 col-sm-6">
                    <div class="futer_addres">
                     <h2>Sukhdev Sahota</h2>
					 <div class="futer_detail">
					 <img src="images/futer_icon1.png" alt="" /><p>HomeLife Maple Leaf Realty Ldt., Brokerage <br/>
263 Queen Street.East Suite 20, <br/>
Brampton, Ontario L6W 4K6 </p>
					 </div>
					 <div class="futer_detail">
					 <img src="images/futer_icon2.png" alt="" />
					 <p> <a href="mailto:buyandsellwithsukh@gmail.com">
                                <asp:Label ID="lblemailid" runat="server"></asp:Label></a></p>
					 </div>
					 <div class="futer_detail">
					 <img src="images/futer_icon3.png" alt="" /><p>  <a href="tel:416-881-1599">
                                <asp:Label ID="Label1" runat="server"></asp:Label></a></p>
					 </div>
                    </div>
                </div>
               <div class="col-md-6 col-sm-6">
               <div class="fuuter_map">
                <a href="#"><img src="images/map_img.png" alt="" /></a>
			  </div>
            </div>
            </div>
            
        </div>
    </div>
	
	<div class="bottom_futer">
	<div class="col-md-12 col-sm-12">
                <div class="Designed_and_Developed">
                    <div>
                        <b>Designed & Developed by <a href="http://only4Agents.com/">Only4Agents</a>
                        </b>
                    </div>
                </div>
            </div>
	</div>
	
        <div class="fuutr_phne_bg">
            <div class="futer_mail_bg">
                <div class="futer_mail">
                    <ul>
                        <li><a href="mailto:buyandsellwithsukh@gmail.com">
                            <img alt="" src="images/mail_icnnn.png" /></a></li>
                        <li><a href="tel:416-881-1599">
                            <img alt="" src="images/mbl_icnnn.png" /></a></li>
                        <li><a href="sms:416-881-1599">
                            <img alt="" src="images/sms.png" /></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </form>
     
</body>

</html>--%>
