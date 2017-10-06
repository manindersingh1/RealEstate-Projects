<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true"
    CodeBehind="TrackRecords.aspx.cs" Inherits="Property.Admin.TrackRecords" %>

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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="span9">
        <div class="content">

            <div class="module">
                <div class="module-head">
                    <h3>Tracked Users</h3>
                </div>
                <div class="module-body">
                    <%--<p>
                        <asp:Button ID="btnaddusers" runat="server" class="btn btn-primary" Text="Add User" OnClick="btnaddusers_Click" />                       
                    </p>--%>
                    <asp:GridView ID="grdUsers" class="table table-striped table-bordered table-condensed" PageSize="10" AutoGenerateColumns="False" runat="server"
                        AllowPaging="true" OnPageIndexChanging="grdUsers_PageIndexChanging"
                        OnSorting="grdUsers_Sorting" OnRowDataBound="grdUsers_RowDataBound">

                        <Columns>
                            <asp:BoundField DataField="IP" HeaderText="IP Address" SortExpression="IP"></asp:BoundField>
                            <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country"></asp:BoundField>
                            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City"></asp:BoundField>
                            <asp:BoundField DataField="Region" HeaderText="Region" SortExpression="Region"></asp:BoundField>
                            <asp:BoundField DataField="Loc" HeaderText="Location" SortExpression="Loc"></asp:BoundField>
                            <asp:BoundField DataField="Org" HeaderText="Organition" SortExpression="Org"></asp:BoundField>
                            <asp:BoundField DataField="CreatedOn" HeaderText="Date" SortExpression="CreatedOn"></asp:BoundField>
                          
                        </Columns>
                    </asp:GridView>

                    
                </div>
            </div>
        </div>
        <!--/.content-->
    </div>
    <!--/.span9-->
</asp:Content>
