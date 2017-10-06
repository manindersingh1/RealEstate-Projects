<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/NewsLetterMaster.Master" AutoEventWireup="true"
    CodeBehind="PostCard.aspx.cs" Inherits="Property.Admin.PostCard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <%--    <link href="../css/style_002.css" rel="stylesheet" />
    <link href="../slider/css/style.css" rel="stylesheet" />
    <link href="../css/shortcodes.css" rel="stylesheet" />--%>
    
    <script type="text/javascript">
        $(document).ready(function () {

            //Slider work
            $('#slider4').css('display', 'block')
            $('#slider4').Thumbelina({
                orientation: 'vertical',         // Use vertical mode (default horizontal).
                $bwdBut: $('#slider4 .top'),     // Selector to top button.
                $fwdBut: $('#slider4 .bottom')   // Selector to bottom button.
            });


            //Postcard slider click events
            $("#Openhouse_click li").click(function () {

                var id = this.id;
                $('#newletter_div').css('display', 'block')
                $('#Send_To').css('display', 'block')
                $('#ClientList').css('display', 'none')

                if (id == "Openhouse") {
                    Show_OpenHouse();
                    Hide_FirstFtr();
                    Hide_2ndFtr();
                    Hide_jstsold();
                    $('#<%=hdnTemplateType.ClientID %>').val(id)
                }
                else if (id == "feature") {
                    Show_FirstFtr();
                    Hide_OpenHouse();
                    Hide_2ndFtr();
                    Hide_jstsold();
                    $('#<%=hdnTemplateType.ClientID %>').val(id)
                 }
                 else if (id == "2ndfeature") {
                     Show_2ndFtr();
                     Hide_FirstFtr();
                     Hide_OpenHouse();
                     Hide_jstsold();
                     $('#<%=hdnTemplateType.ClientID %>').val(id)
                }
                else if (id == "jst_sold") {

                    Show_jstsold();
                    Hide_OpenHouse();
                    Hide_FirstFtr();
                    Hide_2ndFtr();
                    $('#<%=hdnTemplateType.ClientID %>').val(id)
                }
            });
            //End postcard slider click



            //Open house functionality
            $('#newletter_div').css('display', 'block')

            //go back from user list to front page.
            $('#news_letter').click(function () {

                $('#newletter_div').css('display', 'block')
                $('#ClientList').css('display', 'none')
                $('#Send_To').css('display', 'block')
                $('#news_letter').css('display', 'none')
            })

            $('#feature_card').click(function () {
                $('#newletter_div').css('display', 'block')
                $('#feature_Front').css('display', 'block')
                $('#ClientList').css('display', 'none')
                $('#Send_To').css('display', 'block')
                $('#news_letter').css('display', 'none')
                $('#feature_card').css('display', 'none')
                $('#feature_back_side').css('display', 'block')
            })

            $('#2ndfeature_card').click(function () {

                $('#ClientList').css('display', 'none')
                $('#Send_To').css('display', 'block')
                $('#2nd_ftr_btn_backpage').css('display', 'block')
                $('#newletter_div').css('display', 'block')
                $('#2nd_ftr_btn_frontpage').css('display', 'none')
                $('#2nd_featured_front').css('display', 'block')
                $('#2nd_featured_back').css('display', 'none')

            })

            $('#jst_hold_card').click(function () {

                Show_jstsold();
                Hide_OpenHouse();
                Hide_FirstFtr();
                Hide_2ndFtr();
                $('#newletter_div').css('display', 'block')
                $('#ClientList').css('display', 'none')
                $('#Send_To').css('display', 'block')
            })
            //
            //End


            $('#Send_To').click(function () {

                $('#Send_To').css('display', 'none')
                $('#ClientList').css('display', 'block')
                $('#newletter_div').css('display', 'none')

                //hide featured page and button.
                $('#feature_front_side').css('display', 'none')
                $('#feature_back_side').css('display', 'none')
                $('#feature_Front').css('display', 'none')
                $('#feature_Back').css('display', 'none')

                if ($('#<%=hdnTemplateType.ClientID %>').val() == "feature") {
                     $('#feature_card').css('display', 'block')
                     $('#2ndfeature_card').css('display', 'none')
                     $('#news_letter').css('display', 'none')
                 }
                 else if ($('#<%=hdnTemplateType.ClientID %>').val() == "Openhouse") {
                     $('#news_letter').css('display', 'block')
                     $('#feature_card').css('display', 'none')
                     $('#2ndfeature_card').css('display', 'none')
                 }
                 else if ($('#<%=hdnTemplateType.ClientID %>').val() == "2ndfeature") {
                    $('#2ndfeature_card').css('display', 'block')
                    $('#news_letter').css('display', 'none')
                    $('#feature_card').css('display', 'none')
                }
                else if ($('#<%=hdnTemplateType.ClientID %>').val() == "jst_sold") {
                    $('#2ndfeature_card').css('display', 'none')
                    $('#news_letter').css('display', 'none')
                    $('#feature_card').css('display', 'none')
                    $('#jst_hold_card').css('display', 'block')
                }

                 //End 

             });


            $('#back_side').click(function () {
                $('#frontside_page').css('display', 'none')
                $('#backside_page').css('display', 'block')
                $('#back_side').css('display', 'none')
                $('#front_side').css('display', 'block')
            })
            $('#front_side').click(function () {
                $('#frontside_page').css('display', 'block')
                $('#backside_page').css('display', 'none')
                $('#back_side').css('display', 'block')
                $('#front_side').css('display', 'none')
            })

            // End open house functionality.

            //Featured postcard button click functionality
            $('#feature_back_side').click(function () {

                $('#feature_front_side').css('display', 'block')
                $('#feature_back_side').css('display', 'none')
                $('#feature_Front').css('display', 'none')
                $('#feature_Back').css('display', 'block')
            })
            $('#feature_front_side').click(function () {

                $('#feature_front_side').css('display', 'none')
                $('#feature_back_side').css('display', 'block')
                $('#feature_Front').css('display', 'block')
                $('#feature_Back').css('display', 'none')
            })
            //end


            //open house image click popup model
            $('#property_photo_div').click(function () {
                var id = $(this).data("id");
                OpenFeaturFirstmodel(id)
            }
          )

            //first featured image  popup model open          
            $('#featured_first_imge').click(function () {
                var id = $(this).data("id");
                OpenFeaturFirstmodel(id);
            })
            $('#featured_second_imge').click(function () {

                var id = $(this).data("id");
                OpenFeaturFirstmodel(id)
            })
            $('#featured_thirld_imge').click(function () {

                var id = $(this).data("id");
                OpenFeaturFirstmodel(id)
            })
            $('#featured_fourth_imge').click(function () {
                var id = $(this).data("id");
                OpenFeaturFirstmodel(id)
            })
            $('#featured_fifth_imge').click(function () {
                var id = $(this).data("id");
                OpenFeaturFirstmodel(id)
            })
            //End button click functionality


            //2nd Featured postcard button click functionality          
            $('#2nd_ftr_btn_backpage').click(function () {

                $('#2nd_ftr_btn_backpage').css('display', 'none')
                $('#2nd_ftr_btn_frontpage').css('display', 'block')
                $('#2nd_featured_front').css('display', 'none')
                $('#2nd_featured_back').css('display', 'block')
            })
            $('#2nd_ftr_btn_frontpage').click(function () {
                $('#2nd_ftr_btn_backpage').css('display', 'block')
                $('#2nd_ftr_btn_frontpage').css('display', 'none')
                $('#2nd_featured_front').css('display', 'block')
                $('#2nd_featured_back').css('display', 'none')
            })
            //End jsthold_btn_backpage

            //Just hold postcard button click functionality          
            $('#jsthold_btn_backpage').click(function () {

                $('#jsthold_btn_backpage').css('display', 'none')
                $('#jsthold_btn_frontpage').css('display', 'block')
                $('#jst_sold_front').css('display', 'none')
                $('#jst_sold_back').css('display', 'block')
            })
            $('#jsthold_btn_frontpage').click(function () {
                $('#jsthold_btn_backpage').css('display', 'block')
                $('#jsthold_btn_frontpage').css('display', 'none')
                $('#jst_sold_front').css('display', 'block')
                $('#jst_sold_back').css('display', 'none')
            })
            //End 




            //2nd feature image click.
            $('#2nd_ftr_fstimg').click(function () {
                var id = $(this).data("id");
                OpenFeaturFirstmodel(id)
            })
            $('#2nd_ftr_2ndimg').click(function () {
                var id = $(this).data("id");
                OpenFeaturFirstmodel(id)
            })
            $('#2nd_ftr_3rdimg').click(function () {
                var id = $(this).data("id");
                OpenFeaturFirstmodel(id)
            })
            $('#2nd_ftr_4thimg').click(function () {
                var id = $(this).data("id");
                OpenFeaturFirstmodel(id)
            })
            $('#2nd_ftr_5thimg').click(function () {
                var id = $(this).data("id");
                OpenFeaturFirstmodel(id)
            })
            $('#2nd_ftr_6thimg').click(function () {
                var id = $(this).data("id");
                OpenFeaturFirstmodel(id)
            })
            $('#2nd_ftr_7thimg').click(function () {
                var id = $(this).data("id");
                OpenFeaturFirstmodel(id)
            })

            //end


            //jst hold postcard image click.
            $('#jsthold_1stimge').click(function () {
                var id = $(this).data("id");
                OpenFeaturFirstmodel(id)
            })
            $('#jsthold_2ndimge').click(function () {
                var id = $(this).data("id");
                OpenFeaturFirstmodel(id)
            })
            $('#jsthold_3rdimge').click(function () {
                var id = $(this).data("id");
                OpenFeaturFirstmodel(id)
            })
            $('#jsthold_4thimge').click(function () {
                var id = $(this).data("id");
                OpenFeaturFirstmodel(id)
            })
            $('#jsthold_5thimge').click(function () {
                var id = $(this).data("id");
                OpenFeaturFirstmodel(id)
            })
            $('#jsthold_6thimge').click(function () {
                var id = $(this).data("id");
                OpenFeaturFirstmodel(id)
            })
            $('#jsthold_7thimge').click(function () {
                var id = $(this).data("id");
                OpenFeaturFirstmodel(id)
            })
            //end


            //print functionality
            $('#preview').click(function () {
                Preview();
            })
            $('#print').click(function () {
                print();
            })

            $(document).on("click", "#close_popup", function (e) {
                e.preventDefault();
                $("#mypopup").css("display", "none");
                $('.span9').removeClass('is-blurred');
                $('.span3').removeClass('is-blurred');

            });
        })



