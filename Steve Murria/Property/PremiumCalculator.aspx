<%@ Page Title="" Language="C#" MasterPageFile="~/PropertyNew.Master" AutoEventWireup="true"
    CodeBehind="PremiumCalculator.aspx.cs" Inherits="Property.PremiumCalculator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="free_nw_cls_bg">
       <div class="col-md-12 col-sm-12">
       <div class="chmc_calculator">
            <h2>CMHC Premium Calculator</h2>
        <iframe frameborder="0" scrolling="no" id="premiumCalculatorIframe" class="en" name="premiumCalculatorIframe"
            src="http://www.ratehub.ca/widgets/payment-calc.php?cmhc=only&lang=en&ac=954289">
        </iframe>
        <script type="text/javascript">            $('iframe').iFrameResize();</script>
    </div>
     <div class="calculater_developer">
            <h2>CMHC calculator by  <img src="images/logo-small-right.png" alt="" title="" /></h2>
            </div>
    </div>
    </div>

</asp:Content>
