<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/NewsLetterMaster.Master" AutoEventWireup="true"
    CodeBehind="NewsLetter.aspx.cs" Inherits="Property.Admin.NewsLetter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <%--    <link href="../css/style_002.css" rel="stylesheet" />
    <link href="../slider/css/style.css" rel="stylesheet" />
    <link href="../css/shortcodes.css" rel="stylesheet" />--%>

    <script type="text/javascript">
        $(document).ready(function () {

            //Slider work
            $('#slider3').css('display', 'block')
            $('#slider3').Thumbelina({
                orientation: 'vertical',         // Use vertical mode (default horizontal).
                $bwdBut: $('#slider3 .top'),     // Selector to top button.
                $fwdBut: $('#slider3 .bottom')   // Selector to bottom button.
            });

            $("#Newsletter_click li").click(function () {

                var id = this.id;
                if (id == "First_nwslettr") {
                    Show_FirstNewsLetter();
                    $('#<%=hdnTemplateType.ClientID %>').val(id)
                }
                else if (id == "Second_nwslettr") {
                    Show_SecondNewsLetter();
                    $('#<%=hdnTemplateType.ClientID %>').val(id)
                }
                else if (id == "Thirld_nwslettr") {
                    Show_ThirldNewsLetter();
                    $('#<%=hdnTemplateType.ClientID %>').val(id)
                }
                else if (id == "Fourth_nwslettr") {
                    Show_FourthNewsLetter();
                    $('#<%=hdnTemplateType.ClientID %>').val(id)
                }
                else if (id == "Fifth_nwslettr") {

                    Show_FifthNewsLetter();
                    $('#<%=hdnTemplateType.ClientID %>').val(id)
                }
                else if (id == "Sixth_nwslettr") {

                    Show_SixthNewsLetter();
                    $('#<%=hdnTemplateType.ClientID %>').val(id)
                }
                else if (id == "Seventh_nwslettr") {

                    Show_SevenNewsLetter();
                    $('#<%=hdnTemplateType.ClientID %>').val(id)
                }
                else if (id == "Eighth_nwslettr") {

                    Show_EightNewsLetter();
                    $('#<%=hdnTemplateType.ClientID %>').val(id)
                 }
                 else if (id == "Ninth_nwslettr") {
                    
                     Show_NinthNewsLetter();
                     
                    $('#<%=hdnTemplateType.ClientID %>').val(id)
                }
                else if (id == "Tenth_nwslettr") {

                    Show_TenthNewsLetter();
                    $('#<%=hdnTemplateType.ClientID %>').val(id)
                }
                else if (id == "Eleventh_nwslettr") {

                    Show_EleventhNewsLetter();
                    $('#<%=hdnTemplateType.ClientID %>').val(id)
                }
                else if (id == "Twelveth_nwslettr") {

                    Show_TwelvethNewsLetter();
                    $('#<%=hdnTemplateType.ClientID %>').val(id)
                }
                else if (id == "Thirteenth_nwslettr") {

                    Show_ThirteenthNewsLetter();
                    $('#<%=hdnTemplateType.ClientID %>').val(id)
                }
                else if (id == "Fourteenth_nwslettr") {

                    Show_FourteenthNewsLetter();
                    $('#<%=hdnTemplateType.ClientID %>').val(id)
                }
                else if (id == "Fifteenth_nwslettr") {

                    Show_FifteenthNewsLetter();
                    $('#<%=hdnTemplateType.ClientID %>').val(id)
                }
                else if (id == "Sixteenth_nwslettr") {

                    Show_SixteenthNewsLetter();
                    $('#<%=hdnTemplateType.ClientID %>').val(id)
                }
                else if (id == "Seventeenth_nwslettr") {

                    Show_SeventeenthNewsLetter();
                    $('#<%=hdnTemplateType.ClientID %>').val(id)
                }
                else if (id == "Eightteenth_nwslettr") {

                    Show_EightteenthNewsLetter();
                    $('#<%=hdnTemplateType.ClientID %>').val(id)
                }
                else if (id == "Ninteenth_nwslettr") {

                    Show_NinteenthNewsLetter();
                    $('#<%=hdnTemplateType.ClientID %>').val(id)
                }
                else if (id == "Twentieth_nwslettr") {
                    debugger;
                    Show_twentiethNewsLetter();
                    $('#<%=hdnTemplateType.ClientID %>').val(id)
                }
                else if (id == "TwentyOne_nwslettr") {
                    debugger;
                    Show_TwentyOneNewsLetter();
                    $('#<%=hdnTemplateType.ClientID %>').val(id)
                }
                

            });
            //End Slider work



            $('#newletter_div').css('display', 'block')
            $('#First_newletter_btn').click(function () {
                $('#newletter_div').css('display', 'block')
                $('#Send_To').css('display', 'block')
                $('#First_newletter_btn').css('display', 'none')
                $('#ClientList').css('display', 'none')
                $('#slider3').css('display', 'block');
                $('#span9').addClass('span9');
                $('#span3').addClass('span3');
            })
            $('#Second_newletter_btn').click(function () {
                $('#newletter_div').css('display', 'block')
                $('#Send_To').css('display', 'block')
                $('#First_newletter_btn').css('display', 'none')
                $('#ClientList').css('display', 'none')
            })



            $('#Send_To').click(function () {
                $('#Send_To').css('display', 'none')
                $('#newletter_div').css('display', 'none')
                $('#ClientList').css('display', 'block')
                $('#First_newletter_btn').css('display', 'block')
                $('#slider3').css('display', 'none');
                $('#span9').removeClass('span9');
                $('#span3').removeClass('span3');
            })

            $('#logoprvw').click(function () {
                var id = $(this).data("id");
                Openmodel(id);
            }
 )
            $('#imgprvw').click(function () {
                var id = $(this).data("id");
                Openmodel(id);
            }
           )



            $('#Logofile').click(function () {
                var id = $(this).data("id");
                Openmodel(id);
            })

            //print functionality
            $('#preview').click(function () {
                window.scrollTo(0, 0);
                Preview();
            })
            $('#print').click(function () {
                print();
            })

            $('.close').click(function () {
                $('#Send_To').css('display', 'block')
                $('#preview').css('display', 'block')
                $('#print').css('display', 'block')

            })

            //Second NewsLetter Front and Back btns.
            $('#btn_Front_Of_SecondNewsletter').click(function () {
                $('#SecondNewsletter_Front').css('display', 'block');
                $('#SecondNewsletter_Back').css('display', 'None');
                $('#btn_Front_Of_SecondNewsletter').css('display', 'None');
                $('#btn_Back_Of_SecondNewsletter').css('display', 'block');
            })
            $('#btn_Back_Of_SecondNewsletter').click(function () {
                $('#SecondNewsletter_Front').css('display', 'None');
                $('#SecondNewsletter_Back').css('display', 'Block');
                $('#btn_Front_Of_SecondNewsletter').css('display', 'block');
                $('#btn_Back_Of_SecondNewsletter').css('display', 'None');
            })
            //End

            //Fourth NewsLetter Front and Back btns.
            $('#btn_Front_Of_FourthNewsletter').click(function () {
                $('#FourthNewsletter_Front').css('display', 'block');
                $('#FourthNewsletter_Back').css('display', 'None');
                $('#btn_Front_Of_FourthNewsletter').css('display', 'None');
                $('#btn_Back_Of_FourthNewsletter').css('display', 'block');
            })
            $('#btn_Back_Of_FourthNewsletter').click(function () {
                $('#FourthNewsletter_Front').css('display', 'None');
                $('#FourthNewsletter_Back').css('display', 'Block');
                $('#btn_Front_Of_FourthNewsletter').css('display', 'Block');
                $('#btn_Back_Of_FourthNewsletter').css('display', 'None');
            })
            //End

            //Seven NewsLetter Front and Back btns.
            $('#btn_Front_Of_SevenNewsletter').click(function () {
                $('#SeventhNewsletter_Front').css('display', 'block');
                $('#SeventhNewsletter_Back').css('display', 'None');
                $('#btn_Front_Of_SevenNewsletter').css('display', 'None');
                $('#btn_Back_Of_SevenNewsletter').css('display', 'block');
            })
            $('#btn_Back_Of_SevenNewsletter').click(function () {
                
                $('#SeventhNewsletter_Front').css('display', 'None');
                $('#SeventhNewsletter_Back').css('display', 'Block');
                $('#btn_Front_Of_SevenNewsletter').css('display', 'Block');
                $('#btn_Back_Of_SevenNewsletter').css('display', 'None');
            })
            //End

            //Eight NewsLetter Front and Back btns.
            $('#btn_Front_Of_EightNewsletter').click(function () {
                $('#EightNewsletter_Front').css('display', 'block');
                $('#EightNewsletter_Back').css('display', 'None');
                $('#btn_Front_Of_EightNewsletter').css('display', 'None');
                $('#btn_Back_Of_EightNewsletter').css('display', 'block');
            })
            $('#btn_Back_Of_EightNewsletter').click(function () {
                $('#EightNewsletter_Front').css('display', 'None');
                $('#EightNewsletter_Back').css('display', 'Block');
                $('#btn_Front_Of_EightNewsletter').css('display', 'Block');
                $('#btn_Back_Of_EightNewsletter').css('display', 'None');
            })
            //End

            //Twelve Newsletter front and back btns.
            $('#btn_Front_Of_TwelveNewsletter').click(function () {
                $('#TwelvethNewsletter_Front').css('display', 'block');
                $('#TwelvethNewsletter_Back').css('display', 'None');
                $('#btn_Front_Of_TwelveNewsletter').css('display', 'None');
                $('#btn_Back_Of_TwelveNewsletter').css('display', 'block');
            })
            $('#btn_Back_Of_TwelveNewsletter').click(function () {
                $('#TwelvethNewsletter_Front').css('display', 'None');
                $('#TwelvethNewsletter_Back').css('display', 'Block');
                $('#btn_Front_Of_TwelveNewsletter').css('display', 'Block');
                $('#btn_Back_Of_TwelveNewsletter').css('display', 'None');
            })
            
            //End

            //Fourteenth Newsletter front and back btns.
            $('#btn_Front_Of_FourteenthNewsletter').click(function () {
                $('#FourteenthNewsletter_Front').css('display', 'block');
                $('#FourteenthNewsletter_Back').css('display', 'None');
                $('#btn_Front_Of_FourteenthNewsletter').css('display', 'None');
                $('#btn_Back_Of_FourteenthNewsletter').css('display', 'block');
            })
            $('#btn_Back_Of_FourteenthNewsletter').click(function () {
                $('#FourteenthNewsletter_Front').css('display', 'None');
                $('#FourteenthNewsletter_Back').css('display', 'Block');
                $('#btn_Front_Of_FourteenthNewsletter').css('display', 'Block');
                $('#btn_Back_Of_FourteenthNewsletter').css('display', 'None');
            })
            //End 

            //Sixteenth Newsletter front and back btns.
            $('#btn_Front_Of_SixteenthNewsletter').click(function () {
                $('#SixteenthNewsletter_Front').css('display', 'block');
                $('#SixteenthNewsletter_Back').css('display', 'None');
                $('#btn_Front_Of_SixteenthNewsletter').css('display', 'None');
                $('#btn_Back_Of_SixteenthNewsletter').css('display', 'block');
            })
            $('#btn_Back_Of_SixteenthNewsletter').click(function () {
                $('#SixteenthNewsletter_Front').css('display', 'None');
                $('#SixteenthNewsletter_Back').css('display', 'Block');
                $('#btn_Front_Of_SixteenthNewsletter').css('display', 'Block');
                $('#btn_Back_Of_SixteenthNewsletter').css('display', 'None');
            })
            //End

            //Seventeenth Newsletter front and back btns.
            $('#btn_Front_Of_SeventeenthNewsletter').click(function () {
                $('#SeventeenthNewsletter_Front').css('display', 'block');
                $('#SeventeenthNewsletter_Back').css('display', 'None');
                $('#btn_Front_Of_SeventeenthNewsletter').css('display', 'None');
                $('#btn_Back_Of_SeventeenthNewsletter').css('display', 'block');
            })
            $('#btn_Back_Of_SeventeenthNewsletter').click(function () {
                $('#SeventeenthNewsletter_Front').css('display', 'None');
                $('#SeventeenthNewsletter_Back').css('display', 'Block');
                $('#btn_Front_Of_SeventeenthNewsletter').css('display', 'Block');
                $('#btn_Back_Of_SeventeenthNewsletter').css('display', 'None');
            })
            //End 

            //Eightteenth Newsletter front and back btns.
            $('#btn_Front_Of_EightteenthNewsletter').click(function () {
                $('#EightteenthNewsletter_Front').css('display', 'block');
                $('#EightteenthNewsletter_Back').css('display', 'None');
                $('#btn_Front_Of_EightteenthNewsletter').css('display', 'None');
                $('#btn_Back_Of_EightteenthNewsletter').css('display', 'block');
            })
            $('#btn_Back_Of_EightteenthNewsletter').click(function () {
                $('#EightteenthNewsletter_Front').css('display', 'None');
                $('#EightteenthNewsletter_Back').css('display', 'Block');
                $('#btn_Front_Of_EightteenthNewsletter').css('display', 'Block');
                $('#btn_Back_Of_EightteenthNewsletter').css('display', 'None');
            })
            //End 

            //Ninteenth Newsletter front and back btns.
            $('#btn_Front_Of_NinteenthNewsletter').click(function () {
                $('#NinteenthNewsletter_Front').css('display', 'block');
                $('#NinteenthNewsletter_Back').css('display', 'None');
                $('#btn_Front_Of_NinteenthNewsletter').css('display', 'None');
                $('#btn_Back_Of_NinteenthNewsletter').css('display', 'block');
            })
            $('#btn_Back_Of_NinteenthNewsletter').click(function () {
                $('#NinteenthNewsletter_Front').css('display', 'None');
                $('#NinteenthNewsletter_Back').css('display', 'Block');
                $('#btn_Front_Of_NinteenthNewsletter').css('display', 'Block');
                $('#btn_Back_Of_NinteenthNewsletter').css('display', 'None');
            })
            //End


            $(document).on("click", "#close_popup", function (e) {
                e.preventDefault();
                $("#mypopup").css("display", "none");
                $('.span9').removeClass('is-blurred');
                $('.span3').removeClass('is-blurred');

            });


        })


