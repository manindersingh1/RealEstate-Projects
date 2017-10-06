<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="Property.ForgetPassword" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
        <link type="text/css" href="/admin/admintemplate/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link type="text/css" href="/admin/admintemplate/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
        <link type="text/css" href="/admin/admintemplate/css/theme.css" rel="stylesheet">
        <link type="text/css" href="/admin/admintemplate/images/icons/css/font-awesome.css" rel="stylesheet">
        <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>

        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container">
                    <%-- <a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
                <i class="icon-reorder shaded"></i>
            </a>--%>

                    <a class="brand" href="../Default.aspx"> <img src="../images/ltst_logo-1.png" alt="Team Kahlon" width="270" id="Adminlogo" runat="server" />   </a>  

                    <div class="nav-collapse collapse navbar-inverse-collapse">

                        <ul class="nav pull-right">

                 <%--   <li><a href="#">Sign Up
                    </a></li>--%>



                    <li><a href="Admin/AdminLogin.aspx">Login
                    </a></li>
                </ul>
                    </div>
                    <!-- /.nav-collapse -->
                </div>
            </div>
            <!-- /navbar-inner -->
        </div>
        <!-- /navbar -->



        <div class="wrapper">
            <div class="container">
                <div class="row">
                    <div class="module module-login span4 offset4">
                        <form class="form-vertical">
                            <div class="module-head">
                                <h3>Forgot password</h3>
                            </div>
                            <div class="module-body">
                                <div class="control-group">
                                    <div class="controls row-fluid">
                                        <asp:TextBox ID="txtEmail" runat="server" PlaceHolder="Email" class="span12" MaxLength="50"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email-ID is required"
                                            ControlToValidate="txtEmail" ForeColor="Red" ValidationGroup="forgotpassword" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="rgeEmail" runat="server" ValidationGroup="forgotpassword"
                                            Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                            ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Invalid email address." />

                                    </div>
                                </div>
                            </div>
                            <div class="module-foot">
                                <div class="control-group">
                                    <div class="controls clearfix">
                                        <asp:Button ID="btnLogin" runat="server" Text="Send" class="btn btn-primary pull-right" ValidationGroup="forgotpassword"
                                            OnClick="btnLogin_Click" />
                                        <asp:Label ID="lblerror" runat="server" ForeColor="Red"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--/.wrapper-->

        <div class="footer">
            <div class="container">
                <b class="copyright">&copy; <asp:Label ID="lblCopyRight" runat="server"></asp:Label> </b>All rights reserved.
            </div>
        </div>
    </form>
</body>
</html>
