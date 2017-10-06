<%@ Page Title="" Language="C#" MasterPageFile="~/Property.Master" AutoEventWireup="true"
    CodeBehind="UserInfo.aspx.cs" Inherits="Property.UserInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="wrapper_new">
        <div class="property-search-container">
            <div class="dt-sc-tabs-container" style="width: 100%;">
                <ul class="dt-sc-tabs-frame">
                    <li><a class="current" href="#">User Information</a></li>
                </ul>
                <div style="display: block;" class="dt-sc-tabs-frame-content">
                    <div class="property-type-module medium-module">
                        <div class="login_input">
                            <label>
                                First Name</label>
                            <asp:TextBox ID="txtFirstName" runat="server" MaxLength="50" PlaceHolder="First Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqFirstName" runat="server" ErrorMessage="First Name is Required" 
                                ControlToValidate="txtFirstName" ValidationGroup="SaveInfo" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="property-type-module medium-module">
                        <div class="login_input">
                            <label>
                                Last Name</label>
                            <asp:TextBox ID="txtLastName" runat="server" MaxLength="50" PlaceHolder="Last Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqLastName" runat="server" ErrorMessage="LastName is Required"
                                ControlToValidate="txtLastName" ValidationGroup="SaveInfo" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="property-type-module medium-module">
                        <div class="login_input">
                            <label>
                                Company Name</label>
                            <asp:TextBox ID="txtCompanyName" runat="server" MaxLength="50" PlaceHolder="Company Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqCompanyName" runat="server" ErrorMessage="Company Name is Required"
                                ControlToValidate="txtCompanyName" ValidationGroup="SaveInfo" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="property-type-module medium-module">
                        <div class="login_input">
                            <label>
                                Address</label>
                            <asp:TextBox ID="txtAddress" runat="server" MaxLength="255" PlaceHolder="Address"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqAddress" runat="server" ErrorMessage="Address is Required"
                                ControlToValidate="txtAddress" ValidationGroup="SaveInfo" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="property-type-module medium-module">
                        <div class="login_input">
                            <label>
                                City</label>
                            <asp:TextBox ID="txtCity" runat="server" MaxLength="50" PlaceHolder="City"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqCity" runat="server" ErrorMessage="City is Required"
                                ControlToValidate="txtCity" ValidationGroup="SaveInfo" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="property-type-module medium-module">
                        <div class="login_input">
                            <label>
                                State</label>
                            <asp:TextBox ID="txtState" runat="server" MaxLength="50" PlaceHolder="State"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqState" runat="server" ErrorMessage="State is Required"
                                ControlToValidate="txtState" ValidationGroup="SaveInfo" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="property-type-module medium-module">
                        <div class="login_input">
                            <label>
                                Phone Number</label>
                            <asp:TextBox ID="txtPhoneNo" runat="server" MaxLength="50" PlaceHolder="Phone Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqPhoneNo" runat="server" ErrorMessage="Phone Number is Required"
                                ControlToValidate="txtPhoneNo" ValidationGroup="SaveInfo" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="property-type-module medium-module">
                        <div class="login_input">
                            <label>
                                Upload Image</label>
                            <br />
                            <asp:FileUpload ID="ImageUpload" runat="server" />
                        </div>
                    </div>
                    <div class="property-type-module medium-module">
                        <div class="login_input">
                            <br />
                            <label>
                                Website URL</label>
                            <asp:TextBox ID="txtWebsite" runat="server" MaxLength="50" PlaceHolder="Website URL"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqWebsite" runat="server" ErrorMessage="Website is Required"
                                ControlToValidate="txtWebsite" ValidationGroup="SaveInfo" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="login_input">
                        <asp:Button ID="btnSaveInfo" runat="server" ValidationGroup="SaveInfo" 
                            Text="Save User Information" onclick="btnSaveInfo_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
