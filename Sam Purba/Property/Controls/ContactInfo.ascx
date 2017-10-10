<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContactInfo.ascx.cs"
    Inherits="Property.ContactInfo" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
   <link href="../css/style.css" rel="stylesheet" />
    <link href="../slider/css/style.css" rel="stylesheet" />
    <link href="../css/style_002.css" rel="stylesheet" />
    <link href="../css/shortcodes.css" rel="stylesheet" />
<div class="agent_input">
    <p>
        First Name: </p><asp:RequiredFieldValidator ID="reqFirstName" runat="server" ErrorMessage="*"
            ControlToValidate="txtFirstName" ValidationGroup="SaveContactInfo" ForeColor="Red"
            Display="Dynamic"></asp:RequiredFieldValidator>
   
    <asp:TextBox ID="txtFirstName" CssClass="CTextBox" runat="server" PlaceHolder="First Name" MaxLength="20"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="FreeHome" runat="server" Display="Dynamic" ControlToValidate="txtFirstName" ErrorMessage="FirstName required" SetFocusOnError="true"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
        ControlToValidate="txtFirstName" ErrorMessage="Only alphabets are allowed"
        ForeColor="Red" Display="Dynamic" ValidationExpression="^[a-zA-Z ]+$"> </asp:RegularExpressionValidator>
</div>
<div class="agent_input">
    <p>
        Last Name: </p>
        <asp:RequiredFieldValidator ID="reqLastName" runat="server" ErrorMessage="*" ControlToValidate="txtLastName"
            ValidationGroup="SaveContactInfo" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
   
    <asp:TextBox ID="txtLastName" CssClass="CTextBox" MaxLength="20" runat="server" PlaceHolder="Last Name"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ValidationGroup="FreeHome" runat="server" Display="Dynamic" ControlToValidate="txtLastName" ErrorMessage="LastName required" SetFocusOnError="true"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
        ControlToValidate="txtLastName" ErrorMessage="Only alphabets are allowed"
        ForeColor="Red" Display="Dynamic" ValidationExpression="^[a-zA-Z ]+$"> </asp:RegularExpressionValidator>
</div>
<div class="agent_input">
    <p>
        E-mail:
      </p>
    <asp:TextBox ID="txtEmail" CssClass="CTextBox" runat="server" PlaceHolder="Email"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ValidationGroup="FreeHome" Display="Dynamic" ControlToValidate="txtEmail" ErrorMessage="EmailID required" SetFocusOnError="true"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="rgeEmail" runat="server" ValidationGroup="FreeHome" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
            ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Invalid email address." />
</div>
<div class="agent_input">
    <p>
        Phone Number: 
        </p>     
    <asp:TextBox ID="txtPhoneno" CssClass="CTextBox" MaxLength="10" runat="server" PlaceHolder="Phone Number"></asp:TextBox>
   
        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ValidationGroup="FreeHome" Display="Dynamic" ControlToValidate="txtPhoneno" ErrorMessage="Phone No. required" SetFocusOnError="true"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="regPhone" ValidationGroup="DreamHome" runat="server" ControlToValidate="txtPhoneno"
            ValidationExpression="^(\(\d{3}\) \d{3}-\d{4}|\d{3}-\d{3}-\d{4}|\d{10})$"
            Text="Enter a valid phone number" Display="Dynamic" ForeColor="Red" />
</div>
<div class="agent_input">
    <p>
        Message: </p>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
        ControlToValidate="txtMessage" ValidationGroup="SaveContactInfo" ForeColor="Red"
        Display="Dynamic"></asp:RequiredFieldValidator>
   
    <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Height="90px" PlaceHolder="Message"></asp:TextBox>
</div>
<div style="margin: 0 0 50px 0">
    <asp:Label ID="lblResult" runat="server" ForeColor="Red"></asp:Label>
    <asp:Button ID="btnSend" runat="server" Text="Send" CssClass="Sendbutton" Width="24%"
        UseSubmitBehavior="false" ValidationGroup="SaveContactInfo" OnClick="btnSend_Click" />
</div>

