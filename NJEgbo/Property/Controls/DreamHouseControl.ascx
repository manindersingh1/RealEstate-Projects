<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DreamHouseControl.ascx.cs" Inherits="Property.Controls.DreamHouseControl" %>
<div class="col-md-4">
    <asp:Label ID="count" CssClass="count_label" runat="server"></asp:Label>
</div>
<div class="col-md-4">
</div>



<div class="In_bg">
     
    <asp:Label ID="resultSearch" CssClass="in_bg_label_property" Visible="false" runat="server"></asp:Label>
    <asp:UpdatePanel ID="upSearch" runat="server" UpdateMode="Conditional" Visible="false">
        <ContentTemplate>

            <div id="DivGridSearch" runat="server" style="display: none" class="In_bg">
                <asp:Repeater ID="rptSearchResults" runat="server" > 
                    <HeaderTemplate>
                        <div class="row nooo_mrgnnn">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="col-md-3 col-sm-3">
                            <asp:HyperLink ID="hypBoxDetail" runat="server">
                                <div class="boxx_construction">
                                    <asp:HiddenField ID="Id" runat="server" Value='<%# Eval("Id") %>' />
                                    <div class="search_boxx_left2">
                                        <img src='/admin/uploadfiles/<%# Eval("ImageUrl")%>' alt='' title='' width="180px" height="134">
                                    </div>
                                    <div class="construction_bg">
                                       <div class="construction_hdng"><span><%# Eval("Title") %></span></div>
                                        <div class="construction_price"><span><%# Eval("Price") %></span></div>
                                        
                                            
                                                                            <div class="text_bg_bottom">                                        
                                         <asp:HyperLink ID="hypBoxreadmore" NavigateUrl='<%# Eval("Id", "~/DreamHouseDetail.aspx?ID={0}") %>' CssClass="read_more_btn3" Text="Read More" runat="server"></asp:HyperLink>
                                        </div>
                                      
                                    </div>
                                </div>
                            </asp:HyperLink>
                        </div>
                    </ItemTemplate>
                  
                    <FooterTemplate>
                        </div>

                    </FooterTemplate>

                </asp:Repeater>
               
            </div>          
  <div id="DivListSearch" runat="server" style="display: block" class="In_bg">
                <asp:Repeater ID="rptSearchResultList" runat="server"  >
                    <HeaderTemplate>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="search_boxx_list_5">                            
                            <div class="search_boxx_right_bg">
                                 <asp:HiddenField ID="Id" runat="server" Value='<%# Eval("Id") %>' />
                                <asp:HyperLink ID="hypImage" runat="server">
                                        <div class="search_boxx_left">
                                            <img src='<%# Eval("ImageUrl")%>' alt='' title='<%# Eval("Title")%>' width="180px"
                                                height="134">
                                        </div>
                                </asp:HyperLink>
                                <span>
                                    <asp:HyperLink ID="hypAddress" runat="server"><%# Eval("Title") %></asp:HyperLink></span>
                                <div class="para">
                                    <p>
                                        <%# Eval("Description") %>
                                    </p>
                                    <p>


                                       <%-- <asp:HyperLink ID="hypBoxreadmore" NavigateUrl="~/DreamHouseDetail.aspx?ID=" CssClass="read_more_btn3" Text="Read More" runat="server"></asp:HyperLink>--%>
                                    </p>
                                </div>

                            </div>
                      
                        </div>
                    </ItemTemplate>
                
                </asp:Repeater>
               
            </div>
        </ContentTemplate>
       <%-- <Triggers>
            <asp:AsyncPostBackTrigger ControlID="lnkNext" EventName="Click" />
        </Triggers>--%>
    </asp:UpdatePanel>
    <div class="col-md-3 col-sm-3">
          <div class="count_date">
        <asp:Label ID="lbldate" Style="float: right;" runat="server"></asp:Label>
    </div></div>
 <div class="col-md-4 col-sm-4">
       
    </div>
    <div class="col-md-5 col-sm-5">
   <%-- <div class="changer table-responsive" runat="server" id="pagesLink" visible="true">
        <table class="table">
            <tr>
                <td>
                    <asp:LinkButton ID="lnkFirst" runat="server" Font-Bold="true" PostBackUrl="~/Search.aspx"
                         >First</asp:LinkButton>
                </td>
                <td>
                    <asp:LinkButton ID="lnkPrevious" runat="server" Font-Bold="true" Style="margin-left: 6px;" PostBackUrl="~/Search.aspx"
                        >Prev</asp:LinkButton>
                </td>
                <td>
                    <asp:DataList ID="RepeaterPaging" runat="server" RepeatDirection="Horizontal"  >
                        <ItemTemplate>
                            <asp:LinkButton ID="Pagingbtn" runat="server" CommandArgument='<%# Eval("PageIndex") %>'
                                CommandName="newpage" Text='<%# Eval("PageText") %> ' Width="20px"></asp:LinkButton>&nbsp&nbsp
                        </ItemTemplate>
                    </asp:DataList>
                </td>
                <td>
                    <asp:LinkButton ID="lnkNext" runat="server" Font-Bold="true" PostBackUrl="~/Search.aspx"
                         >Next</asp:LinkButton>
                </td>
                <td>
                    <asp:LinkButton ID="lnkLast" runat="server" Style="margin-left: 6px;" Font-Bold="true" PostBackUrl="~/Search.aspx"
                        >Last</asp:LinkButton>
                </td>
            </tr>
        </table>
    </div>--%>
        </div>
    </div>
  