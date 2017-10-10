<%@ Page Title="" Language="C#" MasterPageFile="~/PropertyNew.Master" AutoEventWireup="true" CodeBehind="BankSale.aspx.cs" Inherits="Property.BankSale" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <style type="text/css">
    .AutoExtender {
        background: none repeat scroll 0 0 hsl(0, 0%, 96%);
        border: 1px solid #ccc;
        font-family: Verdana,Arial Black;
        font-size: 12px;
        font-weight: normal;
        height: auto;
        line-height: 20px;
        margin-top: -1px;
        position: absolute;
        width: 265px !important;
        z-index: 600001;
        padding-bottom: 10px;
        padding-top: 10px;
    }

    .AutoExtenderList {
        cursor: pointer;
        color: Black;
        width: 257px;
        padding-left: 7px;
        list-style-type:none;
    }

    .AutoExtenderHighlight {
        color: White;
        background-color: #006699;
        cursor: pointer;
        width: 257px;
        padding-left: 7px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="script" runat="server"></asp:ScriptManager>
    <div class="free_nw_cls_bg">
      <div class="col-md-2 col-sm-2"></div>
        <div class="col-md-8 col-sm-8">
            <div class="schedule_appointment_bg">
                <div style="display: block;" class="schedule_appointment">
                    <h2>Fill the following Details
                    </h2>
                    <div>
                        <div class="login_input">
                            <label>
                                First Name</label>
                            <asp:TextBox ID="txtFirstName" runat="server" MaxLength="50" PlaceHolder="First Name"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                ControlToValidate="txtFirstName" ErrorMessage="Only alphabets are allowed"
                                ForeColor="Red" ValidationGroup="SaveAppointment" Display="Dynamic" ValidationExpression="^[a-zA-Z ]+$"> </asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="reqFirstName" runat="server" ErrorMessage="First Name is Required"
                                ControlToValidate="txtFirstName" ForeColor="Red" ValidationGroup="SaveAppointment"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div>
                        <div class="login_input">
                            <label>
                                Last Name</label>
                            <asp:TextBox ID="txtLastName" runat="server" MaxLength="50" PlaceHolder="Last Name"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                ControlToValidate="txtLastName" ErrorMessage="Only alphabets are allowed"
                                ForeColor="Red" ValidationGroup="SaveAppointment" Display="Dynamic" ValidationExpression="^[a-zA-Z ]+$"> </asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="reqLastName" runat="server" ErrorMessage="Last Name is Required"
                                ControlToValidate="txtLastName" ForeColor="Red" ValidationGroup="SaveAppointment"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div>
                        <div class="login_input">
                            <label>
                                Email</label>
                            <asp:TextBox ID="txtEmail" runat="server" MaxLength="150" TextMode="Email" PlaceHolder="Email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="reqEmail" runat="server" ErrorMessage="Email is Required"
                                ControlToValidate="txtEmail" ForeColor="Red" ValidationGroup="SaveAppointment"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegEmail" ForeColor="Red" runat="server" ErrorMessage="Email is not valid"
                                ValidationGroup="SaveAppointment" SetFocusOnError="true" ControlToValidate="txtEmail"
                                Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                            </asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div>
                        <div class="login_input">
                            <label>
                                Phone Number</label>
                            <asp:TextBox ID="txtPhoneNo" runat="server" MaxLength="50" PlaceHolder="Phone Number" onkeypress="return IsNumeric(event);" ondrop="return false;" onpaste="return false;"></asp:TextBox>
                            <ajaxtoolkit:MaskedEditExtender runat="server" ID="mee" Mask="(999) 999-9999"
                                TargetControlID="txtPhoneNo">
                            </ajaxtoolkit:MaskedEditExtender>
                            <asp:RequiredFieldValidator ID="rfvPhoneNo" runat="server" ErrorMessage="Phone Number is Required"
                                ControlToValidate="txtPhoneNo" ForeColor="Red" ValidationGroup="SaveAppointment"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator2" ValidationGroup="SaveAppointment" ForeColor="red" runat="server" ErrorMessage="Invalid Phone no."
                                ControlToValidate="txtPhoneNo" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <div>
                        <div class="login_input">
                            <label>
                                Desired Property Type</label>
                            <asp:DropDownList ID="ddltype" runat="server">
                                <asp:ListItem>Select</asp:ListItem>
                                <asp:ListItem>Detached</asp:ListItem>
                                <asp:ListItem>Semi-detached</asp:ListItem>
                                <asp:ListItem> Attached/Townhouse</asp:ListItem>
                                <asp:ListItem> Condo/Loft</asp:ListItem>
                                <asp:ListItem> Investment/Rental Property</asp:ListItem>
                                <asp:ListItem>Commercial, Vacant Land</asp:ListItem>
                                <asp:ListItem>Cottage/Vacation Home</asp:ListItem>
                            </asp:DropDownList>

                        </div>
                    </div>
                    <div>
                        <div class="login_input">
                           <label>Price Range</label>
                            <asp:DropDownList ID="DropDownList1" runat="server">
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
                        </div>
                    </div>
                    <div>
                        <div class="login_input">
                             <label >Preferred Location
                                </label>
                            <asp:TextBox ID="txtSearch" runat="server" AutoComplete="off"></asp:TextBox>
                            <ajaxtoolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtSearch" FilterMode="InvalidChars" FilterType="LowercaseLetters,UppercaseLetters,custom"
                                ValidChars="<,>">
                            </ajaxtoolkit:FilteredTextBoxExtender>
                            <ajaxtoolkit:AutoCompleteExtender ID="AutoCompleteExtender2" CompletionSetCount="10"
                                TargetControlID="txtSearch" UseContextKey="True" CompletionInterval="0" ServiceMethod="GetAutoCompleteData"
                                CompletionListCssClass="AutoExtender" CompletionListItemCssClass="AutoExtenderList"
                                CompletionListHighlightedItemCssClass="AutoExtenderHighlight" MinimumPrefixLength="2"
                                Enabled="True" runat="server">
                            </ajaxtoolkit:AutoCompleteExtender>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                ValidationGroup="SaveInfo" ErrorMessage="Preferred Location is required !" ControlToValidate="txtSearch"
                                ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div>
                        <div class="login_input">
                            <label >Additional Comments</label>
                            <asp:TextBox TextMode="MultiLine" runat="server" class="form-control" ID="txtMessage"></asp:TextBox>
                        </div>
                    </div>
                    <div class="login_input_regstrtn">
                         <asp:Button ID="btnsubmit" ValidationGroup="SaveInfo" runat="server" CssClass="btn btn-primary khln_frm_btn" Text="Submit" OnClick="btnsubmit_Click" />
                      <%--  <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="SaveAppointment"
                            OnClick="btnSave_Click" />--%>
                    </div>
                    <asp:Label ID="lblmsg" runat="server" ForeColor="Red"></asp:Label>
                </div>
            </div>
        </div>
       <div class="col-md-2 col-sm-2"></div>
        </div>
   
</asp:Content>
