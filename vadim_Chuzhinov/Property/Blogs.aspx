<%@ Page Title="" Language="C#" MasterPageFile="~/PropertyNew.Master" AutoEventWireup="true"
    CodeBehind="Blogs.aspx.cs" Inherits="Property.Blog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="wrapper_new">
        <div class="property-search-container">
            <div class="dt-sc-tabs-container" style="width: 100%;">
                <ul class="dt-sc-tabs-frame">
                    <li><a class="current" href="#">Blogs</a></li>
                </ul>
                <div style="display: block;" class="dt-sc-tabs-frame-content">
                        <asp:Repeater ID="rptBlog" runat="server">
                            <ItemTemplate>
                                <div class="blog_bg"> 
                                    <div class="Blog_section">
                                        <h1>
                                        <%#Eval("PageTitle") %></h1>
                                        <hr />
                                    <p>
                                       <%#Eval("PageDescription") %></p>
                                    </div>
                                    
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
