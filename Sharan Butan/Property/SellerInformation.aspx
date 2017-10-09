<%@ Page Title="" Language="C#" MasterPageFile="~/PropertyNew.Master" AutoEventWireup="true"
    CodeBehind="SellerInformation.aspx.cs" Inherits="Property.SellerInformation" %>
<%@ Register TagName="SearchBar" TagPrefix="uc" Src="~/Controls/SearchBar.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <div class="wrapper_new">
            <div class="Free-Home_new">
                <div class="sell_house">
                    <h3>
                        <a href="SellingyourHouse.aspx" target="_blank">Selling your House</a></h3>
                    <p>
                        Completing a Listing AgreementWhat is a Listing Agreement? It is a contract between
                you and the brokerage company that the agent represents.It is a framework for subsequent
                forms and negotiations. It’...
                    </p>
                    <a href="SellingyourHouse.aspx" target="_blank">...Detail</a>
                </div>
                <div class="sell_house">
                    <h3>
                        <a href="RenovatingResale.aspx" target="_blank">Renovating for resale</a></h3>
                    <p>
                        The money invested in improving your home will not always translate into an equivalent
                return in the selling price of your home. So careful planning is important if you
                want to increase the salability...
                    </p>
                    <a href="RenovatingResale.aspx" target="_blank">...Detail</a>
                </div>
                <div class="sell_house">
                    <h3>
                        <a href="CommonSellingMistakes.aspx" target="_blank">Common Selling Mistakes</a></h3>
                    <p>
                        Incorrect PricingEvery seller naturally wants to get the most money for his or her
                product. The most common mistake that causes sellers to get less than they hope
                for, however, is listing too high. L...
                    </p>
                    <a href="CommonSellingMistakes.aspx" target="_blank">...Detail</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