//open User logo  model
function Openmodel(id) {

    backdrop: 'static';
    keyboard: false;
    $('#myModal').click();
    browsebuttons(id);
    return false;
}
//end
//open User logo  model
function OpenUsrImgmodel() {
    backdrop: 'static';
    keyboard: false;
    $('#myImgModal').click();
    return false;
}
//end
function Show_FirstNewsLetter() {
    $('#FirstNewsLetter_Div').css('display', 'block')
    $('#Send_To').css('display', 'block')
    $('#ClientList').css('display', 'none')
    $('#btn_Front_Of_SecondNewsletter').css('display', 'None');
    $('#btn_Back_Of_SecondNewsletter').css('display', 'None');

    Hide_SecondNewsLetter();
    Hide_ThirldNewsLetter();
    Hide_FourthNewsLetter();
    Hide_FifthNewsLetter();
    Hide_SixthNewsLetter();
    Hide_SevenNewsLetter();
    Hide_EightNewsLetter();
    Hide_NinthNewsLetter();
    Hide_TenthNewsLetter();
    Hide_EleventhNewsLetter();
    Hide_TwelvethNewsLetter();
    Hide_ThirteenthNewsLetter();
    Hide_FourteenthNewsLetter();
    Hide_FifteenthNewsLetter();
    Hide_SixteenthNewsLetter();
    Hide_SeventeenthNewsLetter();
    Hide_NinteenthNewsLetter();
    Hide_twentiethNewsLetter()
    Hide_TwentyOneNewsLetter()
    //22
    //23
}
function Hide_FirstNewsLetter() {
    $('#FirstNewsLetter_Div').css('display', 'none')
}


function Show_SecondNewsLetter() {
    $('#SecondNewsletter_Div').css('display', 'block')
    $('#FirstNewsLetter_Div').css('display', 'None')
    $('#ClientList').css('display', 'none')
    $('#btn_Front_Of_SecondNewsletter').css('display', 'None');
    $('#btn_Back_Of_SecondNewsletter').css('display', 'block');
    SendTo_btn();
    Hide_FirstNewsLetter();
    Hide_ThirldNewsLetter();
    Hide_FourthNewsLetter();
    Hide_FifthNewsLetter();
    Hide_SixthNewsLetter();
    Hide_SevenNewsLetter();
    Hide_EightNewsLetter();
    Hide_NinthNewsLetter();
    Hide_TenthNewsLetter();
    Hide_EleventhNewsLetter();
    Hide_TwelvethNewsLetter();
    Hide_ThirteenthNewsLetter();
    Hide_FourteenthNewsLetter();
    Hide_FifteenthNewsLetter();
    Hide_SixteenthNewsLetter();
    Hide_SeventeenthNewsLetter();
    Hide_EightteenthNewsLetter();
    Hide_NinteenthNewsLetter();
    Hide_twentiethNewsLetter()
    Hide_TwentyOneNewsLetter()
    //22
    //23
}
function Hide_SecondNewsLetter() {
    $('#SecondNewsletter_Div').css('display', 'none')
    $('#ClientList').css('display', 'none')
    $('#btn_Front_Of_SecondNewsletter').css('display', 'None');
    $('#btn_Back_Of_SecondNewsletter').css('display', 'none');
}

function Show_ThirldNewsLetter() {
    $('#ThirldNewsletter_Div').css('display', 'block')
    SendTo_btn();
    Hide_FirstNewsLetter();
    Hide_SecondNewsLetter();
    Hide_FourthNewsLetter();
    Hide_FifthNewsLetter();
    Hide_SixthNewsLetter();
    Hide_SevenNewsLetter();
    Hide_NinthNewsLetter();
    Hide_TenthNewsLetter();
    Hide_EleventhNewsLetter();
    Hide_TwelvethNewsLetter();
    Hide_ThirteenthNewsLetter();
    Hide_FourteenthNewsLetter();
    Hide_FifteenthNewsLetter();
    Hide_SixteenthNewsLetter();
    Hide_EightteenthNewsLetter();
    Hide_NinteenthNewsLetter();
    Hide_twentiethNewsLetter()
    Hide_TwentyOneNewsLetter()
    //22
    //23
}
function Hide_ThirldNewsLetter() {
    $('#ThirldNewsletter_Div').css('display', 'None')
}

function Show_FourthNewsLetter() {
    $('#FourthNewsletter_Div').css('display', 'block')
    $('#btn_Front_Of_FourthNewsletter').css('display', 'None');
    $('#btn_Back_Of_FourthNewsletter').css('display', 'block');
    SendTo_btn();
    Hide_FirstNewsLetter();
    Hide_SecondNewsLetter();
    Hide_ThirldNewsLetter();
    Hide_FifthNewsLetter();
    Hide_SixthNewsLetter();
    Hide_SevenNewsLetter();
    Hide_EightNewsLetter();
    Hide_NinthNewsLetter();
    Hide_TenthNewsLetter();
    Hide_EleventhNewsLetter();
    Hide_TwelvethNewsLetter();
    Hide_ThirteenthNewsLetter();
    Hide_FourteenthNewsLetter();
    Hide_FifteenthNewsLetter();
    Hide_SixteenthNewsLetter();
    Hide_SeventeenthNewsLetter();
    Hide_EightteenthNewsLetter();
    Hide_NinteenthNewsLetter();
    Hide_twentiethNewsLetter()
    Hide_TwentyOneNewsLetter()
    //22
    //23
}
function Hide_FourthNewsLetter() {
    $('#FourthNewsletter_Div').css('display', 'None')
    $('#btn_Front_Of_FourthNewsletter').css('display', 'None');
    $('#btn_Back_Of_FourthNewsletter').css('display', 'None');
}

