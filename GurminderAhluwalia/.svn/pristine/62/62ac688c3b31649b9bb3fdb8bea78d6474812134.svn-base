<%@ Page Title="" Language="C#" MasterPageFile="~/PropertyNew.Master" AutoEventWireup="true" CodeBehind="PowerOfSale.aspx.cs" Inherits="Property.PowerOfSale" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
     <link href="../css/style_002.css" rel="stylesheet" />
    <link href="../slider/css/style.css" rel="stylesheet" />
    <link href="../css/shortcodes.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <ajaxtoolkit:ToolkitScriptManager ID="fds" runat="server"></ajaxtoolkit:ToolkitScriptManager>
    <div>
        <div class="row frnt_line_cls">
            <div class="col-md-6 col-sm-6">
                <div class="contact_in_right">

                   <img src="images/contact-img-2_new.png" alt="" />
                </div>
            </div>
            <div class="col-md-6 col-sm-6">
                <div class="contact_in_left">
                    <h2>Power Of Sale</h2>
                    <div class="agent_input">
                        <p>
                            Name:<asp:RequiredFieldValidator ID="reqName" runat="server" ErrorMessage="*"
                                ControlToValidate="txtName" ValidationGroup="FreeHome" ForeColor="Red"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtName" CssClass="CTextBox" runat="server" PlaceHolder="Name" MaxLength="20"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                       ControlToValidate="txtName" ErrorMessage="Only alphabets are allowed" ValidationGroup="FreeHome"
                       ForeColor="Red" Display="Dynamic" ValidationExpression="^[a-zA-Z ]+$"  > </asp:RegularExpressionValidator> 
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="FreeHome" runat="server" Display="Dynamic" ControlToValidate="txtName" ErrorMessage="Name required" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </p>
                    </div>
                    <div class="agent_input">
                        <p>
                            E-mail:
                          <asp:TextBox ID="txtEmail" CssClass="CTextBox" runat="server" PlaceHolder="Email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ValidationGroup="FreeHome" Display="Dynamic" ControlToValidate="txtEmail" ErrorMessage="EmailID required" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="rgeEmail" runat="server" ValidationGroup="FreeHome"  Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Invalid email address." />
                        </p>
                    </div>
                    <div class="agent_input">
                        <p>
                            Phone Number:
    <asp:TextBox ID="txtPhoneno" CssClass="CTextBox" runat="server" PlaceHolder="Phone Number"></asp:TextBox>
                                <ajaxtoolkit:MaskedEditExtender runat="server" ID="mee" Mask="(999) 999-9999"
                                        TargetControlID="txtPhoneno">
                                    </ajaxtoolkit:MaskedEditExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ValidationGroup="FreeHome" Display="Dynamic" ControlToValidate="txtPhoneno" ErrorMessage="Phone No. required" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RequiredFieldValidator14" ValidationGroup="FreeHome" runat="server" ControlToValidate="txtPhoneno" Display="Dynamic"
                                ValidationExpression="^(\(\d{3}\) \d{3}-\d{4}|\d{3}-\d{3}-\d{4}|\d{10})$"
                                Text="Enter a valid phone number" ForeColor="Red" />
                        </p>
                    </div>
                    <div class="agent_input">
                        <p>
                            Preferred City:
                        <asp:DropDownList ID="ddlCity" runat="server">
                            <asp:ListItem>Select</asp:ListItem>
                            <asp:ListItem>Barrie</asp:ListItem>
                            <asp:ListItem>Belleville</asp:ListItem>
                            <asp:ListItem>Brampton</asp:ListItem>
                            <asp:ListItem>Brant</asp:ListItem>
                            <asp:ListItem>Brantford</asp:ListItem>
                            <asp:ListItem>Brockville</asp:ListItem>
                            <asp:ListItem>Burlington</asp:ListItem>
                            <asp:ListItem>Cambridge</asp:ListItem>
                            <asp:ListItem>Clarence-Rockland</asp:ListItem>
                            <asp:ListItem>Cornwall</asp:ListItem>
                            <asp:ListItem>Dryden</asp:ListItem>
                            <asp:ListItem>Elliot Lake</asp:ListItem>
                            <asp:ListItem>Greater Sudbury</asp:ListItem>
                            <asp:ListItem>Guelph</asp:ListItem>
                            <asp:ListItem>Haldimand County</asp:ListItem>
                            <asp:ListItem>Hamilton</asp:ListItem>
                            <asp:ListItem>Kawartha Lakes</asp:ListItem>
                            <asp:ListItem>Kenora</asp:ListItem>
                            <asp:ListItem>Kingston</asp:ListItem>
                            <asp:ListItem>Kitchener</asp:ListItem>
                            <asp:ListItem>London</asp:ListItem>
                            <asp:ListItem>Markham</asp:ListItem>
                            <asp:ListItem>Mississauga</asp:ListItem>
                            <asp:ListItem>Niagara Falls</asp:ListItem>
                            <asp:ListItem>Norfolk County</asp:ListItem>
                            <asp:ListItem>North Bay</asp:ListItem>
                            <asp:ListItem>Orillia</asp:ListItem>
                            <asp:ListItem>Oshawa</asp:ListItem>
                            <asp:ListItem>Ottawa</asp:ListItem>
                            <asp:ListItem>Owen Sound</asp:ListItem>
                            <asp:ListItem>Pembroke</asp:ListItem>
                            <asp:ListItem>Peterborough</asp:ListItem>
                            <asp:ListItem>Pickering</asp:ListItem>
                            <asp:ListItem>Port Colborne</asp:ListItem>
                            <asp:ListItem>Prince Edward County</asp:ListItem>
                            <asp:ListItem>Quinte West</asp:ListItem>
                            <asp:ListItem>Sarnia</asp:ListItem>
                            <asp:ListItem>Sault Ste. Marie</asp:ListItem>
                            <asp:ListItem>St. Catharines</asp:ListItem>
                            <asp:ListItem>St. Thomas</asp:ListItem>
                            <asp:ListItem>Stratford</asp:ListItem>
                            <asp:ListItem>Temiskaming Shores</asp:ListItem>
                            <asp:ListItem>Thorold</asp:ListItem>
                            <asp:ListItem>Thunder Bay</asp:ListItem>
                            <asp:ListItem>Timmins</asp:ListItem>
                            <asp:ListItem>Toronto</asp:ListItem>
                            <asp:ListItem>Vaughan</asp:ListItem>
                            <asp:ListItem>Waterloo</asp:ListItem>
                            <asp:ListItem>Welland</asp:ListItem>
                            <asp:ListItem>Windsor</asp:ListItem>
                            <asp:ListItem>Woodstock</asp:ListItem>
                        </asp:DropDownList>
                        </p>
                    </div>
                    <div class="agent_input">
                        <p>
                            Price Range
                        <asp:DropDownList ID="ddlPriceRange" runat="server">
                            <asp:ListItem>Select</asp:ListItem>
                            <asp:ListItem> Under $400,000</asp:ListItem>
                            <asp:ListItem> $400,000-$450,000</asp:ListItem>
                            <asp:ListItem>$450,000-$500,000</asp:ListItem>
                            <asp:ListItem>$500,000-$550,000</asp:ListItem>
                            <asp:ListItem>$550,000-$600,000</asp:ListItem>
                            <asp:ListItem> $600,000-$650,000</asp:ListItem>
                            <asp:ListItem> $650,000-$700,000</asp:ListItem>
                            <asp:ListItem>$700,000-$750,000</asp:ListItem>
                            <asp:ListItem>$750,000-$800,000</asp:ListItem>
                            <asp:ListItem>$800,000-$900,000</asp:ListItem>
                            <asp:ListItem>$900,000- $1M</asp:ListItem>
                            <asp:ListItem>$1M-$1.2M</asp:ListItem>
                            <asp:ListItem>$1.2M-$1.5M</asp:ListItem>
                            <asp:ListItem>$1.5M-$2m</asp:ListItem>
                            <asp:ListItem>$2M and Up</asp:ListItem>
                        </asp:DropDownList>
                        </p>
                    </div>
                    <div style="margin: 0 0 50px 0">
                        <asp:Label ID="lblResult" runat="server" ForeColor="Red"></asp:Label>
                        <asp:Button ID="btnSend" runat="server" Text="Send" CssClass="Sendbutton" Width="24%"
                            UseSubmitBehavior="false" ValidationGroup="FreeHome" OnClick="btnSend_Click" />
                    </div>


                </div>
            </div>


        </div>
    </div>
</asp:Content>
