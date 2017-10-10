<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/NewsLetterMaster.Master" AutoEventWireup="true"
    CodeBehind="NewsLetter.aspx.cs" Inherits="Property.Admin.NewsLetter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

        <script type="text/javascript">
            $(document).ready(function()
            {

                //Slider work
                $('#slider3').css('display', 'block')
                $('#slider3').Thumbelina({
                    orientation: 'vertical',         // Use vertical mode (default horizontal).
                    $bwdBut: $('#slider3 .top'),     // Selector to top button.
                    $fwdBut: $('#slider3 .bottom')   // Selector to bottom button.
                });
                 $('#<%=hdnTemplateType.ClientID %>').val(1)
                $("#sliderclick li").click(function () {

                    var id = this.id;
                    if (id == 1) {
                        $('#newletter_div').css('display', 'block')
                        $('#Send_To').css('display', 'block')
                        $('#ClientList').css('display', 'none')
                        $('#<%=hdnTemplateType.ClientID %>').val(id)
                    }
                    else if (id == 2) {

                        $('#newletter_div').css('display', 'none')
                        $('#Send_To').css('display', 'block')
                        $('#ClientList').css('display', 'none')
                        $('#<%=hdnTemplateType.ClientID %>').val(id)
                    }
                    else if (id == 3) {

                        $('#newletter_div').css('display', 'none')
                        $('#Send_To').css('display', 'block')
                        $('#ClientList').css('display', 'none')

                        $('#<%=hdnTemplateType.ClientID %>').val(id)
                    }

                });
                //End Slider work



                $('#newletter_div').css('display', 'block')
                $('#news_letter').click(function () {

                    $('#newletter_div').css('display', 'block')
                    $('#ClientList').css('display', 'none')
                    $('#Send_To').css('display', 'block')
                    $('#news_letter').css('display', 'none')
                    
                })

                $('#Send_To').click(function () {
                    $('#Send_To').css('display', 'none')
                    $('#newletter_div').css('display', 'none')
                    $('#ClientList').css('display', 'block')
                    $('#news_letter').css('display', 'block')
                })
                
                $('#userlogo').click(function () {                   
                    Openmodel();
                }
     )
                $('#userimg').click(function () {                   
                    OpenUsrImgmodel();
                }
               )
                //$('.chosen-select').chosen({ no_results_text: 'Oops, nothing found!' });


                $('#Logofile').click(function () {                  
                    Openmodel();
                }
              )

                $('#preview').click(function () {
                   
                    Preview();
                })

               
                $(document).on("click", "#print", function (e) {
                    e.preventDefault();
                    
                    print();

                });
                $('.close').click(function () {
                    $('#Send_To').css('display', 'block')
                    $('#preview').css('display', 'block')
                    $('#print').css('display', 'block')

                })
                $(document).on("click", "#close_popup", function (e) {
                    e.preventDefault();
                    $("#mypopup").css("display", "none");
                    $('.span9').removeClass('is-blurred');
                    $('.span3').removeClass('is-blurred');

                });
            })
          

            //open User logo  model
            function Openmodel() {

                backdrop: 'static';
                keyboard: false;
                $('#myModal').click();
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

            
           //open print prev  model
        function Preview() {
            var type = "Preview";
            backdrop: 'static';
            keyboard: false;
            $("#mypopup").css("display", "block");
            $('.span9').addClass('is-blurred');
            $('.span3').addClass('is-blurred');
            firstnewsletterprint(type);
            return false;
        }
        //end

        //open print window
        function print() {
            
            var type = "Print";
            
            if ($('#<%=hdnTemplateType.ClientID %>').val() == "1")
            {
                firstnewsletterprint(type);
            }
            
        }


            function showLogopreview(input) {
               
                if (input.files && input.files[0]) {
                    var filerdr = new FileReader();
                    filerdr.onload = function (e) {
                        $('#logoprvw').attr('src', e.target.result);
                        $('#myModal').click();
                    }
                    filerdr.readAsDataURL(input.files[0]);
                }
            }

            function showUsrImgpreview(input) {               
                if (input.files && input.files[0]) {
                    var filerdr = new FileReader();
                    filerdr.onload = function (e) {
                        $('#imgprvw').attr('src', e.target.result);
                        $('#myImgModal').click();
                    }
                    filerdr.readAsDataURL(input.files[0]);
                }
            }

                //newsletter print functionalty.
        function firstnewsletterprint(type)
        {
            var firstcontent = $('#<%=FirstContent.ClientID %>').val();
            var secondcontent = $('#<%=SecondContent.ClientID %>').val();
            var thirldcontent = $('#<%=ThirdContent.ClientID %>').val();
            var imagelogo = $('#logoprvw').attr('src');
            var propertyimg = $('#imgprvw').attr('src');
           
            $.ajax({
                type: "POST",
                url: '/Newsletterfile.asmx/FirstNewsLetterPrint',
                data: "{ NewsletterType: 'first', FirstContent: '" + firstcontent + "', SecondContent: '" + secondcontent + "', ThirldContent: '" + thirldcontent + "'}",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    var returnhtml = data.d;
                    returnhtml = returnhtml.replace("{Logopath}", imagelogo);
                    returnhtml = returnhtml.replace("{PropertyPhoto}", propertyimg);
                    if (type == "Print") {
                        printfunction(returnhtml)// print function
                    }
                    else
                    {
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

        function printfunction(content)
        {
            var frame = $('#printframe')[0].contentWindow.document;
            frame.open();
            frame.write(content);
            frame.close();
            // print just the modal div
            $('#printframe')[0].contentWindow.print();
        }
        function previewfunction(content)
        {
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
    <div class="span9">
         <asp:HiddenField ID="hdnTemplateType" runat="server" />
        <div class="content" id="ClientList" style="display:none">

            <div class="module">
                <div class="module-head">
                    <h3>Admin Clients</h3>
                </div>
                <div class="module-body">
                     <p>
                        <asp:Button ID="btnaddusers"  runat="server" style="display:none" class="btn btn-primary" Text="Add Client" OnClick="btnaddusers_Click" />                                     
                        <asp:Button ID="btnDelete" runat="server" style="display:none" class="btn btn-primary" Text="Delete Selected Record" OnClientClick="return confirm('Are you sure you want to delete selected');"
                        OnClick="btnDelete_Click"/>
                          <button id="news_letter" style="display: block; float: left; margin-right: 3px;" type="button" class="btn btn-primary" value="Back To Newsletter">Back To Newsletter</button>
                            <asp:Button ID="btnSave" runat="server" Text="Send" class="btn btn-primary" style="display: block; float: left; margin-right: 3px;" OnClick="btnSave_Click" />
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
                    <div class="form-horizontal row-fluid" >


                    <div style="float: left; width: 99%; background-color: #231f20; border-bottom: 8px solid #eda320; padding: 6px 0;">
                        <div id="userlogo" style="float: left; width: 30%; padding: 6px; text-align: center;">
                            <img id="logoprvw" src="../images/logo.png" alt="" title="" />
                            <%--<asp:Image ID="imgLogo" style="width:60%;" runat="server" Visible="false" />--%>
                            <h3 style="font-size: 15px; margin-bottom: 21px; width: 94px; height: 0; margin-left: 81px; color: #E49523;">Change logo</h3>
                        </div>


                        <div style="float: left; width: 62%; padding: 6px;">
                            <%--  <textarea name="FirstContent" contenteditable="true" style="float: left; width: 100%; font-size: 26px; padding: 1px 0 0; font-family: Arial, Helvetica, sans-serif; font-weight: bold; color: #55518a; margin-top: 6px; height: 40px; "> Tittle of the Newsletter Section</textarea>--%>
                            <asp:TextBox ID="FirstContent" MaxLength='50' onkeyDown="checkTextAreaMaxLength(this,event,'50');" Style="float: left;text-wrap:normal; width: 100%; font-size: 26px; padding: 5px 0 0; font-family: Arial, Helvetica, sans-serif; font-weight: bold; color: #55518a; margin-top: 6px; height: 31px;" runat="server" TextMode="MultiLine" PlaceHolder="Description here..." class="span8">Tittle of the Newsletter Section </asp:TextBox>
                            <div style="float: left; width: 100%; margin: 12px 0 0;">
                                <h2 style="float: left; width: 100%; font-size: 18px; font-family: Arial, Helvetica, sans-serif; color: #FFF; margin: 0px;">Sam Purba</h2>
                                <p style="float: left; width: 100%; font-size: 16px; font-family: Arial, Helvetica, sans-serif; color: #c48820; margin: 5px 0 2px 0;">ROYAL LEPAGE FLOWER CITY REALTY, BROKERAGE</p>
                                <p style="float: left; width: 100%; margin: 0">
                                    <span style="float: left; font-size: 15px; color: #c48820;">Phone:</span>
                                    <span style="float: left; font-size: 14px; color: #FFF; margin: 0 10px 0 4px;">647-893-1331</span>
                                    <span style="float: left; font-size: 15px; color: #c48820; margin: 0 6px 0 1px">Email:</span>
                                    <span style="float: left; font-size: 14px; color: #FFF;">sampurba7@gmail.com</span>
                                </p>
                                <p style="float: left; width: 100%; margin: 0">
                                    <span style="float: left; font-size: 15px; color: #c48820;">Address:</span>
                                    <span style="float: left; font-size: 14px; color: #FFF; margin: 0 10px 0 4px;">10 Cottrelle Blvd #302, Brampton, ON L6S 0E1, Canada</span>
                                </p>
                                <p style="float: left; width: 100%; font-size: 22px; font-family: Arial, Helvetica, sans-serif; color: #c48820; margin: 5px 0 0;">www.number1homes.ca</p>
                            </div>
                        </div>
                        
                    </div>
                    <div style="float: left; width: 100%;">
                        <div style="float: left; width: 30%; padding: 6px; padding: 12px 4px; background: #da1d23; height: 624px;">
                            <%-- <img style='width: 50%;' src='@Model.AdminPhoto' alt='' title=''>--%>
                            <img alt="" src="../Admin/admintemplate/images/admin_client.jpg" />
                            <%--<asp:Image ID="adminphoto" style="width:60%;" runat="server" Visible="false" />--%>
                            <%--<textarea id="textarea1" style="float: left; width: 100%; color: white; font-size: 14px; line-height: 22px; white-space: normal; text-align: justify; padding: 4px 10px; background: none; height: 650px; border: 0px;" class="txtarea" name="SecondContent" contenteditable="true" style="float: left; width: 100%; color: white; font-size: 14px; line-height: 22px; white-space: normal; text-align: justify; padding: 4px 10px; background: none; height: 650px; border: 0px;">--%>
                            <asp:TextBox MaxLength='900' onkeyDown="checkTextAreaMaxLength(this,event,'900');" ID="SecondContent" Style="float: left; font-family: arial; border: none;overflow-wrap:normal; width: 100%; font-size: 13px; padding: 1px 0 0; background: #da1d23 none repeat scroll 0 0; font-weight: bold; color: white; white-space: normal; margin-top: 6px; height: 435px;" runat="server" TextMode="MultiLine" PlaceHolder="" class="span8">
                                
                                 400 CENTRAL PARK WEST 5W

                                This spacious and sunny renovated 1-bedroom/1 bath apartment is ready for you to move in. Enjoy Central Park views as you gaze ot the windows or as you relax on the huge outdoor terrace. The brand new kitchen features granite counter tops, custom cabinets and top-of-the-line appliances. The brand new kitchen features granite counter tops, custom cabinets and top-of-the-line appliances. custom cabinets and top-of-the-line appliances . The brand new kitchen features granite counter tops, custom cabinets and top-of-the-line appliances. custom cabinets and top-of-the-line appliances  . The brand new kitchen features granite counter tops, custom cabinets and top-of-the-line appliances. custom cabinets and top-of-the-line appliances .

                               
                            </asp:TextBox>
                            <%-- </textarea>--%>
                        </div>

                        <div style="float: left; width: 68%; padding: 3px 0 0 3px;">
                            <div id="userimg" style="float: left; width: 100%;">
                                <img id="imgprvw" src="../NewsLetterImages/img1F.jpg" style="width: 100%; height: 350px;" alt="" title="" />
                            </div>
                            <div style="float: left; width: 100%; margin-top: 3px; background-color: #f0f0f0;">

                                <%-- <textarea id="textarea2" class="txtarea" name="ThirdContent" contenteditable="true" style="float:left; width:100%;height:445px;  color:#3d3d3d; font-size:13px; line-height: 22px; white-space: normal; text-align: justify; padding: 4px 10px;">--%>
                                <asp:TextBox ID="ThirdContent" MaxLength='920' onkeyDown="checkTextAreaMaxLength(this,event,'920');" Style="float: left; width: 100%; height: 292px; color: #3d3d3d; font-size: 13px; line-height: 22px; white-space: normal; text-align: justify; padding: 4px 10px;font-family:'Open Sans',Tahoma,Arial,sans-serif;" runat="server" TextMode="MultiLine" PlaceHolder="Description here..." class="span8">
                                    
                                    This charming mint one bedroom penthouse with a wrap terrace and a WBFP is located on a tree lined block and is steps from Central Park. Take the elevator up to the 10th floor and walk up one flight of stairs to a semi private landing. When entering this special home you will find light surrounding you from four exposures. The south facing living room boasts a wood burning fireplace and French doors that open to the wrap terrace.. The brand new kitchen features granite counter tops, custom cabinets and top-of-the-line appliances. custom cabinets and top-of-the-line appliances  . The brand new kitchen features granite counter tops, custom cabinets and top-of-the-line appliances. custom cabinets and top-of-the-line appliances .

                                </asp:TextBox>
                                <%--</textarea>--%>
                            </div>

                        </div>

                    </div>


                    <div class="control-group">
                        <div class="newslter_btn_bg">
                            <asp:Button ID="btnBack" class="btn" runat="server" Visible="false" Text="Back" OnClick="btnBack_Click" />
                            <button id="Send_To" type="button" class="btn btn-primary" value="Send To" style="display: block; float: left; padding-top: 3px; margin-right: 7px;">Send To</button>
                           <button id="preview" type="button" class="btn btn-primary" value="preview" style="display: block; float: left; padding-top: 3px; margin-right: 7px;">preview</button>
                             <button id="print"  type="button" class="btn btn-primary" value="Send To" style="display: block; float: left; padding-top: 3px; margin-right: 7px;">print</button>
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
                                <asp:FileUpload ID="Logofile" runat="server" onchange="showLogopreview(this)"/>
                                
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


            <!-- Trigger the User Image modal with a button -->
            <button id="myImgModal" type="button" style="visibility: hidden" class="btn btn-info btn-lg" data-toggle="modal" data-target="#UserImageDiv" data-backdrop="static" data-keyboard="false">Open Modal</button>

            <!--User image Modal -->
            <div class="modal fade new" id="UserImageDiv" role="dialog">
                <div class="modal-dialog modl_bgg">

                    <!-- User Modal content-->
                    <div class="modal-content new_pop">
                        <div class="modal-header mdl_hdrrr">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 id="popupheading" class="modal-title modl_hdng">Upload User Image</h4>
                        </div>
                        <div class="modal-body modl_bg">

                            <ul class="list_to_row">
                                <li class="cell" style="width: 75px;">Browse</li>
                                <li class="cell">
                                   <%-- <input type="file" id="file" name="Imgfile" onchange="showUsrImgpreview(this)" />--%>
                                <asp:FileUpload ID="Imgfile" runat="server"  onchange="showUsrImgpreview(this)"/>
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
    <div id="mypopup" style="display:none;">
            <div style="margin-top: 30px; height: 44px; background: #026F52; width: 982px;">
                <button type="button" class="close" id="close_popup" data-dismiss="modal">&times;</button>
            </div>
            <iframe id="printframe"></iframe>

        </div>
    
</asp:Content>
