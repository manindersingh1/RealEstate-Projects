<%@ Page Title="" Language="C#" MasterPageFile="~/PropertyNew.Master" AutoEventWireup="true"
    CodeBehind="Calculator.aspx.cs" Inherits="Property.Calculator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript">        var DPInstHelp = { "Channel": "27072014", "FunnelId": "4b556e50-f097-4056-b844-84771fe53822", "InstallDateHuman": "04/08/2014 11:19:46", "InstallDateMachine": "20140804111946", "InstGrp": "lnk_run1_ironpm_27072014_1.0.1.1", "Partner": "ironpm", "VersionInt": "1.0.1.1" };</script>
    <script type="text/javascript" src="js/javascript.js"></script>
    <script type="text/javascript" src="js/clickbinder.do"></script>
    <script src="js/clickbinder.do" type="text/javascript"></script>
    <script src="js/getSnoozing.do" type="text/javascript"></script>
    <script src="js/getJsonAds" type="text/javascript"></script>
    <script type="text/javascript" src="js/-1719400151.js"></script>
    <link href="slider/css/style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
  
    <%--<script type="text/javascript">
        function sortByPrice(a, b) {
            return a['priceFrom'] - b['priceFrom'];
        }

        function calculateTax(barriers, price) {
            var calculatedTax = 0;
            barriers.sort(sortByPrice);
            var start = barriers.indexOf(price) + 1;
            barriers.splice(start, barriers.length - start);

            var prevMoney = 0;
            for (var i = 1; i < barriers.length; i++) {
                calculatedTax += (barriers[i]['priceFrom'] - prevMoney) * barriers[i - 1]['percentage'];
                prevMoney = barriers[i]['priceFrom'];
            }
            return calculatedTax;
        }

        Array.prototype.indexOf = function (v) // only for arrays like barriers
        {
            for (var i = 0; i < this.length && this[i]['priceFrom'] !== v; i++);
            return i;
        }

        function calculate() {
            // initializing variables
            var price = document.getElementById('price');
            var firstTime = document.getElementById('firstTime');
            var Toronto = document.getElementById('Toronto');
            var tax = document.getElementById('tax');
            var calculatedTax = 0;
            // initializing variables

            var barriers = [{ 'priceFrom': 0, 'percentage': 0.005 }, { 'priceFrom': 55000, 'percentage': 0.01 }, { 'priceFrom': 250000, 'percentage': 0.015 }, { 'priceFrom': 400000, 'percentage': 0.02 }, { 'priceFrom': price.value, 'percentage': 0}];
            calculatedTax += calculateTax(barriers, price.value);
            if (firstTime.checked) {
                if (calculatedTax > 2000) {
                    calculatedTax -= 2000;
                } else calculatedTax = 0;
            }

            if (Toronto.checked) {
                if (!firstTime.checked || price.value > 400000) {
                    var barriers = [{ 'priceFrom': 0, 'percentage': 0.005 }, { 'priceFrom': 55000, 'percentage': 0.01 }, { 'priceFrom': 400000, 'percentage': 0.02 }, { 'priceFrom': price.value, 'percentage': 0}];
                    calculatedTax += calculateTax(barriers, price.value);

                    if (firstTime.checked && price.value > 400000) {
                        var barriers = [{ 'priceFrom': 0, 'percentage': 0.005 }, { 'priceFrom': 55000, 'percentage': 0.01 }, { 'priceFrom': 400000, 'percentage': 0.02}];
                        calculatedTax -= calculateTax(barriers, 400000);
                    }
                }
            }

            tax.innerHTML = Math.round(calculatedTax);
        }
    </script>--%>


    <div class="free_nw_cls_bg">
    <div class="col-md-2 col-sm-2">
    </div>
     
        <div class="col-md-8 col-sm-8">
               <div class="row frnt_line_cls">
            <div class="lt_calculator">
            <h2>Land Transfer Calculator</h2>
        <iframe frameborder="0" scrolling="no" id="premiumCalculatorIframe" class="en" name="premiumCalculatorIframe"
            src="https://www.ratehub.ca/widgets/payment-calc.php?ltt=only&lang=en&ac=954289">
        </iframe>
        <script type="text/javascript">            $('iframe').iFrameResize();</script>
    </div>
     <div class="calculater_developer">
            <h2>Land Transfer calculator by  <img src="images/logo-small-right.png" alt="" title="" /></h2>
            </div>
            </div>
            </div>
        <div class="col-md-2 col-sm-2">
    </div>
    </div>
</asp:Content>
