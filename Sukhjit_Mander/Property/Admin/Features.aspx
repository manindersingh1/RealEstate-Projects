<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true"
    CodeBehind="Features.aspx.cs" Inherits="Property.Admin.Features" %>

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
                    <h3>Featured Properties</h3>
                </div>
                <div class="module-body">
                    <br />
                    <div class="form-horizontal row-fluid">
                        <div class="control-group">
                            <label class="control-label" for="basicinput">Search MLS-ID</label>
                            <div class="controls">
                                <asp:TextBox ID="txtFeature" runat="server" PlaceHolder="Enter MLS-ID" class="span8"></asp:TextBox>
                                <span class="help-inline">
                                    <asp:RequiredFieldValidator ID="revBanner" runat="server" ErrorMessage="MLS-ID required" Display="Dynamic"
                                        ControlToValidate="txtFeature" ValidationGroup="SavePage" SetFocusOnError="true"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </span>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <asp:Button ID="btnCreateFeature" runat="server" ValidationGroup="SavePage" class="btn btn-primary" Text="Search" OnClick="btnCreateFeature_Click" />
                                <span class="help-inline">
                                    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
                    <asp:GridView ID="grdFeatures" AllowPaging="true"  class="table table-striped table-bordered table-condensed" PageSize="10" AutoGenerateColumns="False"
                            runat="server" DataKeyNames="mls"  OnPageIndexChanging="grdFeatures_PageIndexChanging" OnSorting="grdFeatures_Sorting"
                            OnRowCommand="grdFeatures_RowCommand" OnRowDeleting="grdFeatures_RowDeleting" >

                            <Columns>
                                 <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:CheckBox ID="chkdeleteAll" runat="server" AutoPostBack="false" onclick="checkAll(this);" OnCheckedChanged="chkdeleteAll_CheckedChanged" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:HiddenField ID="hdnID" runat="server" Value='<%#Eval("MLS") %>' />
                                     <asp:Label ID="HiddenField1" runat="server" Value='<%#Eval("IsActive") %>' ></asp:Label>
                                    <asp:CheckBox ID="chkdelete" runat="server" AutoPostBack="false" onclick="Check_Click(this)" OnCheckedChanged="chkdelete_CheckedChanged" />
                                </ItemTemplate>
                            </asp:TemplateField>
                                <asp:BoundField DataField="MLS" HeaderText="MLS" SortExpression="MLS"></asp:BoundField>
                                <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address"></asp:BoundField>
                                 <asp:BoundField Visible="false" DataField="Province" HeaderText="City" SortExpression="Province"></asp:BoundField>
                                <asp:BoundField DataField="PostalCode" HeaderText="Postal Code" SortExpression="PostalCode"></asp:BoundField>
                                 <asp:TemplateField  >
                                    <ItemTemplate>
                                        <asp:Button CommandName="Add" Visible='<%# (Convert.ToBoolean(Eval("IsActive")))?false:true%>' ID="btnCreate" runat="server" CssClass="btn btn-primary" Text="Add To Feature" />
                                        <asp:Button CommandName="remove" Visible='<%# (Convert.ToBoolean(Eval("IsActive")))?true:false%>' ID="btnDelete" runat="server" class="btn btn-primary" Text="Remove from Feature" />
                                       
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                </div>
            </div>
            <div class="changer" runat="server" id="pagesLink" visible="false">
        <table>
            <tr>
                <td>
                    <asp:LinkButton ID="lnkFirst" runat="server" Font-Bold="true"  PostBackUrl="~/Search.aspx"
                        OnClick="lnkFirst_Click">First</asp:LinkButton>
                </td>
                <td>
                    <asp:LinkButton ID="lnkPrevious" runat="server" Font-Bold="true" Style="margin-left: 6px;" PostBackUrl="~/Search.aspx"
                        OnClick="lnkPrevious_Click">Prev</asp:LinkButton>
                </td>
                <td>
                    <asp:DataList ID="RepeaterPaging" runat="server" RepeatDirection="Horizontal" OnItemCommand="RepeaterPaging_ItemCommand"
                        OnItemDataBound="RepeaterPaging_ItemDataBound">
                        <ItemTemplate>
                            <asp:LinkButton ID="Pagingbtn" runat="server" CommandArgument='<%# Eval("PageIndex") %>'
                                CommandName="newpage" Text='<%# Eval("PageText") %> ' Width="20px"></asp:LinkButton>&nbsp&nbsp
                        </ItemTemplate>
                    </asp:DataList>
                </td>
                <td>
                    <asp:LinkButton ID="lnkNext" runat="server" Font-Bold="true"  PostBackUrl="~/Search.aspx"
                        OnClick="lnkNext_Click">Next</asp:LinkButton>
                </td>
                <td>
                    <asp:LinkButton ID="lnkLast" runat="server" Style="margin-left: 6px;" Font-Bold="true" PostBackUrl="~/Search.aspx"
                        OnClick="lnkLast_Click">Last</asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>
        </div>
     
</asp:Content>
