<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true"
    CodeBehind="NewsLetterList.aspx.cs" Inherits="Property.Admin.NewsLetterList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <style>
        .modal-title {
            margin: 0;
            line-height: 1.42857143;
        }

        .modal-header {
            background-color: #20A12E;
        }

            .modal-header button {
                font-size: 30px;
            }

            .modal-header button, h4.modal-title {
                color: #fff !important;
                opacity: 1;
            }
    </style>
    <script type="text/javascript">
        $(document).ready(function()
        {
            $('.commonclas').click(function ()
            {
                debugger;
                var chk = $(this).closest('tr').find('input:checkbox');
                if (chk[0].checked) {
                    $('#Newsletter').css('display', 'none');
                    $('#userlist').css('display', 'block');
                } else {
                    alert("Must select the checkbox before send");
                }
               

            })

            $('.backbtn').click(function () {
                $('#Newsletter').css('display', 'block');
                $('#userlist').css('display', 'none');
            })
        })
        
       

        function imageclick(e) {
            $('#imgsrc').attr('src', '')
            $('#imgsrc').attr('src', e)
            $('#ImgModal').modal('show');           
            return false;
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
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="span9">
        <div class="content">

            <div class="module">
                <div class="module-head">
                    <h3>Admin Clients</h3>
                </div>
                <div class="module-body">
                    <div id="Newsletter">
                        <asp:HiddenField ID="hdnTemplateType" Value="First_nwslettr" runat="server" />
                        <p>
                            <asp:Button ID="btnaddusers" runat="server" class="btn btn-primary" Text="Add NewsLetter" OnClick="btnaddusers_Click" />                          
                        </p>
                        <div class="alert" runat="server" id="alertMSG" visible="false">
                            <button type="button" class="close" data-dismiss="alert">×</button>
                            <strong>Sorry!</strong> no records found!
                        </div>

                        <asp:GridView ID="Newsletters" class="table table-striped table-bordered table-condensed" PageSize="10" AutoGenerateColumns="False" runat="server"
                            AllowPaging="true" OnPageIndexChanging="Newsletters_PageIndexChanging"
                            OnSorting="Newsletters_Sorting" OnRowDataBound="Newsletters_RowDataBound" OnRowCommand="Newsletters_RowCommand">

                            <Columns>                               
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:HiddenField ID="hdnID" runat="server" Value='<%#Eval("NewsLetterId") %>' />                                       
                                        <asp:HiddenField ID="firstimage" runat="server" Value='<%#Eval("Image") %>' />  
                                        <asp:HiddenField ID="secondimage" runat="server" Value='<%#Eval("second_Image") %>' />   
                                        <asp:CheckBox ID="chkdelete" runat="server" AutoPostBack="false" onclick="Check_Click(this)" OnCheckedChanged="chkdelete_CheckedChanged" />                                    
                                        
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Preview Image">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("Image")%>'
                                            Width="81px" Height="85px" Style="cursor: pointer" OnClientClick=" imageclick(this.src);return false;" />
                                        <asp:ImageButton ID="second_Image" runat="server" ImageUrl='<%# Eval("Image")%>'
                                            Width="81px" Height="85px" Style="cursor: pointer" OnClientClick="imageclick(this.src);return false;" />
                                    </ItemTemplate>
                                </asp:TemplateField>                              
                                <asp:BoundField DataField="NewsLetterName" HeaderText="NewsLetterName" SortExpression="NewsLetterName"></asp:BoundField>
                                <asp:BoundField DataField="OrderNo" HeaderText="OrderNo" SortExpression="OrderNo"></asp:BoundField>
                                <asp:TemplateField HeaderText="Send To">
                                    <ItemTemplate>
                                        <button type="button" id="sendto"  class="commonclas" value="Send To">Send To</button>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete">
                                    <ItemTemplate>
                                        <a id="id" href="NewsLetterList.aspx?Id=<%#Eval("NewsLetterId") %>">
                                            <img src="../images/delete.png" alt="" /></a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div id="userlist" style="display:none;">
                        <p>
                        <asp:Button ID="send"  runat="server" class="btn btn-primary" Text="Send NewsLetter" OnClick="btnsendNewsLetter_Click" />                                     
                        <button  class="btn btn-primary backbtn" type="button">Back to NewsLetter</button>
                    </p>   
                    <div class="alert" runat="server" id="Div1" visible="false">
                        <button type="button" class="close" data-dismiss="alert">×</button>
                        <strong>Sorry!</strong> no records found!
                    </div>
                    
                    <asp:GridView ID="gridusrs" class="table table-striped table-bordered table-condensed" PageSize="10" AutoGenerateColumns="False" runat="server"
                        AllowPaging="true" OnPageIndexChanging="gridusrs_PageIndexChanging"
                        OnSorting="gridusrs_Sorting" OnRowDataBound="gridusrs_RowDataBound" OnRowCommand="gridusrs_RowCommand">

                        <Columns>                        
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
                            <asp:BoundField DataField="PhoneNo" HeaderText="Phone No." SortExpression="PhoneNo"></asp:BoundField>
                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address"></asp:BoundField>
                            <asp:BoundField DataField="Source" HeaderText="Source" SortExpression="Source"></asp:BoundField>
                            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status"></asp:BoundField>
                            <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks"></asp:BoundField>
                            <asp:ImageField DataImageUrlField="Photopath" HeaderText="Photopath"></asp:ImageField>
                          
                        </Columns>
                    </asp:GridView>

                    </div>

                </div>
            </div>
        </div>
        <!--/.content-->
    </div>
    <!--/.span9-->
    <div class="modal fade fadd" id="ImgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <!-- modal header -->
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">News Letter</h4>

                </div>
                <!-- /modal header -->
                <!-- modal body -->
                <div class="modal-body">
                    <img alt="" src="" id="imgsrc" height="100%" width="100%" style="display: block" />
                    <h4 id="Date_ErrorMessage" style="display: none"></h4>
                    <div id="show_usrs" class="user_listt" style="display: none">
                    </div>
                </div>
                <!-- /modal body -->

                <div class="modal-footer">
                    <!-- modal footer -->
                    <button class="bigButton" data-dismiss="modal">Close</button>

                    <%--<button class="bigButton" onclick="deleteme();">Cancel</button>--%>
                </div>
                <!-- /modal footer -->

            </div>
        </div>
    </div>
</asp:Content>