//open model for open house    
        function showUsrImgpreview(input, id) {            
    if (input.files && input.files[0]) {
        var filerdr = new FileReader();
        filerdr.onload = function (e) {
            Change_src(e, id);
            $('#firstImgModal').click();
        }
        filerdr.readAsDataURL(input.files[0]);
    }
}
        function Change_src(e, id) {            
    Change_src_opnhouse(e, id);
    Change_src_fst_ftr(e, id);
    Change_src_scnd_ftr(e, id);
    Change_src_jsthold(e, id);
}
//end

function Change_src_opnhouse(e, id) {
   
    if (id == "openhousefile") {        
        $('#property_photo').attr('src', e.target.result);
    }
}
function Change_src_fst_ftr(e, id) {
    //first feature imgs
    if (id == "First_feature_Image") {
        $('#featured_first_img').attr('src', e.target.result);
    }
    else if (id == "secd_feature_Image") {
        $('#featured_second_img').attr('src', e.target.result);
    }
    else if (id == "thrld_feature_Image") {
        $('#featured_thirld_img').attr('src', e.target.result);
    }
    else if (id == "forth_feature_Image") {
        $('#featured_fourth_img').attr('src', e.target.result);
    }
    else if (id == "fifth_feature_Image") {
        $('#featured_fifth_img').attr('src', e.target.result);
    }
    //end 
}
function Change_src_scnd_ftr(e, id) {
    //second feature imgs

    if (id == "2nd_ftr_1stfile") {

        $('#ftr_2nd_1stimge').attr('src', e.target.result);
    }
    else if (id == "2nd_ftr_2ndfile") {
        $('#ftr_2nd_2ndimge').attr('src', e.target.result);
    }
    else if (id == "2nd_ftr_3rdfile") {
        $('#ftr_2nd_3rdimge').attr('src', e.target.result);
    }
    else if (id == "2nd_ftr_4thfile") {
        $('#ftr_2nd_4thimge').attr('src', e.target.result);
    }
    else if (id == "2nd_ftr_5thfile") {
        $('#ftr_2nd_5thimge').attr('src', e.target.result);
    }
    else if (id == "2nd_ftr_6thfile") {
        $('#ftr_2nd_6thimge').attr('src', e.target.result);
    }
    else if (id == "2nd_ftr_7thfile") {
        $('#ftr_2nd_7thimge').attr('src', e.target.result);
    }
    //end
}
function Change_src_jsthold(e, id) {

    if (id == "jsthold_1stimge") {

        $('#jsthold_1stimge').attr('src', e.target.result);
    }
    else if (id == "jsthold_2ndimge") {
        $('#jsthold_2ndimge').attr('src', e.target.result);
    }
    else if (id == "jsthold_3rdimge") {
        $('#jsthold_3rdimge').attr('src', e.target.result);
    }
    else if (id == "jsthold_4thimge") {
        $('#jsthold_4thimge').attr('src', e.target.result);
    }
    else if (id == "jsthold_5thimge") {
        $('#jsthold_5thimge').attr('src', e.target.result);
    }
    else if (id == "jsthold_6thimge") {
        $('#jsthold_6thimge').attr('src', e.target.result);
    }
    else if (id == "jsthold_7thimge") {
        $('#jsthold_7thimge').attr('src', e.target.result);
    }
    //end
}


//Featured page functions
function OpenFeaturFirstmodel(id) {
    backdrop: 'static';
    keyboard: false;
    $('#firstImgModal').click();
    browsebuttons(id);
    return false;
}
//End Featured page functions

//browse button hide/show
function browsebuttons(id) {
    Hide_Show_opn_browsebtns(id);
    Hide_Show_firstFtr_browsebtns(id); //hide/show browse btns
    Hide_Show_2ndFtr_browsebtns(id);   //hide/show browse btns
    Hide_Show_jstsold_browsebtns(id);  //hide/show browse btns
}

function Hide_OpenHouse() {
    $('#frontside_page').css('display', 'none')
    $('#backside_page').css('display', 'none')
    $('#back_side').css('display', 'none')
    $('#front_side').css('display', 'none')
}
function Show_OpenHouse() {
    $('#frontside_page').css('display', 'block')
    $('#backside_page').css('display', 'none')
    $('#back_side').css('display', 'block')
    $('#front_side').css('display', 'none')
}

function Hide_FirstFtr() {
    $('#feature_Front').css('display', 'none')
    $('#feature_Back').css('display', 'none')
    $('#feature_back_side').css('display', 'none')
    $('#feature_front_side').css('display', 'none')
    $('#news_letter').css('display', 'none')
}
function Show_FirstFtr() {

    $('#feature_Front').css('display', 'block')
    $('#feature_Back').css('display', 'none')
    $('#feature_back_side').css('display', 'block')
    $('#feature_front_side').css('display', 'none')
    $('#news_letter').css('display', 'none')

    $('#jsthold_btn_frontpage').css('display', 'none')
    $('#jsthold_btn_backpage').css('display', 'none')

}

function Hide_2ndFtr() {
    $('#2nd_ftr_btn_backpage').css('display', 'none')
    $('#2nd_ftr_btn_frontpage').css('display', 'none')
    $('#2nd_featured_front').css('display', 'none')
    $('#2nd_featured_back').css('display', 'none')
}
function Show_2ndFtr() {
    $('#2nd_ftr_btn_backpage').css('display', 'block')
    $('#2nd_featured_front').css('display', 'block')
    $('#2nd_featured_back').css('display', 'none')
}

function Hide_jstsold() {
    $('#jst_sold_front').css('display', 'none')
    $('#jst_sold_back').css('display', 'none')
    $('#jsthold_btn_frontpage').css('display', 'none')
    $('#jsthold_btn_backpage').css('display', 'none')
}
function Show_jstsold() {
    $('#jst_sold_front').css('display', 'block')
    $('#jst_sold_back').css('display', 'none')
    $('#jsthold_btn_backpage').css('display', 'block')
}



//hide show browse btns
function Hide_Show_jstsold_browsebtns(id) {
    {
        //jst hold  browse buttons.
        $("#<%=jsthold_1stimg.ClientID %>").css('display', 'none')
        $('#<%=jsthold_2ndimg.ClientID %>').css('display', 'none')
        $('#<%=jsthold_3rdimg.ClientID %>').css('display', 'none')
        $('#<%=jsthold_4thimg.ClientID %>').css('display', 'none')
        $('#<%=jsthold_5thimg.ClientID %>').css('display', 'none')
        $('#<%=jsthold_6thimg.ClientID %>').css('display', 'none')
        $('#<%=jsthold_7thimg.ClientID %>').css('display', 'none')

        if (id == "jsthold_1stimge") {
            $('#<%=jsthold_1stimg.ClientID %>').css('display', 'block')
        }
        else if (id == "jsthold_2ndimge") {
            $('#<%=jsthold_2ndimg.ClientID %>').css('display', 'block')
        }
        else if (id == "jsthold_3rdimge") {
            $('#<%=jsthold_3rdimg.ClientID %>').css('display', 'block')
        }
        else if (id == "jsthold_4thimge") {
            $('#<%=jsthold_4thimg.ClientID %>').css('display', 'block')
        }
        else if (id == "jsthold_5thimge") {
            $('#<%=jsthold_5thimg.ClientID %>').css('display', 'block')
        }
        else if (id == "jsthold_6thimge") {
            $('#<%=jsthold_6thimg.ClientID %>').css('display', 'block')
            }
            else if (id == "jsthold_7thimge") {
                $('#<%=jsthold_7thimg.ClientID %>').css('display', 'block')
            }
}
}


function Hide_Show_2ndFtr_browsebtns(id) {

    //hide second feature browse buttons.
    $("#<%=ftr_2nd_1stfile.ClientID %>").css('display', 'none')
    $('#<%=ftr_2nd_2ndfile.ClientID %>').css('display', 'none')
    $('#<%=ftr_2nd_3rdfile.ClientID %>').css('display', 'none')
    $('#<%=ftr_2nd_4thfile.ClientID %>').css('display', 'none')
    $('#<%=ftr_2nd_5thfile.ClientID %>').css('display', 'none')
    $('#<%=ftr_2nd_6thfile.ClientID %>').css('display', 'none')
    $('#<%=ftr_2nd_7thfile.ClientID %>').css('display', 'none')

    if (id == "2nd_ftr_fstimg") {
        $('#<%=ftr_2nd_1stfile.ClientID %>').css('display', 'block')
    }
    else if (id == "2nd_ftr_2ndimg") {
        $('#<%=ftr_2nd_2ndfile.ClientID %>').css('display', 'block')
    }
    else if (id == "2nd_ftr_3rdimg") {
        $('#<%=ftr_2nd_3rdfile.ClientID %>').css('display', 'block')
    }
    else if (id == "2nd_ftr_4thimg") {
        $('#<%=ftr_2nd_4thfile.ClientID %>').css('display', 'block')
    }
    else if (id == "2nd_ftr_5thimg") {
        $('#<%=ftr_2nd_5thfile.ClientID %>').css('display', 'block')
    }
    else if (id == "2nd_ftr_6thimg") {
        $('#<%=ftr_2nd_6thfile.ClientID %>').css('display', 'block')
    }
    else if (id == "2nd_ftr_7thimg") {
        $('#<%=ftr_2nd_7thfile.ClientID %>').css('display', 'block')
    }
}



