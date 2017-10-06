<%@ Page Title="" Language="C#" MasterPageFile="~/PropertyNew.Master" AutoEventWireup="true" CodeBehind="Change_Password.aspx.cs" Inherits="Property.Change_Password" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="slider/css/style.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/style_002.css" rel="stylesheet" />
    <link href="css/shortcodes.css" rel="stylesheet" />
     <div class="container">
    <div class="wrapper_new">
                <div class="property-search-container">
                    <div class="dt-sc-tabs-container" style="width: 100%;">
                        <div style="display: block;" class="dt-sc-tabs-frame-content">
                        <div id="divpassword" runat="server" >
                            <div class="property-type-module medium-module">
                                <div class="login_input">
                                    <label>
                                        Old Password</label>
                                    <asp:TextBox ID="oldpasword" runat="server" TextMode="Password" MaxLength="50" PlaceHolder="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Old Password is Required"
                                        ControlToValidate="oldpasword" ForeColor="Red" ValidationGroup="SaveRegInfo"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                          <div class="property-type-module medium-module">
                                <div class="login_input">
                                    <label>
                                       New Password</label>
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" MaxLength="50" PlaceHolder="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password is Required"
                                        ControlToValidate="txtPassword" ForeColor="Red" ValidationGroup="SaveRegInfo"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="property-type-module medium-module">
                                <div class="login_input">
                                    <label>
                                        Confirm Password</label>
                                    <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password" MaxLength="50" Placeholder="Confirm Passowrd"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="reqConfirmPassword" runat="server" ErrorMessage="Confirm Password is Required"
                                        ControlToValidate="txtConfirm" ValidationGroup="SaveRegInfo" Display="Dynamic"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="cmpPassword" runat="server" ControlToValidate="txtConfirm"
                                        ControlToCompare="txtPassword" ForeColor="Red" ValidationGroup="SaveRegInfo"
                                        Display="Dynamic" ErrorMessage="Password Don't Match"></asp:CompareValidator>
                                </div>
                            </div>
                             <div class="property-type-module medium-module">
                            <div class="login_input">
                                <asp:Label ID="Label1" runat="server"></asp:Label>
                                <asp:Button ID="btnChange" ValidationGroup="SaveRegInfo" runat="server" Style="clear: none; width:9%; float:left;" Text="Submit" OnClick="btnChange_Click" />
                            </div>
                            </div>
                            </div>

                         </div>
                        </div>
                    </div>
                    </div>
                </div>
          
</asp:Content>

