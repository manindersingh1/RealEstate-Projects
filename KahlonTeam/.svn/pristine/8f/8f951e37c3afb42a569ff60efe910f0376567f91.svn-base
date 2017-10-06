<%@ Page Title="" Language="C#" MasterPageFile="~/Property_New.Master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="Property.Login" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <link href="css/style.css" rel="stylesheet" />
<link href="../css/style_002.css" rel="stylesheet" />
<link href="../css/shortcodes.css" rel="stylesheet" />
     <div class="container">
    <div class="col-md-3 col-sm-3"></div>
      <div class="col-md-6 col-sm-6">
    <div class="wrapper_new">
        <div class="property-search-container">
            <div class="dt-sc-tabs-container" style="width: 100%;">
                <ul class="dt-sc-tabs-frame">
                   
                    <li><a class="current" href="#">User Login</a></li>
                  
                </ul>
                <div style="display: block;" class="dt-sc-tabs-frame-content">
                    <asp:Label ID="ll" runat="server" CssClass="loginlabel" Text="Login to view the vow properties"></asp:Label>
                        <%--<li><a  href="#">Login to view the vow properties</a></li>--%>
                   <div class="login_input bckend_login">
                            <label>
                                Username</label>
                            <asp:TextBox ID="txtUserName" runat="server" MaxLength="50" PlaceHolder="Username"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ErrorMessage="User Name is Required"
                                ControlToValidate="txtUserName" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                     <div class="login_input bckend_login">
                            <label>
                                Password</label>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" MaxLength="50" PlaceHolder="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password is Required"
                                ControlToValidate="txtPassword" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                       <asp:Label ID="lblerror" runat="server" ForeColor="Red"></asp:Label>
                     <div class="login_input bckend_login">
                             
                                <asp:HyperLink ID="hlCreateUser" runat="server" NavigateUrl="~/Registration.aspx">Click Here To Register</asp:HyperLink>&nbsp
                               
                                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
                            </div>
                  </div>
            </div>
        </div>
    </div>
          </div>
       <div class="col-md-3 col-sm-3"></div>
         </div>
</asp:Content>
