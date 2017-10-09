<%@ Page Title="" Language="C#" MasterPageFile="~/PropertyNew.Master" AutoEventWireup="true" CodeBehind="RealEstateNews.aspx.cs" Inherits="Property.RealEstateNews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="resultSearch" Visible="false" runat="server"></asp:Label>
    <asp:Literal ID="ltrLink" runat="server"></asp:Literal>
    <div>
        <div class="news_sction_bg">
            <asp:Repeater ID="grvRSS" runat="server" >
                <HeaderTemplate>
                    <div class="news_hding">
                        <h2>Real Estate News</h2>
                    </div>
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="news_sect">
                        <h2>
                            <asp:Label ID="Label1" Text='<%# Eval("title") %>' runat="server"></asp:Label>
                        </h2>
                        <div class="news_date">
                            <asp:Label ID="Label3" Text='<%# Eval("pubDate") %>' runat="server"></asp:Label>
                        </div>
                        <p>
                            <asp:Label ID="Label4" Text='<%# Eval("description") %> ' runat="server"></asp:Label>
                        </p>
                        <div class="news_butn">
                            <asp:HyperLink ID="HyperLink2" NavigateUrl='<%# Eval("link") %> ' Target="_blank" runat="server">Read More...</asp:HyperLink>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