function Show_FifthNewsLetter() {
    
    $('#FifthNewsletter_Div').css('display','block');

    Hide_FirstNewsLetter();
    Hide_SecondNewsLetter();
    Hide_ThirldNewsLetter();
    Hide_FourthNewsLetter()
    Hide_SixthNewsLetter();
    Hide_SevenNewsLetter();
    Hide_EightNewsLetter();
    Hide_NinthNewsLetter();
    Hide_TenthNewsLetter();
    Hide_EleventhNewsLetter();
    Hide_TwelvethNewsLetter();
    Hide_ThirteenthNewsLetter();
    Hide_FourteenthNewsLetter();
    Hide_SixteenthNewsLetter();
    Hide_SeventeenthNewsLetter();
    Hide_EightteenthNewsLetter();

    Hide_NinteenthNewsLetter();
    Hide_twentiethNewsLetter()
    Hide_TwentyOneNewsLetter()
    //22
    //23
    SendTo_btn();
}
function Hide_FifthNewsLetter() {
    $('#FifthNewsletter_Div').css('display','none')
}

function Show_SixthNewsLetter() {
    
    $('#SixNewsletter_Div').css('display', 'block');

    Hide_FirstNewsLetter();
    Hide_SecondNewsLetter();
    Hide_ThirldNewsLetter();
    Hide_FourthNewsLetter();
    Hide_FifthNewsLetter();
    Hide_SevenNewsLetter();
    Hide_EightNewsLetter();
    Hide_NinthNewsLetter();
    Hide_TenthNewsLetter();
    Hide_EleventhNewsLetter();
    Hide_TwelvethNewsLetter();
    Hide_FourteenthNewsLetter();
    Hide_FifteenthNewsLetter();
    Hide_SixteenthNewsLetter();
    Hide_SeventeenthNewsLetter();
    Hide_NinteenthNewsLetter();
    Hide_twentiethNewsLetter()
    Hide_TwentyOneNewsLetter()
    //22
    //23
    SendTo_btn();
}
function Hide_SixthNewsLetter() {
    $('#SixNewsletter_Div').css('display', 'none')
}

function Show_SevenNewsLetter() {  
   
    $('#SevenNewsletter_Div').css('display', 'block');
    $('#btn_Back_Of_SevenNewsletter').css('display', 'block');
    Hide_FirstNewsLetter();
    Hide_SecondNewsLetter();
    Hide_ThirldNewsLetter();
    Hide_FourthNewsLetter();
    Hide_FifthNewsLetter();
    Hide_EightNewsLetter();
    Hide_SixthNewsLetter();
    Hide_NinthNewsLetter();
    Hide_TenthNewsLetter();
    Hide_EleventhNewsLetter();
    Hide_TwelvethNewsLetter();
    Hide_ThirteenthNewsLetter();
    Hide_FourteenthNewsLetter();
    Hide_FifteenthNewsLetter();
    Hide_SixteenthNewsLetter();
    Hide_SeventeenthNewsLetter();
    Hide_EightteenthNewsLetter();
    Hide_NinteenthNewsLetter();
    Hide_twentiethNewsLetter()
    Hide_TwentyOneNewsLetter()
    //22
    //23
    SendTo_btn();
}
function Hide_SevenNewsLetter() {
    $('#SevenNewsletter_Div').css('display', 'none')

    $('#btn_Front_Of_SevenNewsletter').css('display', 'None');
    $('#btn_Back_Of_SevenNewsletter').css('display', 'None');
}

function Show_EightNewsLetter() {
   
    $('#EightNewsletter_Div').css('display', 'block');
    $('#btn_Back_Of_EightNewsletter').css('display', 'block');
    Hide_FirstNewsLetter();
    Hide_SecondNewsLetter();
    Hide_ThirldNewsLetter();
    Hide_FourthNewsLetter();
    Hide_FifthNewsLetter();
    Hide_SevenNewsLetter();
    Hide_SixthNewsLetter();
    Hide_NinthNewsLetter();
    Hide_TenthNewsLetter();
    Hide_EleventhNewsLetter();
    Hide_TwelvethNewsLetter();
    Hide_ThirteenthNewsLetter();
    Hide_FourteenthNewsLetter();
    Hide_SixteenthNewsLetter();
    Hide_SeventeenthNewsLetter();
    Hide_EightteenthNewsLetter();
    Hide_NinteenthNewsLetter();
    Hide_twentiethNewsLetter()
    Hide_TwentyOneNewsLetter()
    //22
    //23
    SendTo_btn();
}
function Hide_EightNewsLetter() {
    $('#EightNewsletter_Div').css('display', 'none')

    $('#btn_Front_Of_EightNewsletter').css('display', 'none');
    $('#btn_Back_Of_EightNewsletter').css('display', 'None');
}

function Show_NinthNewsLetter() {
   
    $('#NinthNewsletter_Div').css('display', 'block');

    Hide_FirstNewsLetter();
    Hide_SecondNewsLetter();
    Hide_ThirldNewsLetter();
    Hide_FourthNewsLetter();
    Hide_FifthNewsLetter();
    Hide_SixthNewsLetter();
    Hide_SevenNewsLetter();
    Hide_EightNewsLetter();
    Hide_TenthNewsLetter();
    Hide_EleventhNewsLetter();
    Hide_TwelvethNewsLetter();
    Hide_ThirteenthNewsLetter();
    Hide_FourteenthNewsLetter();
    Hide_FifteenthNewsLetter();
    Hide_SixteenthNewsLetter();
    Hide_SeventeenthNewsLetter();
    Hide_EightteenthNewsLetter();
    Hide_NinteenthNewsLetter();
    Hide_twentiethNewsLetter()
    Hide_TwentyOneNewsLetter()
    //22
    //23
    SendTo_btn();
}
function Hide_NinthNewsLetter() {
    $('#NinthNewsletter_Div').css('display', 'none')
}

function Show_TenthNewsLetter() {

    $('#TenthNewsletter_Div').css('display', 'block');

    Hide_FirstNewsLetter();
    Hide_SecondNewsLetter();
    Hide_ThirldNewsLetter();
    Hide_FourthNewsLetter();
    Hide_FifthNewsLetter();
    Hide_SixthNewsLetter();
    Hide_SevenNewsLetter();
    Hide_EightNewsLetter();
    Hide_NinthNewsLetter();
    Hide_EleventhNewsLetter();
    Hide_TwelvethNewsLetter();
    Hide_ThirteenthNewsLetter();
    Hide_FourteenthNewsLetter();
    Hide_FifteenthNewsLetter();
    Hide_SixteenthNewsLetter();
    Hide_SeventeenthNewsLetter();
    Hide_EightteenthNewsLetter();
    Hide_NinteenthNewsLetter();
    Hide_twentiethNewsLetter()
    Hide_TwentyOneNewsLetter()
    //22
    //23
    SendTo_btn();
}
function Hide_TenthNewsLetter() {
    $('#TenthNewsletter_Div').css('display', 'none')
}

function Show_EleventhNewsLetter() {
    
    $('#EleventhNewsletter_Div').css('display', 'block');   
    Hide_FirstNewsLetter();
    Hide_SecondNewsLetter();
    Hide_ThirldNewsLetter();
    Hide_FourthNewsLetter();
    Hide_FifthNewsLetter();
    Hide_SixthNewsLetter();
    Hide_SevenNewsLetter();
    Hide_EightNewsLetter();
    Hide_NinthNewsLetter();
    Hide_TenthNewsLetter();
    Hide_TwelvethNewsLetter();
    Hide_ThirteenthNewsLetter();
    Hide_FourteenthNewsLetter();
    Hide_FifteenthNewsLetter();
    Hide_SixteenthNewsLetter();
    Hide_SeventeenthNewsLetter();
    Hide_EightteenthNewsLetter();
    Hide_NinteenthNewsLetter();
    Hide_twentiethNewsLetter()
    Hide_TwentyOneNewsLetter()
    //22
    //23
    SendTo_btn();
}
function Hide_EleventhNewsLetter() {
    $('#EleventhNewsletter_Div').css('display', 'none')
}

function Show_TwelvethNewsLetter() {

    $('#TwelvethNewsletter_Div').css('display', 'block');
    $('#TwelvethNewsletter_Front').css('display', 'block');
    $('#btn_Back_Of_TwelveNewsletter').css('display', 'block');
    Hide_FirstNewsLetter();
    Hide_SecondNewsLetter();
    Hide_ThirldNewsLetter();
    Hide_FourthNewsLetter();
    Hide_FifthNewsLetter();
    Hide_SixthNewsLetter();
    Hide_SevenNewsLetter();
    Hide_EightNewsLetter();
    Hide_NinthNewsLetter();
    Hide_TenthNewsLetter();
    Hide_EleventhNewsLetter();
    Hide_ThirteenthNewsLetter();
    Hide_FourteenthNewsLetter();
    Hide_FifteenthNewsLetter();
    Hide_SixteenthNewsLetter();
    Hide_SeventeenthNewsLetter();
    Hide_EightteenthNewsLetter();
    Hide_NinteenthNewsLetter();
    Hide_twentiethNewsLetter()
    Hide_TwentyOneNewsLetter()
    //22
    //23
    SendTo_btn();
}
function Hide_TwelvethNewsLetter() {
    $('#TwelvethNewsletter_Div').css('display', 'none')
    $('#TwelvethNewsletter_Front').css('display', 'None');
    $('#TwelvethNewsletter_Back').css('display', 'None');
    $('#btn_Front_Of_TwelveNewsletter').css('display', 'None');
    $('#btn_Back_Of_TwelveNewsletter').css('display', 'None');
}

