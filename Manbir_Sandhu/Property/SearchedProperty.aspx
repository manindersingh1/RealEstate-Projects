<%@ Page Title="" Language="C#" MasterPageFile="~/property_landing_page.Master" AutoEventWireup="true" CodeBehind="SearchedProperty.aspx.cs" Inherits="Property.SearchedProperty" %>
<%@ Register TagName="GoogleMap" TagPrefix="uc"  Src="~/Controls/GoogleMap.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<link href="css/style.css" rel="stylesheet" />
<link href="css/style_002.css" rel="stylesheet" />
<link href="slider/css/style.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col col-md-12" style="padding-top: 44px">
        <div class="col col-md-7">
               <uc:GoogleMap ID="GoogleMap" runat="server" />
        </div>
        <div class="col col-md-5">
            <div>
                	
                    <h3>Almost done!</h3>
                    <h3>Please fill in the information below to get instant updates...</h3>
                    <div id="custom-form-aside">
                    	<input name="street_number" id="street_number" value="25" type="hidden"/>
                    	<input name="route" id="route" value="Peel Centre Drive" type="hidden"/>
                    	<input name="locality" id="locality" value="Brampton" type="hidden"/>
                    	<input name="administrative_area_level_1" id="administrative_area_level_1" value="ON" type="hidden"/>
                    	<input name="country" id="country" value="Canada" type="hidden"/>
                    	<input name="postal_code" id="postal_code" value="L6T 3R5" type="hidden"/>
                    	<input name="lat" id="glat" value="43.698958" type="hidden"/>
                    	<input name="lng" id="glng" value="-79.765961" type="hidden"/>
                    	
                        <label for="type">Type of Home:</label>
                        <asp:DropDownList ID="PropertyType" runat="server">
                            <asp:ListItem value="Detached" selected="true">Detached Home</asp:ListItem>
							<asp:ListItem value="Semi-Detached">Semi-Detached Home</asp:ListItem>
							<asp:ListItem value="Condo Townhouse">Condo Townhouse</asp:ListItem>
							<asp:ListItem value="Condo Apt">Condo Apartment</asp:ListItem>
							<asp:ListItem value="Att/Row/Twnhouse">Att/Row/Twnhouse</asp:ListItem>
                        </asp:DropDownList>
                        <label for="Radius">Radius:</label>
                          <asp:DropDownList ID="Radius" runat="server">
                                <asp:ListItem value="200" selected="true">200 Meters</asp:ListItem> 
                            <asp:ListItem value="250">250 Meters</asp:ListItem>
                            <asp:ListItem value="300">300 Meters</asp:ListItem>
                            <asp:ListItem value="350">350 Meters</asp:ListItem>
                            <asp:ListItem value="400">400 Meters</asp:ListItem>
                            <asp:ListItem value="500">500 Meters</asp:ListItem>
                            <asp:ListItem value="600">600 Meters</asp:ListItem>
                            <asp:ListItem value="700">700 Meters</asp:ListItem>
                            <asp:ListItem value="800">800 Meters</asp:ListItem>
                            <asp:ListItem value="900">900 Meters</asp:ListItem>
                            <asp:ListItem value="1000">1000 Meters</asp:ListItem>
                        </asp:DropDownList>
                        <label for="Name">First &amp; Last name:</label>
                      <asp:TextBox ID="Name" CssClass="CTextBox" runat="server" MaxLength="20"></asp:TextBox>
                        <label for="PhoneNumber">Phone:</label>
                         <asp:TextBox ID="PhoneNumber" CssClass="CTextBox" runat="server" MaxLength="20"></asp:TextBox>
                        <label for="Email">E-mail:</label>
                         <asp:TextBox ID="Email" CssClass="CTextBox" runat="server"  MaxLength="20"></asp:TextBox>
                       
                     <asp:Button ID="btnSearch" runat="server" Text="Submit" OnClick="btnSearch_Click" />
                    </div>
                </div>
        </div>
    </div>
</asp:Content>
