<%@ Page Title="" Language="C#" MasterPageFile="~/Property_detail.Master" AutoEventWireup="true" CodeBehind="Print_Property_Detail.aspx.cs" Inherits="Property.Print_Property_Detail" %>

<%@ Register TagName="PropertySearch" TagPrefix="uc" Src="~/Controls/PropertySearch.ascx" %>
<%@ Register TagName="ContactInfo" TagPrefix="uc" Src="~/Controls/ContactInfo.ascx" %>
<%@ Register TagName="Print_Property_Detail" TagPrefix="uc" Src="~/Controls/Print_Property_Detail.ascx" %>
<%@ Register TagName="PropertyDemo" TagPrefix="uc" Src="~/Controls/PropertyDemo.ascx" %>
<%@ Register TagName="GoogleMap" TagPrefix="uc" Src="~/Controls/GoogleMap.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

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
            sb.append('</head>');
            sb.append('<body');
            sb.append('<div style="float: left; width: 100%;">');
            sb.append('<div style="margin: 0 auto; width: 1119px;">');
            sb.append('<div style="width: 50%; padding: 20px 0; float: left; background: #192b4d; height: 42px;">');
            sb.append(' <h2 style="font-size: 32px; color: white; margin: 0 0 0 16px;">Just Listed</h2>');
            sb.append('</div>');
            sb.append('<div style="width: 50%; float: left; background: #192b4d; height: 42px; padding: 20px 0;">');
            sb.append(' <h2 style="float: right; margin: 0 20px 0 0; color: white;">Offered at:<asp:Label Style="font-size: 24px; margin: 0 31px 0 0; font-size: 31px;" ID="lblprice" runat="server"></asp:Label></h2>');
            sb.append('</div>');
            sb.append('<img src="images/banner-inner.jpg" alt="" title="" />');
            sb.append('<div style="width: 100%; float: left; padding: 20px 0;">');
            sb.append('<h2 style="float: left; margin: 0; color: white; font-size: 18px; text-align: center; width: 100%;"><asp:Label ID="lblAddressBar1" runat="server"></asp:Label></h2>');
            sb.append('</div>');
            sb.append(' <div style="float: left; width: 100%; background: white; border-radius: 6px;">');
            sb.append('<div style="float: left; width: 20%; padding: 6px 10px;">');
            sb.append('<h2 style="font-size: 20px; text-transform: uppercase; color: #5a6d21;">Ammeneties</h2>');
            sb.append('<ul style="list-style-type: none; padding: 0; font-size: 15px; line-height: 20px;">');
            sb.append('<li><p><span style="margin: 0 10px 0 0;"><asp:Label ID="lblbed" runat="server"></asp:Label></span>Bedrooms</p></li>');
            sb.append('<li><p><span style="margin: 0 10px 0 0;"><asp:Label ID="lblbath" runat="server"></asp:Label></span>Baths</p></li>');
            sb.append('<li><p><span style="margin: 0 10px 0 0;">5</span>Stone Topsa</p></li>');
            sb.append(' <li><p><span style="margin: 0 10px 0 0;">5</span>Fireplace</p> </li>');
            sb.append('<li><p><span style="margin: 0 10px 0 0;">5</span>Pane Windows</p></li>');
            sb.append('<li><p><span style="margin: 0 10px 0 0;"><asp:Label ID="lblgarage" runat="server"></asp:Label></span>Garages</p></li></ul> </div>');
            sb.append('<div style="float: left; width: 20%; padding: 6px;">');
            sb.append('<h2 style="font-size: 20px; text-transform: uppercase; color: #5a6d21;">Features</h2>');
            sb.append('<p style="font-size: 14px; line-height: 20px;">');
            sb.append('<asp:Label ID="lblPropertyDescription" runat="server"></asp:Label></p></div>');
            sb.append('<div style="float: left; width: 55%; margin-top: 20px; padding: 10px; text-align: center;">');
            sb.append('<div style="float: left;"><asp:Image ID="img1" runat="server" Style=" width:236px; height:150px;" />');
            sb.append('<asp:Image ID="Image1" runat="server" style="width:236px; height:150px;" /></div>');
            sb.append(' <div style="float: left;"><asp:Image ID="Image2" runat="server" Style=" width:236px; height:150px;" />');
            sb.append('<asp:Image ID="Image3" runat="server" style="width:236px; height:150px;" /></div></div>');
            sb.append(' <div style="float: left; width: 40%; padding: 6px 10px;">');
            sb.append('<div style="float: left; width: 25%; text-align: center; font-weight: bold;">');
            sb.append('<img src="images/1.png" alt="" title=""  />');
            sb.append('<p><span style="margin: 0 10px 0 0;"><asp:Label ID="lblbath1" runat="server"></asp:Label></span>Baths</p> </div>');
            sb.append('<div style="float: left; width: 25%; text-align: center; font-weight: bold;">');
            sb.append('<img src="images/2.png" alt="" title="" />');
            sb.append('<p><span style="margin: 0 10px 0 0;"><asp:Label ID="lblBedroom" runat="server"></asp:Label></span>Beds</p></div>');
            sb.append('<div style="float: left; width: 25%; text-align: center; font-weight: bold;">');
            sb.append('<img src="images/3.png" alt="" title="" />');
            sb.append(' <p><span style="margin: 0 10px 0 0;"><asp:Label ID="lblgarage1" runat="server"></asp:Label></span>Garage</p></div>');
            sb.append(' <div style="float: left; width: 25%; text-align: center; font-weight: bold;">');
            sb.append('<img src="images/4.png" alt="" title="" />');
            sb.append('<p style="margin-top: 10px;"><span style="margin: 0 10px 0 0;"><asp:Label ID="lblsqrfeet" Text="456" runat="server"></asp:Label></span>Sq ft</p></div></div>');
            sb.append('<div style="float: left; width: 100%; background: #5a6d21; margin-bottom: 12px;">');
            sb.append('<div style="float: left; width: 20%; text-align: center; padding: 8px;">');
            sb.append(' <img src="images/arshad.png" alt="" title="" /></div>');
            sb.append('<div style="float: left; width: 30%; margin-top: 20px;">');
            sb.append('<h2 style="color: white; margin-bottom: 0px;">Manbir Sandhu</h2>');
            sb.append('<p style="margin-top: 0px;">Sales Representative</p>');
            sb.append('<p style="font-weight: bold;">E-Mail:<span style="font-weight: normal; margin: 0 0px 0 6px;">manbirsandhu07@gmail.com</span></p>');
            sb.append(' <p style="font-weight: bold;">Phone:<span style="font-weight: normal; margin: 0 0px 0 6px;">647-403-4855</span></p></div>');
            sb.append(' <div style="float: left; width: 47%; margin-top: 20px;">');
            sb.append('<img src="images/logo.jpg" alt="" title="" />');
            sb.append(' </div> </div> </div> </div></div> ');
            sb.append('</body>');
            sb.append('</html>');
            popupWin.document.write(sb.toString());
            popupWin.document.close();
        }
    </script>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server" >
    <div id="printarea" style="float: left; width: 100%;">
        <div style="margin: 0 auto; width: 1119px;">
            <div style="width: 50%; padding: 20px 0; float: left; background: #192b4d; height: 42px;">
                <h2 style="font-size: 32px; color: white; margin: 0 0 0 16px;">Just Listed</h2>
            </div>
            <div style="width: 50%; float: left; background: #192b4d; height: 42px; padding: 20px 0;">
                <h2 style="float: right; margin: 0 20px 0 0; color: white;">Offered at:<asp:Label Style="font-size: 24px; margin: 0 31px 0 0; font-size: 31px;" ID="lblprice" runat="server"></asp:Label></h2>
            </div>
            <img src="images/banner-inner.jpg" alt="" title="" />
            <div style="width: 100%; float: left; padding: 20px 0;">
                <h2 style="float: left; margin: 0; color: white; font-size: 18px; text-align: center; width: 100%;"><asp:Label ID="lblAddressBar1" runat="server"></asp:Label></h2>
            </div>
            <div style="float: left; width: 100%; background: white; border-radius: 6px;">
                <div style="float: left; width: 20%; padding: 6px 10px;">
                    <h2 style="font-size: 20px; text-transform: uppercase; color: #5a6d21;">Ammeneties</h2>
                    <ul style="list-style-type: none; padding: 0; font-size: 15px; line-height: 20px;">
                        
                            <li><p><span style="margin: 0 10px 0 0;"><asp:Label ID="lblbed" runat="server"></asp:Label></span>Bedrooms</p></li>
                        
                        
                            <li><p><span style="margin: 0 10px 0 0;"><asp:Label ID="lblbath" runat="server"></asp:Label></span>Baths</p></li>
                        
                        
                            <li><p><span style="margin: 0 10px 0 0;">5</span>Stone Topsa</p></li>
                        
                        
                            <li><p><span style="margin: 0 10px 0 0;">5</span>Fireplace</p> </li>
                       
                       
                             <li><p><span style="margin: 0 10px 0 0;">5</span>Pane Windows</p></li>
                        
                        
                            <li><p><span style="margin: 0 10px 0 0;"><asp:Label ID="lblgarage" runat="server"></asp:Label></span>Garages</p></li></ul> </div>
               
                        
                    
                <div style="float: left; width: 20%; padding: 6px;">
                    <h2 style="font-size: 20px; text-transform: uppercase; color: #5a6d21;">Features</h2>
                    <p style="font-size: 14px; line-height: 20px;">
                        <asp:Label ID="lblPropertyDescription" runat="server"></asp:Label></p></div>
                    
                <div style="float: left; width: 55%; margin-top: 20px; padding: 10px; text-align: center;">
                    
                        <div style="float: left;"><asp:Image ID="img1" runat="server" Style=" width:236px; height:150px;" />
                        <asp:Image ID="Image1" runat="server" style="width:236px; height:150px;" /></div>
                    
                    
                        <div style="float: left;"><asp:Image ID="Image2" runat="server" Style=" width:236px; height:150px;" />
                        <asp:Image ID="Image3" runat="server" style="width:236px; height:150px;" /></div>
                    
                </div>
                <div style="float: left; width: 40%; padding: 6px 10px;">
                    <div style="float: left; width: 25%; text-align: center; font-weight: bold;">
                        <img src="images/1.png" alt="" title=""  />
                        <p><span style="margin: 0 10px 0 0;"><asp:Label ID="lblbath1" runat="server"></asp:Label></span>Baths</p> </div>

                   
                    <div style="float: left; width: 25%; text-align: center; font-weight: bold;">
                        <img src="images/2.png" alt="" title="" />
                        <p><span style="margin: 0 10px 0 0;"><asp:Label ID="lblBedroom" runat="server"></asp:Label></span>Beds</p>

                    </div>
                    <div style="float: left; width: 25%; text-align: center; font-weight: bold;">
                        <img src="images/3.png" alt="" title="" />
                        <p><span style="margin: 0 10px 0 0;"><asp:Label ID="lblgarage1" runat="server"></asp:Label></span>Garage</p>

                    </div>
                    <div style="float: left; width: 25%; text-align: center; font-weight: bold;">
                        <img src="images/4.png" alt="" title="" />
                        <p style="margin-top: 10px;"><span style="margin: 0 10px 0 0;"><asp:Label ID="lblsqrfeet" Text="456" runat="server"></asp:Label></span>Sq ft</p>
                    </div> </div>//
               
                <div style="float: left; width: 100%; text-align: center; font-size: 24px; margin: 10px 0;">
                    <span style="color: #192b4d; font-family: 'Times New Roman', Times, serif;">Lorem Ipsum is simply dummy text of the printing and typesetting industry.   </span>
                    <p style="font-size: 16px;"><asp:Label ID="lblremarks" runat="server"></asp:Label></p>
                </div>
                <div style="float: left; width: 100%; background: #5a6d21; margin-bottom: 12px;">
                    <div style="float: left; width: 20%; text-align: center; padding: 8px;">
                        <img src="images/arshad.png" alt="" title="" />
                    </div>
                
                    <div style="float: left; width: 30%; margin-top: 20px;">
                        <h2 style="color: white; margin-bottom: 0px;">Manbir Sandhu</h2>
                        <p style="margin-top: 0px;">Sales Representative</p>
                        <p style="font-weight: bold;">E-Mail:<span style="font-weight: normal; margin: 0 0px 0 6px;">manbirsandhu07@gmail.com</span></p>
                        <p style="font-weight: bold;">Phone:<span style="font-weight: normal; margin: 0 0px 0 6px;">647-403-4855</span></p>
                    </div>
                    <div style="float: left; width: 47%; margin-top: 20px;">
                        <img src="images/logo.jpg" alt="" title="" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