function Show_ThirteenthNewsLetter() {

    $('#ThirteenthNewsletter_Div').css('display', 'block');
    Hide_FirstNewsLetter();
    Hide_SecondNewsLetter();
    Hide_ThirldNewsLetter();
    Hide_FourthNewsLetter();
    Hide_FifthNewsLetter();
    Hide_SixthNewsLetter();
    Hide_SevenNewsLetter();
    Hide_EightNewsLetter();
    Hide_NinthNewsLetter();
    Hide_TenthNewsLetter();
    Hide_TwelvethNewsLetter();
    Hide_FourteenthNewsLetter();
    Hide_FifteenthNewsLetter();
    Hide_SixteenthNewsLetter();
    Hide_SeventeenthNewsLetter();
    Hide_EightteenthNewsLetter();
    Hide_NinteenthNewsLetter();
    Hide_twentiethNewsLetter()
    Hide_TwentyOneNewsLetter()
    //22
    //23
    SendTo_btn();
}
function Hide_ThirteenthNewsLetter() {
    $('#ThirteenthNewsletter_Div').css('display', 'none')
}

function Show_FourteenthNewsLetter() {

    $('#FourteenthNewsletter_Div').css('display', 'block');
    $('#FourteenthNewsletter_Front').css('display', 'block');    
    $('#btn_Back_Of_FourteenthNewsletter').css('display', 'block');
    Hide_FirstNewsLetter();
    Hide_SecondNewsLetter();
    Hide_ThirldNewsLetter();
    Hide_FourthNewsLetter();
    Hide_FifthNewsLetter();
    Hide_SixthNewsLetter();
    Hide_SevenNewsLetter();
    Hide_EightNewsLetter();
    Hide_NinthNewsLetter();
    Hide_TenthNewsLetter();
    Hide_TwelvethNewsLetter();
    Hide_ThirteenthNewsLetter();
    Hide_FifteenthNewsLetter();
    Hide_SixteenthNewsLetter();
    Hide_SeventeenthNewsLetter();
    Hide_EightteenthNewsLetter();
    Hide_NinteenthNewsLetter();
    Hide_twentiethNewsLetter()
    Hide_TwentyOneNewsLetter()
    //22
    //23
    SendTo_btn();
}
function Hide_FourteenthNewsLetter() {
    $('#FourteenthNewsletter_Div').css('display', 'none');
    $('#btn_Front_Of_FourteenthNewsletter').css('display', 'None');
    $('#btn_Back_Of_FourteenthNewsletter').css('display', 'None');
}

function Show_FifteenthNewsLetter() {

    $('#FifteenthNewsletter_Div').css('display', 'block');
   
    Hide_FirstNewsLetter();
    Hide_SecondNewsLetter();
    Hide_ThirldNewsLetter();
    Hide_FourthNewsLetter();
    Hide_FifthNewsLetter();
    Hide_SixthNewsLetter();
    Hide_SevenNewsLetter();
    Hide_EightNewsLetter();
    Hide_NinthNewsLetter();
    Hide_TenthNewsLetter();
    Hide_TwelvethNewsLetter();
    Hide_ThirteenthNewsLetter();
    Hide_FourteenthNewsLetter();
    Hide_SixteenthNewsLetter();
    Hide_SixteenthNewsLetter();
    Hide_EightteenthNewsLetter();
    Hide_SeventeenthNewsLetter();
    Hide_NinteenthNewsLetter();
    Hide_twentiethNewsLetter()
    Hide_TwentyOneNewsLetter()
    //22
    //23
    SendTo_btn();
}
function Hide_FifteenthNewsLetter() {
    $('#FifteenthNewsletter_Div').css('display', 'none');    
}

function Show_SixteenthNewsLetter() {

    $('#SixteenthNewsletter_Div').css('display', 'block');
    $('#SixteenthNewsletter_Front').css('display', 'block');
    $('#btn_Back_Of_SixteenthNewsletter').css('display', 'block');
    Hide_FirstNewsLetter();
    Hide_SecondNewsLetter();
    Hide_ThirldNewsLetter();
    Hide_FourthNewsLetter();
    Hide_FifthNewsLetter();
    Hide_SixthNewsLetter();
    Hide_SevenNewsLetter();
    Hide_EightNewsLetter();
    Hide_NinthNewsLetter();
    Hide_TenthNewsLetter();
    Hide_TwelvethNewsLetter();
    Hide_ThirteenthNewsLetter();
    Hide_FifteenthNewsLetter();   
    Hide_SeventeenthNewsLetter();
    Hide_EightteenthNewsLetter();
    Hide_NinteenthNewsLetter();
    Hide_twentiethNewsLetter()
    Hide_TwentyOneNewsLetter()
    //22
    //23
    
    SendTo_btn();
}
function Hide_SixteenthNewsLetter() {
    $('#SixteenthNewsletter_Div').css('display', 'none');
    $('#btn_Front_Of_SixteenthNewsletter').css('display', 'None');
    $('#btn_Back_Of_SixteenthNewsletter').css('display', 'None');
}

function Show_SeventeenthNewsLetter() {
    
    $('#SeventeenthNewsletter_Div').css('display', 'block');
    $('#SeventeenthNewsletter_Front').css('display', 'block');
    $('#btn_Back_Of_SeventeenthNewsletter').css('display', 'block');
    Hide_FirstNewsLetter();
    Hide_SecondNewsLetter();
    Hide_ThirldNewsLetter();
    Hide_FourthNewsLetter();
    Hide_FifthNewsLetter();    
    Hide_SevenNewsLetter();
    Hide_EightNewsLetter();
    Hide_NinthNewsLetter();
    Hide_TenthNewsLetter();
    Hide_TwelvethNewsLetter();
    Hide_ThirteenthNewsLetter();
    Hide_FourteenthNewsLetter();
    Hide_FifteenthNewsLetter();
    Hide_SixteenthNewsLetter();
    Hide_EightteenthNewsLetter();
    Hide_NinteenthNewsLetter();
    Hide_twentiethNewsLetter()
    Hide_TwentyOneNewsLetter()
    //22
    //23

    SendTo_btn();
}
function Hide_SeventeenthNewsLetter() {
    $('#SeventeenthNewsletter_Div').css('display', 'none');
    $('#btn_Front_Of_SeventeenthNewsletter').css('display', 'None');
    $('#btn_Back_Of_SeventeenthNewsletter').css('display', 'None');
}

function Show_EightteenthNewsLetter() {

    $('#EightteenthNewsletter_Div').css('display', 'block');
    $('#EightteenthNewsletter_Front').css('display', 'block');
    $('#btn_Back_Of_EightteenthNewsletter').css('display', 'block');
    Hide_FirstNewsLetter();
    Hide_SecondNewsLetter();
    Hide_ThirldNewsLetter();
    Hide_FourthNewsLetter();
    Hide_FifthNewsLetter();    
    Hide_EightNewsLetter();   
    Hide_NinthNewsLetter();
    Hide_TenthNewsLetter();
    Hide_EleventhNewsLetter();
    Hide_TwelvethNewsLetter();
    Hide_ThirteenthNewsLetter();
    Hide_FourteenthNewsLetter();
    Hide_FifteenthNewsLetter();
    Hide_SixteenthNewsLetter();    
    Hide_SeventeenthNewsLetter();
    Hide_NinteenthNewsLetter();
    Hide_twentiethNewsLetter()
    Hide_TwentyOneNewsLetter()
    //22
    //23

    SendTo_btn();
}
function Hide_EightteenthNewsLetter() {
    $('#EightteenthNewsletter_Div').css('display', 'none');
    $('#btn_Front_Of_EightteenthNewsletter').css('display', 'None');
    $('#btn_Back_Of_EightteenthNewsletter').css('display', 'None');
}
    
function Show_NinteenthNewsLetter() {

    $('#NinteenthNewsletter_Div').css('display', 'block');
    $('#NinteenthNewsletter_Front').css('display', 'block');
    $('#btn_Back_Of_NinteenthNewsletter').css('display', 'block');
    Hide_FirstNewsLetter();
    Hide_SecondNewsLetter();
    Hide_ThirldNewsLetter();
    Hide_FourthNewsLetter();
    Hide_FifthNewsLetter();
    Hide_EightNewsLetter();
    Hide_NinthNewsLetter();
    Hide_TenthNewsLetter();
    Hide_EleventhNewsLetter();
    Hide_TwelvethNewsLetter();
    Hide_ThirteenthNewsLetter();
    Hide_FourteenthNewsLetter();
    Hide_FifteenthNewsLetter();
    Hide_SixteenthNewsLetter();
    Hide_SeventeenthNewsLetter();
    Hide_EightteenthNewsLetter();
    Hide_twentiethNewsLetter()
    Hide_TwentyOneNewsLetter()
    //22
    //23
    SendTo_btn();
}
function Hide_NinteenthNewsLetter() {
    $('#NinteenthNewsletter_Div').css('display', 'none');
    $('#btn_Front_Of_NinteenthNewsletter').css('display', 'None');
    $('#btn_Back_Of_NinteenthNewsletter').css('display', 'None');
}


function Show_twentiethNewsLetter() {
    debugger;
    $('#twentiethNewsletter_Div').css('display', 'block');
    
    Hide_FirstNewsLetter();
    Hide_SecondNewsLetter();
    Hide_ThirldNewsLetter();
    Hide_FourthNewsLetter();
    Hide_FifthNewsLetter();
    Hide_EightNewsLetter();
    Hide_NinthNewsLetter();
    Hide_TenthNewsLetter();
    Hide_EleventhNewsLetter();
    Hide_TwelvethNewsLetter();
    Hide_ThirteenthNewsLetter();
    Hide_FourteenthNewsLetter();
    Hide_FifteenthNewsLetter();
    Hide_SixteenthNewsLetter();
    Hide_SeventeenthNewsLetter();
    Hide_EightteenthNewsLetter();
    Hide_NinteenthNewsLetter();
    Hide_TwentyOneNewsLetter()
    //22
    //23
    SendTo_btn();
}
function Hide_twentiethNewsLetter() {
    $('#twentiethNewsletter_Div').css('display', 'none');
  
}

