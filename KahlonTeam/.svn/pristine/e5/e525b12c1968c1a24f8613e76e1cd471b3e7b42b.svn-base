<%@ Page Title="" Language="C#" MasterPageFile="~/Property_New.Master" AutoEventWireup="true" CodeBehind="RealEstateNews.aspx.cs" Inherits="Property.RealEstateNews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/style_002.css" rel="stylesheet" />
    <link href="slider/css/style.css" rel="stylesheet" />
    <asp:Label ID="resultSearch" Visible="false" runat="server"></asp:Label>
    <asp:Literal ID="ltrLink" runat="server"></asp:Literal>
    <div class="col-md-12 col-sm-12">
        <div class="container">
        <div class="news_sction_bg">
            <div>
                <h2>
                    <asp:Label ID="real"  CssClass="real" runat="server" Text="Real Estate News"></asp:Label>
                </h2>
            </div>
            <asp:Repeater ID="grvRSS" runat="server" OnItemCommand="grvRSS_ItemCommand">
                <HeaderTemplate>
                </HeaderTemplate>
                
                <ItemTemplate>
                    
                    <div class="news_sect">
                      
                        <h2>
                            <asp:Label ID="Label1" Style="color: #366; font-size: 18px;" Text='<%# Eval("title") %>' runat="server"></asp:Label>
                        </h2>
                        <div>
                            <asp:Label ID="Label3" Text='<%# Eval("pubDate") %>' runat="server"></asp:Label>
                        </div>
                        <p>
                            <asp:Label ID="Label4" Text='<%# Eval("description") %> ' runat="server"></asp:Label>
                        </p>
                        <div>
                            <asp:HyperLink ID="HyperLink2" Style="color: #366; font-size: 16px;" NavigateUrl='<%# Eval("link") %> ' Target="_blank" runat="server">Read More...</asp:HyperLink>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
         
        </div>
            </div>
    </div>
</asp:Content>
