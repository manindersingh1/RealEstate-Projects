<%@ Page Title="About Us" Language="C#" AutoEventWireup="true"
    CodeBehind="About.aspx.cs" Inherits="Property.About" %>

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
<body>
    <div class="top_sect_bg">
        <div class="container">
            <div class="col-md-3 col-sm-3">
                <div class="logo_sctn">
                    <a href="#">
                        <img src="Multiple_Condos/images/logo.png" alt="" title="" />
                    </a>
                </div>
            </div>
            <div class="col-md-1 col-sm-1">
            </div>
            <div class="col-md-8 col-sm-8">
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
                                    <li><a href="about.aspx">About us</a></li>
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Multiple Condos <b class="caret"></b></a>
                                        <asp:Literal ID="dynamicmenus" runat="server"></asp:Literal>


                                    </li>
                                    <li><a href="register.aspx">Register Now</a></li>
                                    <li><a href="disclaimer.aspx">Disclaimer</a></li>
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
    <div class="banner_sct_bg">
        <div class="inner_banner">
            <img src="Multiple_Condos/images/banner1.jpg" alt="" title="" />
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

                        </div>
                    </div>
                    <div class="col-md-5 col-sm-5">
                        <div class="video_section">
                            <iframe src="https://www.youtube.com/embed/Hsybe862Zhg" frameborder="0" allowfullscreen></iframe>
                        </div>
                    </div>
                </div>
                <div class="team_bg">
                    <div class="col-md-3 col-sm-3">
                        <div class="team_img">
                            <img src="Multiple_Condos/images/rajiv.jpg" alt="" title="" />
                        </div>
                    </div>
                    <div class="col-md-9 col-sm-9">
                        <div class="team_content">
                            <h2>Rajiv Datta</h2>
                            <p><strong>RAJIV DATTA,  President and Broker of Record of Homelife Lifetime Realty Inc.,</strong> has won multiple  awards in the field of real estate including top 5% in Canada President Award, Top Listing Salesperson, Platinum Award. Rajiv Datta is the name people trust in real estate since 2002. Rajiv is known for his expertise and industry knowledge. With his expertise in pre-construction low-rise and high-rise condos, resale homes and commercial properties, Rajiv has achieved continued success for his clients and himself. His experience in the market and his knowledge of the business sets him Legend In The Field. What motivates RAJIV and his whole team, is producing the most satisfying results for their clients.</p>
                        </div>
                    </div>
                </div>
                <div class="team_bg">
                    <div class="col-md-9 col-sm-9">
                        <div class="team_content">
                            <h2>Navneet Kaur</h2>
                            <p><strong>Navneet Kaur</strong> is a toronto Condo Specialist & Presale Expert who is setting a new standard in service. Her personable nature and strong work ethic help build great rapport and relationships with her clients. Right from day one of her career as a Realtor, Nav has measured her success by the number of happy and satisfied home owners she's assisted. With a Masters Degree focused on a specialization in Human Resource and Behaviour , She bring forth a very honest, caring and patient approach with Clients.</p>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-3">
                        <div class="team_img">
                            <img src="Multiple_Condos/images/navneet.jpg" alt="" title="" />
                        </div>
                    </div>
                </div>
                <div class="team_bg">
                    <div class="col-md-3 col-sm-3">
                        <div class="team_img">
                            <img src="Multiple_Condos/images/abhi.jpg" alt="" title="" />
                        </div>
                    </div>
                    <div class="col-md-9 col-sm-9">
                        <div class="team_content">
                            <h2>Abhi</h2>
                            <p>It has been wisely said by someone "If you make a sale, you can make a living. If you make an investment of time and good service in a customer, you can make a fortune." Always inspired from this quote Abhi has gained tremendous experience in Real Estate while helping people make the right investment at right time and right place. Abhi's commitment to his clients and work ethic are unparalleled. He has a thorough understanding of the real estate market and exceptional negotiating skills. Abhi believes that clients deserve more – more competency, more care, more focus.</p>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>


    <div class="futer_section">
        <h2>Designed & Developed by: Only4Agents</h2>
    </div>
</body>
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
</html>
