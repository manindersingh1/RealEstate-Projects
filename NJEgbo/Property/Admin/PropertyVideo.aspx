<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="PropertyVideo.aspx.cs" Inherits="Property.Admin.PropertyVideo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="span9">
        <div class="content">
            <div class="module">
                <div class="module-head">
                    <h3>Manage Property Video</h3>
                </div>
                <div class="module-body">
                    <div class="form-horizontal row-fluid">


                        <div class="control-group">
                            <label class="control-label" for="basicinput">Property Video</label>
                            <div class="controls">
                                <asp:FileUpload ID="updBannerImage" CssClass="multi" AllowMultiple="true" runat="server" />
                                <span class="help-inline">
                                    <asp:Image ID="imgbanner" Width="130px" runat="server" Visible="false" /></span>
                                <asp:HiddenField ID="hdnImg" runat="server" />
                                <asp:Label ID="lblbannersize" Style="color: red;" runat="server"></asp:Label>

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

                                        <video src="..//admin/uploadfiles/<%#Eval("Name") %>" controls="controls" width="150px" height="100px" />
                                    </ItemTemplate>
                                </asp:TemplateField>



                                <asp:TemplateField HeaderText="Name" SortExpression="ItemOrder">
                                    <ItemTemplate>
                                        <asp:Label ID="lblOrder" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Set Video" SortExpression="Edit">
                                    <ItemTemplate>
                                        <asp:Button ID="btnEdit" runat="server" Text="Set Video" CommandArgument='<%#Eval("Id") %>' CommandName="Editrec" />
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