function Show_TwentyOneNewsLetter() {
    debugger;
    $('#TwentyOneNewsletter_Div').css('display', 'block');

    Hide_FirstNewsLetter();
    Hide_SecondNewsLetter();
    Hide_ThirldNewsLetter();
    Hide_FourthNewsLetter();
    Hide_FifthNewsLetter();
    Hide_EightNewsLetter();
    Hide_NinthNewsLetter();
    Hide_TenthNewsLetter();
    Hide_EleventhNewsLetter();
    Hide_TwelvethNewsLetter();
    Hide_ThirteenthNewsLetter();
    Hide_FourteenthNewsLetter();
    Hide_FifteenthNewsLetter();
    Hide_SixteenthNewsLetter();
    Hide_SeventeenthNewsLetter();
    Hide_EightteenthNewsLetter();
    Hide_NinteenthNewsLetter();
    
    //22
    //23
    SendTo_btn();
}
function Hide_TwentyOneNewsLetter() {
    $('#TwentyOneNewsletter_Div').css('display', 'none');

}
        
function SendTo_btn() {
    $('#Send_To').css('display', 'block');
}

//open print prev  model
function Preview() {
    var type = "Preview";
    backdrop: 'static';
    keyboard: false;
    $("#mypopup").css("display", "block");
    $('.span9').addClass('is-blurred');
    $('.span3').addClass('is-blurred');
    $('#mypopup').addClass('nwslettr');
   
    PrintAndPreview(type);
    return false;
}
//end

//open print window
function print() {
    var type = "Print";
    PrintAndPreview(type);
}

function showLogopreview(input, id) {

    if (input.files && input.files[0]) {
        var filerdr = new FileReader();
        filerdr.onload = function (e) {
            Change_src(e, id);
            $('#myModal').click();
        }
        filerdr.readAsDataURL(input.files[0]);
    }

}
function Change_src(e, id) {

    Change_src_First_nwslettr_logo(e, id);


}


function Change_src_First_nwslettr_logo(e, id) {

    if (id == "First_newsletter_Logo") {
        $('#logoprvw').attr('src', e.target.result);
    }
    else if (id == "First_newsletter_Img") {

        $('#imgprvw').attr('src', e.target.result);
    }
}


//browse button hide/show
function browsebuttons(id) {
    HideShow_FirstNwslettr_Upload_Btn(id); //hide show file upload btn
}
function HideShow_FirstNwslettr_Upload_Btn(id) {
    // hide first feature browse button
    $('#<%=First_newsletter_Logo.ClientID %>').css('display', 'none')
    $('#<%=First_newsletter_Imgfile.ClientID %>').css('display', 'none')

    //display browse button on click
    if (id == "logoprvw") {
        $('#<%=First_newsletter_Logo.ClientID %>').css('display', 'block')
        }
        else if (id == "imgprvw") {

            $('#<%=First_newsletter_Imgfile.ClientID %>').css('display', 'block')
    }
}

//newsletter print functionalty.
function PrintAndPreview(type) {
    debugger;
    var obj = NewsLettr_Data();
    var url = GetUrl();
    ajaxrequest(type, obj, url)  //common ajax request
}
//Return data object of postcards
function NewsLettr_Data() {

    var data = "";
    if ($('#<%=hdnTemplateType.ClientID %>').val() == "First_nwslettr") {
        $('#mypopup').addClass('nwslettr');
        $('#Clos_btn').removeClass();
        $('#Clos_btn').addClass('clos-btn-div-FstNwsLtr');
        var firstcontent = $('#<%=FirstContent.ClientID %>').val();
        var secondcontent = $('#<%=SecondContent.ClientID %>').val();
        var thirldcontent = $('#<%=ThirdContent.ClientID %>').val();

        data = "{ NewsletterType: 'first', FirstContent: '" + firstcontent + "', SecondContent: '" + secondcontent + "', ThirldContent: '" + thirldcontent + "'}";
    }
    else if ($('#<%=hdnTemplateType.ClientID %>').val() == "Second_nwslettr") {
        data = "{ NewsletterType: 'second', FirstContent: '', SecondContent: '', ThirldContent: ''}";
        $('#Clos_btn').removeClass();
        $('#Clos_btn').addClass('clos-btn-div-ScndNwsLtr');
    }
    else if ($('#<%=hdnTemplateType.ClientID %>').val() == "Thirld_nwslettr") {
        data = "{ NewsletterType: 'thirld', FirstContent: '', SecondContent: '', ThirldContent: ''}";
        $('#Clos_btn').removeClass();
        $('#Clos_btn').addClass('clos-btn-div-ThirldNwsLtr');
    }
    else if ($('#<%=hdnTemplateType.ClientID %>').val() == "Fourth_nwslettr") {
        data = "{ NewsletterType: 'fourth', FirstContent: '', SecondContent: '', ThirldContent: ''}";
        $('#Clos_btn').removeClass();
        $('#Clos_btn').addClass('clos-btn-div-ForthNwsLtr');
    }
    else if ($('#<%=hdnTemplateType.ClientID %>').val() == "Fifth_nwslettr") {
        data = "{ NewsletterType: 'fifth', FirstContent: '', SecondContent: '', ThirldContent: ''}";
        $('#Clos_btn').removeClass();
        $('#Clos_btn').addClass('clos-btn-div-FifthNwsLtr');
    }
    else if ($('#<%=hdnTemplateType.ClientID %>').val() == "Sixth_nwslettr") {
        data = "{ NewsletterType: 'six', FirstContent: '', SecondContent: '', ThirldContent: ''}";
        $('#Clos_btn').removeClass();
        $('#Clos_btn').addClass('clos-btn-div-SixthNwsLtr');
    }
    else if ($('#<%=hdnTemplateType.ClientID %>').val() == "Seventh_nwslettr") {
        data = "{ NewsletterType: 'seven', FirstContent: '', SecondContent: '', ThirldContent: ''}";
        $('#Clos_btn').removeClass();
        $('#Clos_btn').addClass('clos-btn-div-SeventhNwsLtr');
    }
    else if ($('#<%=hdnTemplateType.ClientID %>').val() == "Eighth_nwslettr") {
        data = "{ NewsletterType: 'eight', FirstContent: '', SecondContent: '', ThirldContent: ''}";
        $('#Clos_btn').removeClass();
        $('#Clos_btn').addClass('clos-btn-div-EightNwsLtr');
    }
     else if ($('#<%=hdnTemplateType.ClientID %>').val() == "Ninth_nwslettr") {
        data = "{ NewsletterType: 'nine', FirstContent: '', SecondContent: '', ThirldContent: ''}";
        $('#Clos_btn').removeClass();
        $('#Clos_btn').addClass('clos-btn-div-NinthNwsLtr');
     }
     else if ($('#<%=hdnTemplateType.ClientID %>').val() == "Tenth_nwslettr") {
        data = "{ NewsletterType: 'ten', FirstContent: '', SecondContent: '', ThirldContent: ''}";
        $('#Clos_btn').removeClass();
        $('#Clos_btn').addClass('clos-btn-div-TenthNwsLtr');
     }
     else if ($('#<%=hdnTemplateType.ClientID %>').val() == "Eleventh_nwslettr") {
        data = "{ NewsletterType: 'eleven', FirstContent: '', SecondContent: '', ThirldContent: ''}";
        $('#Clos_btn').removeClass();
        $('#Clos_btn').addClass('clos-btn-div-EleventhNwsLtr');
     }
     else if ($('#<%=hdnTemplateType.ClientID %>').val() == "Twelveth_nwslettr") {
         data = "{ NewsletterType: 'twelve', FirstContent: '', SecondContent: '', ThirldContent: ''}";
         $('#Clos_btn').removeClass();
         $('#Clos_btn').addClass('clos-btn-div-TwelvethNwsLtr');
     }
     else if ($('#<%=hdnTemplateType.ClientID %>').val() == "Thirteenth_nwslettr") {
         data = "{ NewsletterType: 'thirteen', FirstContent: '', SecondContent: '', ThirldContent: ''}";
         $('#Clos_btn').removeClass();
         $('#Clos_btn').addClass('clos-btn-div-ThirteenthNwsLtr');
     }
     else if ($('#<%=hdnTemplateType.ClientID %>').val() == "Fourteenth_nwslettr") {
         data = "{ NewsletterType: 'fourteen', FirstContent: '', SecondContent: '', ThirldContent: ''}";
         $('#Clos_btn').removeClass();
         $('#Clos_btn').addClass('clos-btn-div-FourteenthNwsLtr');
     }
     else if ($('#<%=hdnTemplateType.ClientID %>').val() == "Fifteenth_nwslettr") {
         data = "{ NewsletterType: 'fifteen', FirstContent: '', SecondContent: '', ThirldContent: ''}";
         $('#Clos_btn').removeClass();
         $('#Clos_btn').addClass('clos-btn-div-FifteenthNwsLtr');
     }
     else if ($('#<%=hdnTemplateType.ClientID %>').val() == "Sixteenth_nwslettr") {
         data = "{ NewsletterType: 'sixteen', FirstContent: '', SecondContent: '', ThirldContent: ''}";
         $('#Clos_btn').removeClass();
         $('#Clos_btn').addClass('clos-btn-div-SixteenthNwsLtr');
     }
     else if ($('#<%=hdnTemplateType.ClientID %>').val() == "Seventeenth_nwslettr") {
         data = "{ NewsletterType: 'seventeen', FirstContent: '', SecondContent: '', ThirldContent: ''}";
         $('#Clos_btn').removeClass();
         $('#Clos_btn').addClass('clos-btn-div-SeventeenthNwsLtr');
     }
     else if ($('#<%=hdnTemplateType.ClientID %>').val() == "Eightteenth_nwslettr") {
         data = "{ NewsletterType: 'eightteen', FirstContent: '', SecondContent: '', ThirldContent: ''}";
         $('#Clos_btn').removeClass();
         $('#Clos_btn').addClass('clos-btn-div-EightteenthNwsLtr');
     }
     else if ($('#<%=hdnTemplateType.ClientID %>').val() == "Ninteenth_nwslettr") {
         data = "{ NewsletterType: 'ninteen', FirstContent: '', SecondContent: '', ThirldContent: ''}";
         $('#Clos_btn').removeClass();
         $('#Clos_btn').addClass('clos-btn-div-NinteenthNwsLtr');
     }
     else if ($('#<%=hdnTemplateType.ClientID %>').val() == "Twentieth_nwslettr") {
         data = "{ NewsletterType: 'twenty', FirstContent: '', SecondContent: '', ThirldContent: ''}";
         $('#Clos_btn').removeClass();
         $('#Clos_btn').addClass('clos-btn-div-TwentiethNwsLtr');
     }
     else if ($('#<%=hdnTemplateType.ClientID %>').val() == "TwentyOne_nwslettr") {
         data = "{ NewsletterType: 'twentyone', FirstContent: '', SecondContent: '', ThirldContent: ''}";
         $('#Clos_btn').removeClass();
         $('#Clos_btn').addClass('clos-btn-div-TwentyOneNwsLtr');
     }
    return data;
}