function Hide_Show_firstFtr_browsebtns(id) {


    // hide first feature browse button
    $('#<%=First_feature_Image.ClientID %>').css('display', 'none')
    $('#<%=secd_feature_Image.ClientID %>').css('display', 'none')
    $('#<%=thrld_feature_Image.ClientID %>').css('display', 'none')
    $('#<%=forth_feature_Image.ClientID %>').css('display', 'none')
    $('#<%=fifth_feature_Image.ClientID %>').css('display', 'none')


    //for first feature browse button
    if (id == "featured_first") {
        $('#<%=First_feature_Image.ClientID %>').css('display', 'block')
    }
    else if (id == "featured_second") {
        $('#<%=secd_feature_Image.ClientID %>').css('display', 'block')
    }
    else if (id == "featured_thirld") {
        $('#<%=thrld_feature_Image.ClientID %>').css('display', 'block')
    }
    else if (id == "featured_fourth") {
        $('#<%=forth_feature_Image.ClientID %>').css('display', 'block')
    }
    else if (id == "featured_fifth") {
        $('#<%=fifth_feature_Image.ClientID %>').css('display', 'block')
    }

}
function Hide_Show_opn_browsebtns(id) {
    //open house browse button.
    $('#<%=openhousefile.ClientID %>').css('display', 'none')
    //display browse button on click
    if (id == "openhouse") {
        $('#<%=openhousefile.ClientID %>').css('display', 'block')
    }
}




//open print prev  model
function Preview() {
    var type = "Preview";
    backdrop: 'static';
    keyboard: false;
    $("#mypopup").css("display", "block");
    $('.span9').addClass('is-blurred');
    $('.span3').addClass('is-blurred');
    PrintAndPreview(type);
    return false;
}
//end

//open print window
function print() {
    var type = "Print";
    PrintAndPreview(type);
}


//newsletter print functionalty.
function PrintAndPreview(type) {
    debugger;
    var obj = PostCard_Data();
    var url = GetUrl();
    ajaxrequest(type, obj, url)  //common ajax request
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
                alert(data);
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
    if ($('#<%=hdnTemplateType.ClientID %>').val() == "Openhouse") {
        var firstimg = $('#property_photo').attr('src');
        var secondimg = $('#secnd_imge').attr('src');
        returnhtml = returnhtml.replace("{firstimg}", firstimg);
        returnhtml = returnhtml.replace("{secondimg}", secondimg);
    }
    else if ($('#<%=hdnTemplateType.ClientID %>').val() == "feature") {
        var First_feature_Image = $('#featured_first_img').attr('src');
        var secd_feature_Image = $('#featured_second_img').attr('src');
        var thrld_feature_Image = $('#featured_thirld_img').attr('src');
        var forth_feature_Image = $('#featured_fourth_img').attr('src');
        var fifth_feature_Image = $('#featured_fifth_img').attr('src');

        returnhtml = returnhtml.replace("{First_feature_Image}", First_feature_Image);
        returnhtml = returnhtml.replace("{secd_feature_Image}", secd_feature_Image);
        returnhtml = returnhtml.replace("{thrld_feature_Image}", thrld_feature_Image);
        returnhtml = returnhtml.replace("{forth_feature_Image}", forth_feature_Image);
        returnhtml = returnhtml.replace("{fifth_feature_Image}", fifth_feature_Image);

    }
    else if ($('#<%=hdnTemplateType.ClientID %>').val() == "2ndfeature") {
        var First_feature_Image = $('#ftr_2nd_1stimge').attr('src');
        var secd_feature_Image = $('#ftr_2nd_2ndimge').attr('src');
        var thrld_feature_Image = $('#ftr_2nd_3rdimge').attr('src');
        var forth_feature_Image = $('#ftr_2nd_4thimge').attr('src');
        var fifth_feature_Image = $('#ftr_2nd_5thimge').attr('src');
        var sixth_feature_Image = $('#ftr_2nd_6thimge').attr('src');
        var seventh_feature_Image = $('#ftr_2nd_7thimge').attr('src');

        returnhtml = returnhtml.replace("{ftr_2nd_1stimg}", First_feature_Image);
        returnhtml = returnhtml.replace("{ftr_2nd_2ndimg}", secd_feature_Image);
        returnhtml = returnhtml.replace("{ftr_2nd_3rdimg}", thrld_feature_Image);
        returnhtml = returnhtml.replace("{ftr_2nd_4thimg}", forth_feature_Image);
        returnhtml = returnhtml.replace("{ftr_2nd_5thimg}", fifth_feature_Image);
        returnhtml = returnhtml.replace("{ftr_2nd_6thimg}", sixth_feature_Image);
        returnhtml = returnhtml.replace("{ftr_2nd_7thimg}", seventh_feature_Image);

    }
    else if ($('#<%=hdnTemplateType.ClientID %>').val() == "jst_sold") {
        var First_feature_Image = $('#jsthold_1stimge').attr('src');
        var secd_feature_Image = $('#jsthold_2ndimge').attr('src');
        var thrld_feature_Image = $('#jsthold_3rdimge').attr('src');
        var forth_feature_Image = $('#jsthold_4thimge').attr('src');
        var fifth_feature_Image = $('#jsthold_5thimge').attr('src');
        var sixth_feature_Image = $('#jsthold_6thimge').attr('src');
        var seventh_feature_Image = $('#jsthold_7thimge').attr('src');

        returnhtml = returnhtml.replace("{jsthold_1stimg}", First_feature_Image);
        returnhtml = returnhtml.replace("{jsthold_2ndimg}", secd_feature_Image);
        returnhtml = returnhtml.replace("{jsthold_3rdimg}", thrld_feature_Image);
        returnhtml = returnhtml.replace("{jsthold_4thimg}", forth_feature_Image);
        returnhtml = returnhtml.replace("{jsthold_5thimg}", fifth_feature_Image);
        returnhtml = returnhtml.replace("{jsthold_6thimg}", sixth_feature_Image);
        returnhtml = returnhtml.replace("{jsthold_7thimg}", seventh_feature_Image);

    }
    return returnhtml;

}
        function printfunction(content) {
            debugger;
    var frame = $('#printframe')[0].contentWindow.document;
    frame.open();
    frame.write(content);
    frame.close();
    // print just the modal div
    $('#printframe')[0].contentWindow.print();
}//print function code
function previewfunction(content) {
    var frame = $('#printframe')[0].contentWindow.document;
    // open the frame document and add the contents
    frame.open();
    frame.write(content);
    frame.close();
}// preview function code GetUrl()

function GetUrl() {

    var url = '';
    if ($('#<%=hdnTemplateType.ClientID %>').val() == "Openhouse") {
        url = '/Newsletterfile.asmx/FirstPostCard';
    }
    else if ($('#<%=hdnTemplateType.ClientID %>').val() == "feature") {
        url = '/Newsletterfile.asmx/SecondPostCard';
    }
    else if ($('#<%=hdnTemplateType.ClientID %>').val() == "2ndfeature") {
                url = '/Newsletterfile.asmx/ThirldPostCard';
            }
            else if ($('#<%=hdnTemplateType.ClientID %>').val() == "jst_sold") {
        url = '/Newsletterfile.asmx/FourthPostCard';
    }
    return url;
}



