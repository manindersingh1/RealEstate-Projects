<%@ Page Title="" Language="C#" MasterPageFile="~/PropertyNew.Master" AutoEventWireup="true"
    CodeBehind="ForgetPassword.aspx.cs" Inherits="Property.ForgetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="wrapper_new">
        <div class="property-search-container_new">
            <div class="dt-sc-tabs-container" style="width: 100%;">
                <div style="display: block;" class="dt-sc-tabs-frame-content">
                    <div class="property-type-module medium-module">
                        <h2 style="text-align: center;">
                            Forget Password</h2>
                        <%--  <hr style="width:100px;"/>--%>
                        <div class="login_input">
                            <label>
                                Email</label>
                            <asp:TextBox ID="txtEmail" runat="server" PlaceHolder="Email" MaxLength="50"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage=""
                                ControlToValidate="txtEmail" ForeColor="Red" ValidationGroup="forgotpassword" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="rgeEmail" runat="server" ValidationGroup="forgotpassword"
                                Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Invalid email address." />
                        </div>
                    </div>
                    <div class="property-type-module medium-module">
                        <div class="login_input_1">
                            <asp:Button ID="btnLogin" runat="server" Text="Send" ValidationGroup="forgotpassword"
                                OnClick="btnLogin_Click" />
                        </div>
                    </div>
                    <div class="property-type-module medium-module">
                        <div class="login_input">
                            <asp:Label ID="lblerror" runat="server" ForeColor="Red" Style="float: left; width: 100%;"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
</asp:Content>
