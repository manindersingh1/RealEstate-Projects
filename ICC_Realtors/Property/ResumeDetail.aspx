<%@ Page Title="" Language="C#" MasterPageFile="~/PropertyNew.Master" AutoEventWireup="true"
    CodeBehind="ResumeDetail.aspx.cs" Inherits="Property.ResumeDetail" %>

<%@ Register TagName="resumedetail" TagPrefix="uc" Src="~/Controls/resumedetail.ascx" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <div class="row frnt_line_cls">
            <div class="col-md-6 col-sm-6">
                <div class="contact_in_left">
                    <%--<uc:resumedetail ID="resumedetail" runat="Server"></uc:resumedetail>--%>
                    <uc:resumedetail runat="server" id="resumedetail" />
                </div>
            </div>
            <div class="col-md-6 col-sm-6">
                <div class="contact_in_right">
                    <img src="images/contact-img-2.png" alt="" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
