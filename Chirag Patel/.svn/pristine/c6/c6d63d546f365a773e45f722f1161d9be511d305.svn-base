<%@ Page Title="" Language="C#" ValidateRequest="false" MasterPageFile="~/Admin/AdminMaster.Master"
    AutoEventWireup="true" CodeBehind="CreateBlog.aspx.cs" Inherits="Property.Admin.CreateBlog" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="span9">
        <div class="content">
            <div class="module">
                <div class="module-head">
                    <h3>Create Blog</h3>
                </div>
                <div class="module-body">
                    <%--  <div class="alert">
                        <button type="button" class="close" data-dismiss="alert">×</button>
                        <strong>Warning!</strong> Something fishy here!
                    </div>--%>
                    <%--  <div class="alert alert-error">
                        <button type="button" class="close" data-dismiss="alert">×</button>
                        <strong>Error !</strong> <asp:Label ID="lblerror" runat="server"></asp:Label> 
                    </div>--%>
                    <%--<div class="alert alert-success">
                        <button type="button" class="close" data-dismiss="alert">×</button>
                        <strong>Well done!</strong> Now you are listening me :) 
                    </div>--%>
                    <br />

                    <div class="form-horizontal row-fluid">
                        <div class="control-group">
                            <label class="control-label" for="basicinput">Blog Title</label>
                            <div class="controls">
                                <asp:TextBox ID="txtBlogTitle" runat="server" MaxLength="355" PlaceHolder="Blog Title" class="span8"></asp:TextBox>
                                <span class="help-inline">
                                    <asp:RequiredFieldValidator ID="rfvBlogTitle" runat="server" ErrorMessage="Blog title required"
                                        ControlToValidate="txtBlogTitle" ForeColor="Red" ValidationGroup="SavePage" Display="Dynamic"></asp:RequiredFieldValidator>
                                </span>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="basicinput">Blog Name</label>
                            <div class="controls">
                                <asp:TextBox ID="txtBlogName" runat="server" MaxLength="50" PlaceHolder="Blog Name.." class="span8"></asp:TextBox>
                                <span class="help-inline">
                                    <asp:RequiredFieldValidator ID="rfvBlogName" runat="server" ErrorMessage="Blog name required"
                                        ControlToValidate="txtBlogName" ForeColor="Red" ValidationGroup="SavePage" Display="Dynamic"></asp:RequiredFieldValidator>
                                </span>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="basicinput">Blog Description</label>
                            <div class="controls">
                                <FCKeditorV2:FCKeditor ID="txtBlogDescription" Value="Add Content To Your Blog"
                                    Width="100%" runat="server">
                                </FCKeditorV2:FCKeditor>
                            </div>
                        </div>

                        <div class="control-group">
                            <div class="controls">
                                <asp:Button ID="btnSave" runat="server" Text="Submit" class="btn btn-primary" ValidationGroup="SavePage"
                                    OnClick="btnSave_Click" />
                                <asp:Button ID="btnBack" class="btn" Visible="false" runat="server" Text="Back" OnClick="btnBack_Click" />
                                <asp:Label ID="lblmsg" ForeColor="Red" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/.content-->
    </div>
    <!--/.span9-->

</asp:Content>
