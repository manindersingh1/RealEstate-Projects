<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs"
    Inherits="Property.Admin.AdminDashboard" %>--%>

<%@ Page Title="" Language="C#" MasterPageFile="AdminMaster.Master" AutoEventWireup="true" ValidateRequest="false"
    CodeBehind="AdminDashboard.aspx.cs" Inherits="Property.Admin.AdminDashboard" %>

<%@ Register TagName="Logo" TagPrefix="uc" Src="~/Controls/logo.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="BoxMain">
        <section class="boxmenu">
                            <div class="box">
                                <a href="../Admin/SiteSettings.aspx">
                                    <img " src="../Images/Settings-icon.png"
                                        ></a>
                            </div>
                            <span>Site Configuration</span>        
                            </section>
     <%--   <section class="boxmenu">
                            <div class="box">
                                <a href="../Admin/ListOfPages.aspx">
                                    <img src="../Images/file_manager.png"
                                        ></a>
                            </div>
                            <span>Page Manager</span>        
                        </section>--%>
        <section class="boxmenu">
                            <div class="box">
                                <a href="../Admin/ListOfBlogs.aspx">
                                    <img  src="../Images/add_blog.png"
                                        ></a>
                            </div>
                            <span>Blog Manager</span>        
                        </section>
        <section class="boxmenu">
                            <div class="box">
                                <a href="../Admin/RegisteredUsers.aspx">
                                    <img  src="../Images/user-icon.png"
                                        ></a>
                            </div>
                            <span>Manage Users</span>        
                        </section>
        <section class="boxmenu">
                            <div class="box">
                                <a href="../Admin/Appointments.aspx">
                                    <img  src="../Images/appointments.png"
                                       ></a>
                            </div>
                            <span>Appointments</span>
                        </section>
        <%--  <section class="boxmenu">
                            <div class="box">
                                <a href="AdminRegistration.aspx?new=1">
                                    <img  src="../Images/add_user.png"
                                       ></a>
                            </div>
                            <span>Add Users</span>
                        </section>--%>
        <section class="boxmenu">
                            <div class="box">
                                <a href="features.aspx">
                                    <img  src="../Images/Features-icon.png"
                                       ></a>
                            </div>
                            <span>Feature Property</span>
                        </section>
        <section class="boxmenu">
                            <div class="box">
                                <a href="Banner.aspx">
                                    <img  src="../Images/banner_design.png"
                                       ></a>
                            </div>
                            <span>Manage Banner</span>
                        </section>
    </div>
</asp:Content>
