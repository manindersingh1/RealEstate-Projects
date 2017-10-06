<%@ Page Title="" Language="C#" ValidateRequest="false" MasterPageFile="~/Admin/AdminMaster.Master"
    AutoEventWireup="true" CodeBehind="CreatePage.aspx.cs" Inherits="Property.Admin.CreatePage" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="span9">
        <div class="content">
            <div class="module">
                <div class="module-head">
                    <h3>Create Page</h3>
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
                            <label class="control-label" for="basicinput">Page Title</label>
                            <div class="controls">
                                <asp:TextBox ID="txtPageTitle" runat="server" MaxLength="355" Placeholder="Page Title.." class="span8"></asp:TextBox>
                                <span class="help-inline">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Title required"
                                        ControlToValidate="txtPageTitle" ForeColor="Red" ValidationGroup="SavePage" Display="Dynamic"></asp:RequiredFieldValidator>
                                </span>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="basicinput">Page Name</label>
                            <div class="controls">
                                <asp:TextBox ID="txtPageName" runat="server" MaxLength="50" PlaceHolder="Page Name.." class="span8"> </asp:TextBox>
                                <span class="help-inline">
                                    <asp:RequiredFieldValidator ID="rfvPageName" runat="server" ErrorMessage="Page name required"
                                        ControlToValidate="txtPageName" ForeColor="Red" ValidationGroup="SavePage" Display="Dynamic"></asp:RequiredFieldValidator>
                                </span>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="basicinput">Meta Tag</label>
                            <div class="controls">
                                <asp:TextBox ID="txtmetatag" runat="server" MaxLength="355" Placeholder="Meta Tag.." class="span8"></asp:TextBox>
                                <span class="help-inline">
                                    <asp:RequiredFieldValidator ID="rfvPageTitle" runat="server" ErrorMessage="Title required"
                                        ControlToValidate="txtPageTitle" ForeColor="Red" ValidationGroup="SavePage" Display="Dynamic"></asp:RequiredFieldValidator>
                                </span>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="basicinput">Meta Description</label>
                            <div class="controls">
                                <asp:TextBox ID="txtmetadiscription" runat="server" MaxLength="355" PlaceHolder="Description here..." class="span8 "></asp:TextBox>
                                <span class="help-inline">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Description required"
                                        ControlToValidate="txtmetadiscription" ForeColor="Red" ValidationGroup="SavePage" Display="Dynamic"></asp:RequiredFieldValidator></span>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="basicinput">Page Description</label>
                            <div class="controls">
                                <FCKeditorV2:FCKeditor ID="txtPageDescription" Value="Add Content To Your Page"
                                    Width="100%" runat="server">
                                </FCKeditorV2:FCKeditor>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="basicinput">Display Index</label>
                            <div class="controls">
                                <asp:DropDownList ID="drpDisplayIndex" runat="server" class="span8">
                                    <asp:ListItem Value="0" Text="--select--"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="1"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="2"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="3"></asp:ListItem>
                                    <asp:ListItem Value="4" Text="4"></asp:ListItem>
                                    <asp:ListItem Value="5" Text="5"></asp:ListItem>
                                    <asp:ListItem Value="6" Text="6"></asp:ListItem>
                                    <asp:ListItem Value="7" Text="7"></asp:ListItem>
                                    <asp:ListItem Value="8" Text="8"></asp:ListItem>
                                    <asp:ListItem Value="8" Text="9"></asp:ListItem>
                                    <asp:ListItem Value="8" Text="10"></asp:ListItem>
                                    <asp:ListItem Value="8" Text="11"></asp:ListItem>
                                    <asp:ListItem Value="8" Text="12"></asp:ListItem>
                                    <asp:ListItem Value="8" Text="13"></asp:ListItem>
                                    <asp:ListItem Value="8" Text="14"></asp:ListItem>
                                    <asp:ListItem Value="8" Text="15"></asp:ListItem>
                                    <asp:ListItem Value="8" Text="16"></asp:ListItem>
                                    <asp:ListItem Value="8" Text="17"></asp:ListItem>
                                    <asp:ListItem Value="8" Text="18"></asp:ListItem>
                                    <asp:ListItem Value="8" Text="19"></asp:ListItem>
                                    <asp:ListItem Value="8" Text="20"></asp:ListItem>
                                    <asp:ListItem Value="8" Text="8"></asp:ListItem>
                                    <asp:ListItem Value="8" Text="8"></asp:ListItem>
                                    <asp:ListItem Value="8" Text="8"></asp:ListItem>
                                    <asp:ListItem Value="8" Text="8"></asp:ListItem>
                                    <asp:ListItem Value="8" Text="8"></asp:ListItem>
                                </asp:DropDownList>
                                <span class="help-inline">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Display index required"
                                        InitialValue="0" ControlToValidate="drpDisplayIndex" ValidationGroup="SavePage"
                                        SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                </span>
                            </div>
                        </div>

                        <asp:Panel ID="PanelIncludeMenu" runat="server">
                            <div class="control-group">
                                <label class="control-label" for="basicinput">Include In Menu?</label>
                                <div class="controls">
                                    <label class="checkbox">
                                        <asp:CheckBox ID="chkincludeMenu" AutoPostBack="true" runat="server" OnCheckedChanged="chkincludeMenu_CheckedChanged" />
                                    </label>
                                </div>
                            </div>
                        </asp:Panel>

                        <asp:Panel ID="panelSubmenu" runat="server">
                            <div class="control-group">
                                <label class="control-label" for="basicinput">Include In Submenu?</label>
                                <div class="controls">
                                    <label class="checkbox">
                                        <asp:CheckBox ID="ChkSubmenu" AutoPostBack="true" runat="server" OnCheckedChanged="ChkSubmenu_CheckedChanged" />
                                    </label>
                                </div>
                            </div>
                        </asp:Panel>

                        <div class="control-group">
                            <label class="control-label" for="basicinput">Submenu Page</label>
                            <div class="controls">
                                <asp:DropDownList ID="drpSubmenuPage" Enabled="false" runat="server" class="span8">
                                </asp:DropDownList>
                                <span class="help-inline">
                                    <asp:RequiredFieldValidator ID="rfvScenario" runat="server" ErrorMessage="Submenu page required"
                                        InitialValue="0" ControlToValidate="drpSubmenuPage" ValidationGroup="SavePage"
                                        SetFocusOnError="true" ForeColor="Red"></asp:RequiredFieldValidator>
                                </span>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="basicinput">Page Location</label>
                            <div class="controls">
                                <asp:DropDownList ID="drpLocation" runat="server" class="span8">
                                    <asp:ListItem Value="0" Text="--select--"></asp:ListItem>
                                    <asp:ListItem Value="Header" Text="Header"></asp:ListItem>
                                    <asp:ListItem Value="Link" Text="Link"></asp:ListItem>
                                    <asp:ListItem Value="Footer" Text="Footer"></asp:ListItem>
                                </asp:DropDownList>
                                <span class="help-inline">
                                    <asp:RequiredFieldValidator ID="reqPageLocation" runat="server" ErrorMessage="Page Location is required"
                                        InitialValue="0" ControlToValidate="drpLocation" ValidationGroup="SavePage" SetFocusOnError="true"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </span>
                            </div>
                        </div>

                        <div class="control-group">
                            <div class="controls">
                                <asp:Button ID="btnSave" runat="server" Text="Submit" class="btn btn-primary" ValidationGroup="SavePage"
                                    OnClick="btnSave_Click" />
                                <asp:Button ID="btnBack" class="btn" runat="server" Text="Back" OnClick="btnBack_Click" />
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
