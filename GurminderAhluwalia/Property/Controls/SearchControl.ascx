<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchControl.ascx.cs" Inherits="Property.Controls.SearchControl" %>
<div class="col-md-4">
    <asp:Label ID="count" CssClass="count_label" runat="server"></asp:Label>
</div>
<div class="col-md-4">
</div>
<div class="col-md-4">
    <div class="rr">
        <asp:ImageButton ID="btnGridView" ImageUrl="~/images/grid-button.png" runat="server"
            ToolTip="Grid View" OnClick="btnGridView_Click"></asp:ImageButton>
        <asp:ImageButton ID="btnListView" ImageUrl="~/images/list-button.png" runat="server"
            ToolTip="List View" OnClick="btnListView_Click"></asp:ImageButton>
    </div>
</div>


<div class="In_bg">
     
    <asp:Label ID="resultSearch" CssClass="in_bg_label_property" Visible="false" runat="server"></asp:Label>
    <asp:UpdatePanel ID="upSearch" runat="server" UpdateMode="Conditional" Visible="false">
        <ContentTemplate>

            <div id="DivGridSearch" runat="server" style="display: none" class="In_bg">
                <asp:Repeater ID="rptSearchResults" runat="server" OnItemCommand="rptSearchResults_ItemCommand"
                    OnItemDataBound="rptSearchResults_ItemDataBound">

                    <HeaderTemplate>
                        <div class="row nooo_mrgnnn">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="col-md-3 col-sm-3">
                            <asp:HyperLink ID="hypBoxDetail" runat="server">
                                <div class="search_boxx">
                                    <asp:HiddenField ID="hdnMLSID" runat="server" Value='<%# Eval("MLS") %>' />
                                    <asp:HiddenField ID="hdnVOX" runat="server" Value='<%# Eval("VOX") %>' />
                                    <asp:HiddenField ID="hdnType" runat="server" Value='<%# Eval("pType") %>' />
                                    <asp:HiddenField ID="hdnShowAddress" runat="server" Value='<%# Eval("DisplayAddressOnInternet") %>' />
                                    <asp:HiddenField ID="hdnAddress" runat="server" Value='<%# Eval("Address")%>' />
                                    <asp:HiddenField ID="hdnprovince" runat="server" Value='<%# Eval("province") %>' />
                                    <asp:HiddenField ID="hdnPostalCode" runat="server" Value='<%# Eval("PostalCode") %>' />
                                    <div class="search_boxx_left2">
                                        <img src='<%# Eval("pImage")%>' alt='<%# Eval("Style")%> in <%# Eval("Area")%>' title='<%# Eval("Area")%>'
                                            width="180px" height="134">
                                    </div>
                                    <div class="text_bg">
                                        <h2>$<%# Eval("ListPrice")%></h2>
                                        <span><%# Eval("Address") %>,<%# Eval("Municipality") %><br /><%# Eval("PostalCode")%>, <%# Eval("province") %></span><p>
                                            <%# Eval("Bedrooms")%>
                                                        Beds,
                                                        <%# Eval("Washrooms").ToString()  == null ? "" : Eval("Washrooms").ToString() + " Baths" %>
                                        </p>
                                        <div class="text_bg_bottom">
                                            <asp:Button ID="btnDetails" runat="server" Text="Details" CssClass="detail" CommandName="Details"
                                                CommandArgument='<%# Eval("MLS") %>' ToolTip="Click For Details" CausesValidation="false" />
                                        </div>
                                        <div class="text_bg_bottom_right">
                                            <asp:ImageButton ID="btnlock" ImageUrl="~/images/lock.png" Visible='<%#Convert.ToBoolean(Eval("VOX")) == true%>'
                                                CommandName="LockButton" CommandArgument='<%# Eval("MLS")%>' runat="server" ToolTip="Click to Unlock"></asp:ImageButton>
                                        </div>
                                    </div>
                                </div>
                            </asp:HyperLink>
                        </div>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <div class="col-md-3 col-sm-3">
                            <asp:HyperLink ID="hypBoxDetail" runat="server">
                                <div class="search_boxx">
                                    <asp:HiddenField ID="hdnMLSID" runat="server" Value='<%# Eval("MLS") %>' />
                                    <asp:HiddenField ID="hdnVOX" runat="server" Value='<%# Eval("VOX") %>' />
                                    <asp:HiddenField ID="hdnType" runat="server" Value='<%# Eval("pType") %>' />
                                    <asp:HiddenField ID="hdnShowAddress" runat="server" Value='<%# Eval("DisplayAddressOnInternet") %>' />
                                    <asp:HiddenField ID="hdnAddress" runat="server" Value='<%# Eval("Address") %>' />
                                    <asp:HiddenField ID="hdnprovince" runat="server" Value='<%# Eval("province") %>' />
                                    <asp:HiddenField ID="hdnPostalCode" runat="server" Value='<%# Eval("PostalCode") %>' />
                                    <div class="search_boxx_left2">
                                        <img src='<%# Eval("pImage")%>' title='<%# Eval("Style")%> in <%# Eval("Area")%>'
                                            alt='<%# Eval("Style")%> in <%# Eval("Area")%>' width="180px" height="134">
                                    </div>
                                    <div class="text_bg">
                                        <h2>$<%# Eval("ListPrice")%></h2>
                                        <span><%# Eval("Address") %>,<%# Eval("Municipality") %><br /><%# Eval("PostalCode")%>, <%# Eval("province") %></span><p>
                                            <%# Eval("Bedrooms")%>
                                                        Beds,
                                                        <%# Eval("Washrooms")%>
                                                        Baths
                                        </p>
                                        <div class="text_bg_bottom">
                                            <asp:Button ID="btnDetails" runat="server" Text="Details" CssClass="detail" CommandName="Details"
                                                CommandArgument='<%# Eval("MLS") %>' ToolTip="Click For Details" CausesValidation="false" />
                                        </div>
                                        <div class="text_bg_bottom_right">
                                            <asp:ImageButton ID="btnlock" ImageUrl="~/images/lock.png" Visible='<%#Convert.ToBoolean(Eval("VOX")) == true%>'
                                                CommandName="LockButton" CommandArgument='<%# Eval("MLS")%>' runat="server" ToolTip="Click to Unlock"></asp:ImageButton>
                                        </div>
                                    </div>
                                </div>
                            </asp:HyperLink>
                        </div>
                    </AlternatingItemTemplate>
                    <FooterTemplate>
                        </div>

                    </FooterTemplate>

                </asp:Repeater>
                <asp:Repeater ID="rptSearchCommercialResult" runat="server" OnItemCommand="rptSearchCommercialResult_ItemCommand"
                    OnItemDataBound="rptSearchCommercialResult_ItemDataBound">
                     <HeaderTemplate>
                        <div class="row nooo_mrgnnn">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="col-md-3 col-sm-3">
                    
                        <asp:HyperLink ID="hypBoxDetail" runat="server">
                            <div class="search_boxx">
                                <asp:HiddenField ID="hdnMLSID" runat="server" Value='<%# Eval("MLS") %>' />
                                <asp:HiddenField ID="hdnVOX" runat="server" Value='<%# Eval("VOX") %>' />
                                <asp:HiddenField ID="hdnType" runat="server" Value='<%# Eval("pType") %>' />
                                <asp:HiddenField ID="hdnShowAddress" runat="server" Value='<%# Eval("DisplayAddressOnInternet") %>' />
                                <asp:HiddenField ID="hdnAddress" runat="server" Value='<%# Eval("Address") %>' />
                                <asp:HiddenField ID="hdnprovince" runat="server" Value='<%# Eval("province") %>' />
                                <asp:HiddenField ID="hdnPostalCode" runat="server" Value='<%# Eval("PostalCode") %>' />
                                <div class="search_boxx_left2">
                                    <img src='<%# Eval("pImage")%>' alt='<%# Eval("Area")%>' width="180px" height="134">
                                </div>
                                <div class="text_bg">
                                    <h2>$<%# Eval("ListPrice")%></h2><span><%# Eval("Address") %>, <%# Eval("Municipality") %>, <%# Eval("PostalCode")%>, <%# Eval("province") %></span><p>
                                        <%# Eval("Washrooms")%>
                                                        Baths
                                    </p>
                                    <div class="text_bg_bottom">
                                        <asp:Button ID="btnDetails" runat="server" Text="Details" CssClass="detail" CommandName="Details"
                                            CommandArgument='<%# Eval("MLS") %>' ToolTip="Click For Details" CausesValidation="false" />
                                    </div>
                                    <div class="text_bg_bottom_right">
                                        <asp:ImageButton ID="btnlock" ImageUrl="~/images/lock.png" Visible='<%#Convert.ToBoolean(Eval("VOX")) == true%>'
                                            CommandName="LockButton" CommandArgument='<%# Eval("MLS")%>' runat="server" ToolTip="Click to Unlock"></asp:ImageButton>
                                    </div>
                                </div>
                            </div>
                        </asp:HyperLink>
                            </div>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                         <div class="col-md-3 col-sm-3">
                        <asp:HyperLink ID="hypBoxDetail" runat="server">
                            <div class="search_boxx">
                                <asp:HiddenField ID="hdnMLSID" runat="server" Value='<%# Eval("MLS") %>' />
                                <asp:HiddenField ID="hdnVOX" runat="server" Value='<%# Eval("VOX") %>' />
                                <asp:HiddenField ID="hdnType" runat="server" Value='<%# Eval("pType") %>' />
                                <asp:HiddenField ID="hdnShowAddress" runat="server" Value='<%# Eval("DisplayAddressOnInternet") %>' />
                                <asp:HiddenField ID="hdnAddress" runat="server" Value='<%# Eval("Address") %>' />
                                <asp:HiddenField ID="hdnprovince" runat="server" Value='<%# Eval("province") %>' />
                                <asp:HiddenField ID="hdnPostalCode" runat="server" Value='<%# Eval("PostalCode") %>' />
                                <div class="search_boxx_left2">
                                    <img src='<%# Eval("pImage")%>' alt='<%# Eval("Area")%>' width="180px" height="134">
                                </div>
                                <div class="text_bg">
                                    <h2>$<%# Eval("ListPrice")%></h2><span><%# Eval("Address") %>, <%# Eval("Municipality") %>, <%# Eval("PostalCode")%>, <%# Eval("province") %></span><p>
                                        <%# Eval("Washrooms")%>
                                                        Baths
                                    </p>
                                    <div class="text_bg_bottom">
                                        <asp:Button ID="btnDetails" runat="server" Text="Details" CssClass="detail" CommandName="Details"
                                            CommandArgument='<%# Eval("MLS") %>' ToolTip="Click For Details" CausesValidation="false" />
                                    </div>
                                    <div class="text_bg_bottom_right">
                                        <asp:ImageButton ID="btnlock" ImageUrl="~/images/lock.png" Visible='<%#Convert.ToBoolean(Eval("VOX")) == true%>'
                                            CommandName="LockButton" CommandArgument='<%# Eval("MLS")%>' runat="server" ToolTip="Click to Unlock"></asp:ImageButton>
                                    </div>
                                </div>
                            </div>
                        </asp:HyperLink>
                             </div>
                    </AlternatingItemTemplate>
                    <FooterTemplate>
                        </div>
                    </FooterTemplate>
                </asp:Repeater>
                <asp:Repeater ID="rptSearchCondoResult" runat="server" OnItemCommand="rptSearchCondoResult_ItemCommand"
                    OnItemDataBound="rptSearchCondoResult_ItemDataBound">
                    <HeaderTemplate>
                        <div class="row nooo_mrgnnn">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="col-md-3 col-sm-3">
                        <asp:HyperLink ID="hypBoxDetail" runat="server">
                            <div class="search_boxx">
                                <asp:HiddenField ID="hdnMLSID" runat="server" Value='<%# Eval("MLS") %>' />
                                <asp:HiddenField ID="hdnVOX" runat="server" Value='<%# Eval("VOX") %>' />
                                <asp:HiddenField ID="hdnType" runat="server" Value='<%# Eval("pType") %>' />
                                <asp:HiddenField ID="hdnShowAddress" runat="server" Value='<%# Eval("DisplayAddressOnInternet") %>' />
                                <asp:HiddenField ID="hdnAddress" runat="server" Value='<%# Eval("Address") %>' />
                                <asp:HiddenField ID="hdnprovince" runat="server" Value='<%# Eval("province") %>' />
                                <asp:HiddenField ID="hdnPostalCode" runat="server" Value='<%# Eval("PostalCode") %>' />
                                <div class="search_boxx_left2">
                                    <img src='<%# Eval("pImage")%>' alt='<%# Eval("Style")%> in <%# Eval("Area")%>' width="180px"
                                        height="134">
                                </div>
                                <div class="text_bg">
                                    <h2>$<%# Eval("ListPrice")%></h2><span><%# Eval("Address") %>, <%# Eval("Municipality") %>, <%# Eval("PostalCode")%>, <%# Eval("province") %></span><p>
                                        <%# Eval("Bedrooms")%>
                                                        Beds,
                                                        <%# Eval("Washrooms")%>
                                                        Baths
                                    </p>
                                    <div class="text_bg_bottom">
                                        <asp:Button ID="btnDetails" runat="server" Text="Details" CssClass="detail" CommandName="Details"
                                            CommandArgument='<%# Eval("MLS") %>' ToolTip="Click For Details" CausesValidation="false" />
                                    </div>
                                    <div class="text_bg_bottom_right">
                                        <asp:ImageButton ID="btnlock" ImageUrl="~/images/lock.png" Visible='<%#Convert.ToBoolean(Eval("VOX")) == true%>'
                                            CommandName="LockButton" CommandArgument='<%# Eval("MLS")%>' runat="server" ToolTip="Click to Unlock"></asp:ImageButton>
                                    </div>
                                </div>
                            </div>
                        </asp:HyperLink>
                            </div>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                         <div class="col-md-3 col-sm-3">
                        <asp:HyperLink ID="hypBoxDetail" runat="server">
                            <div class="search_boxx">
                                <asp:HiddenField ID="hdnMLSID" runat="server" Value='<%# Eval("MLS") %>' />
                                <asp:HiddenField ID="hdnVOX" runat="server" Value='<%# Eval("VOX") %>' />
                                <asp:HiddenField ID="hdnType" runat="server" Value='<%# Eval("pType") %>' />
                                <asp:HiddenField ID="hdnShowAddress" runat="server" Value='<%# Eval("DisplayAddressOnInternet") %>' />
                                <asp:HiddenField ID="hdnAddress" runat="server" Value='<%# Eval("Address") %>' />
                                <asp:HiddenField ID="hdnprovince" runat="server" Value='<%# Eval("province") %>' />
                                <asp:HiddenField ID="hdnPostalCode" runat="server" Value='<%# Eval("PostalCode") %>' />
                                <div class="search_boxx_left2">
                                    <img src='<%# Eval("pImage")%>' alt='<%# Eval("Style")%> in <%# Eval("Area")%>' width="180px"
                                        height="134">
                                </div>
                                <div class="text_bg">
                                    <h2>$<%# Eval("ListPrice")%></h2><span><%# Eval("Address") %>, <%# Eval("Municipality") %>, <%# Eval("PostalCode")%>, <%# Eval("province") %></span><p>
                                        <%# Eval("Bedrooms")%>
                                                        Beds,
                                                        <%# Eval("Washrooms")%>
                                                        Baths
                                    </p>
                                    <div class="text_bg_bottom">
                                        <asp:Button ID="btnDetails" runat="server" Text="Details" CssClass="detail" CommandName="Details"
                                            CommandArgument='<%# Eval("MLS") %>' ToolTip="Click For Details" CausesValidation="false" />
                                    </div>
                                    <div class="text_bg_bottom_right">
                                        <asp:ImageButton ID="btnlock" ImageUrl="~/images/lock.png" Visible='<%#Convert.ToBoolean(Eval("VOX")) == true%>'
                                            CommandName="LockButton" CommandArgument='<%# Eval("MLS")%>' runat="server" ToolTip="Click to Unlock"></asp:ImageButton>
                                    </div>
                                </div>
                            </div>
                        </asp:HyperLink>
                             </div>
                    </AlternatingItemTemplate>
                    <FooterTemplate>
                        </div>

                    </FooterTemplate>
                </asp:Repeater>
            </div>
            <div id="DivListSearch" runat="server" style="display: block" class="In_bg">
                <asp:Repeater ID="rptSearchResultList" runat="server" OnItemCommand="rptSearchResultList_ItemCommand"
                    OnItemDataBound="rptSearchResultList_ItemDataBound">
                    <HeaderTemplate>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="search_boxx_list_5">
                            <asp:HiddenField ID="hdnMLSID" runat="server" Value='<%# Eval("MLS") %>' />
                            <asp:HiddenField ID="hdnVOX" runat="server" Value='<%# Eval("VOX") %>' />
                            <asp:HiddenField ID="hdnType" runat="server" Value='<%# Eval("pType") %>' />
                            <asp:HiddenField ID="hdnShowAddress" runat="server" Value='<%# Eval("DisplayAddressOnInternet") %>' />
                            <asp:HiddenField ID="hdnAddress" runat="server" Value='<%# Eval("Address") %>' />
                            <asp:HiddenField ID="hdnprovince" runat="server" Value='<%# Eval("province") %>' />
                            <asp:HiddenField ID="hdnPostalCode" runat="server" Value='<%# Eval("PostalCode") %>' />
                            <div class="search_boxx_right_bg">
                                <asp:HyperLink ID="hypImage" runat="server">
                                        <div class="search_boxx_left">
                                            <img src='<%# Eval("pImage")%>' alt='<%# Eval("Style")%> in <%# Eval("Area")%>' title='<%# Eval("Style")%> in <%# Eval("Area")%>' width="180px"
                                                height="134">
                                        </div>
                                </asp:HyperLink>
                                <span>
                                    <asp:HyperLink ID="hypAddress" runat="server"><%# Eval("Address") %>, <%# Eval("Municipality") %>, <%# Eval("PostalCode")%>, <%# Eval("province") %></asp:HyperLink></span>
                                <div class="para">
                                    <p>
                                        <%# Eval("RemarksForClients") %>
                                    </p>
                                    <p>
                                        <asp:HyperLink ID="hypBoxreadmore" CssClass="read_more_btn3" Text="Read More" runat="server"></asp:HyperLink>
                                    </p>
                                </div>

                            </div>
                            <div class="search_boxx_right_bg_2">
                                <span>$<%# Eval("ListPrice")%></span><br />
                                <br />
                                <div class="detl">
                                    <ul>
                                        <li><b>MLS:</b> #<%# Eval("MLS") %></li>
                                        <li><b>Status:</b>
                                            <%# Eval("SaleLease")%></li>
                                        <li><b>Type:</b>
                                            <%# Eval("TypeOwn1Out")%>
                                        </li>
                                        <li><b>Beds:</b>
                                            <%# Eval("Bedrooms")%><li>
                                        <li><b>Baths:</b>
                                            <%# Eval("Washrooms")%></li>
                                        <li><b>Area:</b>
                                            <asp:Panel ID="Panel1" runat="server" Visible='<%# Eval("ApproxSquareFootage").ToString() != "null"?true:false%>'>
                                                <%# Eval("ApproxSquareFootage")%>
                                            </asp:Panel>
                                            Sq Ft</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="favorate">
                                <div class="inform_list">
                                    <div class="infor_list_2">
                                        <p><a href="#"><i class="fa fa-pencil-square-o"></i></a></p>
                                        <span><a href="../ScheduleAppointment.aspx?Municipality=<%# Eval("Municipality") %>&PropertyType=<%# Eval("pType") %>"
                                            title="Appointment">Appointment</a></span>
                                    </div>
                                    <div class="infor_list_2">
                                        <p><a href="#"><i class="fa fa-star"></i></a></p>
                                        <span>Add to Favourite</span>

                                    </div>
                                    <div class="infor_list_2">
                                        <p><a href="#"><i class="fa fa-envelope-o"></i></a></p>
                                        <span><a href="../Email_Listing.aspx?MLSID=<%# Eval("MLS") %>&PropertyType=<%# Eval("pType") %>"
                                            title="Send Email">Email</a></span>
                                    </div>
                                    <div class="infor_list_2">
                                        <p><a href="#"><i class="fa fa-info-circle"></i></a></p>
                                        <span><a href="../PropertyDetails.aspx?MLSID=<%# Eval("MLS") %>&PropertyType=<%# Eval("pType") %>"
                                            title="More">More</a></span>
                                    </div>
                                </div>

                                <div class="infor_list_3">
                                    <asp:ImageButton ID="btnlock" ImageUrl="~/images/lock.png" Visible='<%#Convert.ToBoolean(Eval("VOX")) == true%>'
                                        CommandName="LockButton" CommandArgument='<%# Eval("MLS")%>' runat="server" ToolTip="Click To Unlock"></asp:ImageButton>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <div class="search_boxx_list_5">
                            <asp:HiddenField ID="hdnMLSID" runat="server" Value='<%# Eval("MLS") %>' />
                            <asp:HiddenField ID="hdnVOX" runat="server" Value='<%# Eval("VOX") %>' />
                            <asp:HiddenField ID="hdnType" runat="server" Value='<%# Eval("pType") %>' />
                            <asp:HiddenField ID="hdnShowAddress" runat="server" Value='<%# Eval("DisplayAddressOnInternet") %>' />
                            <asp:HiddenField ID="hdnAddress" runat="server" Value='<%# Eval("Address") %>' />
                            <asp:HiddenField ID="hdnprovince" runat="server" Value='<%# Eval("province") %>' />
                            <asp:HiddenField ID="hdnPostalCode" runat="server" Value='<%# Eval("PostalCode") %>' />
                            <div class="search_boxx_right_bg">
                                <asp:HyperLink ID="hypImage" runat="server">
                                        <div class="search_boxx_left">
                                            <img src='<%# Eval("pImage")%>' alt='<%# Eval("Style")%> in <%# Eval("Area")%>' width="180px"
                                                height="134">
                                        </div>
                                </asp:HyperLink>
                                <span>
                                    <asp:HyperLink ID="hypAddress" runat="server"><%# Eval("Address") %>, <%# Eval("Municipality") %>, <%# Eval("PostalCode")%>, <%# Eval("province") %></asp:HyperLink></span>
                                <div class="para">
                                    <p>
                                        <%# Eval("RemarksForClients") %>
                                    </p>
                                    <p>
                                        <asp:HyperLink ID="hypBoxreadmore" CssClass="read_more_btn3" Text="Read More" runat="server"></asp:HyperLink>
                                    </p>
                                </div>

                            </div>
                            <div class="search_boxx_right_bg_2">
                                <span>$<%# Eval("ListPrice")%></span><br />
                                <br />
                                <div class="detl">
                                    <ul>
                                        <li><b>MLS:</b> #<%# Eval("MLS") %></li>
                                        <li><b>Status:</b>
                                            <%# Eval("SaleLease")%></li>
                                        <li><b>Type:</b>
                                            <%# Eval("TypeOwn1Out")%>
                                        </li>
                                        <li><b>Beds:</b>
                                            <%# Eval("Bedrooms")%><li>
                                        <li><b>Baths:</b><%# Eval("Washrooms")%></li>
                                        <li><b>Area:</b><asp:Panel ID="Panel1" runat="server" Visible='<%# Eval("ApproxSquareFootage").ToString() != "null"?true:false%>'>
                                            <%# Eval("ApproxSquareFootage")%>
                                        </asp:Panel>
                                            Sq Ft</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="favorate">
                                <div class="inform_list">
                                    <div class="infor_list_2">
                                        <p><a href="#"><i class="fa fa-pencil-square-o"></i></a></p>
                                        <span><a href="../ScheduleAppointment.aspx?Municipality=<%# Eval("Municipality") %>&PropertyType=<%# Eval("pType") %>"
                                            title="Appointment">Appointment</a></span>
                                    </div>
                                    <div class="infor_list_2">
                                        <p><a href="#"><i class="fa fa-star"></i></a></p>
                                        <span>Add to Favourite</span>

                                    </div>
                                    <div class="infor_list_2">
                                        <p><a href="#"><i class="fa fa-envelope-o"></i></a></p>
                                        <span><a href="../Email_Listing.aspx?MLSID=<%# Eval("MLS") %>&PropertyType=<%# Eval("pType") %>"
                                            title="Send Email">Email</a></span>
                                    </div>
                                    <div class="infor_list_2">
                                        <p><a href="#"><i class="fa fa-info-circle"></i></a></p>
                                        <span><a href="../PropertyDetails.aspx?MLSID=<%# Eval("MLS") %>&PropertyType=<%# Eval("pType") %>"
                                            title="More">More</a></span>
                                    </div>
                                </div>

                                <div class="infor_list_3">
                                    <asp:ImageButton ID="btnlock" ImageUrl="~/images/lock.png" Visible='<%#Convert.ToBoolean(Eval("VOX")) == true%>'
                                        CommandName="LockButton" CommandArgument='<%# Eval("MLS")%>' runat="server" ToolTip="Click To Unlock"></asp:ImageButton>
                                </div>
                            </div>
                        </div>
                    </AlternatingItemTemplate>
                </asp:Repeater>
                <asp:Repeater ID="rptCommercialResultList" runat="server" OnItemCommand="rptCommercialResultList_ItemCommand"
                    OnItemDataBound="rptCommercialResultList_ItemDataBound">
                    <ItemTemplate>
                        <div class="search_boxx_list_5">
                            <asp:HiddenField ID="hdnMLSID" runat="server" Value='<%# Eval("MLS") %>' />
                            <asp:HiddenField ID="hdnVOX" runat="server" Value='<%# Eval("VOX") %>' />
                            <asp:HiddenField ID="hdnType" runat="server" Value='<%# Eval("pType") %>' />
                            <asp:HiddenField ID="hdnShowAddress" runat="server" Value='<%# Eval("DisplayAddressOnInternet") %>' />
                            <asp:HiddenField ID="hdnAddress" runat="server" Value='<%# Eval("Address") %>' />
                            <asp:HiddenField ID="hdnprovince" runat="server" Value='<%# Eval("province") %>' />
                            <asp:HiddenField ID="hdnPostalCode" runat="server" Value='<%# Eval("PostalCode") %>' />
                            <div class="search_boxx_right_bg">
                                <asp:HyperLink ID="hypImage" runat="server">
                                    <div class="search_boxx_left">
                                        <img src='<%# Eval("pImage")%>' alt='<%# Eval("Area")%>' title='<%# Eval("Area")%>' width="180px" height="134">
                                    </div>
                                </asp:HyperLink>
                                <span>
                                    <asp:HyperLink ID="hypAddress" runat="server"><%# Eval("Address") %>, <%# Eval("Municipality") %>, <%# Eval("PostalCode")%>, <%# Eval("province") %></asp:HyperLink></span>
                                <div class="para">
                                    <p>
                                        <%# Eval("RemarksForClients")%>
                                    </p>
                                    <p>
                                        <asp:HyperLink ID="hypBoxreadmore" CssClass="read_more_btn3" Text="Read More" runat="server"></asp:HyperLink>
                                    </p>
                                </div>

                            </div>
                            <div class="search_boxx_right_bg_2">
                                <span>$<%# Eval("ListPrice")%></span><br />
                                <br />
                                <div class="detl">
                                    <ul>
                                        <li><b>MLS:</b>#<%# Eval("MLS") %></li>
                                        <li><b>Status:</b>
                                            <%# Eval("SaleLease") %></li>
                                        <li><b>Type:</b><%# Eval("TypeOwn1Out") %></li>
                                        <li><b>Baths:</b><%# Eval("Washrooms")%></li>
                                        <li><b>Area:</b><%# Eval("TotalArea")%>&nbsp<%# Eval("TotalAreaCode")%></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="favorate">
                                <div class="inform_list">
                                    <div class="infor_list_2">
                                        <p><a href="#"><i class="fa fa-pencil-square-o"></i></a></p>
                                        <span><a href="../ScheduleAppointment.aspx?Municipality=<%# Eval("Municipality") %>&PropertyType=<%# Eval("pType") %>"
                                            title="Appointment">Appointment</a></span>
                                    </div>
                                    <div class="infor_list_2">
                                        <p><a href="#"><i class="fa fa-star"></i></a></p>
                                        <span>Add to Favourite</span>

                                    </div>
                                    <div class="infor_list_2">
                                        <p><a href="#"><i class="fa fa-envelope-o"></i></a></p>
                                        <span><a href="../Email_Listing.aspx?MLSID=<%# Eval("MLS") %>&PropertyType=<%# Eval("pType") %>"
                                            title="Send Email">Email</a></span>
                                    </div>
                                    <div class="infor_list_2">
                                        <p><a href="#"><i class="fa fa-info-circle"></i></a></p>
                                        <span><a href="../PropertyDetails.aspx?MLSID=<%# Eval("MLS") %>&PropertyType=<%# Eval("pType") %>"
                                            title="More">More</a></span>
                                    </div>
                                </div>

                                <div class="infor_list_3">
                                    <asp:ImageButton ID="btnlock" ImageUrl="~/images/lock.png" Visible='<%#Convert.ToBoolean(Eval("VOX")) == true%>'
                                        CommandName="LockButton" CommandArgument='<%# Eval("MLS")%>' runat="server" ToolTip="Click To Unlock"></asp:ImageButton>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <div class="search_boxx_list_5">
                            <asp:HiddenField ID="hdnMLSID" runat="server" Value='<%# Eval("MLS") %>' />
                            <asp:HiddenField ID="hdnVOX" runat="server" Value='<%# Eval("VOX") %>' />
                            <asp:HiddenField ID="hdnType" runat="server" Value='<%# Eval("pType") %>' />
                            <asp:HiddenField ID="hdnShowAddress" runat="server" Value='<%# Eval("DisplayAddressOnInternet") %>' />
                            <asp:HiddenField ID="hdnAddress" runat="server" Value='<%# Eval("Address") %>' />
                            <asp:HiddenField ID="hdnprovince" runat="server" Value='<%# Eval("province") %>' />
                            <asp:HiddenField ID="hdnPostalCode" runat="server" Value='<%# Eval("PostalCode") %>' />
                            <div class="search_boxx_right_bg">
                                <asp:HyperLink ID="hypImage" runat="server">
                                    <div class="search_boxx_left">
                                        <img src='<%# Eval("pImage")%>' alt='<%# Eval("Area")%>' width="180px" height="134">
                                    </div>
                                </asp:HyperLink>
                                <span>
                                    <asp:HyperLink ID="hypAddress" runat="server"><%# Eval("Address") %>, <%# Eval("Municipality") %>, <%# Eval("PostalCode")%>, <%# Eval("province") %></asp:HyperLink></span>
                                <div class="para">
                                    <p>
                                        <%# Eval("RemarksForClients")%>
                                    </p>
                                    <p>
                                        <asp:HyperLink ID="hypBoxreadmore" CssClass="read_more_btn3" Text="Read More" runat="server"></asp:HyperLink>
                                    </p>
                                </div>

                            </div>
                            <div class="search_boxx_right_bg_2">
                                <span>$<%# Eval("ListPrice")%></span><br />
                                <br />
                                <div class="detl">
                                    <ul>
                                        <li><b>MLS:</b>#<%# Eval("MLS") %></li>
                                        <li><b>Status:</b>
                                            <%# Eval("SaleLease") %></li>
                                        <li><b>Type:</b><%# Eval("TypeOwn1Out") %></li>
                                        <li><b>Baths:</b><%# Eval("Washrooms")%></li>
                                        <li><b>Area:</b>
                                            <%# Eval("TotalArea")%>&nbsp<%# Eval("TotalAreaCode")%></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="favorate">
                                <div class="inform_list">
                                    <div class="infor_list_2">
                                        <p><a href="#"><i class="fa fa-pencil-square-o"></i></a></p>
                                        <span><a href="../ScheduleAppointment.aspx?Municipality=<%# Eval("Municipality") %>&PropertyType=<%# Eval("pType") %>"
                                            title="Appointment">Appointment</a></span>
                                    </div>
                                    <div class="infor_list_2">
                                        <p><a href="#"><i class="fa fa-star"></i></a></p>
                                        <span>Add to Favourite</span>

                                    </div>
                                    <div class="infor_list_2">
                                        <p><a href="#"><i class="fa fa-envelope-o"></i></a></p>
                                        <span><a href="../Email_Listing.aspx?MLSID=<%# Eval("MLS") %>&PropertyType=<%# Eval("pType") %>"
                                            title="Send Email">Email</a></span>
                                    </div>
                                    <div class="infor_list_2">
                                        <p><a href="#"><i class="fa fa-info-circle"></i></a></p>
                                        <span><a href="../PropertyDetails.aspx?MLSID=<%# Eval("MLS") %>&PropertyType=<%# Eval("pType") %>"
                                            title="More">More</a></span>
                                    </div>
                                </div>

                                <div class="infor_list_3">
                                    <asp:ImageButton ID="btnlock" ImageUrl="~/images/lock.png" Visible='<%#Convert.ToBoolean(Eval("VOX")) == true%>'
                                        CommandName="LockButton" CommandArgument='<%# Eval("MLS")%>' runat="server" ToolTip="Click To Unlock"></asp:ImageButton>
                                </div>
                            </div>
                        </div>
                    </AlternatingItemTemplate>
                </asp:Repeater>
                <asp:Repeater ID="rptCondoResultList" runat="server" OnItemCommand="rptCondoResultList_ItemCommand"
                    OnItemDataBound="rptCondoResultList_ItemDataBound">
                    <HeaderTemplate>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="search_boxx_list_5">
                            <asp:HiddenField ID="hdnMLSID" runat="server" Value='<%# Eval("MLS") %>' />
                            <asp:HiddenField ID="hdnVOX" runat="server" Value='<%# Eval("VOX") %>' />
                            <asp:HiddenField ID="hdnType" runat="server" Value='<%# Eval("pType") %>' />
                            <asp:HiddenField ID="hdnShowAddress" runat="server" Value='<%# Eval("DisplayAddressOnInternet") %>' />
                            <asp:HiddenField ID="hdnAddress" runat="server" Value='<%# Eval("Address") %>' />
                            <asp:HiddenField ID="hdnprovince" runat="server" Value='<%# Eval("province") %>' />
                            <asp:HiddenField ID="hdnPostalCode" runat="server" Value='<%# Eval("PostalCode") %>' />
                            <div class="search_boxx_right_bg">
                                <asp:HyperLink ID="hypImage" runat="server">
                                        <div class="search_boxx_left">
                                            <img src='<%# Eval("pImage")%>' alt='<%# Eval("Style")%> in <%# Eval("Area")%>'  title='<%# Eval("Style")%> in <%# Eval("Area")%>'  width="180px"
                                                height="134">
                                        </div>
                                </asp:HyperLink>
                                <span>
                                    <asp:HyperLink ID="hypAddress" runat="server" title='<%# Eval("Address") %>'>, <%# Eval("Municipality") %>, <%# Eval("PostalCode")%>, <%# Eval("province") %></asp:HyperLink></span>
                                <div class="para">
                                    <p>
                                        <%# Eval("RemarksForClients") %>
                                    </p>
                                    <p>
                                        <asp:HyperLink ID="hypBoxreadmore" CssClass="read_more_btn3" Text="Read More" runat="server"></asp:HyperLink>
                                    </p>
                                </div>

                            </div>
                            <div class="search_boxx_right_bg_2">
                                <span>$<%# Eval("ListPrice")%></span><br />
                                <br />
                                <div class="detl">
                                    <ul>
                                        <li><b>MLS:</b> #<%# Eval("MLS") %></li>
                                        <li><b>Status:</b>
                                            <%# Eval("SaleLease")%></li>
                                        <li><b>Type:</b>
                                            <%# Eval("TypeOwn1Out")%>
                                        </li>
                                        <li><b>Beds:</b>
                                            <%# Eval("Bedrooms")%><li>
                                        <li><b>Baths:</b><%# Eval("Washrooms")%></li>
                                        <asp:Panel ID="Panel1" runat="server" Visible='<%# Eval("ApproxSquareFootage").ToString() != "null"?true:false%>'>
                                            <li><b>Area:</b><%# Eval("ApproxSquareFootage")%>Sq Ft</li>
                                        </asp:Panel>
                                    </ul>
                                </div>
                            </div>
                            <div class="favorate">
                                <div class="inform_list">
                                    <div class="infor_list_2">
                                        <p><a href="#"><i class="fa fa-pencil-square-o"></i></a></p>
                                        <span><a href="../ScheduleAppointment.aspx?Municipality=<%# Eval("Municipality") %>&PropertyType=<%# Eval("pType") %>"
                                            title="Appointment">Appointment</a></span>
                                    </div>
                                    <div class="infor_list_2">
                                        <p><a href="#"><i class="fa fa-star"></i></a></p>
                                        <span>Add to Favourite</span>

                                    </div>
                                    <div class="infor_list_2">
                                        <p><a href="#"><i class="fa fa-envelope-o"></i></a></p>
                                        <span><a href="../Email_Listing.aspx?MLSID=<%# Eval("MLS") %>&PropertyType=<%# Eval("pType") %>"
                                            title="Send Email">Email</a></span>
                                    </div>
                                    <div class="infor_list_2">
                                        <p><a href="#"><i class="fa fa-info-circle"></i></a></p>
                                        <span><a href="../PropertyDetails.aspx?MLSID=<%# Eval("MLS") %>&PropertyType=<%# Eval("pType") %>"
                                            title="More">More</a></span>
                                    </div>
                                </div>

                                <div class="infor_list_3">
                                    <asp:ImageButton ID="btnlock" ImageUrl="~/images/lock.png" Visible='<%#Convert.ToBoolean(Eval("VOX")) == true%>'
                                        CommandName="LockButton" CommandArgument='<%# Eval("MLS")%>' runat="server" ToolTip="Click To Unlock"></asp:ImageButton>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <div class="search_boxx_list_5">
                            <asp:HiddenField ID="hdnMLSID" runat="server" Value='<%# Eval("MLS") %>' />
                            <asp:HiddenField ID="hdnVOX" runat="server" Value='<%# Eval("VOX") %>' />
                            <asp:HiddenField ID="hdnType" runat="server" Value='<%# Eval("pType") %>' />
                            <asp:HiddenField ID="hdnShowAddress" runat="server" Value='<%# Eval("DisplayAddressOnInternet") %>' />
                            <asp:HiddenField ID="hdnAddress" runat="server" Value='<%# Eval("Address") %>' />
                            <asp:HiddenField ID="hdnprovince" runat="server" Value='<%# Eval("province") %>' />
                            <asp:HiddenField ID="hdnPostalCode" runat="server" Value='<%# Eval("PostalCode") %>' />
                            <div class="search_boxx_right_bg">
                                <asp:HyperLink ID="hypImage" runat="server">
                                        <div class="search_boxx_left">
                                            <img src='<%# Eval("pImage")%>' alt='<%# Eval("Style")%> in <%# Eval("Area")%>'  title='<%# Eval("Style")%> in <%# Eval("Area")%>'  width="180px"
                                                height="134">
                                        </div>
                                </asp:HyperLink>
                                <span>
                                    <asp:HyperLink ID="hypAddress" runat="server"><%# Eval("Address") %>, <%# Eval("Municipality") %>, <%# Eval("PostalCode")%>, <%# Eval("province") %></asp:HyperLink></span>
                                <div class="para">
                                    <p>
                                        <%# Eval("RemarksForClients") %>
                                    </p>
                                    <p>
                                        <asp:HyperLink ID="hypBoxreadmore" CssClass="read_more_btn3" Text="Read More" runat="server"></asp:HyperLink>
                                    </p>
                                </div>

                            </div>
                            <div class="search_boxx_right_bg_2">
                                <span>$<%# Eval("ListPrice")%></span><br />
                                <br />
                                <div class="detl">
                                    <ul>
                                        <li><b>MLS:</b> #<%# Eval("MLS") %></li>
                                        <li><b>Status:</b>
                                            <%# Eval("SaleLease")%></li>
                                        <li><b>Type:</b>
                                            <%# Eval("TypeOwn1Out")%>
                                        </li>
                                        <li><b>Beds:</b>
                                            <%# Eval("Bedrooms")%><li>
                                        <li><b>Baths:</b><%# Eval("Washrooms")%></li>
                                        <asp:Panel ID="Panel1" runat="server" Visible='<%# Eval("ApproxSquareFootage").ToString() != "null"?true:false%>'>
                                            <li><b>Area:</b><%# Eval("ApproxSquareFootage")%>Sq Ft</li>
                                        </asp:Panel>
                                    </ul>
                                </div>
                            </div>
                            <div class="favorate">
                                <div class="inform_list">
                                    <div class="infor_list_2">
                                        <p><a href="#"><i class="fa fa-pencil-square-o"></i></a></p>
                                        <span><a href="../ScheduleAppointment.aspx?Municipality=<%# Eval("Municipality") %>&PropertyType=<%# Eval("pType") %>"
                                            title="Appointment">Appointment</a></span>
                                    </div>
                                    <div class="infor_list_2">
                                        <p><a href="#"><i class="fa fa-star"></i></a></p>
                                        <span>Add to Favourite</span>

                                    </div>
                                    <div class="infor_list_2">
                                        <p><a href="#"><i class="fa fa-envelope-o"></i></a></p>
                                        <span><a href="../Email_Listing.aspx?MLSID=<%# Eval("MLS") %>&PropertyType=<%# Eval("pType") %>"
                                            title="Send Email">Email</a></span>
                                    </div>
                                    <div class="infor_list_2">
                                        <p><a href="#"><i class="fa fa-info-circle"></i></a></p>
                                        <span><a href="../PropertyDetails.aspx?MLSID=<%# Eval("MLS") %>&PropertyType=<%# Eval("pType") %>"
                                            title="More">More</a></span>
                                    </div>
                                </div>

                                <div class="infor_list_3">
                                    <asp:ImageButton ID="btnlock" ImageUrl="~/images/lock.png" Visible='<%#Convert.ToBoolean(Eval("VOX")) == true%>'
                                        CommandName="LockButton" CommandArgument='<%# Eval("MLS")%>' runat="server" ToolTip="Click To Unlock"></asp:ImageButton>
                                </div>
                            </div>
                        </div>
                    </AlternatingItemTemplate>
                </asp:Repeater>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="lnkNext" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
    <div class="col-md-3 col-sm-3">
          <div class="count_date">
        <asp:Label ID="lbldate" Style="float: right;" runat="server"></asp:Label>
    </div></div>
 <div class="col-md-4 col-sm-4">
       
    </div>
    <div class="col-md-5 col-sm-5">
    <div class="changer table-responsive" runat="server" id="pagesLink" visible="true">
        <table class="table">
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
    </div>
        </div>
    </div>
  

