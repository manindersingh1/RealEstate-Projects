<%@ Page Title="" Language="C#"  AutoEventWireup="true" MasterPageFile="~/MultipleCondos.Master" CodeBehind="DreamHouseDetail.aspx.cs" Inherits="Property.DreamHouseDetail" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
   <%-- <script src="js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="js/jssor.slider.js"></script>
    <script type="text/javascript" src="js/jssor.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="slider/css/media-queries.css" rel="stylesheet" />--%>
    <style type="text/css">

        .new_pop {
    border: 2px solid 
}
.btn.btn-default.mdl_sbmt_btn {
    background:#6b0c00 !important;
    color:white !important;
    }
.modl_sct > input {
    margin: 0 !important;
    padding: 7px !important;
}
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
        StringBuilder.prototype.append = function (value) {
            if (value) {
                this.strings.push(value);
            }
        }
        StringBuilder.prototype.clear = function () {
            this.strings.length = 1;
        }
        StringBuilder.prototype.toString = function () {
            return this.strings.join("");
        }
        function PrintDiv() {
            var divToPrint = document.getElementById('printarea');
            var popupWin = window.open('', '_blank', 'width=500,height=500,location=no, scrollbars=yes,left=200px;');
            popupWin.document.open();
            var sb = new StringBuilder();
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

           <script type="text/javascript">
               function openModal() {
                   $('#btnModal').click();
               }
               $('#btnSubmit').click(function () {
                   var name = document.getElementById("txtName").value;
                   var emailId = document.getElementById("txtEmailID").value;
                   var phone = document.getElementById("txtPhone").value;
                   debugger;
                   if (name == "" && emailId == "" && phone == "") {
                       alert("please fill all details.");
                   }
                   else {

                   }
               }
                   )
               function ValidateMobNumber(txtPhone) {
                   var phone = document.getElementById("txtPhone");
                   if (phone.value == "") {
                       alert("You didn't enter a phone number.");
                       phone.value = "";
                       phone.focus();
                       return false;
                   }
                   else if (isNaN(phone.value)) {
                       alert("The phone number contains illegal characters.");
                       phone.value = "";
                       phone.focus();
                       return false;
                   }
                   else if (!(phone.value.length == 10)) {
                       alert("The phone number is the wrong length. \nPlease enter 10 digit mobile no.");
                       phone.value = "";
                       phone.focus();
                       return false;
                   }
               }
               //$( var phone = document.getElementById("txtPhone").value;document).ready(function () {
               //    $('#btnSubmit').click(function () {
               //        debugger;
               //        var name = document.getElementById("txtName").value;
               //        var emailId = document.getElementById("txtEmailID").value;
               //        var phone = document.getElementById("txtPhone").value;
               //        $.ajax({
               //            type: "POST",
               //            url: "PropertyDetails.aspx/SaveUserInfo",
               //            data: { Name: name, Email: emailId, Phone: phone },
               //            contentType: "application/json;",
               //            dataType: "json",
               //            success: function (data) {
               //                alert("Successfully register");
               //            },
               //            error: function (err)
               //            {
               //                alert(err);
               //            }
               //        });
               //    });

               //});

 </script>
</asp:Content>

 


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager runat="server" ID="update"></asp:ScriptManager>
    
    <div class="email_bg">
        <div class="Detail_Email">
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
                                      
        </div>
            </div>
</div>

   
   
</asp:Content>
