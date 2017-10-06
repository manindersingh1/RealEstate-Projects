<%@ Page Title="" Language="C#" MasterPageFile="~/PropertyNew.Master" AutoEventWireup="true"
    CodeBehind="ContactUs.aspx.cs" Inherits="Property.ContactUs" %>

<%@ Register TagName="ContactInfo" TagPrefix="uc" Src="~/Controls/ContactInfo.ascx" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<link href="../slider/css/style.css" rel="stylesheet" />
<link href="../css/style_002.css" rel="stylesheet" />
<link href="../css/shortcodes.css" rel="stylesheet" />
    <div class="row landing_page_p_pge">
    <div class="cls_cntc_us">

       
        <div class="col-md-6 col-sm-6">
            <div class="contact_in_left">
                <uc:ContactInfo ID="ContactInfo" runat="Server"></uc:ContactInfo>
            </div>
           
            </div>
         <div class="col-md-6 col-sm-6">
            <div class="contact_in_right">
                <img src="images/home.jpg"   alt=""/>
            </div>
             </div>
    </div></div>
</asp:Content>