function GetUrl() {
    var url = '';
    url = '/Newsletterfile.asmx/FirstNewsLetterPrint';

    return url;
}

function ajaxrequest(type, obj, url)  //common ajax request
{

    $.ajax({
        type: "POST",
        url: url,
        data: obj,
        dataType: "json",
        contentType: "application/json; charset=utf-8",
        success: function (data) {
            returnhtml = htmldata(data);
            if (type === "Print") {
                printfunction(returnhtml)// print function
            }
            else {
                previewfunction(returnhtml)//preview function
            }
        },
        error: function (res, status) {
            if (status === "error") {
                // errorMessage can be an object with 3 string properties: ExceptionType, Message and StackTrace
                var errorMessage = $.parseJSON(res.responseText);
                alert(errorMessage.Message);
            }
        }
    });
}


function htmldata(data) {
    var returnhtml = data.d;
    if ($('#<%=hdnTemplateType.ClientID %>').val() == "First_nwslettr") {
        var returnhtml = data.d;
        var imagelogo = $('#logoprvw').attr('src');
        var propertyimg = $('#imgprvw').attr('src');
        returnhtml = returnhtml.replace("{Logopath}", imagelogo);
        returnhtml = returnhtml.replace("{PropertyPhoto}", propertyimg);
    }
    return returnhtml;
}


