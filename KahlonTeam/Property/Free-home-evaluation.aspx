﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Property_New.Master" AutoEventWireup="true"
    CodeBehind="Free-home-evaluation.aspx.cs" Inherits="Property.Free_home_evaluation" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
    <link href="slider/css/style.css" rel="stylesheet" />
    <link href="css/font.css" rel="stylesheet" />
    <link href="css/shortcodes.css" rel="stylesheet" />
    <link href="css/style_002.css" rel="stylesheet" />
    <script type="text/javascript" src="js/shortcodes.js"></script>
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
            list-style-type: none;
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
    <div>
        <div class="col-md-2 col-sm-2">
        </div>
        <div class="col-md-8 col-sm-8">
            <div class="wrapper_new">
                <div class="Free-Home_new">
                    <div>
                        <div class="property-search-container">
                            <div class="dt-sc-tabs-container" style="width: 100%;">
                                <ul class="dt-sc-tabs-frame">
                                    <li><a class="current" href="#">Free home evaluation</a></li>
                                </ul>

                                

                                <div style="display: block;" class="dt-sc-tabs-frame-content">
                                    <div class="Free-Home_new">
                                  <asp:ValidationSummary ID="ValidationSummary1" CssClass="validationsummary" ValidationGroup ="FreeHome" runat="server" />   
                                           <div class="Free-Home-Evaluation2222">
                                            <div class="Infomation">
                                                 <p>Province</p>
                                               
                                                <asp:TextBox ID="txtProvince" MaxLength="10" runat="server" PlaceHolder="Province"></asp:TextBox>

                                            </div>
                                            <div class="Infomation">
                                                 <p>City</p>
                                               
                                                <asp:TextBox ID="txtCity" runat="server" MaxLength="10" PlaceHolder="City"></asp:TextBox>
                                                
                                            </div>
                                            <div class="Infomation">
                                                 <p>Area <label style="color: red">*</label></p>
                                              
                                                <asp:TextBox ID="txtArea" runat="server" MaxLength="20" PlaceHolder="Area"></asp:TextBox>
                                               
                                            </div>
                                            <div class="Infomation">
                                                 <p>Street Address <label style="color: red">*</label></p>
                                               
                                                <asp:TextBox ID="txtAddress" MaxLength="50" runat="server" PlaceHolder="Street Address"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvAddress" ValidationGroup="FreeHome" runat="server" Display="None" 
                                                    ControlToValidate="txtAddress" ForeColor="Red" ErrorMessage="Street Address is required !" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="Infomation">
                                                 <p>Number of Bedrooms <label style="color: red">*</label></p>
                                              
                                                <asp:TextBox ID="txtBedroom" runat="server" MaxLength="2" PlaceHolder="Number of Bedrooms" data-mask="000"></asp:TextBox>
                                                <asp:CompareValidator ID="CompareValidator3" runat="server" ForeColor="Red" Operator="DataTypeCheck" Type="Integer"
                                                    ControlToValidate="txtBedroom" ErrorMessage="Value must be number" ValidationGroup="FreeHome" />
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                                                                                                    ValidationGroup="FreeHome" 
                                                                                                    runat="server" Display="none" 
                                                    ControlToValidate="txtBedroom" ForeColor="Red" ErrorMessage="Bedroom is required !" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="Infomation">
                                                 <p>Number of Bathrooms <label style="color: red">*</label></p>
                                               
                                                <asp:TextBox ID="txtBathroom" runat="server" MaxLength="2" PlaceHolder="Number Of Bathrooms" data-mask="000"></asp:TextBox>
                                               <%-- <asp:CompareValidator ID="CompareValidator4" runat="server" ForeColor="Red" Operator="DataTypeCheck" Type="Integer"
                                                    ControlToValidate="txtBathroom" ErrorMessage="Bathroom must be number" ValidationGroup="FreeHome" />--%>
                                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                                                                                                    ValidationGroup="FreeHome" 
                                                                                                    runat="server" Display="none" 
                                                    ControlToValidate="txtBathroom" ForeColor="Red" ErrorMessage="Bathroom is required !" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="Infomation">
                                                 <p>Lot Size / Acreage</p>
                                              
                                                <asp:TextBox ID="txtLotSize" MaxLength="20" runat="server" PlaceHolder="Lot Size"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="Free-Home-Evaluation2222">
                                            <div class="left_section_info">
                                                <b>House Type</b>  <label style="color: red">*</label>
                                                <asp:RequiredFieldValidator ID="rfvHouseType" runat="server" 
                                                        ValidationGroup="FreeHome" 
                                                        Display="None" ControlToValidate="rbHouseType" ForeColor="Red" ErrorMessage="House Type is required !" SetFocusOnError="true"></asp:RequiredFieldValidator> <div>
                                                    <asp:RadioButtonList ValidationGroup ="FreeHome" ID="rbHouseType" runat="server">
                                                        <asp:ListItem>Townhouse</asp:ListItem>
                                                        <asp:ListItem>Condominium</asp:ListItem>
                                                        <asp:ListItem>Semi Detached</asp:ListItem>
                                                        <asp:ListItem>Detached</asp:ListItem>
                                                        <asp:ListItem>Link</asp:ListItem>
                                                        <asp:ListItem>Row House</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                   
                                                    <%--<asp:RadioButton ID="rbTownhouse" runat="server" Text="Townhouse" GroupName="HouseType" />
                <asp:RadioButton ID="rbCondominium" runat="server" Text="Condominium" GroupName="HouseType" />
                <asp:RadioButton ID="rbSemiDetached" runat="server" Text="Semi Detached" GroupName="HouseType" />
                <asp:RadioButton ID="rbDetached" runat="server" Text="Detached" GroupName="HouseType" />
                <asp:RadioButton ID="rbLink" runat="server" Text="Link" GroupName="HouseType" />
                <asp:RadioButton ID="rbRowHouse" runat="server" Text="Row House" GroupName="HouseType" />--%>
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
                                                    <%--   <asp:RadioButton ID="rbSingle" runat="server" Text="Single" GroupName="Garage" />
                <asp:RadioButton ID="rbDouble" runat="server" Text="Double" GroupName="Garage" />
                <asp:RadioButton ID="rbTriple" runat="server" Text="Triple" GroupName="Garage" />
                <asp:RadioButton ID="rbNoGarage" runat="server" Text="No Garage" GroupName="Garage" />--%>
                                                </div>
                                            </div>
                                            <div class="left_section_info">
                                                <b>Basement</b>
                                                <asp:CheckBoxList ID="chkBasement" runat="server">
                                                    <asp:ListItem Selected>Full</asp:ListItem>
                                                    <asp:ListItem>Part</asp:ListItem>
                                                    <asp:ListItem>Finished</asp:ListItem>
                                                    <asp:ListItem>None</asp:ListItem>
                                                </asp:CheckBoxList>
                                                <%--<div>
                <asp:CheckBox ID="chkFull" runat="server" Text="Full" />
                <asp:CheckBox ID="chkPart" runat="server" Text="Part" />
                <asp:CheckBox ID="chkFinished" runat="server" Text="Finished" />
                <asp:CheckBox ID="chkNone" runat="server" Text="None" />
            </div>--%>
                                            </div>
                                        </div>
                                        <div class="Free-Home-Evaluation2222">
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
                                                    <%--      <asp:RadioButton ID="rbNew" runat="server" Text="New " GroupName="Home" />
                <asp:RadioButton ID="rb5yr" runat="server" Text="1 to 5 years " GroupName="Home" />
                <asp:RadioButton ID="rb10yr" runat="server" Text="5 to 10 years " GroupName="Home" />
                <asp:RadioButton ID="rb20yr" runat="server" Text="10 to 20 years" GroupName="Home" />
                <asp:RadioButton ID="rb50yr" runat="server" Text="20 to 50 years " GroupName="Home" />
                <asp:RadioButton ID="rbover50yr" runat="server" Text="Over 50 years " GroupName="Home" />--%>
                                                </div>
                                            </div>
                                            <div class="left_section_info">
                                                <b>When Do You Plan To Move? </b>  <label style="color: red">*</label>
                                              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                        ValidationGroup="FreeHome" 
                                                        Display="None" ControlToValidate="rbHouseType" ForeColor="Red" ErrorMessage="When do you plan to move is required !" SetFocusOnError="true"></asp:RequiredFieldValidator>  <div>
                                                    <asp:RadioButtonList ID="rbMovePlan" ValidationGroup ="FreeHome" runat="server">
                                                        <asp:ListItem>Immediately</asp:ListItem>
                                                        <asp:ListItem>Three Months</asp:ListItem>
                                                        <asp:ListItem>Six Months</asp:ListItem>
                                                        <asp:ListItem>One Year</asp:ListItem>
                                                        <asp:ListItem>Three Years</asp:ListItem>
                                                        <asp:ListItem>Undecided</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                                                

                                                    <%-- <asp:RadioButton ID="rbImmediately" runat="server" Text="Immediately " GroupName="MovePlan" />
                <asp:RadioButton ID="rb3Month" runat="server" Text="Three Months" GroupName="MovePlan" />
                <asp:RadioButton ID="rb6Month" runat="server" Text="Six Months " GroupName="MovePlan" />
                <asp:RadioButton ID="rbyr" runat="server" Text="One Year" GroupName="MovePlan" />
                <asp:RadioButton ID="rb3yr" runat="server" Text="Three Years" GroupName="MovePlan" />
                <asp:RadioButton ID="rbUndecided" runat="server" Text="Undecided " GroupName="MovePlan" />--%>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="Free-Home-Evaluation2222">
                                            <div>
                                                Additional Criteria and Information:
                                            </div>
                                            <asp:TextBox ID="txtAdditionalInfo" runat="server" TextMode="MultiLine" PlaceHolder="Additional Infomation"></asp:TextBox>
                                            <asp:RegularExpressionValidator runat="server" ID="valInput" ForeColor="Red" ControlToValidate="txtAdditionalInfo"
                                                ValidationExpression="^[\s\S]{0,100}$" ErrorMessage="Please enter a maximum of 200 characters in Addtional Criteria"
                                                Display="Dynamic"></asp:RegularExpressionValidator>
                                        </div>
                                        <div class="Free-Home-Evaluation2222">
                                            <b>Contact Information:</b>
                                            <br />
                                            Please answer all fields in this section so that we can send you the information
        you have requested as soon as possible.
          <div class="Infomation">
               <p>First Name <label style="color: red">*</label></p>
             
              <%-- <label style="color: red">*</label>--%>
              <asp:TextBox ID="txtFirstName" MaxLength="20" runat="server" PlaceHolder="First Name"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="FreeHome" runat="server" Display="None" ControlToValidate="txtFirstName" ForeColor="Red" ErrorMessage="FirstName required" SetFocusOnError="true"></asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                  ControlToValidate="txtFirstName" ErrorMessage="Only alphabets are allowed" Display="None"
                  ForeColor="Red" ValidationExpression="^[a-zA-Z ]+$"> </asp:RegularExpressionValidator>
          </div>
                                            <div class="Infomation">
                                                <p>Last Name <label style="color: red">*</label></p>
                                               
                                                <%-- <label style="color: red">*</label>--%>
                                                <asp:TextBox ID="txtLastName" MaxLength="20" runat="server" PlaceHolder="Last Name"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ValidationGroup="FreeHome" 
                                                    ForeColor="Red" runat="server" Display="None" 
                                                    ControlToValidate="txtLastName" ErrorMessage="LastName required" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="Infomation">
                                                 <p>Phone <label style="color: red">*</label></p>
                                               
                                                <asp:TextBox ID="txtPhone" runat="server" PlaceHolder="Phone"></asp:TextBox>
                                               <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                                   ValidationGroup="FreeHome" Display="None" ControlToValidate="txtPhone" 
                                                   ErrorMessage="Phone no. required" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                
                                        
                                                
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationGroup="FreeHome" runat="server" ErrorMessage="Invalid Phone no."
                                                    ControlToValidate="txtPhone" Display="None" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                            </div>

                                            <div class="Infomation">
                                                 <p>E-mail <label style="color: red">*</label></p>
                                               <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ValidationGroup="FreeHome" Display="None" 
                                                   ControlToValidate="txtEmail" ErrorMessage="Email-ID required" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                <asp:TextBox ID="txtEmail" MaxLength="30" runat="server" PlaceHolder="E-mail"></asp:TextBox>
                                                
                                                <asp:RegularExpressionValidator ID="rgeEmail" ForeColor="Red" runat="server" ValidationGroup="FreeHome" Display="None" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                    ControlToValidate="txtEmail" ErrorMessage="Invalid email address." />
                                            </div>
                                          <%--  <div class="Infomation">
                                                <p>Street Address</p>
                                              
                                                <asp:TextBox ID="txtStreet" MaxLength="50" runat="server" PlaceHolder="Street Address"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="FreeHome" ForeColor="Red" runat="server" Display="Dynamic" ControlToValidate="txtStreet" ErrorMessage="Address required" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="Infomation">
                                                 <p>City</p>
                                               
                                                <asp:TextBox ID="txtCity1" runat="server" MaxLength="10" PlaceHolder="City"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="FreeHome" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtCity1" ErrorMessage="City required" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="Infomation">
                                                <p>Province</p>
                                               
                                                <asp:TextBox ID="txtProvince1" MaxLength="10" runat="server" PlaceHolder="Province"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="FreeHome" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtProvince1" ErrorMessage="Province required" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            </div>
                                            <div class="Infomation">
                                                  <p>Postal Code</p>
                                               
                                                <asp:TextBox ID="txtlblPostalCode" MaxLength="10" runat="server" data-mask="000000" PlaceHolder="Postal Code"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ValidationGroup="FreeHome" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtlblPostalCode" ErrorMessage="Postal code required" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                                <asp:CompareValidator ID="CompareValidator6" runat="server" Operator="DataTypeCheck" Type="Integer" ControlToValidate="txtlblPostalCode" ForeColor="Red" ErrorMessage="Value must be number" ValidationGroup="DreamHome" />
                                            </div>
                                            <div class="Infomation">
                                                 <p>Country</p>
                                               
                                                <asp:TextBox ID="txtCountry" MaxLength="10" runat="server" PlaceHolder="Country"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ValidationGroup="FreeHome" runat="server" ForeColor="Red" Display="Dynamic" ControlToValidate="txtCountry" ErrorMessage="Country required" SetFocusOnError="true"></asp:RequiredFieldValidator>
                                            </div>--%>
                                        </div>
                                        <div class="Free-Home-Evaluation2222">
                                            <div class="Btn_Info">
                                                <asp:Button ID="btnSubmit" runat="server" Text="Submit" ValidationGroup="FreeHome"
                                                    OnClick="btnSubmit_Click" />
                                            </div>
                                            <div class="Btn_Info">
                                                <asp:Button ID="btnReset" runat="server" Text="Reset"
                                                    OnClick="btnReset_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-2 col-sm-2">
        </div>
    </div>
    <script src="js/jquery.mask.js"></script>
</asp:Content>
