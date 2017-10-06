<%@ Page Title="" Language="C#" MasterPageFile="~/PropertyNew.Master" AutoEventWireup="true"
    CodeBehind="Calculators.aspx.cs" Inherits="Property.Calculators" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="free_nw_cls_bg">
<div class="col-md-2 col-sm-2"></div>
    <div class="col-md-8 col-sm-8">
    <div class="wrapper_new">
        <div class="Free-Home_calculator">
            <div class="cal_new_cls">
                <h2>
                    <a href="../Calculator.aspx">Land Transfer Tax Calculator
                    </a>
                </h2>
                <p>
                    Determine the amount of land transfer tax you will have to pay. Note that land transfer tax is applied on the sale price only.
                </p>
            </div>
           <%-- <div class="cal_new_cls">
                <h2>
                    <a href="../MortgageCalculator.aspx">Mortgage Loan Calculator

                    </a>
                </h2>
                <p>
                    Determine your estimated monthly payment and amortization schedule.
                </p>
            </div>--%>
            <div class="cal_new_cls hide_cal_new">
                <h2>

                    <a class="link" href="../Mortgage_Affordability_Calculator.aspx">Mortgage Payment Calculator
                    </a></h2>
                <p>
                    Can you buy your dream home? Find out just how much you can afford!
                </p>
            </div>
            <div class="cal_new_cls hide_cal_new">
                <h2>
                    <a class="link" href="../PremiumCalculator.aspx">CMHC Premium Calculator
                    </a></h2>
                <p>
                    A tool to help you estimate the premium payable when you are purchasing a home. Simply enter the purchase price, down payment and the amortization period.
                </p>
            </div>
        </div>
        </div>
    </div>
    <div class="col-md-2 col-sm-2"></div></div>
</asp:Content>
