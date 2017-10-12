<%@ Page Title="" Language="C#" MasterPageFile="~/PropertyNew.Master" AutoEventWireup="true"
    CodeBehind="Registration.aspx.cs" Inherits="Property.Registration" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="../css/style_002.css" rel="stylesheet" />
    <link href="../slider/css/style.css" rel="stylesheet" />
    <link href="../css/shortcodes.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager runat="server" ID="update"></asp:ScriptManager>
    <div class="col-md-2 col-sm-2">
    </div>
    <div class="col-md-8 col-sm-8">
        <div class="wrapper_new">
            <div class="property-search-container">
                <div class="dt-sc-tabs-container" style="width: 100%;">
                    <ul class="dt-sc-tabs-frame">
                        <li><a class="current" href="#">User Registration</a></li>
                    </ul>
                    <div style="display: block;" class="dt-sc-tabs-frame-content">
                        <div>
                            <div class="login_input">
                                <label>
                                    Name</label>
                                <label style="color: red">*</label>
                                <asp:TextBox ID="txtName" runat="server" MaxLength="50" PlaceHolder="Name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Name is Required"
                                    ControlToValidate="txtName" ForeColor="Red" ValidationGroup="SaveRegInfo" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                    ControlToValidate="txtName" ErrorMessage="Only alphabets are allowed" ValidationGroup="SaveRegInfo"
                                    ForeColor="Red" Display="Dynamic" ValidationExpression="^[a-zA-Z ]+$"> </asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div>
                            <div class="login_input">
                                <label>
                                    Address</label>
                                <label style="color: red">*</label>
                                <asp:TextBox ID="txtAddress" runat="server" MaxLength="140" PlaceHolder="Address"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ErrorMessage="Address is Required"
                                    ControlToValidate="txtAddress" ForeColor="Red" ValidationGroup="SaveRegInfo"
                                    Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div>
                            <div class="login_input">
                                <label>
                                    City</label>
                                <label style="color: red">*</label>
                                <asp:TextBox ID="txtCity" runat="server" MaxLength="50" PlaceHolder="City"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvCity" runat="server" ErrorMessage="City is Required"
                                    ControlToValidate="txtCity" ForeColor="Red" ValidationGroup="SaveRegInfo" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div>
                            <div class="login_input">
                                <label>
                                    State</label>
                                <label style="color: red">*</label>
                                <asp:TextBox ID="txtState" runat="server" MaxLength="50" PlaceHolder="State"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvState" runat="server" ErrorMessage="State is Required"
                                    ControlToValidate="txtState" ForeColor="Red" ValidationGroup="SaveRegInfo" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div>
                            <div class="login_input">
                                <label>Phone Number</label>
                                <label style="color: red">*</label>
                                <asp:TextBox ID="txtPhoneNo" runat="server" MaxLength="50" PlaceHolder="Phone Number"></asp:TextBox>
                                <ajaxtoolkit:MaskedEditExtender runat="server" ID="mee" Mask="(999) 999-9999"
                                    TargetControlID="txtPhoneNo">
                                </ajaxtoolkit:MaskedEditExtender>
                                <asp:RequiredFieldValidator ID="reqPhoneno" runat="server" ErrorMessage="Phone Number Required " ControlToValidate="txtPhoneNo"
                                    ValidationGroup="SaveRegInfo" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationGroup="SaveRegInfo" runat="server" ErrorMessage="Invalid Phone no."
                                    ControlToValidate="txtPhoneNo" Display="Dynamic" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div>
                            <div class="login_input">
                                <label>
                                    E-mail</label>
                                <label style="color: red">*</label>
                                <asp:TextBox ID="txtUserName" runat="server" MaxLength="50" PlaceHolder="E-mail"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ErrorMessage="E-mail Required" ControlToValidate="txtUserName"
                                    ValidationGroup="SaveRegInfo" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    ControlToValidate="txtUserName" ForeColor="Red" ErrorMessage="Invalid email!" Display="Dynamic" ValidationGroup="SaveRegInfo">  
                                </asp:RegularExpressionValidator>

                            </div>
                        </div>
                        <div>
                            <div class="login_input">
                                <label>
                                    Password</label>
                                <label style="color: red">*</label>
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" MaxLength="50" PlaceHolder="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password is Required"
                                    ControlToValidate="txtPassword" Display="Dynamic" ForeColor="Red" ValidationGroup="SaveRegInfo"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div>
                            <div class="login_input">
                                <label>
                                    Confirm Password</label>
                                <label style="color: red">*</label>
                                <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password" MaxLength="50" Placeholder="Confirm Passowrd"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="reqConfirmPassword" runat="server" ErrorMessage="Confirm Password is Required"
                                    ControlToValidate="txtConfirm" ValidationGroup="SaveRegInfo" Display="Dynamic"
                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cmpPassword" runat="server" ControlToValidate="txtConfirm"
                                    ControlToCompare="txtPassword" ForeColor="Red" ValidationGroup="SaveRegInfo"
                                    Display="Dynamic" ErrorMessage="Password Don't Match"></asp:CompareValidator>
                            </div>
                        </div>
                        <div class="login_input_regstrtn">
                            <asp:Label ID="lblmsg" runat="server"></asp:Label>
                            <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="SaveRegInfo"
                                OnClick="btnSave_Click" />
                            <asp:Button ID="btnBack" runat="server" Style="clear: none;" Text="Back" OnClick="btnBack_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-2 col-sm-2">
    </div>
</asp:Content>
