<%@ Page Title="" Language="C#" MasterPageFile="~/PropertyNew.Master" AutoEventWireup="true" CodeBehind="RealEstateNews.aspx.cs" Inherits="Property.RealEstateNews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/style_002.css" rel="stylesheet" />
    <link href="slider/css/style.css" rel="stylesheet" />
    <asp:Label ID="resultSearch" Visible="false" runat="server"></asp:Label>
    <asp:Literal ID="ltrLink" runat="server"></asp:Literal>
    <div>
        <div class="news_sction_bg">
            <asp:Repeater ID="grvRSS" runat="server" OnItemCommand="grvRSS_ItemCommand">
                <HeaderTemplate>
                      <div class="news_hding">
                        <h2>Real Estate News</h2>
                    </div>
                </HeaderTemplate>
                <ItemTemplate>
                  
                    <div class="news_sect">
                        <h2>
                            <asp:Label ID="Label1"  Text='<%# Eval("title") %>' runat="server"></asp:Label>
                        </h2>
                        <div class="news_date">
                            <asp:Label ID="Label3" Text='<%# Eval("pubDate") %>' runat="server"></asp:Label>
                        </div>
                        <p>
                            <asp:Label ID="Label4" Text='<%# Eval("description") %> ' runat="server"></asp:Label>
                        </p>
                        <div class="news_butn">
                            <asp:HyperLink ID="HyperLink2"  NavigateUrl='<%# Eval("link") %> ' Target="_blank" runat="server">Read More...</asp:HyperLink>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
<%--            <div class="changer" runat="server" id="pagesLink" visible="true">
                <table>
                    <tr>
                        <td>
                            <asp:LinkButton ID="lnkFirst" runat="server" Font-Bold="true" PostBackUrl="~/Search.aspx"
                                OnClick="lnkFirst_Click">First</asp:LinkButton>
                        </td>
                        <td>
                            <asp:LinkButton ID="lnkPrevious" runat="server" Font-Bold="true" Style="margin-left: 6px;" PostBackUrl="~/Search.aspx"
                                OnClick="lnkPrevious_Click">Prev</asp:LinkButton>
                        </td>
                        <td>
                            <asp:DataList ID="RepeaterPaging" runat="server" RepeatDirection="Horizontal" OnItemCommand="RepeaterPaging_ItemCommand"
                                OnItemDataBound="RepeaterPaging_ItemDataBound">
                                <ItemTemplate>
                                    <asp:LinkButton ID="Pagingbtn" runat="server" CommandArgument='<%# Eval("PageIndex") %>'
                                        CommandName="newpage" Text='<%# Eval("PageText") %> ' Width="20px"></asp:LinkButton>&nbsp&nbsp
                                </ItemTemplate>
                            </asp:DataList>
                        </td>
                        <td>
                            <asp:LinkButton ID="lnkNext" runat="server" Font-Bold="true" PostBackUrl="~/Search.aspx"
                                OnClick="lnkNext_Click">Next</asp:LinkButton>
                        </td>
                        <td>
                            <asp:LinkButton ID="lnkLast" runat="server" Style="margin-left: 6px;" Font-Bold="true" PostBackUrl="~/Search.aspx"
                                OnClick="lnkLast_Click">Last</asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </div>--%>
        </div>
    </div>
</asp:Content>
