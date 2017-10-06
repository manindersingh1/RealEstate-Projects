﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContactInfo.ascx.cs"
    Inherits="Property.ContactInfo" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<link href="../css/style.css" rel="stylesheet" />
<link href="../slider/css/style.css" rel="stylesheet" />
<link href="../css/style_002.css" rel="stylesheet" />
<link href="../css/shortcodes.css" rel="stylesheet" />
<style type="text/css">
    .AutoExtender {
        background: none repeat scroll 0 0 hsl(0, 0%, 96%);
        border: 1px solid #ccc;
        font-family: Verdana,Arial Black;
        font-size: 12px;
        font-weight: normal;
        height: auto;
        line-height: 20px;
        margin-top: -1px;
        position: absolute;
        width: 265px !important;
        z-index: 600001;
        padding-bottom: 10px;
        padding-top: 10px;
    }

    .AutoExtenderList {
        cursor: pointer;
        color: Black;
        width: 257px;
        padding-left: 7px;
        list-style-type: none;
    }

    .AutoExtenderHighlight {
        color: White;
        background-color: #006699;
        cursor: pointer;
        width: 257px;
        padding-left: 7px;
    }
</style>
<asp:ScriptManager ID="script" runat="server"></asp:ScriptManager>
<h2>Contact Info</h2>
<%--<div class="user">
    <div class="UserPic">
        <asp:Image ID="imgDealer" runat="server" />
    </div>
    <div class="UserInfo">
        <div class="Username">
            <asp:Label ID="lblDealerName" runat="server" Text="" ></asp:Label>
            <br />
            <asp:Label ID="lblDealerAddress" runat="server" Text=""></asp:Label>
        </div>
    </div>
</div>--%>
<div class="agent_input">
    <p>
        First Name:<%--<asp:RequiredFieldValidator  ID="reqFirstName" runat="server" ErrorMessage="*"
            ControlToValidate="txtFirstName" ValidationGroup="SaveContactInfo" ForeColor="Red"
            Display="Dynamic"></asp:RequiredFieldValidator>--%><label style="color: red">*</label>
    </p>

    <asp:TextBox ID="txtFirstName" CssClass="CTextBox" runat="server" PlaceHolder="First Name" MaxLength="20"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" ValidationGroup="SaveContactInfo" runat="server" Display="Dynamic" ControlToValidate="txtFirstName" ErrorMessage="First Name required" SetFocusOnError="true"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
        ControlToValidate="txtFirstName" ErrorMessage="Only alphabets are allowed" Display="Dynamic"
        ForeColor="Red" ValidationExpression="^[a-zA-Z ]+$"> </asp:RegularExpressionValidator>
</div>
<div class="agent_input">
    <p>
        Last Name:
        <%--<asp:RequiredFieldValidator ID="reqLastName" runat="server" ErrorMessage="*" ControlToValidate="txtLastName"
            ValidationGroup="SaveContactInfo" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>--%>
        <label style="color: red">*</label>
    </p>

    <asp:TextBox ID="txtLastName" CssClass="CTextBox" MaxLength="20" runat="server" PlaceHolder="Last Name"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ValidationGroup="SaveContactInfo" ForeColor="Red" runat="server" Display="Dynamic" ControlToValidate="txtLastName" ErrorMessage="Last Name required" SetFocusOnError="true"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
        ControlToValidate="txtLastName" ErrorMessage="Only alphabets are allowed" Display="Dynamic"
        ForeColor="Red" ValidationExpression="^[a-zA-Z ]+$"> </asp:RegularExpressionValidator>
</div>
<div class="agent_input">
    <p>
        E-mail:
      
    <asp:TextBox ID="txtEmail" CssClass="CTextBox" runat="server" PlaceHolder="Email"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ForeColor="Red" runat="server" ValidationGroup="SaveContactInfo" Display="Dynamic" ControlToValidate="txtEmail" ErrorMessage="EmailID required" SetFocusOnError="true"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="rgeEmail" runat="server" ValidationGroup="SaveContactInfo" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
            ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Invalid email address." />
</div>
<div class="agent_input">
    <p>
        Phone Number:   
        <label style="color: red">*</label>
    </p>
    <asp:TextBox ID="txtPhoneno" CssClass="CTextBox" runat="server" PlaceHolder="Phone Number"></asp:TextBox>
   
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="SaveContactInfo" Display="Dynamic" ControlToValidate="txtPhoneno" ErrorMessage="Phone no. required" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationGroup="SaveContactInfo" runat="server" ErrorMessage="Invalid Phone no."
        ControlToValidate="txtPhoneno" Display="Dynamic" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
</div>

<div class="agent_input">
    <p>
        Message
             <label style="color: red">*</label>
    </p>

    <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Height="90px" PlaceHolder="Message"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Message Required"
        ControlToValidate="txtMessage" ValidationGroup="SaveContactInfo" ForeColor="Red"
        Display="Dynamic"></asp:RequiredFieldValidator>
</div>
<div style="margin: 0 0 50px 0">
    <asp:Label ID="lblResult" runat="server" ForeColor="Red"></asp:Label>
    <asp:Button ID="btnSend" runat="server" Text="Send" CssClass="Sendbutton" Width="24%"
        UseSubmitBehavior="false" ValidationGroup="SaveContactInfo" OnClick="btnSend_Click" />
</div>

