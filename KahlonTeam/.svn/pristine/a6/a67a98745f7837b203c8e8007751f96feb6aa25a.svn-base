<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" 
    CodeBehind="Add_Current_Flyer.aspx.cs" Inherits="Property.Admin.Add_Current_Flyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="span9">
        <div class="content">
            <div class="module">
                <div class="module-head">
                    <h3>Add Current Flyer</h3>
                </div>
                <div class="module-body">
                    <div class="form-horizontal row-fluid">
                        <div class="control-group">
                            <label class="control-label" for="basicinput">Current Flyer Image</label>
                            <div class="controls">
                                <asp:FileUpload ID="updBannerImage" runat="server" />
                                <span class="help-inline">
                                    <asp:Image ID="imgbanner" Width="130px" runat="server" Visible="false" /></span>
                                <asp:HiddenField ID="hdnImg" runat="server" />
                                <asp:Label ID="lblbannersize" Style="color: red; font-weight: bold;" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="control-group">
                            <div>
                                <asp:Label ID="Label1" Style="color: red; font-weight: bold; margin-left: 166px;" Text="Upload only .jpg and .jpeg file" runat="server"></asp:Label>
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
                        <asp:GridView ID="grdcurrentflyer" class="table table-striped table-bordered table-condensed" AutoGenerateColumns="False" OnRowCommand="GrdBlogList_RowCommand" PageSize="10" runat="server">
                            <Columns>
                                <asp:TemplateField HeaderText="Banner" SortExpression="ID">
                                    <ItemTemplate>
                                        <img src='/admin/uploadfiles/<%#Eval("FileName") %>' alt="" width="100px" height="100px" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete" SortExpression="Delete">
                                    <ItemTemplate>
                                        <asp:Button ID="btnDelete" class="btn btn-primary" OnClientClick="return confirm('Are You Sure You Want to Delete this flyer');" runat="server" Text="Delete" CommandArgument='<%#Eval("ID") %>' CommandName="Deleterec" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>