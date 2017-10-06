<%@ Page Title="" Language="C#" MasterPageFile="~/PropertyNew.Master" AutoEventWireup="true"
    CodeBehind="Mortgage_Affordability_Calculator.aspx.cs" Inherits="Property.Mortgage_Affordability_Calculator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <div class="free_nw_cls_bg">
       <div class="col-md-12 col-sm-12">
       <div class="mortgage_calculator">
            <h2>Mortgage Payment Calculator</h2>
       <iframe frameborder="0" scrolling="no" id="mortgageAffordabilityIframe" class="en"
            name="mortgageAffordabilityIframe" src="http://www.ratehub.ca/widgets/payment-calc.php?lang=en&ac=954289">
        </iframe>
        <script type="text/javascript">            $('iframe').iFrameResize();</script>
    </div>
     <div class="calculater_developer">
            <h2>Mortgage calculator by  <img src="images/logo-small-right.png" alt="" title="" /></h2>
            </div>
    </div>
    </div>
</asp:Content>
