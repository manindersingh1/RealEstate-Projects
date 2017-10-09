<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" ValidateRequest="false" CodeBehind="AdminLogin.aspx.cs" Inherits="Property.Admin.AdminLogin" %>
<%@ Register TagName="UserLogin" TagPrefix="uc" Src="~/Controls/login.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link id="favicon" runat="server" rel="shortcut icon" type="image/x-icon" />
    <title>
        <asp:Literal ID="siteTitle" runat="server"></asp:Literal></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <uc:UserLogin ID="UserLogin" runat="server"></uc:UserLogin>
        </div>
    </form>
</body>
</html>

