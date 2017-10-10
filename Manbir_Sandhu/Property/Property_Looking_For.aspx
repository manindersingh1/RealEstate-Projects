<%@ Page Title="" Language="C#" MasterPageFile="~/Property_New1.Master" AutoEventWireup="true" CodeBehind="Property_Looking_For.aspx.cs" Inherits="Property.Property_Looking_For" %>
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
        <div class="containe66r">
            
            <div class="col-md-3">

            </div>
            <div class="col-md-6">

               
                <div class="Free-Home_calculator">
                    <div class="prprty_lkng_hdng">
                    <h2>Property Looking for</h2>
                </div>
                    <div class="row">
<asp:ValidationSummary ValidationGroup="SaveInfo" ID="ValidationSummary1" CssClass="validationsummary" runat="server" />
                    </div>
                    <fieldset class="login_input">
                        <label for="exampleInput">First Name</label>
                        <label style="color: red">*</label>
                        <asp:TextBox ID="txtFirstName" class="form-control" runat="server" placeholder="First Name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqFirstName" runat="server" ErrorMessage="First Name is Required"
                            ControlToValidate="txtFirstName" ValidationGroup="SaveInfo" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
                    </fieldset>
                    <fieldset class="login_input">
                        <label for="exampleInput">Last Name</label>
                         <label style="color: red">*</label>
                        <asp:TextBox ID="txtLastName" class="form-control" runat="server" placeholder="Last Name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqLastName" runat="server" ErrorMessage="Last Name is Required"
                            ControlToValidate="txtLastName" ValidationGroup="SaveInfo" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
                    </fieldset>
                    <fieldset class="login_input">
                        <label for="exampleInput">E-Mail</label>
                        <label style="color: red">*</label>
                        <asp:TextBox ID="txtEmail" class="form-control" runat="server" placeholder="E-Mail"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Email is Required"
                            ControlToValidate="txtEmail" ValidationGroup="SaveInfo" ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ControlToValidate="txtEmail" ForeColor="Red" Display="None" ErrorMessage="Invalid email!" ValidationGroup="SaveInfo">  
                        </asp:RegularExpressionValidator>
                        <asp:Label ID="lblUserMsg" runat="server" ForeColor="Red"></asp:Label>
                    </fieldset>
                    <fieldset class="login_input">
                        <label for="exampleInput">Phone Number</label>
                        <label style="color: red">*</label>
                        <asp:TextBox ID="txtPhoneno" class="form-control" runat="server" placeholder="Phone Number"></asp:TextBox>
                         
                        <asp:RequiredFieldValidator ID="reqPhoneno" runat="server" ValidationGroup="SaveInfo" ErrorMessage="Phone Number is Required" ControlToValidate="txtPhoneno"
                             ForeColor="Red" Display="None"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationGroup="SaveInfo" runat="server" ErrorMessage="Invalid Phone no."
                            ControlToValidate="txtPhoneno" Display="None" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                    </fieldset>
                    <fieldset class="login_input">
                        <label for="exampleSelect1">Desired Property Type</label>
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
                    </fieldset>
                    <fieldset class="login_input">
                        <label for="exampleSelect2">Price Range</label>
                        <asp:DropDownList ID="ddlrange" runat="server">
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
                    </fieldset>
                    <fieldset class="login_input">
                        <label for="exampleSelect2">Preferred Location <label style="color: red">*</label></label>
                        <asp:TextBox CssClass="MainContentSearchBar" ID="txtSearch" runat="server" AutoComplete="off"></asp:TextBox>
                        <ajaxtoolkit:FilteredTextBoxExtender ID="fltrtitle" runat="server" TargetControlID="txtSearch" FilterMode="InvalidChars" FilterType="LowercaseLetters,UppercaseLetters,custom" 
                            ValidChars="<,>"></ajaxtoolkit:FilteredTextBoxExtender>
                        <ajaxtoolkit:AutoCompleteExtender ID="AutoCompleteExtender1" CompletionSetCount="10"
                            TargetControlID="txtSearch" UseContextKey="True" CompletionInterval="0" ServiceMethod="GetAutoCompleteData"
                            CompletionListCssClass="AutoExtender" CompletionListItemCssClass="AutoExtenderList"
                            CompletionListHighlightedItemCssClass="AutoExtenderHighlight" MinimumPrefixLength="2"
                            Enabled="True" runat="server">
                        </ajaxtoolkit:AutoCompleteExtender>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                    ValidationGroup="SaveInfo" ErrorMessage="Preferred Location is required !" ControlToValidate="txtSearch"
                             ForeColor="Red" Display="None"></asp:RequiredFieldValidator>

                    </fieldset>
                    <fieldset class="login_input">
                        <label for="exampleTextarea">Additional Comments</label>
                        <asp:TextBox TextMode="MultiLine" runat="server" class="form-control" ID="txtMessage"></asp:TextBox>
                    </fieldset>
                    <asp:Button ID="btnsubmit" ValidationGroup="SaveInfo" runat="server" CssClass="btn btn-primary khln_frm_btn" Text="Submit" OnClick="btnsubmit_Click" />
                </div>
            </div>
            <div class="col-md-3">
            </div>
        </div>
    </div>
</asp:Content>
