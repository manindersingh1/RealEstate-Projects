<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<html lang="en">
<head>
    <title>Nivo Slider Demo</title>
    <link rel="stylesheet" href="css/default.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="css/light.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="css/dark.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="css/bar.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="css/style.css" type="text/css" media="screen" />
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="css/bootstrap-theme.css" rel="stylesheet"  type="text/css" media="screen"/>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="screen" />
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="screen"/>
    <style>    
.contact_number {
      float: left;
    height: 100px;
    position: absolute;
    top: 25px;
    width: 400px;
    z-index: 99999;
    padding: 20px
}
    .contact_number span {
        color:white;
        font-size:28px;
    }
    </style>
</head>
<body>

  <%--  <div class="top-bar">
          <div class="container">
            <ul id="menu-top-menu" class="top-menu">
              <li id="menu-item-1577" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-1577"><a href="#">Terms</a></li>
              <li id="menu-item-1578" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-1578"><a href="#">Privacy Policy</a></li>
              <li id="menu-item-1579" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-1579"><a href="#">Legal Agreement</a></li>
            </ul>
            <div class="top-right">
              <ul class="user-account">
                <li> <a href="#"> <span class="fa fa-user"> </span> Login </a> </li>
              </ul>
              <div class="contact-number"> <span class="fa fa-phone-square"> </span> 1 (800) 567 8765 </div>
            </div>
          </div>
        </div>--%>
    <div class="container">
    <div class="banner_section">
    <div id="wrapper">
       <div class="slider-wrapper theme-default">
      
            <div id="slider" class="nivoSlider">         
                <img src="images/banner1.png" " data-thumb="images/banner1.png"  alt="" />         
                <img src="images/banner2.png" " data-thumb="images/banner2.png" alt="" data-transition="slideInLeft" />
                <img src="images/banner3.png" " data-thumb="images/banner3.png" alt="" title="#htmlcaption" />
            </div>
            <%--<div id="htmlcaption" class="nivo-html-caption">
                <strong>This</strong> is an example of a <em>HTML</em> caption with <a href="#">a link</a>. 
            </div>--%>
           <div class="contact_number"><span>(416) 318-5566</span></div>
        </div>
        </div>
        </div>
    </div>
    <script type="text/javascript" src="../js/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="../js/jquery.nivo.slider.js"></script>
    <script type="text/javascript">
        $(window).load(function () {
            $('#slider').nivoSlider();
        });
    </script>
</body>
</html>