function printfunction(content) {
    var frame = $('#printframe')[0].contentWindow.document;
    frame.open();
    frame.write(content);
    frame.close();
    // print just the modal div
    $('#printframe')[0].contentWindow.print();
}
function previewfunction(content) {


    var frame = $('#printframe')[0].contentWindow.document;
    // open the frame document and add the contents
    frame.open();
    frame.write(content);
    frame.close();
}


    </script>

    <script type="text/javascript">
        function Check_Click(objRef) {
            //Get the Row based on checkbox
            var row = objRef.parentNode.parentNode;

            //Get the reference of GridView
            var GridView = row.parentNode;

            //Get all input elements in Gridview
            var inputList = GridView.getElementsByTagName("input");

            for (var i = 0; i < inputList.length; i++) {
                //The First element is the Header Checkbox
                var headerCheckBox = inputList[0];

                //Based on all or none checkboxes
                //are checked check/uncheck Header Checkbox
                var checked = true;
                if (inputList[i].type == "checkbox" && inputList[i] != headerCheckBox) {
                    if (!inputList[i].checked) {
                        checked = false;
                        break;
                    }
                }
            }
            headerCheckBox.checked = checked;
        }

        function checkAll(objRef) {
            var GridView = objRef.parentNode.parentNode.parentNode;
            var inputList = GridView.getElementsByTagName("input");
            for (var i = 0; i < inputList.length; i++) {
                //Get the Cell To find out ColumnIndex
                var row = inputList[i].parentNode.parentNode;
                if (inputList[i].type == "checkbox" && objRef != inputList[i]) {
                    if (objRef.checked) {
                        inputList[i].checked = true;
                    }
                    else {
                        inputList[i].checked = false;
                    }
                }
            }
        }

        function checkTextAreaMaxLength(textBox, e, length) {

            var mLen = textBox["MaxLength"];
            if (null == mLen)
                mLen = length;

            var maxLength = parseInt(mLen);
            if (!checkSpecialKeys(e)) {
                if (textBox.value.length > maxLength - 1) {
                    if (window.event)//IE
                        e.returnValue = false;
                    else//Firefox
                        e.preventDefault();
                }
            }
        }
        function checkSpecialKeys(e) {
            if (e.keyCode != 8 && e.keyCode != 46 && e.keyCode != 37 && e.keyCode != 38 && e.keyCode != 39 && e.keyCode != 40)
                return false;
            else
                return true;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="span9" class="span9">
        <asp:HiddenField ID="hdnTemplateType" Value="First_nwslettr" runat="server" />
      
         <div class="content" id="ClientList" style="display: none">

            <div class="module">
                <div class="module-head">
                    <h3>Admin Clients</h3>
                </div>
                <div class="module-body">
                    <p>
                        <asp:Button ID="btnaddusers" runat="server" Style="display: none" class="btn btn-primary" Text="Add Client" OnClick="btnaddusers_Click" />
                        <asp:Button ID="btnDelete" runat="server" Style="display: none" class="btn btn-primary" Text="Delete Selected Record" OnClientClick="return confirm('Are you sure you want to delete selected');"
                            OnClick="btnDelete_Click" />
                        <button id="First_newletter_btn" style="display: block; float: left; margin-right: 3px;" type="button" class="btn btn-primary" value="Back To Newsletter">Back To Newsletter</button>
                        <asp:Button ID="btnSave" runat="server" Text="Send" class="btn btn-primary" Style="display: block; float: left; margin-right: 3px;" OnClick="btnSave_Click" />
                    </p>
                    <div class="alert" runat="server" id="alertMSG" visible="false">
                        <button type="button" class="close" data-dismiss="alert">×</button>
                        <strong>Sorry!</strong> no records found!
                    </div>

                    <asp:GridView ID="grdUsers" class="table table-striped table-bordered table-condensed" PageSize="10" AutoGenerateColumns="False" runat="server"
                        AllowPaging="true" OnPageIndexChanging="grdUsers_PageIndexChanging"
                        OnSorting="grdUsers_Sorting" OnRowDataBound="grdUsers_RowDataBound" OnRowCommand="grdUsers_RowCommand">

                        <Columns>
                            <%--    <asp:BoundField DataField="ID" HeaderText="#" SortExpression="ID"></asp:BoundField>--%>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:CheckBox ID="chkdeleteAll" runat="server" AutoPostBack="false" onclick="checkAll(this);" OnCheckedChanged="chkdeleteAll_CheckedChanged" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:HiddenField ID="hdnID" runat="server" Value='<%#Eval("ID") %>' />
                                    <asp:CheckBox ID="chkdelete" runat="server" AutoPostBack="false" onclick="Check_Click(this)" OnCheckedChanged="chkdelete_CheckedChanged" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ID" HeaderText="S.No" SortExpression="ID"></asp:BoundField>
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
                            <asp:BoundField DataField="EmailId" HeaderText="Email" SortExpression="Email"></asp:BoundField>
                            <asp:BoundField DataField="DOB" HeaderText="Date of Birth" SortExpression="DOB"></asp:BoundField>
                            <asp:BoundField DataField="PhoneNo" HeaderText="Phone No." SortExpression="PhoneNo"></asp:BoundField>
                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address"></asp:BoundField>
                            <asp:BoundField DataField="Source" HeaderText="Source" SortExpression="Source"></asp:BoundField>
                            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status"></asp:BoundField>
                            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender"></asp:BoundField>
                            <asp:ImageField DataImageUrlField="Photopath" HeaderText="Photopath"></asp:ImageField>


                            <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>
                                    <a id="id" href="AdminClient.aspx?edit=<%#Eval("ID") %>">
                                        <img src="../images/edit.png" alt="" /></a>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>


                </div>
            </div>
        </div>


        <div class="module" id="newletter_div">
            <div class="module-head">
                <h3>News Letter</h3>
            </div>
            <div class="module-body" id="newsletter">
                <br />
                <div class="form-horizontal row-fluid">

                    <div id="FirstNewsLetter_Div">
                        <div style="float: left; width: 99%; background-color: #231f20; border-bottom: 8px solid #eda320; padding: 6px 0;">
                            <div id="FirstNewsLetter_userlogo" style="float: left; width: 30%; padding: 6px; text-align: center;">
                                <img id="logoprvw" data-id="logoprvw" src="../images/logo.png" alt="" title="" height="250px" width="250px" />

                                <h3 style="font-size: 15px; margin-bottom: 21px; width: 94px; height: 0; margin-left: 81px; color: #E49523;">Change logo</h3>
                            </div>


                            <div style="float: left; width: 67%; padding: 6px;">

                                <asp:TextBox ID="FirstContent" onkeyDown="checkTextAreaMaxLength(this,event,'30');" Style="float: left; width: 100%; font-size: 26px; padding: 5px 0 0; font-family: Arial, Helvetica, sans-serif; font-weight: bold; color: #55518a; margin-top: 6px; height: 31px;" runat="server" TextMode="MultiLine" PlaceHolder="Description here..." class="span8">Tittle of the Newsletter Section </asp:TextBox>
                                <div style="float: left; width: 100%; margin: 12px 0 0;">
                                    <h2 style="float: left; width: 100%; font-size: 18px; font-family: Arial, Helvetica, sans-serif; color: #FFF; margin: 0px;">Gurminder Ahluwalia</h2>
                                    <p style="float: left; width: 100%; font-size: 16px; font-family: Arial, Helvetica, sans-serif; color: #c48820; margin: 5px 0 2px 0;">HomeLife/Miracle Realty Ltd., Brokerage*</p>
                                    <p style="float: left; width: 100%; margin: 0">
                                        <span style="float: left; font-size: 15px; color: #c48820;">Phone:</span>
                                        <span style="float: left; font-size: 14px; color: #FFF; margin: 0 10px 0 4px;">416-500-9331</span>
                                        <span style="float: left; font-size: 15px; color: #c48820; margin: 0 6px 0 1px">Email:</span>
                                        <span style="float: left; font-size: 14px; color: #FFF;">gps@ahome4me.ca</span>
                                    </p>
                                    <p style="float: left; width: 100%; margin: 0">
                                        <span style="float: left; font-size: 15px; color: #c48820;">Address:</span>
                                        <span style="float: left; font-size: 14px; color: #FFF; margin: 0 10px 0 4px;">5010 Steeles Avenue West , Suite 11A , Toronto, Ontario, M9V 5C6</span>
                                    </p>
                                    <p style="float: left; width: 100%; font-size: 22px; font-family: Arial, Helvetica, sans-serif; color: #c48820; margin: 5px 0 0;">www.homelifemiracle.com</p>
                                </div>
                            </div>
                        </div>
                        <div style="float: left; width: 100%;">
                            <div style="float: left; width: 30%; padding: 6px; padding: 12px 4px; background: #026f52; height: 628px;">

                                <img alt="" src="/images/client_img.png" />
                                <asp:TextBox ID="SecondContent" MaxLength='750' onkeyDown="checkTextAreaMaxLength(this,event,'750');" Style="float: left; font-family: arial; border: none; width: 100%; font-size: 13px; padding: 1px 0 0; background: #026f52 none repeat scroll 0 0; font-weight: bold; color: white; white-space: normal; margin-top: 6px; height: 455px;" runat="server" TextMode="MultiLine" PlaceHolder="" class="span8">
                                400 CENTRAL PARK WEST 5W
                                This spacious and sunny renovated 1-bedroom/1 bath apartment is ready for you to move in. Enjoy Central Park views as you gaze out the windows or as you relax on the huge outdoor terrace. The brand new kitchen features granite counter tops, custom cabinets and top-of-the-line appliances. The large living room is wonderful for entertaining and there is also a separate dining area. The bedroom is full-sized and can accommodate any type of furniture.The bedroom is full-sized and can accommodate any type of furniture.
                                               
                                </asp:TextBox>
                                <%-- </textarea>--%>
                            </div>

                            <div style="float: left; width: 68%; padding: 3px 0 0 3px;">
                                <div id="userimg" style="float: left; width: 100%;">
                                    <img id="imgprvw" data-id="imgprvw" src="../NewsLetterImages/images/img1F.jpg" style="width: 100%; height: 350px;" alt="" title="" />
                                </div>
                                <div style="float: left; width: 100%; margin-top: 3px; background-color: #f0f0f0;">

                                    <%-- <textarea id="textarea2" class="txtarea" name="ThirdContent" contenteditable="true" style="float:left; width:100%;height:445px;  color:#3d3d3d; font-size:13px; line-height: 22px; white-space: normal; text-align: justify; padding: 4px 10px;">--%>
                                    <asp:TextBox ID="ThirdContent" MaxLength='750' onkeyDown="checkTextAreaMaxLength(this,event,'750');" Style="float: left; width: 100%; height: 296px; color: #3d3d3d; font-size: 13px; line-height: 22px; white-space: normal; text-align: justify; padding: 4px 10px; font-family: 'Open Sans',Tahoma,Arial,sans-serif;" runat="server" TextMode="MultiLine" PlaceHolder="Description here..." class="span8">
                                    This charming mint one bedroom penthouse with a wrap terrace and a WBFP is located on a tree lined block and is steps from Central Park. Take the elevator up to the 10th floor and walk up one flight of stairs to a semi private landing. When entering this special home you will find light surrounding you from four exposures. The south facing living room boasts a wood burning fireplace and French doors that open to the wrap terrace, here you will be able to entertain your friends surrounded by lush plantings .The south facing living room boasts a wood burning fireplace and French doors that open to the wrap terrace.
                                   
                                    </asp:TextBox>
                                    <%--</textarea>--%>
                                </div>

                            </div>

                        </div>
                    </div>
                    <div id="SecondNewsletter_Div" style="display: none;">
                        <div id="" style="float: left; width: 100%; padding: 6px; text-align: center;">
                            <img id="SecondNewsletter_Front" data-id="logoprvw" src="../NewsLetterImages/images/front_design1.jpg" alt="" title="" />
                            <img id="SecondNewsletter_Back" style="display: none;" data-id="logoprvw" src="../NewsLetterImages/images/back_design1.jpg" alt="" title="" />
                        </div>
                    </div>
                    <div id="ThirldNewsletter_Div" style="display: none;">
                        <div id="" style="float: left; width: 100%; padding: 6px; text-align: center;">
                            <img id="ThirldNewsletter_Front" src="../NewsLetterImages/images/ThirldNewsLetter.jpg" alt="" title="" />

                        </div>
                    </div>
                    <div id="FourthNewsletter_Div" style="display: none;">
                        <div id="" style="float: left; width: 100%; padding: 6px; text-align: center;">
                            <img id="FourthNewsletter_Front" data-id="logoprvw" src="../NewsLetterImages/images/FourthNewsLetter_front_design.jpg" alt="" title="" />
                            <img id="FourthNewsletter_Back" style="display: none;" data-id="logoprvw" src="../NewsLetterImages/images/FourthNewsLetter_back_design.jpg" alt="" title="" />
                        </div>
                    </div>
                     <div id="FifthNewsletter_Div" style="display: none;">
                        <div id="" style="float: left; width: 100%; padding: 6px; text-align: center;">
                            <img id="FifthNewsletter_Front" src="../NewsLetterImages/images/Fifth_design.jpg" alt="" title="" />

                        </div>
                    </div>

                    <div id="SixNewsletter_Div" style="display: none;">
                        <div id="" style="float: left; width: 100%; padding: 6px; text-align: center;">
                            <img id="SixNewsletter_Front" src="../NewsLetterImages/images/6th_design.jpg" alt="" title="" />

                        </div>
                    </div>
                     <div id="SevenNewsletter_Div" style="display: none;">
                        <div id="" style="float: left; width: 100%; padding: 6px; text-align: center;">
                            <img id="SeventhNewsletter_Front" data-id="logoprvw" src="../NewsLetterImages/images/7th_front.jpg" alt="" title="" />
                            <img id="SeventhNewsletter_Back" style="display: none;" data-id="logoprvw" src="../NewsLetterImages/images/7th_Back.jpg" alt="" title="" />
                        </div>
                    </div>
                    <div id="EightNewsletter_Div" style="display: none;">
                        <div id="" style="float: left; width: 100%; padding: 6px; text-align: center;">
                           
                             <img id="EightNewsletter_Front" data-id="logoprvw" src="../NewsLetterImages/images/8th_front.jpg" alt="" title="" />
                            <img id="EightNewsletter_Back" style="display: none;" data-id="logoprvw" src="../NewsLetterImages/images/8th_back.jpg" alt="" title="" />
                        </div>
                    </div>

                    <div id="NinthNewsletter_Div" style="display: none;">
                        <div id="" style="float: left; width: 100%; padding: 6px; text-align: center;">
                            <img id="NinthNewsletter_Front" src="../NewsLetterImages/images/9th_design.jpg" alt="" title="" />
                            </div>
                    </div>
                   <div id="TenthNewsletter_Div" style="display: none;">
                        <div id="" style="float: left; width: 100%; padding: 6px; text-align: center;">
                            <img id="TenthNewsletter_Front" src="../NewsLetterImages/images/10th_design.jpg" alt="" title="" />

                        </div>
                    </div>
                    <div id="EleventhNewsletter_Div" style="display: none;">
                        <div id="" style="float: left; width: 100%; padding: 6px; text-align: center;">
                            <img id="EleventhNewsletter_Front" src="../NewsLetterImages/images/11th_design.jpg" alt="" title="" />

                        </div>
                    </div>

                      <div id="TwelvethNewsletter_Div" style="display: none;">
                        <div id="" style="float: left; width: 100%; padding: 6px; text-align: center;">
                            <img id="TwelvethNewsletter_Front" data-id="logoprvw" src="../NewsLetterImages/images/12th_design_front.jpg" alt="" title="" />
                            <img id="TwelvethNewsletter_Back" style="display: none;" data-id="logoprvw" src="../NewsLetterImages/images/12th_design_back.jpg" alt="" title="" />
                        </div>
                    </div>

                      <div id="ThirteenthNewsletter_Div" style="display: none;">
                        <div id="" style="float: left; width: 100%; padding: 6px; text-align: center;">
                            <img id="ThirteenthNewsletter_Front" data-id="logoprvw" src="../NewsLetterImages/images/13th_design.jpg" alt="" title="" />
                           
                        </div>
                    </div>

                     <div id="FourteenthNewsletter_Div" style="display: none;">
                        <div id="" style="float: left; width: 100%; padding: 6px; text-align: center;">
                            <img id="FourteenthNewsletter_Front" data-id="logoprvw" src="../NewsLetterImages/images/14th_design_front.jpg" style="display:none;" alt="" title="" />
                            <img id="FourteenthNewsletter_Back" data-id="logoprvw" src="../NewsLetterImages/images/14th_design_back.jpg" style="display:none;" alt="" title="" />
                            
                        </div>
                    </div>
                     <div id="FifteenthNewsletter_Div" style="display: none;">
                        <div id="" style="float: left; width: 100%; padding: 6px; text-align: center;">
                            <img id="FifteenthNewsletter_Front" data-id="logoprvw" src="../NewsLetterImages/images/15th_design.jpg"  alt="" title="" />
                            
                        </div>
                    </div>
                     <div id="SixteenthNewsletter_Div" style="display: none;">
                        <div id="" style="float: left; width: 100%; padding: 6px; text-align: center;">
                            <img id="SixteenthNewsletter_Front" data-id="logoprvw" src="../NewsLetterImages/images/16th_design_front.jpg" alt="" title="" />
                            <img id="SixteenthNewsletter_Back" style="display: none;" data-id="logoprvw" src="../NewsLetterImages/images/16th_design_back.jpg" alt="" title="" />
                        </div>
                    </div>
                       <div id="SeventeenthNewsletter_Div" style="display: none;">
                        <div id="" style="float: left; width: 100%; padding: 6px; text-align: center;">
                            <img id="SeventeenthNewsletter_Front" data-id="logoprvw" src="../NewsLetterImages/images/17th_design_front.jpg" alt="" title="" />
                            <img id="SeventeenthNewsletter_Back" style="display: none;" data-id="logoprvw" src="../NewsLetterImages/images/17th_design_back.jpg" alt="" title="" />
                        </div>
                    </div>
                       <div id="EightteenthNewsletter_Div" style="display: none;">
                        <div id="" style="float: left; width: 100%; padding: 6px; text-align: center;">
                            <img id="EightteenthNewsletter_Front" data-id="logoprvw" src="../NewsLetterImages/images/18th_design_front.jpg" alt="" title="" />
                            <img id="EightteenthNewsletter_Back" style="display: none;" data-id="logoprvw" src="../NewsLetterImages/images/18th_design_back.jpg" alt="" title="" />
                        </div>
                    </div>

                    <div id="NinteenthNewsletter_Div" style="display: none;">
                        <div id="" style="float: left; width: 100%; padding: 6px; text-align: center;">
                            <img id="NinteenthNewsletter_Front" data-id="logoprvw" src="../NewsLetterImages/images/19th_design_front.jpg" alt="" title="" />
                            <img id="NinteenthNewsletter_Back" style="display: none;" data-id="logoprvw" src="../NewsLetterImages/images/19th_design_back.jpg" alt="" title="" />
                        </div>
                    </div>

                     <div id="twentiethNewsletter_Div" style="display: none;">
                        <div id="" style="float: left; width: 100%; padding: 6px; text-align: center;">
                            <img id="twentiethNewsletter_Front" data-id="logoprvw" src="../NewsLetterImages/images/20th_design.jpg" alt="" title="" />
                            
                        </div>
                    </div>
                    <div id="TwentyOneNewsletter_Div" style="display: none;">
                        <div id="" style="float: left; width: 100%; padding: 6px; text-align: center;">
                            <img id="TwentyOneNewsletter_Front" data-id="logoprvw" src="../NewsLetterImages/images/21th_design.jpg" alt="" title="" />
                            
                        </div>
                    </div>
                    <div class="control-group">
                        <div style="float: left; width: 100%; margin-top: 12px;">
                            <asp:Button ID="btnBack" class="btn" runat="server" Visible="false" Text="Back" OnClick="btnBack_Click" />
                            <button id="Send_To" type="button" class="btn btn-primary" value="Send To" style="display: block; float: left; padding-top: 3px; margin-right: 7px;">Send To</button>
                            <button id="preview" type="button" class="btn btn-primary" value="preview" style="display: block; float: left; padding-top: 3px; margin-right: 7px;">preview</button>
                            <button id="print" type="button" class="btn btn-primary" value="Send To" style="display: block; float: left; padding-top: 3px; margin-right: 7px;">print</button>

                            <button id="btn_Front_Of_SecondNewsletter" type="button" class="btn btn-primary" value="Send To" style="display: None; float: left; padding-top: 3px; margin-right: 7px;">Front Side</button>
                            <button id="btn_Back_Of_SecondNewsletter" type="button" class="btn btn-primary" value="Send To" style="display: none; float: left; padding-top: 3px; margin-right: 7px;">Back Side</button>

                            <button id="btn_Front_Of_FourthNewsletter" type="button" class="btn btn-primary" value="Send To" style="display: None; float: left; padding-top: 3px; margin-right: 7px;">Front Side</button>
                            <button id="btn_Back_Of_FourthNewsletter" type="button" class="btn btn-primary" value="Send To" style="display: none; float: left; padding-top: 3px; margin-right: 7px;">Back Side</button>

                            <button id="btn_Front_Of_SevenNewsletter" type="button" class="btn btn-primary" value="Send To" style="display: None; float: left; padding-top: 3px; margin-right: 7px;">Front Side</button>
                            <button id="btn_Back_Of_SevenNewsletter" type="button" class="btn btn-primary" value="Send To" style="display: none; float: left; padding-top: 3px; margin-right: 7px;">Back Side</button>

                            <button id="btn_Front_Of_EightNewsletter" type="button" class="btn btn-primary" value="Send To" style="display: None; float: left; padding-top: 3px; margin-right: 7px;">Front Side</button>
                            <button id="btn_Back_Of_EightNewsletter" type="button" class="btn btn-primary" value="Send To" style="display: none; float: left; padding-top: 3px; margin-right: 7px;">Back Side</button>

                             <button id="btn_Front_Of_TwelveNewsletter" type="button" class="btn btn-primary" value="Send To" style="display: None; float: left; padding-top: 3px; margin-right: 7px;">Front Side</button>
                            <button id="btn_Back_Of_TwelveNewsletter" type="button" class="btn btn-primary" value="Send To" style="display: none; float: left; padding-top: 3px; margin-right: 7px;">Back Side</button>

                             <button id="btn_Front_Of_FourteenthNewsletter" type="button" class="btn btn-primary" value="Send To" style="display: None; float: left; padding-top: 3px; margin-right: 7px;">Front Side</button>
                            <button id="btn_Back_Of_FourteenthNewsletter" type="button" class="btn btn-primary" value="Send To" style="display: none; float: left; padding-top: 3px; margin-right: 7px;">Back Side</button>

                            <button id="btn_Front_Of_SixteenthNewsletter" type="button" class="btn btn-primary" value="Send To" style="display: None; float: left; padding-top: 3px; margin-right: 7px;">Front Side</button>
                            <button id="btn_Back_Of_SixteenthNewsletter" type="button" class="btn btn-primary" value="Send To" style="display: none; float: left; padding-top: 3px; margin-right: 7px;">Back Side</button>

                            <button id="btn_Front_Of_SeventeenthNewsletter" type="button" class="btn btn-primary" value="Send To" style="display: None; float: left; padding-top: 3px; margin-right: 7px;">Front Side</button>
                            <button id="btn_Back_Of_SeventeenthNewsletter" type="button" class="btn btn-primary" value="Send To" style="display: none; float: left; padding-top: 3px; margin-right: 7px;">Back Side</button>

                            <button id="btn_Front_Of_EightteenthNewsletter" type="button" class="btn btn-primary" value="Send To" style="display: None; float: left; padding-top: 3px; margin-right: 7px;">Front Side</button>
                            <button id="btn_Back_Of_EightteenthNewsletter" type="button" class="btn btn-primary" value="Send To" style="display: none; float: left; padding-top: 3px; margin-right: 7px;">Back Side</button>

                            <button id="btn_Front_Of_NinteenthNewsletter" type="button" class="btn btn-primary" value="Send To" style="display: None; float: left; padding-top: 3px; margin-right: 7px;">Front Side</button>
                            <button id="btn_Back_Of_NinteenthNewsletter" type="button" class="btn btn-primary" value="Send To" style="display: none; float: left; padding-top: 3px; margin-right: 7px;">Back Side</button>

                            
                            
                            <a id="admin_btn" href="../admin/SiteSettings.aspx" class="btn btn-primary">Go To Admin</a>
                        </div>
                    </div>
                </div>

            </div>



        </div>






        <button id="myModal" type="button" style="visibility: hidden" class="btn btn-info btn-lg" data-toggle="modal" data-target="#favouriteProperties" data-backdrop="static" data-keyboard="false">Open Modal</button>

        <!--logo image Modal -->
        <div class="modal fade new" id="favouriteProperties" role="dialog">
            <div class="modal-dialog modl_bgg">

                <!-- Modal content-->
                <div class="modal-content new_pop">
                    <div class="modal-header mdl_hdrrr">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 id="popupheading" class="modal-title modl_hdng">Upload logo</h4>
                    </div>
                    <div class="modal-body modl_bg">

                        <ul class="list_to_row">
                            <li class="cell" style="width: 75px">Browse</li>
                            <li class="cell">
                                <%-- <input type="file" id="file" name="Logofile" onchange="showLogopreview(this)" />--%>
                                <asp:FileUpload ID="First_newsletter_Logo" runat="server" onchange="showLogopreview(this,'First_newsletter_Logo')" />
                                <asp:FileUpload ID="First_newsletter_Imgfile" Style="display: none;" runat="server" onchange="showLogopreview(this,'First_newsletter_Img')" />
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                        <div class="modal_button_area">

                            <button type="button" id="closefav" class="btn btn-default mdl_cls_btn" data-dismiss="modal">Close</button>
                        </div>

                    </div>
                </div>

            </div>

        </div>






    </div>
    <div id="mypopup" class="">
        <div id="Clos_btn" class="clos-btn-div-FstNwsLtr">
            <button type="button" class="close" style="float: right; font-size: 40px; font-weight: bold; line-height: 35px; opacity: 0.96;" id="close_popup" data-dismiss="modal">&times;</button>
        </div>
        <iframe id="printframe"></iframe>

    </div>
    <!--/.span9-->
</asp:Content>
