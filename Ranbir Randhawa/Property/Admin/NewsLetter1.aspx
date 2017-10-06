<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true"
    CodeBehind="NewsLetter1.aspx.cs" Inherits="Property.Admin.NewsLetter1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">


    <script>
        $(document).ready(function () {
            $('#userlogo').click(function () {
                debugger;
                Openmodel();
            }
      )
            $('#userimg').click(function () {
                debugger;
                OpenUsrImgmodel();
            }
           )
            $('.chosen-select').chosen({ no_results_text: 'Oops, nothing found!' });
           

            $('#Logofile').click(function () {
                debugger;
                Openmodel();
            }
          )

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
        function showLogopreview(input) {
            debugger;
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
            debugger;
            if (input.files && input.files[0]) {
                var filerdr = new FileReader();
                filerdr.onload = function (e) {
                    $('#imgprvw').attr('src', e.target.result);
                    $('#myImgModal').click();
                }
                filerdr.readAsDataURL(input.files[0]);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ajaxtoolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </ajaxtoolkit:ToolkitScriptManager>
    <div class="span9">
        <div class="content">
            <div class="module" id="newletter_div">
                <div class="module-head">
                    <h3>News Letter</h3>
                </div>
                <div class="module-body">
                    <br />
                    <div class="form-horizontal row-fluid">


                        <div style="float: left; width: 100%; background-color: #231f20; border-bottom: 8px solid #eda320; padding: 6px 0;">
                            <div id="userlogo" style="float: left; width: 30%; padding: 6px; text-align: center;">
                                <img id="logoprvw" src="../images/MyLogodd%20-%20Copy.png" alt="" title="" />
                                <%--<asp:Image ID="imgLogo" style="width:60%;" runat="server" Visible="false" />--%>
                                <h3 style="font-size: 15px; margin-bottom: 21px; width: 94px; height: 0; margin-left: 81px; color: #E49523;">Change logo</h3>
                            </div>


                            <div style="float: left; width: 67%; padding: 6px;">
                                <%--  <textarea name="FirstContent" contenteditable="true" style="float: left; width: 100%; font-size: 26px; padding: 1px 0 0; font-family: Arial, Helvetica, sans-serif; font-weight: bold; color: #55518a; margin-top: 6px; height: 40px; "> Tittle of the Newsletter Section</textarea>--%>
                                <asp:TextBox ID="FirstContent" Style="float: left; width: 100%; font-size: 26px; padding: 1px 0 0; font-family: Arial, Helvetica, sans-serif; font-weight: bold; color: #55518a; margin-top: 6px; height: 40px;" runat="server" TextMode="MultiLine" PlaceHolder="Description here..." class="span8">Tittle of the Newsletter Section </asp:TextBox>
                                <div style="float: left; width: 100%; margin: 12px 0 0;">
                                    <h2 style="float: left; width: 100%; font-size: 18px; font-family: Arial, Helvetica, sans-serif; color: #FFF; margin: 0px;">Rajinder Pal Singh</h2>
                                    <p style="float: left; width: 100%; font-size: 16px; font-family: Arial, Helvetica, sans-serif; color: #c48820; margin: 5px 0 2px 0;">HomeLife/Miracle Realty Ltd., Brokerage*</p>
                                    <p style="float: left; width: 100%; margin: 0">
                                        <span style="float: left; font-size: 15px; color: #c48820;">Phone:</span>
                                        <span style="float: left; font-size: 14px; color: #FFF; margin: 0 10px 0 4px;">416-844-5725</span>
                                        <span style="float: left; font-size: 15px; color: #c48820; margin: 0 6px 0 1px">Email:</span>
                                        <span style="float: left; font-size: 14px; color: #FFF;">homekey123@yahoo.com</span>
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
                            <div style="float: left; width: 30%; padding: 6px; padding: 12px 4px; background: #026f52; height: 800px;">
                                <%-- <img style='width: 50%;' src='@Model.AdminPhoto' alt='' title=''>--%>
                                <img alt="" src="../images/client_img.jpg" />
                                <%--<asp:Image ID="adminphoto" style="width:60%;" runat="server" Visible="false" />--%>
                                <%--<textarea id="textarea1" style="float: left; width: 100%; color: white; font-size: 14px; line-height: 22px; white-space: normal; text-align: justify; padding: 4px 10px; background: none; height: 650px; border: 0px;" class="txtarea" name="SecondContent" contenteditable="true" style="float: left; width: 100%; color: white; font-size: 14px; line-height: 22px; white-space: normal; text-align: justify; padding: 4px 10px; background: none; height: 650px; border: 0px;">--%>
                                <asp:TextBox ID="SecondContent" Style="float: left; border: none; width: 100%; font-size: 13px; padding: 1px 0 0; background: #026f52 none repeat scroll 0 0; font-weight: bold; color: white; white-space: normal; margin-top: 6px; height: 577px;" runat="server" TextMode="MultiLine" PlaceHolder="" class="span8">
                                
                                 400 CENTRAL PARK WEST 5W

                                This spacious and sunny renovated 1-bedroom/1 bath apartment is ready for you to move in. Enjoy Central Park views as you gaze out the windows or as you relax on the huge outdoor terrace. The brand new kitchen features granite counter tops, custom cabinets and top-of-the-line appliances. The large living room is wonderful for entertaining and there is also a separate dining area. The bedroom is full-sized and can accommodate any type of furniture.

                                There is great closet space (including two walk-ins), there are wood floors throughout, and each room has its own through-the-wall air condit...ioner. 400 Central Park West is a full-service Condominium building with a 24-hour Concierge, a fitness center, a modern laundry, storage, a bike room, a playground, outdoor parking, and is near to all transportation and shopping. Pets are permitted and subletting is allowed.
                                </asp:TextBox>
                                <%-- </textarea>--%>
                            </div>

                            <div style="float: left; width: 68%; padding: 3px 0 0 3px;">
                                <div id="userimg" style="float: left; width: 100%;">
                                    <img id="imgprvw" src="../NewsLetterImages/img1F.jpg" style="width: 100%; height: 350px;" alt="" title="" />
                                </div>
                                <div style="float: left; width: 100%; margin-top: 3px; background-color: #f0f0f0;">

                                    <%-- <textarea id="textarea2" class="txtarea" name="ThirdContent" contenteditable="true" style="float:left; width:100%;height:445px;  color:#3d3d3d; font-size:13px; line-height: 22px; white-space: normal; text-align: justify; padding: 4px 10px;">--%>
                                    <asp:TextBox ID="ThirdContent" Style="float: left; width: 100%; height: 445px; color: #3d3d3d; font-size: 13px; line-height: 22px; white-space: normal; text-align: justify; padding: 4px 10px;" runat="server" TextMode="MultiLine" PlaceHolder="Description here..." class="span8">
                                    
                                    This charming mint one bedroom penthouse with a wrap terrace and a WBFP is located on a tree lined block and is steps from Central Park. Take the elevator up to the 10th floor and walk up one flight of stairs to a semi private landing. When entering this special home you will find light surrounding you from four exposures. The south facing living room boasts a wood burning fireplace and French doors that open to the wrap terrace, here you will be able to entertain your friends surrounded by lush plantings or sit back and enjoy your morning coff...ee.

                                    The oversized windowed kitchen, with south, north and eastern exposures has granite counter tops, stainless appliances (including a Samsung French door refrigerator/freezer, Bosch dishwasher, electric stove top and oven.) There is also an oversized dining area with access to the terrace from a French door. The newly renovated windowed bathroom sits just outside the bedroom and is finished with white Carrera marble, a pedestal sink as well as a soaking tub/shower. The bedroom has south, west and northern exposures and an entrance to the terrace. There are beautifully refinished hard wood floors throughout, as well as through wall A/C,.

                                    recessed and cove lighting, built in book shelves and 17 windows! The Morleigh is a prewar, elevator cooperative with a live in super and has a video intercom, laundry room, bike room and storage. This rare gem in located in the heart of the UWS near Central Park, Lincoln Center, public transportation and great restaurants. Pied-a-terre's allowed but sorry no pets allowed.
                                
                                    </asp:TextBox>
                                    <%--</textarea>--%>
                                </div>

                            </div>

                        </div>


                        <button id="myModal" type="button" style="visibility: hidden" class="btn btn-info btn-lg" data-toggle="modal" data-target="#favouriteProperties" data-backdrop="static" data-keyboard="false">Open Modal</button>

                        <!--logo image Modal -->
                        <div class="modal fade new" id="favouriteProperties" role="dialog">

                            <div class="modal-dialog modl_bgg">

                                <!-- Modal content-->
                                <div class="modal-content new_pop ">
                                    <div class="modal-header mdl_hdrrr">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 id="popupheading" class="modal-title modl_hdng">Upload logo</h4>
                                    </div>
                                    <div class="modal-body modl_bg">

                                        <ul class="list_to_row">
                                            <li class="cell" style="width: 75px">Browse</li>
                                            <li class="cell">
                                                <%-- <input type="file" id="file" name="Logofile" onchange="showLogopreview(this)" />--%>
                                                <asp:FileUpload ID="Logofile" runat="server" onchange="showLogopreview(this)" />

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
                                                <asp:FileUpload ID="Imgfile" runat="server" onchange="showUsrImgpreview(this)" />
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
                            <div class="controls">
                                <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-primary" OnClick="btnSave_Click" />
                                <asp:Button ID="btnBack" class="btn" runat="server" Visible="false" Text="Back" OnClick="btnBack_Click" />
                            </div>
                        </div>
                    </div>
                    <div>
                        <asp:DropDownList ID="ddlMultiSelect" multiple="multiple"  data-placeholder="Choose a Country…" class="chosen-select"   Style="width: 350px;" runat="server">
                    
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


