﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Property_New.Master" AutoEventWireup="true"
    CodeBehind="Calculators.aspx.cs" Inherits="Property.Calculators" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <link href="slider/css/style.css" rel="stylesheet" />
        <link href="css/font.css" rel="stylesheet" />
    <div class="container">
        <div class="col-md-2 col-sm-2">
         </div>
         <div class="col-md-8 col-sm-8">
        <div class="Free-Home">
        <p><a href="../Calculator.aspx">
<b>Land Transfer Tax Calculator</b>
</a>
<br>
Determine the amount of land transfer tax you will have to pay. Note that land transfer tax is applied on the sale price only.
<br>
<br>
</p>
        <%--p><a href="../MortgageCalculator.aspx">
<b>Mortgage Loan Calculator</b>
<br>
</a>
Determine your estimated monthly payment and amortization schedule.
<br>
<br>
</p>--%>
            <div class="cal_none">
        <p>

<a class="link" href="../Mortgage_Affordability_Calculator.aspx">
<b>Mortgage Payment Calculator</b>
</a>
<br>
Can you buy your dream home? Find out just how much you can afford!
<br>
<br>
</p>
        <p>

<a class="link" href="../PremiumCalculator.aspx">
<b>CMHC Premium Calculator</b>
</a>
<br>
A tool to help you estimate the premium payable when you are purchasing a home. Simply enter the purchase price, down payment and the amortization period.
<br>
<br>
</p></div>
        </div>
        </div>
    </div>
     <div class="col-md-2 col-sm-2">
         </div>
</asp:Content>
