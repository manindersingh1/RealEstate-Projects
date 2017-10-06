<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Banner.aspx.cs" Inherits="Property.Admin.Banner" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="span9">
        <div class="content">
            <div class="module">
                <div class="module-head">
                    <h3>Manage Banner</h3>
                </div>
                <div class="module-body">
                    <div class="form-horizontal row-fluid">
                        <div class="control-group">
                            <label class="control-label" for="basicinput">Banner Name</label>
                            <div class="controls">
                                <asp:TextBox ID="txtName" runat="server" MaxLength="50" PlaceHolder="Banner Name.." class="span8"></asp:TextBox>
                                <span class="help-inline">
                                    <asp:RequiredFieldValidator ID="revBanner" runat="server" ErrorMessage="Banner name required" Display="Dynamic"
                                        ControlToValidate="txtName" ValidationGroup="SavePage" SetFocusOnError="true"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </span>
                            </div>
                        </div>


                        <div class="control-group">
                            <label class="control-label" for="basicinput">Banner Image</label>
                            <div class="controls">
                                <asp:FileUpload ID="updBannerImage" runat="server" />
                                <span class="help-inline">
                                    <asp:Image ID="imgbanner" Width="130px"  runat="server" Visible="false" /></span>
                                <asp:HiddenField ID="hdnImg" runat="server" />
                                <asp:Label ID="lblbannersize" style="color:red;" runat="server"></asp:Label>
                             <%--   <asp:CustomValidator ID="cvFileUpload" runat="server"
                                    ControlToValidate="updBannerImage"
                                    ValidationGroup="SavePage" ValidateEmptyText="True"></asp:CustomValidator>--%>
                            </div>
                        </div>


                        <div class="control-group">
                            <label class="control-label" for="basicinput">Image Order</label>
                            <div class="controls">
                                <div class="dropdown">
                                    <select id="itemOrder" runat="server">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                        <option value="8">8</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="control-group">
                            <div class="controls">
                                <asp:Button ID="btnUploadImage" ValidationGroup="SavePage" runat="server" class="btn btn-primary" Text="Upload" OnClick="btnUploadImage_Click" />
                                <asp:Button ID="btnCancel" class="btn" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls"></div>
                        </div>

                        <asp:GridView ID="grdBannerShow" class="table table-striped table-bordered table-condensed" AutoGenerateColumns="False" OnRowCommand="GrdBlogList_RowCommand" PageSize="10" runat="server">
                            <Columns>
                               <%-- <asp:BoundField DataField="ID" HeaderText="#" SortExpression="ID"></asp:BoundField>--%>
                                <asp:TemplateField HeaderText="Banner" SortExpression="ID">
                                    <ItemTemplate>
                                        <img src='/admin/uploadfiles/<%#Eval("FileName") %>' alt="" width="100px" height="100px" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--<asp:TemplateField HeaderText="ID" HeaderStyle-Width="250px" SortExpression="ID">
                                    <ItemTemplate>
                                        <asp:Label ID="lblID" runat="server" Text='<%#Eval("ID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>

                                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBannerName" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Item Order" SortExpression="ItemOrder">
                                    <ItemTemplate>
                                        <asp:Label ID="lblOrder" runat="server" Text='<%#Eval("ItemOrder") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Edit" SortExpression="Edit">
                                    <ItemTemplate>
                                        <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandArgument='<%#Eval("ID") %>' CommandName="Editrec" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Delete" SortExpression="Delete">
                                    <ItemTemplate>
                                        <asp:Button ID="btnDelete" OnClientClick="return confirm('Are You Sure You Want to Delete this Banner');" runat="server" Text="Delete" CommandArgument='<%#Eval("ID") %>' CommandName="Deleterec" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>

                    </div>
                </div>
            </div>
            <!--/.content-->
        </div>

    </div>
    <!--/.span9-->
</asp:Content>
