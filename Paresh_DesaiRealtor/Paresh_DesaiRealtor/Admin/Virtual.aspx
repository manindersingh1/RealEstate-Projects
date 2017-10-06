<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true"
     CodeBehind="Virtual.aspx.cs" Inherits="Property.Admin.Virtual" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
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
                    <h3>Virtual Tour</h3>
                </div>
                <div class="module-body">
                    <p>
                       
                        <asp:Button ID="btnCreate" runat="server" CssClass="btn btn-primary" Text="Add Virtual Tour" OnClick="btnCreate_Click" />

                          <asp:Button ID="btnDelete" runat="server" class="btn btn-primary" Text="Delete Selected Record" OnClientClick="return confirm('Are you sure you want to delete selected');"
                        OnClick="btnDelete_Click" />
                    </p>
                    <asp:GridView ID="grdvirtualtour" AllowPaging="true" class="table table-striped table-bordered table-condensed" PageSize="10" AutoGenerateColumns="False"
                            runat="server" OnPageIndexChanging="grdFeatures_PageIndexChanging" OnSorting="grdFeatures_Sorting"
                            OnRowCommand="grdFeatures_RowCommand" OnRowDeleting="grdFeatures_RowDeleting">

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
                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
                                <asp:BoundField DataField="Link" HeaderText="Link" SortExpression="Link"></asp:BoundField>
                                
                               <%--  <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton style="height: 18px;" ID="create" runat="server" CommandName="create" 
                                            ImageUrl="../images/create.png" />
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                               <%-- <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="lnkDelete" runat="server" CommandName="Delete" CommandArgument='<%#Eval("Link") %>'
                                            OnClientClick="return confirm('Are You Sure You Want to Delete this Record');"
                                            ImageUrl="~/images/negative.png" />
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                               
                                  
                            </Columns>
                        </asp:GridView>
                </div>
            </div>
        </div>
        <!--/.content-->
    </div>
    <!--/.span9-->
</asp:Content>
