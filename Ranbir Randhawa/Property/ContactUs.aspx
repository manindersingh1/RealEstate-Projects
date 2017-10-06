<%@ Page Title="" Language="C#" MasterPageFile="~/PropertyNew.Master" AutoEventWireup="true"
    CodeBehind="ContactUs.aspx.cs" Inherits="Property.ContactUs" %>

<%@ Register TagName="ContactInfo" TagPrefix="uc" Src="~/Controls/ContactInfo.ascx" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <div class="row frnt_line_cls">
            <div class="col-md-12 col-sm-12">
                <div class="cnt_hdng">
                    <h2>Contact us</h2>
                </div>
            </div>
            <div class="col-md-6 col-sm-6">

                <div class="contact_in_left">
                    <uc:ContactInfo ID="ContactInfo" runat="Server"></uc:ContactInfo>
                </div>

            </div>
            <div class="col-md-6 col-sm-6">
                <div class="contact_in_right">
                    <img src="images/contact_imgg_new.png" alt="" />
                </div>
            </div>
        </div></div>
</asp:Content>
