<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true"
    CodeBehind="SiteSettings.aspx.cs" Inherits="Property.Admin.SiteSettings" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ajaxtoolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </ajaxtoolkit:ToolkitScriptManager>
    <div class="span9">
        <div class="content">
            <div class="module">
                <div class="module-head">
                    <h3>Configuration</h3>
                </div>
                <div class="module-body">
                    <br />
                    <div class="form-horizontal row-fluid">
                        <div class="control-group">
                            <label class="control-label" for="basicinput">Title</label>
                            <div class="controls">
                                <asp:TextBox ID="txtTitle" runat="server" MaxLength="50" PlaceHolder="Title here..." class="span8"></asp:TextBox>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="basicinput">Description</label>
                            <div class="controls">
                                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" PlaceHolder="Description here..." class="span8"></asp:TextBox>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="basicinput">Keywords</label>
                            <div class="controls">
                                <asp:TextBox ID="txtKeywords" runat="server" PlaceHolder="Keywords here..." class="span8 tip"></asp:TextBox>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="basicinput">Copyright</label>
                            <div class="controls">
                                <div class="input-prepend">
                                    <span class="add-on">&copy;</span>
                                    <asp:TextBox ID="txtCopyright" runat="server" PlaceHolder="Copyright here..." class="span8"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="basicinput">Owner Phone Number</label>
                            <div class="controls">
                                <asp:TextBox ID="txtphone" runat="server" PlaceHolder="Owner Phone Number..." class="span8"></asp:TextBox>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="basicinput">Owner Mobile Number</label>
                            <div class="controls">
                                <asp:TextBox ID="txtmobile" runat="server" PlaceHolder="Owner Mobile Number..." class="span8"></asp:TextBox>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="basicinput">Owner Email</label>
                            <div class="controls">
                                <asp:TextBox ID="txtemail" runat="server" PlaceHolder="Owner Email..." class="span8"></asp:TextBox>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="basicinput">Fax</label>
                            <div class="controls">
                                <asp:TextBox ID="txtfax" runat="server" PlaceHolder="Fax.." class="span8"></asp:TextBox>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="basicinput">Favicon.ico</label>
                            <div class="controls">
                                <asp:FileUpload ID="UpdFavicon" runat="server" />
                                <asp:Image ID="imgfavicon" Width="32px" Height="32px" runat="server" Visible="false" />
                                <asp:ImageButton Style="margin-bottom: 66px; margin-left: 165px;" ImageUrl="../images/negative.png" OnClick="btnfavdelete_Click" ID="btnfavdelete" Text="Remove" runat="server" />
                            </div>
                        </div>
                          <div class="control-group">
                            <label class="control-label" for="basicinput">Header Logo</label>
                            <div class="controls">
                                <asp:FileUpload ID="updbanner" runat="server" />
                                <asp:Image ID="imgLogo" Width="200px" runat="server" Visible="false" />
                                <asp:Label ID="lblheaderlogo" runat="server"></asp:Label>
                                <asp:ImageButton Style="margin-bottom: 54px;" ImageUrl="../images/negative.png" OnClick="btnheaderlogodelete_Click" ID="btnheaderlogodelete" Text="Remove" runat="server" />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="basicinput">Footer Logo</label>
                            <div class="controls">
                                <asp:FileUpload ID="UpdLogo" runat="server" />
                                <asp:Image ID="Imgbanner" Width="200px" runat="server" Visible="false" />
                                <asp:Label ID="lbllogo" runat="server"></asp:Label>
                                <asp:ImageButton Style="margin-bottom: 54px;" ImageUrl="../images/negative.png" OnClick="btnlogodelete_Click" ID="btnlogodelete" Text="Remove" runat="server" />
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="basicinput">Site Brokerage</label>
                            <div class="controls">
                                <asp:DropDownList style="width: 65%;" ID="ddlbrokerage" runat="server"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="basicinput">Site Template</label>
                            <div class="controls">
                                <asp:TextBox ID="txtSiteTemplate" runat="server" PlaceHolder="Site Template.." class="span8"></asp:TextBox>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="basicinput">Banner Settings</label>
                            <div class="controls">
                                <asp:TextBox ID="txtBanner" runat="server" PlaceHolder="Banner Settings..." class="span8"></asp:TextBox>
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-primary" OnClick="btnSave_Click" />
                                <asp:Button ID="btnBack" class="btn" runat="server" Visible="false" Text="Back" OnClick="btnBack_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
