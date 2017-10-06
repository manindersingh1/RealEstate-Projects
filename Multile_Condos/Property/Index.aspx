<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MultipleCondos.Master" CodeBehind="Index.aspx.cs" Inherits="Property.Index" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>multiple condos</title>
    <!-- Bootstrap -->
    <link href="Multiple_Condos/css/bootstrap.css" rel="stylesheet">
    <link href="Multiple_Condos/css/bootstrap.min.css" rel="stylesheet">
    <link href="Multiple_Condos/css/bootstrap-theme.css" rel="stylesheet">
    <link href="Multiple_Condos/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="Multiple_Condos/css/font.css" rel="stylesheet">
    <link href="Multiple_Condos/css/font-awesome.css" rel="stylesheet">
    <link href="Multiple_Condos/css/font-awesome.min.css" rel="stylesheet">
    <link href="Multiple_Condos/css/style.css" rel="stylesheet">
       <link rel="stylesheet" href="Multiple_Condos/css/default/default.css" type="text/css" media="screen" />
    <link href="Multiple_Condos/css/media-queries.css" rel="stylesheet">

    <link rel="stylesheet" href="Multiple_Condos/css/nivo-slider.css" type="text/css" media="screen" />

    <script src="Multiple_Condos/js/npm.js"></script>
    <script src="Multiple_Condos/js/jquery-1.11.1.min.js"></script>
    <script src="Multiple_Condos/js/bootstrap.js"></script>
    <script src="Multiple_Condos/js/bootstrap.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

    <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="Multiple_Condos/js/jquery.flexisel.js"></script>

