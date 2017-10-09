<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="NewsLetterNew.aspx.cs" Inherits="Property.Admin.NewsLetterNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="span9">
        <div class="content">
            <div class="module">
                <div class="module-head">
                    <h3>Add NewsLetter</h3>
                </div>
                   <div class="module-body">
                    <div class="form-horizontal row-fluid">
                         <div class="control-group">
                            <label class="control-label" for="basicinput">First Image</label>
                            <div class="controls">
                                <asp:FileUpload ID="FirstImg" onchange="show_First_imagepreview(this)" runat="server" />                               
                                <img id="imgfavicon" alt="Avatar" src="" height="120" width="120" />
                                
                                <asp:ImageButton Style="margin-bottom: 66px; margin-left: 165px;" ImageUrl="../Images/negative.png" OnClick="btnfavdelete_Click" ID="btnfavdelete" Text="Remove" runat="server" />
                            </div>
                        </div>
                          <div class="control-group">
                            <label class="control-label" for="basicinput">Second Image</label>
                            <div class="controls">
                                <asp:FileUpload ID="SecondImg" onchange="show_Second_imagepreview(this)" runat="server" />                                
                                 <img id="Secondfavicon" alt="Avatar" src="" height="120" width="120" />
                                <asp:ImageButton Style="margin-bottom: 66px; margin-left: 165px;" ImageUrl="../Images/negative.png" OnClick="btnfavdelete_Click" ID="ImageButton1" Text="Remove" runat="server" />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="basicinput">Name</label>
                            <div class="controls">
                                <asp:TextBox ID="txtName" runat="server" MaxLength="50" PlaceHolder="Name.." class="span8"></asp:TextBox>
                                <span class="help-inline">
                                    <asp:RequiredFieldValidator ID="revBanner" runat="server" ErrorMessage="Title required" Display="Dynamic"
                                        ControlToValidate="txtName" ValidationGroup="SavePage" SetFocusOnError="true"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </span>
                            </div>
                        </div>


                        <div class="control-group">
                            <label class="control-label" for="basicinput">OrderNo</label>
                            <div class="controls">
                                <asp:DropDownList runat="server" ID="OrderNo">
                                    <asp:ListItem Value="" Text="Choose Order" Selected="True"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="1" ></asp:ListItem>
                                    <asp:ListItem Value="2" Text="2"> </asp:ListItem>
                                    <asp:ListItem Value="3" Text="3"> </asp:ListItem>
                                    <asp:ListItem Value="4" Text="4"> </asp:ListItem>
                                    <asp:ListItem Value="5" Text="5"> </asp:ListItem>
                                    <asp:ListItem Value="6" Text="6"> </asp:ListItem>
                                    <asp:ListItem Value="7" Text="7"> </asp:ListItem>
                                    <asp:ListItem Value="8" Text="8"> </asp:ListItem>
                                    <asp:ListItem Value="9" Text="9"> </asp:ListItem>
                                    <asp:ListItem Value="10" Text="10"> </asp:ListItem>
                                    <asp:ListItem Value="11" Text="11"> </asp:ListItem>
                                    <asp:ListItem Value="12" Text="12"> </asp:ListItem>
                                    <asp:ListItem Value="13" Text="13"> </asp:ListItem>
                                    <asp:ListItem Value="14" Text="14"> </asp:ListItem>
                                    <asp:ListItem Value="15" Text="15"> </asp:ListItem>
                                    <asp:ListItem Value="16" Text="16"> </asp:ListItem>
                                    <asp:ListItem Value="17" Text="17"> </asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                    </div>


                    <div class="control-group">
                        <div class="controls">
                            <asp:Button ID="btnUploadImage" ValidationGroup="SavePage" runat="server" class="btn btn-primary" Text="Save" OnClick="btnUploadImage_Click" />
                            <asp:Button ID="btnCancel" class="btn" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls"></div>
                    </div>



                </div>
            </div>
        </div>
        <!--/.content-->
    </div>

    
    <!--/.span9-->
    <script>
        function show_First_imagepreview(input) {
            debugger;
            if (input.files && input.files[0]) {
                var filerdr = new FileReader();
                filerdr.onload = function (e) {
                    $('#imgfavicon').attr('src', e.target.result);
                  
                }
                filerdr.readAsDataURL(input.files[0]);
            }
        }

        function show_Second_imagepreview(input) {
            debugger;
            if (input.files && input.files[0]) {
                var filerdr = new FileReader();
                filerdr.onload = function (e) {
                    $('#Secondfavicon').attr('src', e.target.result);
                   
                }
                filerdr.readAsDataURL(input.files[0]);
            }
        }
</script>
</asp:Content>
