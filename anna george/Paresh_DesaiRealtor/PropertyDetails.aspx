<%@ Page Title="" Language="C#" MasterPageFile="~/Property_New1.Master" AutoEventWireup="true"
    CodeBehind="PropertyDetails.aspx.cs" Inherits="Property.PropertyDetails" %>

<%@ Register TagName="PropertySearch" TagPrefix="uc" Src="~/Controls/PropertySearch.ascx" %>
<%@ Register TagName="ContactInfo" TagPrefix="uc" Src="~/Controls/ContactInfo.ascx" %>
<%@ Register TagName="PropertyDetailsControl" TagPrefix="uc" Src="~/Controls/PropertyDetailsControl.ascx" %>
<%@ Register TagName="PropertyDemo" TagPrefix="uc" Src="~/Controls/PropertyDemo.ascx" %>
<%@ Register TagName="GoogleMap" TagPrefix="uc" Src="~/Controls/GoogleMap.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
     
    <style type="text/css">
        .gmnoprint img
        {
            max-width: none;
        }
    </style>
      <style type="text/css">
        .gmnoprint img
        {
            max-width: none;
        }
    </style>
    <script type="text/javascript">
        jssor_slider1_starter = function (containerId) {

            var _SlideshowTransitions = [
            //Fade in L
                { $Duration: 1200, $During: { $Left: [0.3, 0.7] }, $FlyDirection: 1, $Easing: { $Left: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $ScaleHorizontal: 0.3, $Opacity: 2 }
            //Fade out R
                , { $Duration: 1200, $SlideOut: true, $FlyDirection: 2, $Easing: { $Left: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $ScaleHorizontal: 0.3, $Opacity: 2 }
            //Fade in R
                , { $Duration: 1200, $During: { $Left: [0.3, 0.7] }, $FlyDirection: 2, $Easing: { $Left: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $ScaleHorizontal: 0.3, $Opacity: 2 }
            //Fade out L
                , { $Duration: 1200, $SlideOut: true, $FlyDirection: 1, $Easing: { $Left: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $ScaleHorizontal: 0.3, $Opacity: 2 }

            //Fade in T
                , { $Duration: 1200, $During: { $Top: [0.3, 0.7] }, $FlyDirection: 4, $Easing: { $Top: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $ScaleVertical: 0.3, $Opacity: 2 }
            //Fade out B
                , { $Duration: 1200, $SlideOut: true, $FlyDirection: 8, $Easing: { $Top: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $ScaleVertical: 0.3, $Opacity: 2 }
            //Fade in B
                , { $Duration: 1200, $During: { $Top: [0.3, 0.7] }, $FlyDirection: 8, $Easing: { $Top: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $ScaleVertical: 0.3, $Opacity: 2 }
            //Fade out T
                , { $Duration: 1200, $SlideOut: true, $FlyDirection: 4, $Easing: { $Top: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $ScaleVertical: 0.3, $Opacity: 2 }

            //Fade in LR
                , { $Duration: 1200, $Cols: 2, $During: { $Left: [0.3, 0.7] }, $FlyDirection: 1, $ChessMode: { $Column: 3 }, $Easing: { $Left: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $ScaleHorizontal: 0.3, $Opacity: 2 }
            //Fade out LR
                , { $Duration: 1200, $Cols: 2, $SlideOut: true, $FlyDirection: 1, $ChessMode: { $Column: 3 }, $Easing: { $Left: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $ScaleHorizontal: 0.3, $Opacity: 2 }
            //Fade in TB
                , { $Duration: 1200, $Rows: 2, $During: { $Top: [0.3, 0.7] }, $FlyDirection: 4, $ChessMode: { $Row: 12 }, $Easing: { $Top: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $ScaleVertical: 0.3, $Opacity: 2 }
            //Fade out TB
                , { $Duration: 1200, $Rows: 2, $SlideOut: true, $FlyDirection: 4, $ChessMode: { $Row: 12 }, $Easing: { $Top: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $ScaleVertical: 0.3, $Opacity: 2 }

            //Fade in LR Chess
                , { $Duration: 1200, $Cols: 2, $During: { $Top: [0.3, 0.7] }, $FlyDirection: 4, $ChessMode: { $Column: 12 }, $Easing: { $Top: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $ScaleVertical: 0.3, $Opacity: 2 }
            //Fade out LR Chess
                , { $Duration: 1200, $Cols: 2, $SlideOut: true, $FlyDirection: 8, $ChessMode: { $Column: 12 }, $Easing: { $Top: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $ScaleVertical: 0.3, $Opacity: 2 }
            //Fade in TB Chess
                , { $Duration: 1200, $Rows: 2, $During: { $Left: [0.3, 0.7] }, $FlyDirection: 1, $ChessMode: { $Row: 3 }, $Easing: { $Left: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $ScaleHorizontal: 0.3, $Opacity: 2 }
            //Fade out TB Chess
                , { $Duration: 1200, $Rows: 2, $SlideOut: true, $FlyDirection: 2, $ChessMode: { $Row: 3 }, $Easing: { $Left: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $ScaleHorizontal: 0.3, $Opacity: 2 }

            //Fade in Corners
                , { $Duration: 1200, $Cols: 2, $Rows: 2, $During: { $Left: [0.3, 0.7], $Top: [0.3, 0.7] }, $FlyDirection: 5, $ChessMode: { $Column: 3, $Row: 12 }, $Easing: { $Left: $JssorEasing$.$EaseInCubic, $Top: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $ScaleHorizontal: 0.3, $ScaleVertical: 0.3, $Opacity: 2 }
            //Fade out Corners
                , { $Duration: 1200, $Cols: 2, $Rows: 2, $During: { $Left: [0.3, 0.7], $Top: [0.3, 0.7] }, $SlideOut: true, $FlyDirection: 5, $ChessMode: { $Column: 3, $Row: 12 }, $Easing: { $Left: $JssorEasing$.$EaseInCubic, $Top: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $ScaleHorizontal: 0.3, $ScaleVertical: 0.3, $Opacity: 2 }

            //Fade Clip in H
                , { $Duration: 1200, $Delay: 20, $Clip: 3, $Assembly: 260, $Easing: { $Clip: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 }
            //Fade Clip out H
                , { $Duration: 1200, $Delay: 20, $Clip: 3, $SlideOut: true, $Assembly: 260, $Easing: { $Clip: $JssorEasing$.$EaseOutCubic, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 }
            //Fade Clip in V
                , { $Duration: 1200, $Delay: 20, $Clip: 12, $Assembly: 260, $Easing: { $Clip: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 }
            //Fade Clip out V
                , { $Duration: 1200, $Delay: 20, $Clip: 12, $SlideOut: true, $Assembly: 260, $Easing: { $Clip: $JssorEasing$.$EaseOutCubic, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 }
            ];

            var options = {
                $AutoPlay: true,                                    //[Optional] Whether to auto play, to enable slideshow, this option must be set to true, default value is false
                $AutoPlayInterval: 1500,                            //[Optional] Interval (in milliseconds) to go for next slide since the previous stopped if the slider is auto playing, default value is 3000
                $PauseOnHover: 1,                                //[Optional] Whether to pause when mouse over if a slider is auto playing, 0 no pause, 1 pause for desktop, 2 pause for touch device, 3 pause for desktop and touch device, default value is 1

                $DragOrientation: 3,                                //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $DisplayPieces is greater than 1, or parking position is not 0)
                $ArrowKeyNavigation: true,   			            //[Optional] Allows keyboard (arrow key) navigation or not, default value is false
                $SlideDuration: 800,                                //Specifies default duration (swipe) for slide in milliseconds

                $SlideshowOptions: {                                //[Optional] Options to specify and enable slideshow or not
                    $Class: $JssorSlideshowRunner$,                 //[Required] Class to create instance of slideshow
                    $Transitions: _SlideshowTransitions,            //[Required] An array of slideshow transitions to play slideshow
                    $TransitionsOrder: 1,                           //[Optional] The way to choose transition to play slide, 1 Sequence, 0 Random
                    $ShowLink: true                                    //[Optional] Whether to bring slide link on top of the slider when slideshow is running, default value is false
                },

                $ArrowNavigatorOptions: {                       //[Optional] Options to specify and enable arrow navigator or not
                    $Class: $JssorArrowNavigator$,              //[Requried] Class to create arrow navigator instance
                    $ChanceToShow: 1                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                },

                $ThumbnailNavigatorOptions: {                       //[Optional] Options to specify and enable thumbnail navigator or not
                    $Class: $JssorThumbnailNavigator$,              //[Required] Class to create thumbnail navigator instance
                    $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always

                    $ActionMode: 1,                                 //[Optional] 0 None, 1 act by click, 2 act by mouse hover, 3 both, default value is 1
                    $SpacingX: 8,                                   //[Optional] Horizontal space between each thumbnail in pixel, default value is 0
                    $DisplayPieces: 10,                             //[Optional] Number of pieces to display, default value is 1
                    $ParkingPosition: 360                          //[Optional] The offset position to park thumbnail
                }
            };

            var jssor_slider1 = new $JssorSlider$(containerId, options);
            //responsive code begin
            //you can remove responsive code if you don't want the slider scales while window resizes
            function ScaleSlider() {
                var parentWidth = jssor_slider1.$Elmt.parentNode.clientWidth;
                if (parentWidth)
                    jssor_slider1.$SetScaleWidth(Math.max(Math.min(parentWidth, 700), 300));
                else
                    $JssorUtils$.$Delay(ScaleSlider, 30);
            }

            ScaleSlider();
            $JssorUtils$.$AddEvent(window, "load", ScaleSlider);


            if (!navigator.userAgent.match(/(iPhone|iPod|iPad|BlackBerry|IEMobile)/)) {
                $JssorUtils$.$OnWindowResize(window, ScaleSlider);
            }

            //if (navigator.userAgent.match(/(iPhone|iPod|iPad)/)) {
            //    $JssorUtils$.$AddEvent(window, "orientationchange", ScaleSlider);
            //}
            //responsive code end
        };
    </script>
       <script type="text/javascript">
           function StringBuilder(value) {
               this.strings = new Array("");
               this.append(value);
           }

           // Appends the given value to the end of this instance.
           StringBuilder.prototype.append = function (value) {
               if (value) {
                   this.strings.push(value);
               }
           }

           // Clears the string buffer
           StringBuilder.prototype.clear = function () {
               this.strings.length = 1;
           }

           // Converts this instance to a String.
           StringBuilder.prototype.toString = function () {
               return this.strings.join("");
           }
           function PrintDiv() {
               var divToPrint = document.getElementById('printarea');
               var popupWin = window.open('', '_blank', 'width=500,height=500,location=no, scrollbars=yes,left=200px;');
               popupWin.document.open();

               // create a StringBuilder
               var sb = new StringBuilder();

               // append some text
               sb.append('<html><head>');
               sb.append('<link rel="stylesheet" type="text/css" href="css/style.css" />');
               sb.append('<link rel="stylesheet" type="text/css" href="css/shortcodes.css" />');
               sb.append('<link rel="stylesheet" type="text/css" href="css/style_002.css" />');
               sb.append('</head>');
               sb.append('<body onload="window.print()">' + divToPrint.innerHTML + '</body>');
               sb.append('</html>');

               popupWin.document.write(sb.toString());
               popupWin.document.close();
           }
    </script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <asp:ScriptManager runat="server" ID="update"></asp:ScriptManager>
<div class="Detail_Left">
 <asp:Label ID="lblAddressBar1" Visible="false" runat="server" Text=""></asp:Label>
   </div>  
<div class="email_bg">
    <div class="D etail_Email">
   
        <uc:PropertyDemo ID="PropertyDemo" runat="server" />
    </div>
    </div>
    <div id="printarea" style="float: left; width: 100%; display: none;">
        <div style="margin: 0 auto; width: 1119px;">
            <div style="width: 50%; padding: 20px 0; float: left; background: #192b4d; height: 42px;">
                <h2 style="font-size: 32px; color: white; margin: 0 0 0 16px;">Just Listed</h2>
            </div>
            <div style="width: 50%; float: left; background: #192b4d; height: 42px; padding: 20px 0;">
                <h2 style="float: right; margin: 0 20px 0 0; color: white;">Offered at:<asp:Label Style="font-size: 24px; margin: 0 31px 0 0; font-size: 31px;" ID="lblprice" runat="server"></asp:Label></h2>
            </div>
            <div style="width: 100%; float: left; padding: 20px 0;">
                <h2 style="float: left; margin: 0; color: white; font-size: 18px; text-align: center; width: 100%;">
                    <asp:Label ID="Label1" runat="server"></asp:Label></h2>
            </div>
            <div style="float: left; width: 100%; background: white; border-radius: 6px; padding:10px;">
                <div style="float: left; width: 43%; margin-top: -6px; padding: 10px; text-align: center;">
                    <div style="float: left;">
                        <asp:Image ID="img1" runat="server" Style="width: 100%; height: 350px;" />
                    </div>
                </div>
                <div style="float: left; width: 23%; padding: 6px 10px;">
                    <h2 style="font-size: 18px; text-transform: uppercase; font-family:arial; color: #5a6d21;">Ammeneties</h2>
                    <ul style="list-style-type: none; padding: 0; font-size: 15px; line-height: 26px;">
                        <li>
                            <p style="font-family:arial; font-size:13px; font-weight:bold;">
                                <span style="margin: 0 27px 0 0; color: #7c952d; font-family:arial; font-weight:bold; width: 80px; float: left;">MLS</span>
                                <asp:Label ID="lblMLS" runat="server"></asp:Label>
                            </p>
                        </li>
                        <li>
                            <p style="font-family:arial; font-size:13px; font-weight:bold;">
                                <span style="margin: 0 27px 0 0; color: #7c952d; font-family:arial; font-weight:bold; width: 80px; float: left;">BedRooom</span>
                                <asp:Label ID="lblbed" runat="server"></asp:Label>
                            </p>
                        </li>
                        <li>
                            <p style="font-family:arial; font-size:13px; font-weight:bold;">
                                <span style="margin: 0 27px 0 0; color: #7c952d; font-family:arial; font-weight:bold; width: 80px; float: left;">Bathroom</span>
                                <asp:Label ID="lblbath" runat="server"></asp:Label>
                            </p>
                        </li>
                        <li>
                            <p style="font-family:arial; font-size:13px; font-weight:bold;">
                                <span style="margin: 0 27px 0 0; color: #7c952d; width: 80px; font-family:arial; font-weight:bold; float: left;">Community</span>
                                <asp:Label ID="lblcommunity" runat="server"></asp:Label>
                            </p>
                        </li>
                        <li>
                        
                            <p style="font-family:arial; font-size:13px; font-weight:bold;">
                                <span style="margin: 0 27px 0 0; color: #7c952d; width: 80px; font-family:arial; font-weight:bold; float: left;">MLS</span>
                                <asp:Label ID="lblroom" runat="server"></asp:Label>
                            </p>
                        </li>
                        <li>
                            <p style="font-family:arial; font-size:13px; font-weight:bold;">
                                <span style="margin: 0 27px 0 0; color: #7c952d; width: 80px; font-family:arial; font-weight:bold; float: left;">City</span>
                                <asp:Label ID="lblcity" runat="server"></asp:Label>
                            </p>
                        </li>
                        <li>
                            <p style="font-family:arial; font-size:13px; font-weight:bold;">
                                <span style="margin: 0 27px 0 0; color: #7c952d; width: 80px; font-family:arial; font-weight:bold; float: left;">Type</span>
                                <asp:Label ID="lbltype" runat="server"></asp:Label>
                            </p>
                        </li>
                        <li>
                            <p style="font-family:arial; font-size:13px; font-weight:bold;">
                                <span style="margin: 0 27px 0 0; color: #7c952d; width: 80px; font-family:arial; font-weight:bold; float: left;">Area</span>
                                <asp:Label ID="lblarea" runat="server"></asp:Label>
                            </p>
                        </li>
                        <li>
                            <p style="font-family:arial; font-size:13px; font-weight:bold;">
                                <span style="margin: 0 27px 0 0; color: #7c952d; width: 80px; font-family:arial; font-weight:bold; float: left;">Basement</span>
                                <asp:Label ID="lblbasement" runat="server"></asp:Label>
                            </p>
                        </li>
                        <li>
                            <p style="font-family:arial; font-size:13px; font-weight:bold;">
                                <span style="margin: 0 27px 0 0; color: #7c952d; width: 80px; font-family:arial; font-weight:bold; float: left;">Garage</span>
                                <asp:Label ID="lblgarage" runat="server"></asp:Label>
                            </p>
                        </li>
                        <li>
                            <p style="font-family:arial; font-size:13px; font-weight:bold;">
                                <span style="margin: 0 27px 0 0; color: #7c952d; width: 80px; font-family:arial; font-weight:bold; float: left;">Tax</span>
                                <asp:Label ID="lbltax" runat="server"></asp:Label>
                            </p>
                        </li>
                    </ul>
                </div>
                <div style="float: left; width: 28%; padding: 6px 10px; margin-top: 0px;">
                    <div style="float: left; width: 100%; font-weight: bold; margin-bottom:5px;">
                        <img src="images/1.png" alt="" title="" style="float: left; margin: 0 14px 10px 0; width: 6%;" />
                        <p style="font-size: 14px; font-family:arial; font-weight:bold;"><span style="margin:0px ;">
                            <asp:Label ID="lblbath1" runat="server"></asp:Label></span>Baths</p>
                    </div>
                    <div style="float: left; width: 100%; font-weight: bold;  margin-bottom:5px;">
                        <img src="images/2.png" alt="" title="" style="float: left; margin: 0 14px 10px 0; width: 6%;" />
                        <p style="font-size: 14px; font-family:arial; font-weight:bold;">
                            <asp:Label ID="lblBedroom" runat="server"></asp:Label></span>Beds</p>
                    </div>
                    <div style="float: left; width: 100%; font-weight: bold;  margin-bottom:5px;">
                        <img src="images/3.png" alt="" title="" style="float: left; margin: 0 14px 10px 0; width: 6%;" />
                        <p style="font-size: 14px; font-family:arial; font-weight:bold;">
                            <asp:Label ID="lblgarage1" runat="server"></asp:Label></span>Garage</p>
                    </div>
                    <div style="float: left; width: 100%; font-weight: bold;  margin-bottom:5px;">
                        <img src="images/4.png" alt="" title="" style="float: left; margin: 0 14px 10px 0; width: 6%;" />
                        <p style="font-size: 14px; font-family:arial; font-weight:bold;"><span style="margin: 0px;">
                            <asp:Label ID="lblsqrfeet" Text="456" runat="server"></asp:Label></span>Sq ft</p>
                    </div>
                </div>
                <div style="float: left; width: 100%; margin-top: -6px; padding: 10px; text-align: center;">
                    <div style="float: left; float: left; width: 100%;">
                        <asp:Image ID="img2" runat="server" Style="width: 157px; height: 120px; float: left; margin-right: 5px;" />
                        <asp:Image ID="Image1" runat="server" Style="width: 157px; height: 120px; float: left; margin-right: 5px;" />
                        <asp:Image ID="Image2" runat="server" Style="width: 157px; height: 120px; float: left; margin-right: 5px;" />
                        <asp:Image ID="Image3" runat="server" Style="width: 157px; height: 120px; float: left; margin-right: 5px;" />
                        <asp:Image ID="Image4" runat="server" Style="width: 157px; height: 120px; float: left; margin-right: 5px;" />
                        <asp:Image ID="Image5" runat="server" Style="width: 157px; height: 120px; float: left; margin-right: 5px;" />
                    </div>
                </div>
                <div style="float: left; width: 100%; padding: 0px;">
                    <h2 style="font-size:17px; text-transform: uppercase; background: #6e6e6e; font-family:arial; padding: 5px; color: white;">Features</h2>
                    <p style="font-size: 14px; font-family:arial; line-height: 24px;">
                        <asp:Label ID="lblPropertyDescriptionnew" runat="server"></asp:Label>
                    </p>
                </div>
                <div style="float: left; width: 100%; font-size: 24px; margin: 10px 0;">
                    <h2  style="font-size:17px; text-transform: uppercase; background: #6e6e6e; margin-top:10px; margin-bottom:10px; font-family:arial; padding: 5px; color: white;">Discription</h2>
                    <p style="font-size: 14px; padding: 6px; line-height: 24px;">
                        <asp:ListView ID="LVroom" runat="server">
                            <LayoutTemplate>
                                <table class="table cld_tabl table-responsive" style="font-family:arial; font-size:14px; line-height:24px; border:2px solid #6e6e6e; padding: 5px; ">
                                    <thead class="tble_hdng_clr">
                                        <tr>
                                            <th style="text-align:left;padding: 5px;">Room</th>
                                            <th style="text-align:left;padding: 5px;">Level</th>
                                            <th style="text-align:left;padding: 5px;">Dimension</th>
                                            <th style="text-align:left;padding: 5px;">Features</th>

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
                    </p>
                </div>
                <div style="float: left; width: 100%; font-size: 24px; margin: 10px 0;">
                    <h2 style="font-size:17px; text-transform: uppercase; background: #6e6e6e; font-family:arial; padding: 5px; color: white;">Highlights</h2>
                    <span style="color: #192b4d; font-size: 14px; font-family:arial; float: left; margin: 4px 0 0; padding: 5px; line-height:24px;">
                        <asp:Label ID="lblremarks" runat="server"></asp:Label>
                    </span>
                </div>
                <div style="float: left; width: 100%; margin-bottom: 12px;">
                    <div style="float: left; width: 33%; padding: 8px;">
                        <img style="border:2px solid gray;" src="images/arshad.png" alt="" title="" />
                    </div>
                    <div style="float: left; width: 33%; margin-top: 20px;">
                        <h2 style="margin-bottom: 5px; font-family:arial; font-size: 18px;">Anna George</h2>
                        <p style="margin-bottom: 5px; font-family:arial;">Sales Representative</p>
                        <p style="font-weight: bold; margin-bottom: 5px; font-family:arial;">E-Mail:<span style="font-weight: normal; margin: 0 0px 0 6px;">gannjolly@gmail.com</span></p>
                        <p style="font-weight: bold; margin-bottom: 5px; font-family:arial;">Phone:<span style="font-weight: normal; margin: 0 0px 0 6px;">905-510-1509</span></p>
                    </div>
                    <div style="float: left; width: 31%; margin-top: 20px;">
                        <img src="images/logo.jpg" alt="" title="" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