</head>

    <div class="top_sect_bg">
        <div class="container">
            <div class="col-md-3 col-sm-3">
                <div class="logo_sctn">
                    <a href="#">
                        <img src="Multiple_Condos/images/logo.png" alt="" title="" />
                    </a>
                </div>
            </div>
            
            <div class="col-md-9 col-sm-9">
                <div class="menu_section">
                    <nav class="navbar navbar-inverse" role="navigation">
                        <div>
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>

                            </div>

                            <!-- Collect the nav links, forms, and other content for toggling -->
                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                 <ul class="nav navbar-nav">
                                    <li><a href="index.aspx">Home</a></li>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Pre-Constructions<b class="caret"></b></a>
                                        <asp:Literal ID="dynamicmenus" runat="server"></asp:Literal>
                                    </li>

                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Re-Sale<b class="caret"></b></a>
                                        <asp:Literal ID="ReSaleMenus" runat="server"></asp:Literal>
                                    </li>
                                    <li><a href="register.aspx">Register Now</a></li>
                                    <li><a href="about.aspx">About us</a></li>
                                    <li><a href="RealEstateNews.aspx">Blogs</a></li>
                                </ul>
                            </div>
                            <!-- /.navbar-collapse -->
                        </div>
                        <!-- /.container-fluid -->
                    </nav>


                </div>
            </div>
        </div>
    </div>
    <div class="slider-wrapper theme-default">
    <div class="banner_sct_bg">
        <div class="banner_sect">
            <div id="slider" class="nivoSlider">
                <asp:Literal ID="ltrImgsf" runat="server"></asp:Literal>             
            </div>
           
        </div>
    </div>
        </div>

    <div class="logo_sect_bg">
        <div class="container">
            <div class="row no_pddng">
                <div class="services_sect">
                    <!-- <h2>Images</h2>-->
                    <div class="services_slider">
                        <ul id="flexiselDemo3">
                               <asp:Repeater runat="server" ID="rptFeaturedProperties">
                                <ItemTemplate>
                                    <li>                                        
                                      <asp:HyperLink ID="hypImage" NavigateUrl=' <%# "service.aspx?Id=" + Eval("Id")%>' runat="server">
                                                             <img src='/admin/uploadfiles/<%# Eval("LogoImg")%>' />
                                       </asp:HyperLink>  
                                    </li>
                                  
                                </ItemTemplate>
                            </asp:Repeater>

                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="middle_sect">
        <div class="container">
            <div class="row no_pddng">
                <div class="about_sect_bg">
                    <div class="col-md-7 col-sm-7">
                        <div class="main_content">
                            <h2>About Team Rajiv</h2>
                            <p>We believe that if we treat our clients as we would treat our own family – we'll never go wrong. The Team Rajiv  is a group of professionals that will get the job done. We have the depth and expertise to meet your real estate needs. Each individual on the team has different strengths, talents, and time to bring to the table – that benefit both the buyer and the seller. </p>
                            <p>If we had to choose one word to describe Team Rajiv it would be "OUTSTANDING!!" Their service, commitment and delivery is so well executed it clearly distinguishes them from others in the marketplace."</p>
                            <span><a href="about.aspx">Read more</a></span>
                        </div>
                    </div>
                    <div class="col-md-5 col-sm-5">
                        <div class="video_section">
                            <iframe src="https://www.youtube.com/embed/1aVuI5OHhjI" frameborder="0" allowfullscreen></iframe>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
   
    <div class="team_sect_bg">
        <div class="container">
            <div class="row no_pddng">
                <div class="about_sect_bg">
                    
                                         <ajaxtoolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </ajaxtoolkit:ToolkitScriptManager>
                    <asp:UpdatePanel ID="upSearch" runat="server" UpdateMode="Conditional" Visible="false">
                        <ContentTemplate>

                            <div id="DivGridSearch" runat="server" style="display: block" class="In_bg">
                                <asp:Repeater ID="rptSearchResults" runat="server">
                                    <HeaderTemplate>
                                        <div class="row nooo_mrgnnn">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <div class="col-md-3 col-sm-3">
                                            
                                                <div class="condo_box">
                                                    <asp:HiddenField ID="Id" runat="server" Value='<%# Eval("Id") %>' />
                                                    
                                                        <img src='/admin/uploadfiles/<%# Eval("ImageUrl")%>' alt='' title=''>
                                                    
                                                        <h2><%# Eval("Title") %></h2>
                                                        <p>
                                                            <span id="multilinedText"><%# Eval("description") %></span>
                                                        </p>
                                                        <div class="text_bg_bottom">
                                                            <asp:HyperLink ID="hypBoxreadmore" NavigateUrl='<%# Eval("Id", "~/service.aspx?ID={0}") %>' CssClass="btn btn-primary cond_detail_btn" Text="Read More" runat="server"></asp:HyperLink>
                                                        </div>
                                                     <div class="text_bg_bottom">
                                                            <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# Eval("Id", "~/Register.aspx?ID={0}") %>' CssClass="btn btn-primary cond_detail_btn" Text="Yes,Email me more info" runat="server"></asp:HyperLink>
                                                        </div>
                                                   
                                                </div>
                                           
                                        </div>
                                    </ItemTemplate>

                                    <FooterTemplate>
                                        </div>

                                    </FooterTemplate>

                                </asp:Repeater>

                            </div>

                        </ContentTemplate>

                    </asp:UpdatePanel>

                  

   

               
                </div>
            </div>

        </div>
    </div>
    
    <div class="futer_section">
        <h2><a href="disclaimer.aspx">Disclaimer</a> &nbsp; &nbsp; <a href="admin/adminlogin.aspx">Login</a> &nbsp; &nbsp; Designed & Developed by Only4Agents </h2>
    </div>
    <div class="container">
    <div class="futer_adress_bg">
        <div class="col-md-6 col-sm-6">
            <div class="futer_adress">
                <h2>Rajiv Datta</h2>
               <h3>647-297-0699</h3>
                <span>Broker of Record</span>
                <p>HomeLife/Lifetime Realty Inc.,Brokerage, <br /> Independently Owned & Operated</p>
            </div>
        </div>
        <div class="col-md-6 col-sm-6">
            <div class="futer_adress_right">
                <h2>Navneet Kaur</h2>
                <span>Sales Representative</span>
                <p>HomeLife/Miracle Realty Ltd.,Brokerage,  <br />Independently Owned & Operated</p>
            </div>
        </div>
    </div>
    </div>
    </html>
    <script type="text/javascript">

        $(window).load(function () {

            $("#flexiselDemo1").flexisel();
            $("#flexiselDemo2").flexisel({
                enableResponsiveBreakpoints: true,
                responsiveBreakpoints: {
                    portrait: {
                        changePoint: 480,
                        visibleItems: 1
                    },
                    landscape: {
                        changePoint: 640,
                        visibleItems: 2
                    },
                    tablet: {
                        changePoint: 768,
                        visibleItems: 3
                    }
                }
            });

            $("#flexiselDemo3").flexisel({
                visibleItems: 5,
                animationSpeed: 2000,
                autoPlay: true,
                autoPlaySpeed: 5000,
                pauseOnHover: true,
                enableResponsiveBreakpoints: true,
                responsiveBreakpoints: {
                    portrait: {
                        changePoint: 480,
                        visibleItems: 1
                    },
                    landscape: {
                        changePoint: 640,
                        visibleItems: 2
                    },
                    tablet: {
                        changePoint: 768,
                        visibleItems: 3
                    }
                }
            });

            $("#flexiselDemo4").flexisel({
                clone: false
            });

        });
</script>

<script type="text/javascript">
    $('ul.nav li.dropdown').hover(function () {
        $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(500);
    }, function () {
        $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(500);
    });
</script>

<script type="text/javascript" src="js/jquery.nivo.slider.js"></script>
<script type="text/javascript">
    $(window).load(function () {
        $('#slider').nivoSlider();
    });
</script>
  </asp:Content>


