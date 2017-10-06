<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FeaturedProperties.ascx.cs"
    Inherits="Property.FeaturedProperties" %>
<div id="FeatureId" visible="false" runat="server">
    <asp:DataList ID="dlFeatured" runat="server" RepeatColumns="3" RepeatLayout="Flow" OnItemDataBound="dlFeatured_ItemDataBound">
        <ItemTemplate>
            <div class="right_section">
                <div class="box3">
                    <div class="boxx">
                         <div class="boxx-left" style="margin: 0px" >
                          <%--  <div class="top_sct_cntnt">
                              <h2>  <span>F</span>eatured Properties</h2>
                               
                            </div>--%>

                           <div class="property_areadesc">
                                <asp:Label ID="lblRemarksForClients" Visible="false" Text='<%# Eval("RemarksForClients")  %>' runat="server"></asp:Label>
                            </div>

                        </div>
                        <div class="top_sct_img">
                       <a href='../Featured_Properties.aspx'>
                                <img src='<%# Eval("pImage")%>' Class="imagebtn" alt="FeaturedProperty" title="Featured Property" height="144px" width="189px" /></a>

                        </div>
                    </div>
                    <br />
                    <br />
                </div>
            </div>
        </ItemTemplate>
        <SeparatorTemplate>
            <div class="seprater"></div>
        </SeparatorTemplate>
    </asp:DataList>
</div>

<div id="Div1" visible="false" runat="server">
    
            <div class="right_section">
                <div class="box3">
                    <div class="boxx">
                         <div class="boxx-left" style="margin: 0px" >
                          <%--  <div class="top_sct_cntnt">
                              <h2>  <span>F</span>eatured Properties</h2>
                               
                            </div>--%>

                           <div class="property_areadesc">
                            
                            </div>
                           
                        </div>
                        <div class="top_sct_imggg5">
                            
                       <a href='../Default_Properties.aspx'>
                                <img  src="images/ftrd_prprty2.jpg"   alt="FeaturedProperty" title="Featured Property"  /></a>

                        </div>
                        <%-- <div class="shadow_img">
                            <asp:Image src="images/shadow_img.png" runat="server" />
                        </div>--%>
                       
                    </div>
                    <br />
                    <br />
                </div>
            </div>
        
      
</div>