//Return data object of postcards
function PostCard_Data() {

    var data = "";
    if ($('#<%=hdnTemplateType.ClientID %>').val() == "Openhouse") {
        $('#mypopup').addClass('fst_postcard');
        var firstcontent = $('#<%=FirstContent.ClientID %>').val();
        var secondcontent = $('#<%=SecondContent.ClientID %>').val();
        var thirldcontent = $('#<%=ThirdContent.ClientID %>').val();
        data = "{FirstContent: '" + firstcontent + "', SecondContent: '" + secondcontent + "', ThirldContent: '" + thirldcontent + "'}";
    }
    else if ($('#<%=hdnTemplateType.ClientID %>').val() == "feature") {
        $('#mypopup').addClass('scnd_postcard');
        var First_feature_cntnt = $('#<%=First_feature_cntnt.ClientID %>').val();
        var Second_feature_cntnt = $('#<%=Second_feature_cntnt.ClientID %>').val();
        var Thirld_feature_cntnt = $('#<%=Thirld_feature_cntnt.ClientID %>').val();
        var Fourth_feature_cntnt = $('#<%=Fourth_feature_cntnt.ClientID %>').val();
        data = "{First_feature_cntnt: '" + First_feature_cntnt + "', Second_feature_cntnt: '" + Second_feature_cntnt + "', Thirld_feature_cntnt: '" + Thirld_feature_cntnt + "', Fourth_feature_cntnt: '" + Fourth_feature_cntnt + "'}";
    }
    else if ($('#<%=hdnTemplateType.ClientID %>').val() == "2ndfeature") {
        $('#mypopup').addClass('scnd_postcard');
        var First_feature_cntnt = $('#<%=ftr_2nd_1stcntnt.ClientID %>').val();
        var Second_feature_cntnt = $('#<%=ftr_2nd_2ndcntnt.ClientID %>').val();
        var Thirld_feature_cntnt = $('#<%=ftr_2nd_3rdcntnt.ClientID %>').val();
        var Fourth_feature_cntnt = $('#<%=ftr_2nd_4thcntnt.ClientID %>').val();
        data = "{First_feature_cntnt: '" + First_feature_cntnt + "', Second_feature_cntnt: '" + Second_feature_cntnt + "', Thirld_feature_cntnt: '" + Thirld_feature_cntnt + "', Fourth_feature_cntnt: '" + Fourth_feature_cntnt + "'}";
    }
    else if ($('#<%=hdnTemplateType.ClientID %>').val() == "jst_sold") {
        $('#mypopup').addClass('scnd_postcard');
        var First_feature_cntnt = $('#<%=jsthold_1stcntnt.ClientID %>').val();
        var Second_feature_cntnt = $('#<%=jsthold_2ndcntnt.ClientID %>').val();
        var Thirld_feature_cntnt = $('#<%=jsthold_3rdcntnt.ClientID %>').val();
        var Fourth_feature_cntnt = $('#<%=jsthold_4thcntnt.ClientID %>').val();
        var Fifth_feature_cntnt = $('#<%=jsthold_5thcntnt.ClientID %>').val();
        var Sixth_feature_cntnt = $('#<%=jsthold_6thcntnt.ClientID %>').val();
        var Seventh_feature_cntnt = $('#<%=jsthold_7thcntnt.ClientID %>').val();
        var Eighth_feature_cntnt = $('#<%=jsthold_8thcntnt.ClientID %>').val();
        var Ninth_feature_cntnt = $('#<%=jsthold_9thcntnt.ClientID %>').val();
        var Tenth_feature_cntnt = $('#<%=jsthold_10thcntnt.ClientID %>').val();
        var Elaventh_feature_cntnt = $('#<%=jsthold_11thcntnt.ClientID %>').val();
        var Twelevth_feature_cntnt = $('#<%=jsthold_12thcntnt.ClientID %>').val();
        var Thirteenth_feature_cntnt = $('#<%=jsthold_13thcntnt.ClientID %>').val();
        var Fourteenth_feature_cntnt = $('#<%=jsthold_14thcntnt.ClientID %>').val();


        data = "{First_feature_cntnt: '" + First_feature_cntnt + "', Second_feature_cntnt: '" + Second_feature_cntnt + "',";
        data += "Thirld_feature_cntnt: '" + Thirld_feature_cntnt + "',Fourth_feature_cntnt: '" + Fourth_feature_cntnt + "',";
        data += "Fifth_feature_cntnt: '" + Fifth_feature_cntnt + "',Sixth_feature_cntnt: '" + Sixth_feature_cntnt + "',";
        data += "Fifth_feature_cntnt: '" + Fifth_feature_cntnt + "',Sixth_feature_cntnt: '" + Sixth_feature_cntnt + "',";
        data += "Seventh_feature_cntnt: '" + Seventh_feature_cntnt + "',Eighth_feature_cntnt: '" + Eighth_feature_cntnt + "',";
        data += "Ninth_feature_cntnt: '" + Ninth_feature_cntnt + "',Tenth_feature_cntnt: '" + Tenth_feature_cntnt + "',";
        data += "Elaventh_feature_cntnt: '" + Elaventh_feature_cntnt + "',Twelevth_feature_cntnt: '" + Twelevth_feature_cntnt + "',";
        data += "Thirteenth_feature_cntnt: '" + Thirteenth_feature_cntnt + "',Fourteenth_feature_cntnt: '" + Fourteenth_feature_cntnt + "'}";
    }
    return data;
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
    <div class="span9">
        <asp:HiddenField ID="hdnTemplateType" Value="Openhouse" runat="server" />
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
                        <button id="news_letter" style="display: block; float: left; margin-right: 3px;" type="button" class="btn btn-primary" value="Back To Newsletter">Back To Open House</button>
                        <button id="feature_card" style="display: none; float: left; margin-right: 3px;" type="button" class="btn btn-primary" value="Back To Newsletter">Back To Feature Card</button>
                        <button id="2ndfeature_card" style="display: none; float: left; margin-right: 3px;" type="button" class="btn btn-primary" value="Back To Newsletter">Back To Feature Card</button>
                        <button id="jst_hold_card" style="display: none; float: left; margin-right: 3px;" type="button" class="btn btn-primary" value="Back To Newsletter">Back To Just Hold</button>
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
                                        <img src="../PostCardImages/edit.png" alt="" /></a>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>


                </div>
            </div>
        </div>


        <div class="module" id="newletter_div">
            <div class="module-head">
                <h3>Post Card</h3>
            </div>
            <div class="module-body">
                <br />
                <div class="form-horizontal row-fluid">

                    <%--Open house page functionality--%>
                    <div class="newsltr_bg" id="frontside_page">
                        <div style="float: left; width: 97%; background-color: #8a5201; padding: 12px;">
                            <div style="float: left; width: 97%; background-image: url(/PostCardImages/border.png); background-size: cover; background-color: #8a5201;">
                                <div style="float: left; width: 100%; text-align: center; margin-top: 36px;">
                                    <h2 style="float: left; width: 100%; color: white; font-style: italic; font-family: 'Times New Roman', Times, serif; font-size: 18px;">Please join us on</h2>
                                    <h2 style="float: left; width: 100%; color: white; font-weight: bold; margin: 8px 0; font-family: 'Times New Roman', Times, serif; font-size: 38px;">Open House</h2>
                                </div>
                                <div id="property_photo_div" data-id="openhouse" style="float: left; width: 100%; text-align: center; margin: 6px 0;">
                                    <img id="property_photo" src="../PostCardImages/open_house_img.jpg" alt="" title="" style="border-radius: 14px; border: 2px solid white; width: 78%;" />
                                </div>
                            </div>
                            <div style="float: left; width: 100%; background-color: white; border-radius: 12px; margin: 22px 0 12px;">
                              <div style="float: left; width: 100%; margin: 12px 0; text-align: center;">
                                    <p style="float: left; width: 100%; color: black; font-size: 20px; font-family: 'Times New Roman', Times, serif; font-style: italic; font-weight: bold;">When ?</p>
                                  <asp:TextBox ID="FirstContent" MaxLength='30' onkeyDown="checkTextAreaMaxLength(this,event,'30');" Style="float: left; box-shadow: none; margin: 12px 0 0; width: 100%; color: #733b09; font-family: Arial, Helvetica, sans-serif; font-size: 26px; text-align: center; border: none; font-weight: bold;" runat="server" PlaceHolder="Description here..." class="span8">Wednesday, MAY 16 12:30 </asp:TextBox>
                                </div>
                                <%--<div style="float: left; width: 100%; text-align: center; margin: 6px 0;">
                                    <img src="../PostCardImages/border_line.png" alt="" title="" />
                                </div>--%>
                                <div style="float: left; width: 100%; margin: 6px 0 18px 0; text-align: center;">
                                    <p style="float: left; width: 100%; color: black; font-size: 20px; font-family: 'Times New Roman', Times, serif; font-style: italic; font-weight: bold;">Where ?</p>
                                    <asp:TextBox ID="SecondContent" MaxLength='30' onkeyDown="checkTextAreaMaxLength(this,event,'30');" Style="float: left; box-shadow: none; width: 100%; color: #733b09; font-family: Arial, Helvetica, sans-serif; font-size: 26px; font-weight: bold; text-align: center; border: none; margin: 12px 0;" runat="server" PlaceHolder="Description here..." class="span8">Wednesday, MAY 16 12:30 </asp:TextBox>
                                </div>
                            </div>
                            <div style="float: left; width: 100%; text-align: center;">
                                <img src="../PostCardImages/futer_border.png" alt="" title="" style="width: 100%;" />
                            </div>
                        </div>
                    </div>

                    <div class="newsltr_bg" id="backside_page" style="display: none">
                        <div style="float: left; width: 97%; background-color: #8a5201; padding: 12px;">
                            <div style="float: left; width: 97%;">
                                <img src="/PostCardImages/futer_border2.png" alt="" title="" style="width: 100%;" />
                            </div>



                            <div style="float: left; width: 97%; background-color: white; border-radius: 12px; padding: 12px; margin: 10px 0;">
                                <h2 style="float: left; margin: 4px 0 10px 0; text-align: center; width: 100%; color: #733b09; font-family: Arial, Helvetica, sans-serif; font-size: 20px; font-weight: bold;">Add your property description here! </h2>

                                <asp:TextBox ID="ThirdContent" MaxLength='1300' onkeyDown="checkTextAreaMaxLength(this,event,'1300');" Style="float: left; box-shadow: none; white-space: normal; border: none; height: 360px; width: 100%; color: black; font-size: 15px; text-align: justify; font-family: Arial, Helvetica, sans-serif; line-height: 28px;" runat="server" TextMode="MultiLine" PlaceHolder="" class="span8">
                                
                                This example property is a must-see! Stunning architectural details, like vaulted ceilings, wrought iron staircase, cherry hardwood throughout home and more. Won,t last, schedule an viewing today!
                                Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industries standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software.
                                </asp:TextBox>
                            </div>
                            <div style="float: left; width: 40%; text-align: center; margin: 8px 0;">
                                <div id="second_imag" style="float: left; width: 100%;">
                                    <img id="secnd_imge" src="/PostCardImages/open_house_img.jpg" alt="" title="" />

                                </div>
                            </div>
                            <div style="float: left; width: 60%; text-align: center; margin: 8px 0;">
                                <div style="float: left; width: 100%; text-align: center;">
                                    <img src="/PostCardImages/ajay_shah.jpg" alt="" title="" style="width: 120px; height: 120px; border-radius: 66px; border: 2px solid white; margin: 3px 0;" />
                                    <h2 style="float: left; margin: 6px 0; text-align: center; width: 100%; color: white; font-family: Arial, Helvetica, sans-serif; font-size: 20px; font-weight: bold;">Aj Shah</h2>
                    <p style="float: left; text-align: center; margin: 2px 0; width: 100%; color: white; font-family: Arial, Helvetica, sans-serif; font-size: 16px;">P: 416-747-9777</p>
                    <p style="float: left; text-align: center; width: 100%; margin: 2px 0; color: white; font-family: Arial, Helvetica, sans-serif; font-size: 16px;">Homekey123@yahoo.ca | www.homelifemiracle.com</p>
                    <p style="float: left; text-align: center; width: 100%; color: white; margin: 2px 0; font-family: Arial, Helvetica, sans-serif; font-size: 16px;">HomeLife/Miracle Realty Ltd., Brokerage*</p>
                    <p style="float: left; text-align: center; width: 100%; color: white; margin: 2px 0; font-family: Arial, Helvetica, sans-serif; font-size: 16px;">5010 Steeles Avenue West , Suite 11A , Toronto, Ontario, M9V 5C6</p>
                                </div>
                            </div>
                            <div style="float: left; width: 100%; text-align: center;">
                                <img src="/PostCardImages/futer_border.png" alt="" title="" style="width: 100%;" />
                            </div>



                        </div>
                    </div>
                    <%--End open house page functionality--%>


                    <%--Featured postcard page functionality--%>
                    <div class="newsltr_bg">
                        <div id="feature_Front" style="float: left; width: 99%; background-color: #FFF; display: none; padding: 12px;">
                            <div style="float: left; width: 100%; background-color: #005f44; text-align: center;">
                                <h2 style="float: left; width: 100%; color: white; font-size: 18px; font-family: 'Times New Roman', Times, serif; font-weight: bold; margin: 8px 0 4px 0; font-style: italic;">Welcome to</h2>
                                <%--<h2 style="float: left; width: 100%; color: white; font-size: 28px; font-weight: bold; font-family: 'Times New Roman', Times, serif; font-style: italic; margin: 6px 0;">146 Barleyfield Road Brampton</h2>--%>
                                <asp:TextBox ID="First_feature_cntnt" MaxLength='50' onkeyDown="checkTextAreaMaxLength(this,event,'50');" Style="float: left; border: none; box-shadow: none; width: 100%; color: white; background: #005f44 none repeat scroll 0 0; font-size: 28px; font-weight: bold; font-family: 'Times New Roman', Times, serif; font-style: italic; text-align: center; margin: 6px 0;" runat="server" PlaceHolder="text here..." class="span8">146 Barleyfield Road Brampton </asp:TextBox>
                                <img src="../PostCardImages/featurd_border2.png" alt="" title="" style="margin: 8px 0; width: 55%;" />
                            </div>
                            <div style="position: absolute;">
                                <img src="../PostCardImages/for_sale_img.png" alt="" title="" style="width: 55%;" />
                            </div>
                            <div id="featured_first_imge" data-id="featured_first" style="float: left; width: 100%;">
                                <img id="featured_first_img" src="../PostCardImages/featurd_img1.png" alt="" title="" />
                            </div>
                            <div style="float: left; width: 100%; margin: 8px 0;">
                                <%--<p style="float: left; width: 100%; color: #222222; font-family: 'Times New Roman', Times, serif; font-style: italic; font-size: 20px;">4+1 Bedrooms, 3 Washrooms</p>--%>
                                <asp:TextBox ID="Second_feature_cntnt" MaxLength='50' onkeyDown="checkTextAreaMaxLength(this,event,'50');" Style="float: left; background: #005f44 none repeat scroll 0 0; text-align: center; width: 100%; cborder: none; box-shadow: none; width: 100%; color: white; font-family: 'Times New Roman', Times, serif; font-style: italic; font-size: 20px;" runat="server" PlaceHolder="text here..." class="span8">4+1 Bedrooms, 3 Washrooms </asp:TextBox>
                            </div>
                            <div style="float: left; width: 100%; margin: 8px 0; text-align: center;">
                                <img src="../PostCardImages/border_futer1.png" alt="" title="" style="margin: 8px 0; width: 55%;" />
                            </div>
                            <div style="float: left; width: 100%; margin: 8px 0;">
                                <div style="float: left; width: 35%;">
                                    <img src="../PostCardImages/ajay_shah.jpg" alt="" title="" style="width: 65%;" />
                                </div>
                                <div style="float: left; width: 65%;">
                                    <div style="float: left; background-color: #e8eaec; border-radius: 12px; padding: 12px;">
                                        <h2 style="float: left; width: 100%; color: #1c1c1c; font-size: 28px; font-weight: bold; font-family: 'Times New Roman', Times, serif; font-style: italic; margin: 6px 0;">AJ Shah (Broker of Record)</h2>
                                        <p style="float: left; width: 100%; color: #222222; font-family: 'Times New Roman', Times, serif; font-style: italic; font-size: 18px; margin: 2px 0;">Call: 416-747-9777</p>
                                        <p style="float: left; width: 100%; color: #222222; font-family: 'Times New Roman', Times, serif; font-style: italic; font-size: 18px; margin: 2px 0;">Email: homekey123@yahoo.ca</p>
                                        <p style="float: left; width: 100%; color: #222222; font-family: 'Times New Roman', Times, serif; font-style: italic; font-size: 18px; margin: 2px 0;">Website: http://ajayshah.ca</p>
                                        <div style="float: left; width: 97%; background-color: #101010; padding: 8px; margin: 6px 0;">
                                            <img src="../PostCardImages/feature_futer_logo.png" alt="" title="" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="newsltr_bg" id="feature_Back" style="display: none">
                        <div style="float: left; width: 100%; background-color: #FFF; padding: 12px;">
                            <div style="float: left; width: 100%; background-color: #005f44;">
                                <div style="float: left; width: 100%; text-align: center; margin-top: 12px;">
                                    <%--<h2 style="float: left; width: 100%; color: white; font-size: 28px; font-weight: bold; font-family: 'Times New Roman', Times, serif; font-style: italic; margin: 6px 0;">146 Barleyfield Road Brampton</h2>--%>
                                    <asp:TextBox ID="Thirld_feature_cntnt" MaxLength='50' onkeyDown="checkTextAreaMaxLength(this,event,'50');" Style="float: left; background: #005f44 none repeat scroll 0 0; text-align: center; width: 100%; border: none; box-shadow: none; width: 100%; color: white; font-size: 28px; font-weight: bold; font-family: 'Times New Roman', Times, serif; font-style: italic; margin: 6px 0;" runat="server" PlaceHolder="text here..." class="span8">146 Barleyfield Road Brampton </asp:TextBox>
                                    <img src="../PostCardImages/featurd_border2.png" alt="" title="" style="margin: 8px 0; width: 55%;" />
                                </div>
                                <div style="float: left; width: 100%; margin: 12px 0;">
                                    <div style="float: left; width: 100%; text-align: center;">
                                        <div id="featured_second_imge" data-id="featured_second" style="float: left; width: 48%; padding: 6px;">
                                            <img id="featured_second_img" src="../PostCardImages/featrd_img1.jpg" alt="" title="" style="width: 100%; border: 2px solid white;" />
                                        </div>
                                        <div id="featured_thirld_imge" data-id="featured_thirld" style="float: left; width: 48%; padding: 6px;">
                                            <img id="featured_thirld_img" src="../PostCardImages/featrd_img2.jpg" alt="" title="" style="width: 100%; border: 2px solid white;" />
                                        </div>
                                    </div>
                                    <div style="float: left; width: 100%; text-align: center;">
                                        <div id="featured_fourth_imge" data-id="featured_fourth" style="float: left; width: 48%; padding: 6px;">
                                            <img id="featured_fourth_img" src="../PostCardImages/featrd_img1.jpg" alt="" title="" style="width: 100%; border: 2px solid white;" />
                                        </div>
                                        <div id="featured_fifth_imge" data-id="featured_fifth" style="float: left; width: 48%; padding: 6px;">
                                            <img id="featured_fifth_img" src="../PostCardImages/featrd_img2.jpg" alt="" title="" style="width: 100%; border: 2px solid white;" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div style="float: left; width: 100%; margin: 8px 0; text-align: center;">
                                <img src="../PostCardImages/border_futer1.png" alt="" title="" style="margin: 8px 0; width: 55%;" />
                            </div>
                            <div style="float: left; width: 100%; margin: 12px 0; text-align: center;">
                                <h2 style="float: left; width: 100%; font-family: 'Times New Roman', Times, serif; font-weight: bold; font-style: italic; font-size: 28px; color: #161616;">Add your description here</h2>
                                <%--<p style="float: left; width: 100%; font-family: 'Times New Roman', Times, serif; font-style: italic; font-size: 16px; margin: 12px 0 0; color: #333333; line-height: 26px; text-align: justify;">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.</p>--%>

                                <asp:TextBox ID="Fourth_feature_cntnt" MaxLength='500' onkeyDown="checkTextAreaMaxLength(this,event,'500');" Style="float: left; width: 100%; height: 200px; white-space: normal; font-family: 'Times New Roman', Times, serif; font-style: italic; font-size: 16px; margin: 12px 0 0; color: black; text-align: center; line-height: 26px; text-align: justify;" runat="server" TextMode="MultiLine" PlaceHolder="" class="span8">
                                
                                This example property is a must-see! Stunning architectural details, like vaulted ceilings, wrought iron staircase, cherry hardwood throughout home and more. Won,t last, schedule an viewing today!  Won,t last, schedule an viewing today! Won,t last, schedule an viewing today.
                                </asp:TextBox>
                            </div>
                            <div style="float: left; width: 100%; margin: 8px 0; text-align: center; background-color: #101010; padding: 12px 0;">
                                <h2 style="float: left; width: 100%; color: white; font-family: Arial, Helvetica, sans-serif; font-size: 18px; margin: 4px 0; font-weight: bold;">Ajay Shah(Broker of Record)</h2>
                                <p style="float: left; width: 100%; color: white; font-family: Arial, Helvetica, sans-serif; font-size: 18px; margin: 2px 0;">Homelife / Miracle Realty Ltd,. Brokerage</p>
                            </div>
                        </div>
                    </div>
                    <%--End Featured postcard functionality--%>


                    <%--Second featured postacard functionality--%>
                    <div class="newsltr_bg" id="2nd_featured_front" style="display: none;">
                        <div style="float: left; width: 100%; background-color: #FFF; padding: 12px;">
                            <div style="float: left; width: 100%; background-color: #094fa5; text-align: center; margin-bottom: 6px;">
                                <h2 style="float: left; width: 100%; color: white; font-size: 18px; font-family: 'Times New Roman', Times, serif; font-weight: bold; margin: 8px 0 4px 0; font-style: italic;">Welcome to</h2>
                                <asp:TextBox ID="ftr_2nd_1stcntnt" MaxLength='30' onkeyDown="checkTextAreaMaxLength(this,event,'30');" Style="float: left; background: #094fa5 none repeat scroll 0 0; border: none; width: 100%; color: white; font-size: 28px; font-weight: bold; font-family: 'Times New Roman', Times, serif; font-style: italic; text-align: center; margin: 6px 0;" runat="server" PlaceHolder="text here..." class="span8">146 Barleyfield Road Brampton </asp:TextBox>
                            </div>
                            <div style="float: left; width: 100%;" id="2nd_ftr_fstimg" data-id="2nd_ftr_fstimg">
                                <img id="ftr_2nd_1stimge" src="../PostCardImages/featurd_img1.png" alt="" title="" />
                            </div>
                            <div style="float: left; width: 100%;">
                                <div style="float: left; width: 50%;">
                                    <img src="../PostCardImages/for_sale_img2.png" alt="" title="" style="width: 30%;" />
                                </div>
                                <div style="float: right; width: 50%; margin: 8px 0;">
                                    <asp:TextBox ID="ftr_2nd_2ndcntnt" MaxLength='30' onkeyDown="checkTextAreaMaxLength(this,event,'30');" Style="float: left; width: 100%; color: #222222; font-family: 'Times New Roman', Times, serif; text-align: right; font-style: italic; border: none; font-size: 20px; font-weight: bold; color: black;" runat="server" PlaceHolder="text here..." class="span8">4+1 Bedrooms, 3 Washrooms</asp:TextBox>
                                </div>
                            </div>

                            <div style="float: left; width: 97%; margin: 12px 0; background-color: #e3e3e3; padding: 6px; border-radius: 8px;">
                                <div style="float: left; width: 100%; margin: 12px 0; text-align: center;">
                                    <h2 style="float: left; width: 100%; font-family: 'Times New Roman', Times, serif; font-weight: bold; font-style: italic; font-size: 28px; color: #161616;">Add your description here</h2>

                                    <asp:TextBox ID="ftr_2nd_3rdcntnt" MaxLength='300' onkeyDown="checkTextAreaMaxLength(this,event,'300');" Style="float: left; white-space: normal; height: 120px; border: none; width: 100%; font-family: Arial, Helvetica, sans-serif; font-size: 15px; margin: 12px 0 0; color: #333333; line-height: 26px; text-align: justify;" runat="server" TextMode="MultiLine" PlaceHolder="" class="span8">
                                
                                This example property is a must-see! Stunning architectural details, like vaulted ceilings, wrought iron staircase, cherry hardwood throughout home and more. Won t last, schedule an viewing today!
                                Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                                    </asp:TextBox>
                                </div>
                                <div style="float: left; width: 97%; margin: 8px 0; background-color: #1c1b1d; padding: 6px;">
                                    <div style="float: left; width: 35%;">
                                        <img src="/PostCardImages/ajay_shah.jpg" alt="" title="" style="width: 80%;">
                                    </div>
                                    <div style="float: left; width: 65%;">
                                        <div style="float: left; background-color: #e8eaec; border-radius: 12px; padding: 6px;">
                                            <h2 style="float: left; width: 100%; color: #1c1c1c; font-size: 28px; font-weight: bold; font-family: 'Times New Roman', Times, serif; font-style: italic; margin: 6px 0;">Ajay Shah</h2>
                                            <p style="float: left; width: 100%; color: #222222; font-family: 'Times New Roman', Times, serif; font-style: italic; font-size: 18px; margin: 2px 0;">Call: 416-747-9777</p>
                                            <p style="float: left; width: 100%; color: #222222; font-family: 'Times New Roman', Times, serif; font-style: italic; font-size: 18px; margin: 2px 0;">Email: homekey123@yahoo.ca</p>
                                            <p style="float: left; width: 100%; color: #222222; font-family: 'Times New Roman', Times, serif; font-style: italic; font-size: 18px; margin: 2px 0;">Website: www.ajayshah.ca</p>
                                            <div style="float: left; width: 97%; background-color: #101010; padding: 8px; margin: 6px 0;">
                                                <img src="/PostCardImages/feature_futer_logo.png" alt="" title="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="newsltr_bg" id="2nd_featured_back" style="display: none">
                        <div style="float: left; width: 100%; background-color: #FFF; padding: 12px;">
                            <div style="float: left; width: 100%; background-color: #094fa5;">
                                <div style="float: left; width: 100%; text-align: center; margin-top: 12px;">
                                    <asp:TextBox ID="ftr_2nd_4thcntnt" MaxLength='30' onkeyDown="checkTextAreaMaxLength(this,event,'30');" Style="float: left; width: 100%; color: white; font-size: 28px; font-weight: bold; background: #094fa5 none repeat scroll 0 0; border: none; font-family: 'Times New Roman', Times, serif; font-style: italic; margin: 6px 0;" runat="server" PlaceHolder="text here..." class="span8">146 Barleyfield Road Brampton</asp:TextBox>
                                    <img src="../PostCardImages/featurd_border2.png" alt="" title="" style="margin: 8px 0; width: 55%;" />
                                </div>
                                <div style="float: left; width: 100%; margin: 12px 0;">
                                    <div style="float: left; width: 100%; text-align: center;">
                                        <div style="float: left; width: 48%; padding: 6px;" id="2nd_ftr_2ndimg" data-id="2nd_ftr_2ndimg">
                                            <img id="ftr_2nd_2ndimge" src="../PostCardImages/featrd_img1.jpg" alt="" title="" style="width: 100%; border: 2px solid white;" />
                                        </div>
                                        <div style="float: left; width: 48%; padding: 6px;" id="2nd_ftr_3rdimg" data-id="2nd_ftr_3rdimg">
                                            <img id="ftr_2nd_3rdimge" src="../PostCardImages/featrd_img1.jpg" alt="" title="" style="width: 100%; border: 2px solid white;" />
                                        </div>
                                    </div>
                                    <div style="float: left; width: 100%; text-align: center;">
                                        <div style="float: left; width: 48%; padding: 6px;" id="2nd_ftr_4thimg" data-id="2nd_ftr_4thimg">
                                            <img id="ftr_2nd_4thimge" src="../PostCardImages/featrd_img1.jpg" alt="" title="" style="width: 100%; border: 2px solid white;" />
                                        </div>
                                        <div style="float: left; width: 48%; padding: 6px;" id="2nd_ftr_5thimg" data-id="2nd_ftr_5thimg">
                                            <img id="ftr_2nd_5thimge" src="../PostCardImages/featrd_img1.jpg" alt="" title="" style="width: 100%; border: 2px solid white;" />
                                        </div>
                                    </div>
                                    <div style="float: left; width: 100%; text-align: center;">
                                        <div style="float: left; width: 48%; padding: 6px;" id="2nd_ftr_6thimg" data-id="2nd_ftr_6thimg">
                                            <img id="ftr_2nd_6thimge" src="../PostCardImages/featrd_img1.jpg" alt="" title="" style="width: 100%; border: 2px solid white;" />
                                        </div>
                                        <div style="float: left; width: 48%; padding: 6px;" id="2nd_ftr_7thimg" data-id="2nd_ftr_7thimg">
                                            <img id="ftr_2nd_7thimge" src="../PostCardImages/featrd_img1.jpg" alt="" title="" style="width: 100%; border: 2px solid white;" />
                                        </div>
                                    </div>
                                    <div style="float: left; width: 100%; margin: 8px 0; text-align: center;">
                                        <img src="../PostCardImages/featurd_border2.png" alt="" title="" style="margin: 8px 0; width: 55%;" />
                                    </div>
                                </div>
                            </div>


                            <div style="float: left; width: 100%; margin: 8px 0; text-align: center; background-color: #101010; padding: 12px 0;">
                                <h2 style="float: left; width: 100%; color: white; font-family: Arial, Helvetica, sans-serif; font-size: 18px; margin: 4px 0; font-weight: bold;">AJ Shah</h2>
                                <p style="float: left; width: 100%; color: white; font-family: Arial, Helvetica, sans-serif; font-size: 18px; margin: 2px 0;">Homelife / Miracle Realty Ltd,. Brokerage</p>
                            </div>
                        </div>
                    </div>
                    <%--End Second featured card functionality--%>

                    <%--just hold postcard functionalty--%>
                    <div class="newsltr_bg" id="jst_sold_front" style="display: none">
                        <div style="float: left; width: 98%; background-color: #FFF; padding: 12px;">
                            <div style="float: left; width: 99%; background-color: #bc8b3d; text-align: center; padding: 6px; margin-bottom: 6px;">
                                <img src="../PostCardImages/jst_sld_img1.png" alt="" title="" style="width: 42%;" />
                            </div>
                            <div style="float: left; width: 100%;">
                                <img id="jsthold_1stimge" data-id="jsthold_1stimge" src="../PostCardImages/featurd_img1.png" alt="" title="" />
                            </div>
                            <div style="float: left; width: 100%;">
                                <div style="float: left; width: 50%; margin: 8px 0;">

                                    <asp:TextBox ID="jsthold_1stcntnt" MaxLength='30' onkeyDown="checkTextAreaMaxLength(this,event,'30');" Style="float: left; width: 100%; color: #ce0c07; border: none; font-size: 22px; font-weight: bold; font-family: 'Times New Roman', Times, serif; font-style: italic; margin: 6px 0;" runat="server" PlaceHolder="text here..." class="span8">146 Barleyfield Road Brampton </asp:TextBox>
                                </div>
                                <div style="float: left; width: 50%; margin: 8px 0;">
                                    <asp:TextBox ID="jsthold_2ndcntnt" MaxLength='30' onkeyDown="checkTextAreaMaxLength(this,event,'30');" Style="float: left; width: 100%; border: none; color: #222222; font-family: 'Times New Roman', Times, serif; text-align: right; font-style: italic; font-size: 20px; font-weight: bold;" runat="server" PlaceHolder="text here..." class="span8">4+1 Bedrooms, 3 Washrooms </asp:TextBox>
                                </div>
                            </div>

                            <div style="float: left; width: 98%; margin: 12px 0; background-color: #e3e3e3; padding: 6px;">
                                <div style="float: left; width: 100%;">
                                    <div style="float: left; width: 35%;">
                                        <img src="../PostCardImages/ajay_shah.jpg" alt="" title="" style="width: 80%;" />
                                    </div>
                                    <div style="float: left; width: 65%;">
                                        <div style="float: left; padding: 6px;">
                                            <h2 style="float: left; width: 100%; color: #b80a05; font-size: 28px; font-weight: bold; font-family: 'Times New Roman', Times, serif; font-style: italic; margin: 6px 0; border-bottom: 1px solid;">AJ Shah</h2>
                                            <p style="float: left; width: 100%; color: #222222; font-family: 'Times New Roman', Times, serif; font-style: italic; font-size: 18px; margin: 2px 0;">Call: 416-747-9777</p>
                                            <p style="float: left; width: 100%; color: #222222; font-family: 'Times New Roman', Times, serif; font-style: italic; font-size: 18px; margin: 2px 0;">Email: homekey123@yahoo.ca</p>
                                            <p style="float: left; width: 100%; color: #222222; font-family: 'Times New Roman', Times, serif; font-style: italic; font-size: 18px; margin: 2px 0;">Website: www.homekey123.com</p>
                                            <div style="float: left; width: 98%; background-color: #101010; padding: 8px; margin: 6px 0;">
                                                <img src="../PostCardImages/feature_futer_logo.png" alt="" title="" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="newsltr_bg" id="jst_sold_back" style="display: none">
                        <div style="float: left; width: 97%; background-color: #FFF; padding: 12px;">
                            <div style="float: left; width: 100%; background-color: white; border: 3px solid #161616;">
                                <div style="float: left; width: 100%; text-align: center; margin-top: 12px;">

                                    <img src="../PostCardImages/recently_sld_img1.png" alt="" title="" style="margin: 8px 0; width: 55%;" />
                                    <img src="../PostCardImages/featurd_border_blck.png" alt="" title="" style="margin: 8px 0; width: 55%;" />
                                </div>
                                <div style="float: left; width: 100%; margin: 4px 0;">
                                    <div style="float: left; width: 100%; padding: 8px;">
                                        <div style="float: left; width: 48%; padding: 6px; background-color: #bc8b3d;">
                                            <asp:TextBox ID="jsthold_3rdcntnt" MaxLength='40' onkeyDown="checkTextAreaMaxLength(this,event,'40');" Style="float: left; border: none; width: 100%; color: #1e1e1e; text-align: center; background: #bc8b3d none repeat scroll 0 0; box-shadow: none; font-size: 18px; font-weight: bold; font-family: 'Times New Roman', Times, serif; font-style: italic; margin: 6px 0;" runat="server" PlaceHolder="text here..." class="span8">146 Barleyfield Road Brampton </asp:TextBox>
                                            <img id="jsthold_2ndimge" data-id="jsthold_2ndimge" src="../PostCardImages/featrd_img1.jpg" alt="" title="" style="width: 100%; border: 2px solid white;" />
                                            <asp:TextBox ID="jsthold_4thcntnt" MaxLength='40' onkeyDown="checkTextAreaMaxLength(this,event,'40');" Style="float: left; border: none; width: 100%; background: #bc8b3d none repeat scroll 0 0; box-shadow: none; color: #dc0000; font-size: 18px; font-weight: bold; font-family: 'Times New Roman', Times, serif; font-style: italic; margin: 6px 0;" runat="server" PlaceHolder="text here..." class="span8">Sold more than Asking price $12,6789</asp:TextBox>
                                        </div>
                                        <div style="float: left; width: 48%; padding: 6px; background-color: #bc8b3d;">
                                            <asp:TextBox ID="jsthold_5thcntnt" MaxLength='40' onkeyDown="checkTextAreaMaxLength(this,event,'40');" Style="float: left; border: none; width: 100%; background: #bc8b3d none repeat scroll 0 0; box-shadow: none; color: #1e1e1e; text-align: center; font-size: 18px; font-weight: bold; font-family: 'Times New Roman', Times, serif; font-style: italic; margin: 6px 0;" runat="server" PlaceHolder="text here..." class="span8">146 Barleyfield Road Brampton </asp:TextBox>
                                            <img id="jsthold_3rdimge" data-id="jsthold_3rdimge" src="../PostCardImages/featrd_img1.jpg" alt="" title="" style="width: 100%; border: 2px solid white;" />
                                            <asp:TextBox ID="jsthold_6thcntnt" MaxLength='40' onkeyDown="checkTextAreaMaxLength(this,event,'40');" Style="float: left; border: none; background: #bc8b3d none repeat scroll 0 0; box-shadow: none; width: 100%; color: #dc0000; font-size: 18px; font-weight: bold; font-family: 'Times New Roman', Times, serif; font-style: italic; margin: 6px 0;" runat="server" PlaceHolder="text here..." class="span8">Sold more than Asking price $12,6789</asp:TextBox>
                                        </div>
                                    </div>
                                    <div style="float: left; width: 100%; padding: 8px;">
                                        <div style="float: left; width: 48%; padding: 6px; background-color: #bc8b3d;">
                                            <asp:TextBox ID="jsthold_7thcntnt" MaxLength='40' onkeyDown="checkTextAreaMaxLength(this,event,'40');" Style="float: left; border: none; background: #bc8b3d none repeat scroll 0 0; box-shadow: none; width: 100%; color: #1e1e1e; text-align: center; font-size: 18px; font-weight: bold; font-family: 'Times New Roman', Times, serif; font-style: italic; margin: 6px 0;" runat="server" PlaceHolder="text here..." class="span8">146 Barleyfield Road Brampton </asp:TextBox>
                                            <img id="jsthold_4thimge" data-id="jsthold_4thimge" src="../PostCardImages/featrd_img1.jpg" alt="" title="" style="width: 100%; border: 2px solid white;" />
                                            <asp:TextBox ID="jsthold_8thcntnt" MaxLength='40' onkeyDown="checkTextAreaMaxLength(this,event,'40');" Style="float: left; border: none; background: #bc8b3d none repeat scroll 0 0; box-shadow: none; width: 100%; color: #dc0000; font-size: 18px; font-weight: bold; font-family: 'Times New Roman', Times, serif; font-style: italic; margin: 6px 0;" runat="server" PlaceHolder="text here..." class="span8">Sold more than Asking price $12,6789</asp:TextBox>
                                        </div>
                                        <div style="float: left; width: 48%; padding: 6px; background-color: #bc8b3d;">
                                            <asp:TextBox ID="jsthold_9thcntnt" MaxLength='40' onkeyDown="checkTextAreaMaxLength(this,event,'40');" Style="float: left; border: none; background: #bc8b3d none repeat scroll 0 0; box-shadow: none; width: 100%; color: #1e1e1e; text-align: center; font-size: 18px; font-weight: bold; font-family: 'Times New Roman', Times, serif; font-style: italic; margin: 6px 0;" runat="server" PlaceHolder="text here..." class="span8">146 Barleyfield Road Brampton </asp:TextBox>
                                            <img id="jsthold_5thimge" data-id="jsthold_5thimge" src="../PostCardImages/featrd_img1.jpg" alt="" title="" style="width: 100%; border: 2px solid white;" />
                                            <asp:TextBox ID="jsthold_10thcntnt" MaxLength='40' onkeyDown="checkTextAreaMaxLength(this,event,'40');" Style="float: left; border: none; background: #bc8b3d none repeat scroll 0 0; box-shadow: none; width: 100%; color: #dc0000; font-size: 18px; font-weight: bold; font-family: 'Times New Roman', Times, serif; font-style: italic; margin: 6px 0;" runat="server" PlaceHolder="text here..." class="span8">Sold more than Asking price $12,6789</asp:TextBox>
                                        </div>
                                    </div>
                                    <div style="float: left; width: 100%; padding: 8px;">
                                        <div style="float: left; width: 48%; padding: 6px; background-color: #bc8b3d;">
                                            <asp:TextBox ID="jsthold_11thcntnt" MaxLength='40' onkeyDown="checkTextAreaMaxLength(this,event,'40');" Style="float: left; border: none; background: #bc8b3d none repeat scroll 0 0; box-shadow: none; width: 100%; color: #1e1e1e; text-align: center; font-size: 18px; font-weight: bold; font-family: 'Times New Roman', Times, serif; font-style: italic; margin: 6px 0;" runat="server" PlaceHolder="text here..." class="span8">146 Barleyfield Road Brampton </asp:TextBox>
                                            <img id="jsthold_6thimge" data-id="jsthold_6thimge" src="../PostCardImages/featrd_img1.jpg" alt="" title="" style="width: 100%; border: 2px solid white;" />
                                            <asp:TextBox ID="jsthold_12thcntnt" MaxLength='40' onkeyDown="checkTextAreaMaxLength(this,event,'40');" Style="float: left; background: #bc8b3d none repeat scroll 0 0; box-shadow: none; border: none; width: 100%; color: #dc0000; font-size: 18px; font-weight: bold; font-family: 'Times New Roman', Times, serif; font-style: italic; margin: 6px 0;" runat="server" PlaceHolder="text here..." class="span8">Sold more than Asking price $12,6789</asp:TextBox>
                                        </div>
                                        <div style="float: left; width: 48%; padding: 6px; background-color: #bc8b3d;">
                                            <asp:TextBox ID="jsthold_13thcntnt" MaxLength='40' onkeyDown="checkTextAreaMaxLength(this,event,'40');" Style="float: left; background: #bc8b3d none repeat scroll 0 0; box-shadow: none; border: none; width: 100%; color: #1e1e1e; text-align: center; font-size: 18px; font-weight: bold; font-family: 'Times New Roman', Times, serif; font-style: italic; margin: 6px 0;" runat="server" PlaceHolder="text here..." class="span8">146 Barleyfield Road Brampton </asp:TextBox>
                                            <img id="jsthold_7thimge" data-id="jsthold_7thimge" src="../PostCardImages/featrd_img1.jpg" alt="" title="" style="width: 100%; border: 2px solid white;" />
                                            <asp:TextBox ID="jsthold_14thcntnt" MaxLength='40' onkeyDown="checkTextAreaMaxLength(this,event,'40');" Style="float: left; border: none; width: 100%; background: #bc8b3d none repeat scroll 0 0; box-shadow: none; color: #dc0000; font-size: 18px; font-weight: bold; font-family: 'Times New Roman', Times, serif; font-style: italic; margin: 6px 0;" runat="server" PlaceHolder="text here..." class="span8">Sold more than Asking price $12,6789</asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div style="float: left; width: 100%; margin: 8px 0; text-align: center; background-color: #101010; padding: 12px 0;">
                                <h2 style="float: left; width: 100%; color: white; font-family: Arial, Helvetica, sans-serif; font-size: 18px; margin: 4px 0; font-weight: bold;">Ajay Shah(Broker of Record)</h2>
                                <p style="float: left; width: 100%; color: white; font-family: Arial, Helvetica, sans-serif; font-size: 18px; margin: 2px 0;">Homelife / Miracle Realty Ltd,. Brokerage</p>
                            </div>
                        </div>
                    </div>
                    <%--end just hold postcard functionalty--%>

                    <!-- Trigger the featured first Image modal with a button -->
                    <button id="firstImgModal" type="button" style="visibility: hidden" class="btn btn-info btn-lg" data-toggle="modal" data-target="#feature_firstImageDiv" data-backdrop="static" data-keyboard="false">Open Modal</button>

                    <!--featured first  image Modal -->
                    <div class="modal fade new" id="feature_firstImageDiv" role="dialog">

                        <div class="modal-dialog modl_bgg">

                            <!-- User Modal content-->
                            <div class="modal-content new_pop">
                                <div class="modal-header mdl_hdrrr">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 id="popupheading" class="modal-title modl_hdng">Upload Property Image</h4>
                                </div>
                                <div class="modal-body modl_bg">

                                    <ul class="list_to_row">
                                        <li class="cell" style="width: 75px;">Browse</li>
                                        <li class="cell">
                                            <%--browse button for open house--%>

                                            <asp:FileUpload ID="openhousefile" runat="server" onchange="showUsrImgpreview(this,'openhousefile')" />

                                            <%--browse button for first feature images--%>
                                            <asp:FileUpload ID="First_feature_Image" Style="display: none;" runat="server" onchange="showUsrImgpreview(this,'First_feature_Image')" />
                                            <asp:FileUpload ID="secd_feature_Image" Style="display: none;" runat="server" onchange="showUsrImgpreview(this,'secd_feature_Image')" />
                                            <asp:FileUpload ID="thrld_feature_Image" Style="display: none;" runat="server" onchange="showUsrImgpreview(this,'thrld_feature_Image')" />
                                            <asp:FileUpload ID="forth_feature_Image" Style="display: none;" runat="server" onchange="showUsrImgpreview(this,'forth_feature_Image')" />
                                            <asp:FileUpload ID="fifth_feature_Image" Style="display: none;" runat="server" onchange="showUsrImgpreview(this,'fifth_feature_Image')" />

                                            <%--browse button for second feature images--%>
                                            <asp:FileUpload ID="ftr_2nd_1stfile" Style="display: none;" runat="server" onchange="showUsrImgpreview(this,'2nd_ftr_1stfile')" />
                                            <asp:FileUpload ID="ftr_2nd_2ndfile" Style="display: none;" runat="server" onchange="showUsrImgpreview(this,'2nd_ftr_2ndfile')" />
                                            <asp:FileUpload ID="ftr_2nd_3rdfile" Style="display: none;" runat="server" onchange="showUsrImgpreview(this,'2nd_ftr_3rdfile')" />
                                            <asp:FileUpload ID="ftr_2nd_4thfile" Style="display: none;" runat="server" onchange="showUsrImgpreview(this,'2nd_ftr_4thfile')" />
                                            <asp:FileUpload ID="ftr_2nd_5thfile" Style="display: none;" runat="server" onchange="showUsrImgpreview(this,'2nd_ftr_5thfile')" />
                                            <asp:FileUpload ID="ftr_2nd_6thfile" Style="display: none;" runat="server" onchange="showUsrImgpreview(this,'2nd_ftr_6thfile')" />
                                            <asp:FileUpload ID="ftr_2nd_7thfile" Style="display: none;" runat="server" onchange="showUsrImgpreview(this,'2nd_ftr_7thfile')" />

                                            <%--browse button for justhold postcard images--%>
                                            <asp:FileUpload ID="jsthold_1stimg" Style="display: none;" runat="server" onchange="showUsrImgpreview(this,'jsthold_1stimge')" />
                                            <asp:FileUpload ID="jsthold_2ndimg" Style="display: none;" runat="server" onchange="showUsrImgpreview(this,'jsthold_2ndimge')" />
                                            <asp:FileUpload ID="jsthold_3rdimg" Style="display: none;" runat="server" onchange="showUsrImgpreview(this,'jsthold_3rdimge')" />
                                            <asp:FileUpload ID="jsthold_4thimg" Style="display: none;" runat="server" onchange="showUsrImgpreview(this,'jsthold_4thimge')" />
                                            <asp:FileUpload ID="jsthold_5thimg" Style="display: none;" runat="server" onchange="showUsrImgpreview(this,'jsthold_5thimge')" />
                                            <asp:FileUpload ID="jsthold_6thimg" Style="display: none;" runat="server" onchange="showUsrImgpreview(this,'jsthold_6thimge')" />
                                            <asp:FileUpload ID="jsthold_7thimg" Style="display: none;" runat="server" onchange="showUsrImgpreview(this,'jsthold_7thimge')" />

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


                    <div class="control-group">
                        <div class="">

                            <asp:Button ID="btnBack" class="btn" runat="server" Visible="false" Text="Back" OnClick="btnBack_Click" />
                            <button id="Send_To" type="button" class="btn btn-primary" value="Send To" style="display: block; float: left; padding-top: 3px; margin-right: 7px;">Send To</button>

                            <button id="back_side" type="button" class="btn btn-primary" value="Back Side" style="display: block; float: left; padding-top: 3px; margin-right: 7px;">Back Side</button>
                            <button id="front_side" type="button" class="btn btn-primary" value="Front Side" style="display: none; float: left; padding-top: 3px; margin-right: 7px;">Front Side</button>

                            <button id="feature_back_side" type="button" class="btn btn-primary" value="Back Side" style="display: none; float: left; padding-top: 3px; margin-right: 7px;">Back Side</button>
                            <button id="feature_front_side" type="button" class="btn btn-primary" value="Front Side" style="display: none; float: left; padding-top: 3px; margin-right: 7px;">Front Side</button>

                            <button id="2nd_ftr_btn_backpage" type="button" class="btn btn-primary" value="Back Side" style="display: none; float: left; padding-top: 3px; margin-right: 7px;">Back Side</button>
                            <button id="2nd_ftr_btn_frontpage" type="button" class="btn btn-primary" value="Front Side" style="display: none; float: left; padding-top: 3px; margin-right: 7px;">Front Side</button>

                            <button id="jsthold_btn_backpage" type="button" class="btn btn-primary" value="Back Side" style="display: none; float: left; padding-top: 3px; margin-right: 7px;">Back Side</button>
                            <button id="jsthold_btn_frontpage" type="button" class="btn btn-primary" value="Front Side" style="display: none; float: left; padding-top: 3px; margin-right: 7px;">Front Side</button>

                            <button id="preview" type="button" class="btn btn-primary" value="preview" style="display: block; float: left; padding-top: 3px; margin-right: 7px;">preview</button>
                            <button id="print" type="button" class="btn btn-primary" value="Send To" style="display: block; float: left; padding-top: 3px; margin-right: 7px;">print</button>
                        
                             <a id="admin_btn" href="../admin/SiteSettings.aspx" class="btn btn-primary">Go To Admin</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!--/.content-->
    </div>
    <div id="mypopup">
        <div style="margin-top: 30px; height: 44px; background: #026F52; width: 982px;">
            <button type="button" class="close" id="close_popup" data-dismiss="modal">&times;</button>
        </div>
        <iframe id="printframe"></iframe>

    </div>
    <!--/.span9-->
</asp:Content>
