<%@ Page Title="" Language="C#" MasterPageFile="~/PropertyNew.Master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="Property.Login" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

       <link href="../css/shortcodes.css" rel="stylesheet" />
    <link href="../css/style_002.css" rel="stylesheet" />
    <link href="slider/css/style.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <div class="col-md-3"></div>
    <div class="col-md-6" >
    <div class="wrapper_new">
        <div class="property-search-container">
            <div class="dt-sc-tabs-container" style="width: 100%;">
                <ul class="dt-sc-tabs-frame">
                    <li><a class="current" href="#">User Login</a></li>
                </ul>
                <div style="display: block;" class="dt-sc-tabs-frame-content">
                   <div class="pls_login">
                       <h5 style="color: red; font-weight: bold;">
                           Please login to View the Unlock properties
                       </h5>
                   </div>
                    <div>
                        <div class="login_input">
                            <label>
                                Username</label>
                            <asp:TextBox ID="txtUserName" runat="server" MaxLength="50" PlaceHolder="Username"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ErrorMessage="User Name is Required"
                                ControlToValidate="txtUserName" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div>
                        <div class="login_input">
                            <label>
                                Password</label>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" MaxLength="50" PlaceHolder="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password is Required"
                                ControlToValidate="txtPassword" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div>
                            <div class="login_input_1">
                                <asp:Label ID="lblerror" runat="server" ForeColor="Red"></asp:Label><br />
                                <asp:HyperLink ID="hlCreateUser" style="float:left;" runat="server" NavigateUrl="~/Registration.aspx">Click Here To Register</asp:HyperLink>&nbsp
                               
                                <asp:Button ID="btnLogin" CssClass="buttn_lgnn" runat="server" Text="Login" OnClick="btnLogin_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
        </div>
      <div class="col-md-3"></div>
</asp:Content>
