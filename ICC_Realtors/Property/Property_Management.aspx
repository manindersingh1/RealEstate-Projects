<%@ Page Title="" Language="C#" MasterPageFile="~/PropertyNew.Master" AutoEventWireup="true"
    CodeBehind="Property_Management.aspx.cs" Inherits="Property.Property_Management" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <ajaxtoolkit:ToolkitScriptManager ID="fds" runat="server"></ajaxtoolkit:ToolkitScriptManager>
    <div>
        <div class="row frnt_line_cls">
            <div class="col-md-6 col-sm-6">
                <div class="contact_in_right">
                    <img src="images/contact-img-2_new.png" alt="" />
                </div>
            </div>
            <div class="col-md-6 col-sm-6">
                <div>
                    <img src="images/newconsnew.jpg" alt="" style="width: 100%" />
                </div>
                <div class="contact_in_left">
                    <div class="agent_input">
                        <p>
                            Name:<asp:RequiredFieldValidator ID="reqName" runat="server" ErrorMessage="*"
                                ControlToValidate="txtName" ValidationGroup="FreeHome" ForeColor="Red"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtName" CssClass="CTextBox" runat="server" PlaceHolder="Name" MaxLength="20"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                ControlToValidate="txtName" ErrorMessage="Only alphabets are allowed" ValidationGroup="FreeHome"
                                ForeColor="Red" Display="Dynamic" ValidationExpression="^[a-zA-Z ]+$"> </asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="FreeHome" runat="server" Display="Dynamic" ControlToValidate="txtName" ErrorMessage="Name required" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </p>
                    </div>
                    <div class="agent_input">
                        <p>
                            E-mail:
                          <asp:TextBox ID="txtEmail" CssClass="CTextBox" runat="server" PlaceHolder="Email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ValidationGroup="FreeHome" Display="Dynamic" ControlToValidate="txtEmail" ErrorMessage="EmailID required" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="rgeEmail" runat="server" ValidationGroup="FreeHome" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Invalid email address." />
                        </p>
                    </div>
                    <div class="agent_input">
                        <p>
                            Phone Number:
                             <asp:TextBox ID="txtPhoneno" CssClass="CTextBox" runat="server" PlaceHolder="Phone Number"></asp:TextBox>
                            <ajaxtoolkit:MaskedEditExtender runat="server" ID="mee" Mask="(999) 999-9999"
                                TargetControlID="txtPhoneno">
                            </ajaxtoolkit:MaskedEditExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ValidationGroup="FreeHome" Display="Dynamic" ControlToValidate="txtPhoneno" ErrorMessage="Phone No. required" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RequiredFieldValidator14" ValidationGroup="FreeHome" runat="server" ControlToValidate="txtPhoneno" Display="Dynamic"
                                ValidationExpression="^(\(\d{3}\) \d{3}-\d{4}|\d{3}-\d{3}-\d{4}|\d{10})$"
                                Text="Enter a valid phone number" ForeColor="Red" />
                        </p>
                    </div>
                    <div class="agent_input">
                        <asp:Label ID="lblResult" runat="server" ForeColor="Red"></asp:Label>
                        <asp:Button ID="btnSend" runat="server" Text="Send" CssClass="Sendbutton" Width="24%"
                            UseSubmitBehavior="false" ValidationGroup="FreeHome" OnClick="btnSend_Click" />
                    </div>
                </div>
            </div>


        </div>
    </div>
</asp:Content>



