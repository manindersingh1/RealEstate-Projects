<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="DreamHouse.aspx.cs" Inherits="Property.Admin.DreamHouse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="span9">
        <div class="content">
            <div class="module">
                <div class="module-head">
                    <h3>Manage Dream House</h3>
                </div>
                <div class="module-body">
                    <div class="form-horizontal row-fluid">
                        <div class="control-group">
                            <label class="control-label" for="basicinput">Title`</label>
                            <div class="controls">
                                <asp:TextBox ID="txtName" runat="server" MaxLength="50" PlaceHolder="Title.." class="span8"></asp:TextBox>
                                <span class="help-inline">
                                    <asp:RequiredFieldValidator ID="revBanner" runat="server" ErrorMessage="Title required" Display="Dynamic"
                                        ControlToValidate="txtName" ValidationGroup="SavePage" SetFocusOnError="true"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </span>
                            </div>
                        </div>


                        <div class="control-group">
                            <label class="control-label" for="basicinput">Condos  Image</label>
                            <div class="controls">
                                <asp:FileUpload ID="updBannerImage" CssClass="multi" AllowMultiple="true" runat="server" />
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
                            <label class="control-label" for="basicinput">Price</label>
                            <div class="controls">
                                
                                <asp:TextBox ID="txtPrice" runat="server" MaxLength="50" PlaceHolder="Price.." class="span8"></asp:TextBox>
                                <span class="help-inline">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Comments required" Display="Dynamic"
                                        ControlToValidate="txtDescription" ValidationGroup="SavePage" SetFocusOnError="true"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </span>
                            </div>
                        </div>
                          <div class="control-group">
                            <label class="control-label" for="basicinput">Address</label>
                            <div class="controls">
                                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Height="90px" PlaceHolder="Address...." class="span8"></asp:TextBox>
                                <span class="help-inline">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Comments required" Display="Dynamic"
                                        ControlToValidate="txtDescription" ValidationGroup="SavePage" SetFocusOnError="true"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </span>
                            </div>
                        </div>
                     


                     <div class="control-group">
                            <label class="control-label" for="basicinput">Description</label>
                            <div class="controls">
                                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Height="90px" PlaceHolder="Description...." class="span8"></asp:TextBox>
                                <span class="help-inline">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Comments required" Display="Dynamic"
                                        ControlToValidate="txtDescription" ValidationGroup="SavePage" SetFocusOnError="true"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </span>
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
                                <asp:TemplateField HeaderText="Image" SortExpression="ID">
                                    <ItemTemplate>
                                        <img src='/admin/uploadfiles/<%#Eval("ImageUrl") %>' alt="" width="100px" height="100px" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--<asp:TemplateField HeaderText="ID" HeaderStyle-Width="250px" SortExpression="ID">
                                    <ItemTemplate>
                                        <asp:Label ID="lblID" runat="server" Text='<%#Eval("ID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>

                                <asp:TemplateField HeaderText="Title" SortExpression="Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBannerName" runat="server" Text='<%#Eval("Title") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Description" SortExpression="ItemOrder">
                                    <ItemTemplate>
                                        <asp:Label ID="lblOrder" runat="server" Text='<%#Eval("Description") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Edit" SortExpression="Edit">
                                    <ItemTemplate>
                                        <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandArgument='<%#Eval("Id") %>' CommandName="Editrec" />
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
