<%@ Page Title="" Language="C#" MasterPageFile="~/PropertyNew.Master" AutoEventWireup="true"
    CodeBehind="Free-home-evaluation.aspx.cs" Inherits="Property.Free_home_evaluation" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ajaxtoolkit:ToolkitScriptManager ID="fd" runat="server"></ajaxtoolkit:ToolkitScriptManager>
    <div class="top_text">
        <h1 style="color: Red;">Free Home Evaluation </h1>
    </div>
    <div class="top_text">
        The EQUITY in your HOME is like any other Investment - it needs to be monitored.
        Homeowners should have their EQUITY evaluated once a year. Now might be the perfect
        time... And it is FREE, WITH NO OBLIGATION! Just fill out the form below.
    </div>
    <div class="top_text">
        We ONLY collect personal information necessary to effectively market and to sell
        the property of sellers, to locate, assess and qualify properties for buyers, and
        to otherwise provide professional services to clients and customers. <b>We do not sell,
            trade, transfer, rent or exchange your personal information with anyone.</b>
        We appreciate the trust you are placing in us.
    </div>
    <div class="Free-Home">
        <div class="Infomation">
            <asp:Label ID="lblProvince" runat="server" Text="Province"></asp:Label>
            <asp:TextBox ID="txtProvince" MaxLength="10" runat="server" PlaceHolder="Province"></asp:TextBox>
            <div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="FreeHome" runat="server" Display="Dynamic" ControlToValidate="txtProvince" ErrorMessage="Province required" SetFocusOnError="true"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="Infomation">
            <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
            <asp:TextBox ID="txtCity" runat="server" MaxLength="10" PlaceHolder="City"></asp:TextBox>
            <div class="requires_span">
                <asp:RequiredFieldValidator ID="RfvCity" runat="server" ValidationGroup="FreeHome" Display="Dynamic" ControlToValidate="txtCity" ErrorMessage="City required " SetFocusOnError="true"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="Infomation">
            <asp:Label ID="lblArea" runat="server" Text="Area"></asp:Label>
            <asp:TextBox ID="txtArea" runat="server" MaxLength="20" PlaceHolder="Area"></asp:TextBox>
            <div class="requires_span">
                <asp:RequiredFieldValidator ID="rfvArea" runat="server" ValidationGroup="FreeHome" Display="Dynamic" ControlToValidate="txtArea" ErrorMessage="Area required " SetFocusOnError="true"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="Infomation">
            <asp:Label ID="lblAddress" runat="server" Text="Street Address"></asp:Label>
            <asp:TextBox ID="txtAddress" MaxLength="50" runat="server" PlaceHolder="Street Address"></asp:TextBox>
            <div class="requires_span">
                <asp:RequiredFieldValidator ID="rfvAddress" ValidationGroup="FreeHome" runat="server" Display="Dynamic" ControlToValidate="txtAddress" ErrorMessage=" Street Address required" SetFocusOnError="true"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="Infomation">
            <asp:Label ID="lblBedroom" runat="server" Text="Number of Bedrooms:"></asp:Label>
            <asp:TextBox ID="txtBedroom" runat="server" MaxLength="2" PlaceHolder="Number of Bedrooms"></asp:TextBox>
            <div class="requires_span">
                <asp:CompareValidator ID="CompareValidator3" Display="Dynamic" runat="server" Operator="DataTypeCheck" Type="Integer"
                    ControlToValidate="txtBedroom" ErrorMessage="Value must be number" ValidationGroup="FreeHome" />
            </div>
        </div>
        <div class="Infomation">
            <asp:Label ID="lblBathroom" runat="server" Text="Number of Bathrooms:"></asp:Label>
            <asp:TextBox ID="txtBathroom" runat="server" MaxLength="2" PlaceHolder="Number Of Bathrooms"></asp:TextBox>
            <div class="requires_span">
                <asp:CompareValidator ID="CompareValidator4" Display="Dynamic" runat="server" Operator="DataTypeCheck" Type="Integer"
                    ControlToValidate="txtBathroom" ErrorMessage="Value must be number" ValidationGroup="FreeHome" />
            </div>
        </div>
        <div class="Infomation">
            <asp:Label ID="lblLotSize" runat="server" Text="Lot Size / Acreage:"></asp:Label>
            <asp:TextBox ID="txtLotSize" MaxLength="20" runat="server" PlaceHolder="Lot Size"></asp:TextBox>
        </div>
    </div>
    <div class="Free-Home">
        <div class="left_section_info">
            <b>House type</b>
            <div>
                <asp:RadioButtonList ID="rbHouseType" runat="server">
                    <asp:ListItem Selected>Townhouse</asp:ListItem>
                    <asp:ListItem>Condominium</asp:ListItem>
                    <asp:ListItem>Semi Detached</asp:ListItem>
                    <asp:ListItem>Detached</asp:ListItem>
                    <asp:ListItem>Link</asp:ListItem>
                    <asp:ListItem>Row House</asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>
        <div class="left_section_info">
            <b>Garage</b>
            <div>
                <asp:RadioButtonList ID="rbGarage" runat="server">
                    <asp:ListItem Selected>Single</asp:ListItem>
                    <asp:ListItem>Double</asp:ListItem>
                    <asp:ListItem>Triple</asp:ListItem>
                    <asp:ListItem>No Garage</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>
        <div class="left_section_info">
            <b>Basement Development</b>
            <asp:CheckBoxList ID="chkBasement" runat="server">
                <asp:ListItem Selected>Full</asp:ListItem>
                <asp:ListItem>Part</asp:ListItem>
                <asp:ListItem>Finished</asp:ListItem>
                <asp:ListItem>None</asp:ListItem>
            </asp:CheckBoxList>
        </div>
    </div>
    <div class="Free-Home">
        <div class="left_section_info">
            <b>Approximate Age of Home</b>
            <div>
                <asp:RadioButtonList ID="rbHome" runat="server">
                    <asp:ListItem>1 to 5 years </asp:ListItem>
                    <asp:ListItem Selected>5 to 10 years</asp:ListItem>
                    <asp:ListItem>10 to 20 years</asp:ListItem>
                    <asp:ListItem>20 to 50 years</asp:ListItem>
                    <asp:ListItem>Over 50 years</asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>
        <div class="left_section_info">
            <b>When Do You Plan To Move?</b>
            <div>
                <asp:RadioButtonList ID="rbMovePlan" runat="server">
                    <asp:ListItem>Immediately</asp:ListItem>
                    <asp:ListItem Selected>Three Months</asp:ListItem>
                    <asp:ListItem>Six Months</asp:ListItem>
                    <asp:ListItem>One Year</asp:ListItem>
                    <asp:ListItem>Three Years</asp:ListItem>
                    <asp:ListItem>Undecided</asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>
    </div>
    <div class="Free-Home">
        <div>
            Additional Criteria and Information:
        </div>
        <asp:TextBox ID="txtAdditionalInfo" runat="server" TextMode="MultiLine" PlaceHolder="Additional Infomation"></asp:TextBox>
        <div class="requires_span">
            <asp:RegularExpressionValidator runat="server" ID="valInput" ControlToValidate="txtAdditionalInfo"
                ValidationExpression="^[\s\S]{0,100}$" ErrorMessage="Please enter a maximum of 200 characters"
                Display="Dynamic"></asp:RegularExpressionValidator>
        </div>
    </div>
    <div class="Free-Home">
        <b>Contact Information:</b>
        <br />
        Please answer all fields in this section so that we can send you the information
        you have requested as soon as possible.
          <div class="Infomation">
              <asp:Label ID="lblFirstName" runat="server" Text="First Name"></asp:Label>
              <asp:TextBox ID="txtFirstName" MaxLength="20" runat="server" PlaceHolder="First Name"></asp:TextBox>
              <div class="requires_span">
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                      ControlToValidate="txtFirstName" ErrorMessage="Only alphabets are allowed" ValidationGroup="FreeHome"
                      ForeColor="Red" Display="Dynamic" ValidationExpression="^[a-zA-Z ]+$"> </asp:RegularExpressionValidator>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="FreeHome" runat="server" Display="Dynamic" ControlToValidate="txtFirstName" ErrorMessage="FirstName required" SetFocusOnError="true"></asp:RequiredFieldValidator>
              </div>
          </div>
        <div class="Infomation">
            <asp:Label ID="lblLastName" runat="server" Text="Last Name"></asp:Label>
            <asp:TextBox ID="txtLastName" MaxLength="20" runat="server" PlaceHolder="Last Name"></asp:TextBox>
            <div class="requires_span">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                    ControlToValidate="txtLastName" ErrorMessage="Only alphabets are allowed" ValidationGroup="FreeHome"
                    ForeColor="Red" Display="Dynamic" ValidationExpression="^[a-zA-Z ]+$"> </asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ValidationGroup="FreeHome" runat="server" Display="Dynamic" ControlToValidate="txtLastName" ErrorMessage="LastName required" SetFocusOnError="true"></asp:RequiredFieldValidator>

            </div>
        </div>
        <div class="Infomation">
            <asp:Label ID="lblPhone" runat="server" Text="Phone"></asp:Label>
            <asp:TextBox ID="txtPhone" runat="server" PlaceHolder="Phone"></asp:TextBox>
            <div class="requires_span">
                <ajaxtoolkit:MaskedEditExtender runat="server" ID="mee" Mask="(999) 999-9999"
                    TargetControlID="txtPhone">
                </ajaxtoolkit:MaskedEditExtender>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ValidationGroup="FreeHome" Display="Dynamic" ControlToValidate="txtPhone" ErrorMessage="Phone No. required" SetFocusOnError="true"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regPhone" ValidationGroup="FreeHome" runat="server" Display="Dynamic" ControlToValidate="txtPhone"
                    ValidationExpression="^(\(\d{3}\) \d{3}-\d{4}|\d{3}-\d{3}-\d{4}|\d{10})$"
                    Text="Enter a valid phone number" />
            </div>
        </div>
        <div class="Infomation">
            <asp:Label ID="lblEmail" runat="server" Text="E-mail"></asp:Label>
            <asp:TextBox ID="txtEmail" MaxLength="30" runat="server" PlaceHolder="E-mail"></asp:TextBox>
            <div class="requires_span">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ValidationGroup="FreeHome" Display="Dynamic" ControlToValidate="txtEmail" ErrorMessage="EmailID required" SetFocusOnError="true"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="rgeEmail" runat="server" ValidationGroup="FreeHome" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Invalid email address." />

            </div>
        </div>
        <div class="Infomation">
            <asp:Label ID="lblStreet" runat="server" Text="Street Address"></asp:Label>
            <asp:TextBox ID="txtStreet" MaxLength="50" runat="server" PlaceHolder="Street Address"></asp:TextBox>
            <div class="requires_span">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="FreeHome" runat="server" Display="Dynamic" ControlToValidate="txtStreet" ErrorMessage="Address required" SetFocusOnError="true"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="Infomation">
            <asp:Label ID="lblCity1" runat="server" Text="City"></asp:Label>
            <asp:TextBox ID="txtCity1" runat="server" MaxLength="10" PlaceHolder="City"></asp:TextBox>
            <div class="requires_span">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server"
                    ControlToValidate="txtCity1" ErrorMessage="Only alphabets are allowed" ValidationGroup="FreeHome"
                    ForeColor="Red" Display="Dynamic" ValidationExpression="^([a-zA-Z0-9 .&'-]+)$"> </asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="FreeHome" runat="server" Display="Dynamic" ControlToValidate="txtCity1" ErrorMessage="City required" SetFocusOnError="true"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="Infomation">
            <asp:Label ID="lblProvince1" runat="server" Text="Province"></asp:Label>
            <asp:TextBox ID="txtProvince1" MaxLength="10" runat="server" PlaceHolder="Province"></asp:TextBox>
            <div class="requires_span">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server"
                    ControlToValidate="txtProvince1" ErrorMessage="Only alphabets are allowed" ValidationGroup="FreeHome"
                    ForeColor="Red" Display="Dynamic" ValidationExpression="^([a-zA-Z0-9 .&'-]+)$"> </asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="FreeHome" runat="server" Display="Dynamic" ControlToValidate="txtProvince1" ErrorMessage="Province required" SetFocusOnError="true"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="Infomation">
            <asp:Label ID="lblPostalCode" runat="server" Text="Postal Code"></asp:Label>
            <asp:TextBox ID="txtlblPostalCode" MaxLength="10" runat="server" PlaceHolder="Postal Code"></asp:TextBox>
            <div class="requires_span">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ValidationGroup="FreeHome" runat="server" Display="Dynamic" ControlToValidate="txtlblPostalCode" ErrorMessage="Postal Code required" SetFocusOnError="true"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="Infomation">
            <asp:Label ID="lblCountry" runat="server" Text="Country"></asp:Label>
            <asp:TextBox ID="txtCountry" MaxLength="10" runat="server" PlaceHolder="Country"></asp:TextBox>
            <div class="requires_span">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server"
                    ControlToValidate="txtCountry" ErrorMessage="Only alphabets are allowed" ValidationGroup="FreeHome"
                    ForeColor="Red" Display="Dynamic" ValidationExpression="^([a-zA-Z0-9 .&'-]+)$"> </asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ValidationGroup="FreeHome" runat="server" Display="Dynamic" ControlToValidate="txtCountry" ErrorMessage="Country required" SetFocusOnError="true"></asp:RequiredFieldValidator>
            </div>
        </div>
    </div>
    <div class="Free-Home">
        <div class="Btn_Info">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" ValidationGroup="FreeHome"
                OnClick="btnSubmit_Click" />
        </div>
        <div class="Btn_Info">
            <asp:Button ID="btnReset" runat="server" Text="Reset"
                OnClick="btnReset_Click" />
        </div>
    </div>
</asp:Content>
