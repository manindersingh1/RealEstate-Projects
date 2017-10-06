<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tour.aspx.cs" Inherits="Property.Tour" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link  href='http://fonts.googleapis.com/css?family=Bree+Serif' rel='stylesheet' type='text/css' />
    <link href="css/ninja-slider.css" rel="stylesheet" />
    <script src="js/ninja-slider.js"></script>
    <style>
        body {font: normal 0.9em Arial;margin:0;}
        a {color:#1155CC;}
        ul li {padding: 10px 0;}
        header {display:block;padding:60px 0 20px;text-align:center;position:absolute;top:8%;left:8%;z-index:4;}
        header a {
            font-family: sans-serif;
            font-size: 24px;
            line-height: 24px;
            padding: 8px 13px 7px;
            color: #fff;
            text-decoration:none;
            transition: color 0.7s;
        }
        header a.active {
            font-weight:bold;
            width: 24px;
            height: 24px;
            padding: 4px;
            text-align: center;
            display:inline-block;
            border-radius: 50%;
            background: #C00;
            color: #fff;
        }
        .w4rlisting-share-a-active 
        {
         background-color:#ff0000 !important;
        }
      .w4rlisting-share-a-deactive 
      {
        background-color:#8f8f8f !important;
      }
    </style>
</head>
<body>
<%--     <header>
        <a href="demo1.html">1</a>
        <a class="active" href="demo2.html">2</a>
        <a href="demo3.html">3</a>
        <a href="demo4.html">4</a>
        <a href="demo5.html">5</a>
        <a href="demo6.html">6</a>
        <a href="demo7.html">7</a>
        <a href="demo8.html">8</a>
    </header>--%>
    <!--start-->
    <div id="ninja-slider">
        <div class="slider-inner">
            <ul>
                <li>
                    <asp:Repeater ID="grdslider" runat="server">
                          <HeaderTemplate>
                          </HeaderTemplate>
                          <ItemTemplate>
                              <li>
                                  <blockquote>
                                      <div class="grdTestimonialstext">
                                          <asp:Image ID="PImage" runat="server" ImageUrl='<%# Eval("pImage") %>' />
                                         <%-- <asp:Label ID="lblPassword" runat="server" Text='<%# Eval("pImage") %>'></asp:Label>
                                          <a id="lblReadMore" style="float: right;" href="View_Testimonials.aspx">Read More</a>--%>
                                      </div>
                                  </blockquote>
                              </li>
                          </ItemTemplate>
                      </asp:Repeater>
                </li>
            </ul>
            <div class="navsWrapper">
                <div id="ninja-slider-prev"></div>
                <div id="ninja-slider-next"></div>
            </div>
        </div>
    </div>
    <!--end-->
   <%-- <div style="text-align:center;margin:30px auto;">
        Detailed instructions: <a href="http://www.menucool.com/zoom-slider">Zoom Slider</a>
    </div> --%>
</body>
</html>
