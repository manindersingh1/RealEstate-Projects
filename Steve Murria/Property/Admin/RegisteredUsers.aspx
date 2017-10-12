<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true"
    CodeBehind="RegisteredUsers.aspx.cs" Inherits="Property.Admin.RegisteredUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
  <%--    <link href="../css/style_002.css" rel="stylesheet" />
    <link href="../slider/css/style.css" rel="stylesheet" />
    <link href="../css/shortcodes.css" rel="stylesheet" />--%>
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
                    <h3>Registered Users</h3>
                </div>
                <div class="module-body">
                     <p>
                        <asp:Button ID="btnaddusers"  runat="server" class="btn btn-primary" Text="Add User" OnClick="btnaddusers_Click" />                                     
                        <asp:Button ID="btnDelete" runat="server" class="btn btn-primary" Text="Delete Selected Record" OnClientClick="return confirm('Are you sure you want to delete selected');"
                        OnClick="btnDelete_Click" />
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
                            <asp:BoundField DataField="FirstName" HeaderText="Name" SortExpression="Name"></asp:BoundField>
                         <%--   <asp:BoundField DataField="DateofBirth" HeaderText="Date of Birth" SortExpression="Date of Birth" DataFormatString="{0:MM/dd/yyyy}" ></asp:BoundField>--%>
                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address"></asp:BoundField>
                            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City"></asp:BoundField>
                            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State"></asp:BoundField>

                            <asp:BoundField DataField="PhoneNumber" HeaderText="Phone No." SortExpression="PhoneNumber"></asp:BoundField>

                            <asp:BoundField DataField="UserName" HeaderText="Email" SortExpression="UserName"></asp:BoundField>

                           <%-- <asp:TemplateField HeaderText="Password" SortExpression="Password">
                                <ItemTemplate>
                                    <asp:Label ID="lblPassword" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Verified">
                                <ItemTemplate>
                                   
                                  
                                    <asp:Label ID="isverify" Text='<%#Eval("IsVerified").ToString()=="True" ? "Yes" : "No"  %>' runat="server"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>    --%>                      

                            <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>
                                    <a id="id" href="AdminRegistration.aspx?edit=<%#Eval("ID") %>">
                                        <img src="../images/edit.png" alt="" /></a>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                    
                </div>
            </div>
        </div>
        <!--/.content-->
    </div>
    <!--/.span9-->
</asp:Content>
