<%@ Page Title="" Language="C#" MasterPageFile="~/PropertyNew.Master" AutoEventWireup="true"
    CodeBehind="search-for-your-dream-home.aspx.cs" Inherits="Property.search_for_your_dream_home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="top_text">
        <h1 style="color: Red;">
            Find Your Dream Home</h1>
    </div>
    <div class="top_text">
         If the time for you has come to "Find Your Dream Home", then I would love to
        help you. If you would like to have new listings emailed to you AS SOON AS THEY
        BECOME AVAILABLE, then, by filling out the form below, you will be placed on the
        "Top Priority" list... No Obligation... new listings will be sent to your E-Mail
        address.One of them just might be... YOUR DREAM HOME!</div>
    <div class="top_text">
        We ONLY collect personal information necessary to effectively market and to sell
        the property of sellers, to locate, assess and qualify properties for buyers, and
        to otherwise provide professional services to clients and customers. <b>We do not sell,
            trade, transfer, rent or exchange your personal information with anyone.</b>
        We appreciate the trust you are placing in us.</div>
    <div class="Free-Home">
        <div class="Infomation">
            <asp:Label ID="lblMinimumprice" runat="server" Text="Minimum Price Range:"></asp:Label>
            <asp:TextBox ID="txtMinimumprice" runat="server" MaxLength="10" PlaceHolder="Minimum Price"></asp:TextBox>
            <asp:RequiredFieldValidator ID="reqfval" runat="server" ValidationGroup="DreamHome"
                Display="Dynamic" ControlToValidate="txtMinimumprice" ErrorMessage="Min price required"
                SetFocusOnError="true"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ValidationGroup="DreamHome"
                Operator="DataTypeCheck" Type="Integer" ControlToValidate="txtMinimumprice" ErrorMessage="Value must be number" />
        </div>
        <div class="Infomation">
            <asp:Label ID="lblMaximumPrice" runat="server" Text="Maximum Price Range:"></asp:Label>
            <asp:TextBox ID="txtMaximumPrice" runat="server" MaxLength="10" PlaceHolder="Maximum Price"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="DreamHome"
                runat="server" Display="Dynamic" ControlToValidate="txtMaximumPrice" ErrorMessage="Maximum price required"
                SetFocusOnError="true"></asp:RequiredFieldValidator>

            <asp:CompareValidator ID="CompareValidator2" runat="server" ValidationGroup="DreamHome"
                Operator="DataTypeCheck" Type="Integer" ControlToValidate="txtMaximumPrice" ErrorMessage="Value must be number " Display="Dynamic" ></asp:CompareValidator>
                 <asp:CompareValidator ID="CompareValidator5" runat="server" ValidationGroup="DreamHome"
                Operator="GreaterThan" ControlToValidate="txtMaximumPrice" ControlToCompare="txtMinimumPrice" ErrorMessage="Price greater than minimum price " Display="Dynamic"></asp:CompareValidator>
        </div>
        <div class="Infomation">
            <asp:Label ID="lblProvince" runat="server" Text="Province"></asp:Label>
            <asp:TextBox ID="txtProvince" runat="server" MaxLength="10" PlaceHolder="Province"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="DreamHome"
                runat="server" Display="Dynamic" ControlToValidate="txtProvince" ErrorMessage="Province required"
                SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
        <div class="Infomation">
            <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
            <asp:TextBox ID="txtCity" runat="server" MaxLength="10" PlaceHolder="City"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="DreamHome"
                runat="server" Display="Dynamic" ControlToValidate="txtCity" ErrorMessage="City required"
                SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
        <div class="Infomation">
            <asp:Label ID="lblArea" runat="server" Text="Area"></asp:Label>
            <asp:TextBox ID="txtArea" MaxLength="100" runat="server" PlaceHolder="Area"></asp:TextBox>
        </div>
        <div class="Infomation">
            <asp:Label ID="lblAddress" runat="server" Text="Street Address"></asp:Label>
            <asp:TextBox ID="txtAddress" MaxLength="100" runat="server" PlaceHolder="Street Address"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="DreamHome"
                runat="server" Display="Dynamic" ControlToValidate="txtAddress" ErrorMessage="Address required"
                SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
        <div class="Infomation">
            <asp:Label ID="lblBedroom" runat="server" Text="Number of Bedrooms:"></asp:Label>
            <asp:TextBox ID="txtBedroom" runat="server" MaxLength="2" PlaceHolder="Number of Bedrooms"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator3" runat="server" Operator="DataTypeCheck"
                Type="Integer" ControlToValidate="txtBedroom" ErrorMessage="Value must be number"
                ValidationGroup="DreamHome" />
        </div>
        <div class="Infomation">
            <asp:Label ID="lblBathroom" runat="server"  Text="Number of Bathrooms:"></asp:Label>
            <asp:TextBox ID="txtBathroom" runat="server" MaxLength="2" PlaceHolder="Number Of Bathrooms"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator4" runat="server" Operator="DataTypeCheck"
                Type="Integer" ControlToValidate="txtBathroom" ErrorMessage="Value must be number"
                ValidationGroup="DreamHome" />
        </div>
        <div class="Infomation">
            <asp:Label ID="lblLotSize" runat="server" Text="Lot Size / Acreage:"></asp:Label>
            <asp:TextBox ID="txtLotSize" MaxLength="10" runat="server" PlaceHolder="Lot Size"></asp:TextBox>
        </div>
    </div>
    <div class="Free-Home">
        <div class="left_section_info">
            <b>House type</b>
            <div>
                <asp:RadioButtonList ID="rbHouseType" runat="server">
                    <asp:ListItem>Townhouse</asp:ListItem>
                    <asp:ListItem>Condominium</asp:ListItem>
                    <asp:ListItem>Semi Detached</asp:ListItem>
                    <asp:ListItem Selected="True">Detached</asp:ListItem>
                    <asp:ListItem>Link</asp:ListItem>
                    <asp:ListItem>Row House</asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>
        <div class="left_section_info">
            <b>Garage</b>
            <div>
                <asp:RadioButtonList ID="rbGarage" runat="server">
                    <asp:ListItem Selected="True">Single</asp:ListItem>
                    <asp:ListItem>Double</asp:ListItem>
                    <asp:ListItem>Triple</asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>
    </div>
    <div class="Free-Home">
        <div class="left_section_info">
            <b>Approximate Age of Home</b>
            <div>
                <asp:RadioButtonList ID="rbHome" runat="server">
                    <asp:ListItem>1 to 5 years </asp:ListItem>
                    <asp:ListItem>5 to 10 years</asp:ListItem>
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
        <asp:TextBox ID="txtAdditionalInfo" runat="server" TextMode="MultiLine" PlaceHolder="Addition Infomation"></asp:TextBox>
        <asp:RegularExpressionValidator runat="server" ID="valInput" ControlToValidate="txtAdditionalInfo"
            ValidationExpression="^[\s\S]{0,100}$" ErrorMessage="Please enter a maximum of 200 characters"
            Display="Dynamic"></asp:RegularExpressionValidator>
    </div>
    <div class="Free-Home">
        Contact Information:
        <br />
        Please answer all fields in this section so that we can send you the information
        you have requested as soon as possible.
        <div class="Infomation">
            <asp:Label ID="lblFirstName" runat="server" Text="First Name"></asp:Label>
            <asp:TextBox ID="txtFirstName" MaxLength="20" runat="server" PlaceHolder="First Name"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="DreamHome"
                runat="server" Display="Dynamic" ControlToValidate="txtFirstName" ErrorMessage="FirstName required"
                SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
        <div class="Infomation">
            <asp:Label ID="lblLastName" runat="server" Text="Last Name"></asp:Label>
            <asp:TextBox ID="txtLastName" MaxLength="20" runat="server" PlaceHolder="Last Name"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ValidationGroup="DreamHome"
                runat="server" Display="Dynamic" ControlToValidate="txtLastName" ErrorMessage="LastName required"
                SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
        <div class="Infomation">
            <asp:Label ID="lblPhone" runat="server" Text="Phone"></asp:Label>
            <asp:TextBox ID="txtPhone" runat="server" MaxLength="20" PlaceHolder="Phone"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ValidationGroup="DreamHome"
                Display="Dynamic" ControlToValidate="txtPhone" ErrorMessage="Phone No. required"
                SetFocusOnError="true"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="regPhone" ValidationGroup="DreamHome" runat="server"
                ControlToValidate="txtPhone" ValidationExpression="^(\(\d{3}\) \d{3}-\d{4}|\d{3}-\d{3}-\d{4}|\d{10})$"
                Text="Enter a valid phone number" />
        </div>
        <div class="Infomation">
            <asp:Label ID="lblEmail" runat="server" Text="E-mail"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server" MaxLength="30" PlaceHolder="E-mail"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ValidationGroup="DreamHome"
                Display="Dynamic" ControlToValidate="txtEmail" ErrorMessage="EmailID required"
                SetFocusOnError="true"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="rgeEmail" runat="server" ValidationGroup="DreamHome"
                Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Invalid email address." />
        </div>
        <div class="Infomation">
            <asp:Label ID="lblStreet" runat="server" Text="Street Address"></asp:Label>
            <asp:TextBox ID="txtStreet" MaxLength="100" runat="server" PlaceHolder="Street Address"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="DreamHome"
                runat="server" Display="Dynamic" ControlToValidate="txtStreet" ErrorMessage="Address required"
                SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
        <div class="Infomation">
            <asp:Label ID="lblCity1" runat="server" Text="City"></asp:Label>
            <asp:TextBox ID="txtCity1" MaxLength="20" runat="server" PlaceHolder="City"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="DreamHome"
                runat="server" Display="Dynamic" ControlToValidate="txtCity1" ErrorMessage="City required"
                SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
        <div class="Infomation">
            <asp:Label ID="lblProvince1" runat="server" Text="Province"></asp:Label>
            <asp:TextBox ID="txtProvince1" MaxLength="10" runat="server" PlaceHolder="Province"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="DreamHome"
                runat="server" Display="Dynamic" ControlToValidate="txtProvince1" ErrorMessage="Province required"
                SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
        <div class="Infomation">
            <asp:Label ID="lblPostalCode" runat="server" Text="Postal Code"></asp:Label>
            <asp:TextBox ID="txtlblPostalCode" MaxLength="10" runat="server" PlaceHolder="Postal Code"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ValidationGroup="DreamHome"
                runat="server" Display="Dynamic" ControlToValidate="txtlblPostalCode" ErrorMessage="Postal Code required"
                SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
        <div class="Infomation">
            <asp:Label ID="lblCountry" runat="server" Text="Country"></asp:Label>
            <asp:TextBox ID="txtCountry" MaxLength="10" runat="server" PlaceHolder="Country"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ValidationGroup="DreamHome"
                runat="server" Display="Dynamic" ControlToValidate="txtCountry" ErrorMessage="Country required"
                SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="Free-Home">
        <div class="Btn_Info">
            <asp:Button ID="btnSubmit" runat="server" ValidationGroup="DreamHome" Text="Submit"
                OnClick="btnSubmit_Click" />
        </div>
        <div class="Btn_Info">
            <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" />
        </div>
    </div>
</asp:Content>
