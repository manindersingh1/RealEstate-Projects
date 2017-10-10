<%@ Page Title="" Language="C#" MasterPageFile="~/PropertyNew.Master" AutoEventWireup="true"
    CodeBehind="Free-home-evaluation.aspx.cs" Inherits="Property.Free_home_evaluation" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ajaxtoolkit:ToolkitScriptManager ID="fd" runat="server"></ajaxtoolkit:ToolkitScriptManager>
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/style_002.css" rel="stylesheet" />
    <link href="slider/css/style.css" rel="stylesheet" />
    
    
    <div class="free_nw_cls_bg">
     <div class="free_home_top">
        <h1>Free Home Evaluation </h1>
        <p> The EQUITY in your HOME is like any other Investment - it needs to be monitored.
        Homeowners should have their EQUITY evaluated once a year. Now might be the perfect
        time... And it is FREE, WITH NO OBLIGATION! Just fill out the form below.</p>
        <p> We ONLY collect personal information necessary to effectively market and to sell
        the property of sellers, to locate, assess and qualify properties for buyers, and
        to otherwise provide professional services to clients and customers. <b>We do not sell,
            trade, transfer, rent or exchange your personal information with anyone.</b>
        We appreciate the trust you are placing in us.</p>
    </div>
   
       <div class="col-md-2 col-sm-2"></div>
       <div class="col-md-8 col-sm-8">
    <div class="Free-Home_form_bg">
         <div class="free_home-frm_sect">
       <div class="row">
           <div class="col-md-3 col-sm-3"> <div class="Infomation_new_frm">
            <asp:Label ID="lblProvince" runat="server" Text="Province"></asp:Label>
            </div>
           </div>
         <div class="col-md-9 col-sm-9"><div class="Infomation_new_frm">
            <asp:TextBox ID="txtProvince" MaxLength="10" runat="server" PlaceHolder="Province"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="FreeHome" runat="server" Display="Dynamic" ControlToValidate="txtProvince" ErrorMessage="Province required" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
             </div>
           </div>
        <div class="row">
       <div class="col-md-3 col-sm-3"> <div class="Infomation_new_frm">
            <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
           </div>
           </div>
        <div class="col-md-9 col-sm-9"><div class="Infomation_new_frm">
            <asp:TextBox ID="txtCity" runat="server" MaxLength="10" PlaceHolder="City"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RfvCity" runat="server" ValidationGroup="FreeHome" Display="Dynamic" ControlToValidate="txtCity" ErrorMessage="City required " SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
            </div>
            </div>
      <div class="row">
       <div class="col-md-3 col-sm-3"> <div class="Infomation_new_frm">
            <asp:Label ID="lblArea" runat="server" Text="Area"></asp:Label>
             </div>
           </div>
          <div class="col-md-9 col-sm-9"><div class="Infomation_new_frm">
            <asp:TextBox ID="txtArea" runat="server" MaxLength="20" PlaceHolder="Area"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvArea" runat="server" ValidationGroup="FreeHome" Display="Dynamic" ControlToValidate="txtArea" ErrorMessage="Area required " SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
            </div>
            </div>

       <div class="row">
       <div class="col-md-3 col-sm-3"> <div class="Infomation_new_frm">
            <asp:Label ID="lblAddress" runat="server" Text="Street Address"></asp:Label>
             </div>
           </div>
             <div class="col-md-9 col-sm-9"><div class="Infomation_new_frm">
            <asp:TextBox ID="txtAddress" MaxLength="50" runat="server" PlaceHolder="Street Address"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvAddress" ValidationGroup="FreeHome" runat="server" Display="Dynamic" ControlToValidate="txtAddress" ErrorMessage=" Street Address required" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
            </div>
            </div>

       <div class="row">
       <div class="col-md-3 col-sm-3"> <div class="Infomation_new_frm">
            <asp:Label ID="lblBedroom" runat="server" Text="Number of Bedrooms:"></asp:Label>
               </div>
           </div>
           <div class="col-md-9 col-sm-9"><div class="Infomation_new_frm">
            <asp:TextBox ID="txtBedroom" runat="server" MaxLength="2" PlaceHolder="Number of Bedrooms"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator3" Display="Dynamic" runat="server" Operator="DataTypeCheck" Type="Integer"
                ControlToValidate="txtBedroom" ErrorMessage="Value must be number" ValidationGroup="FreeHome" />
           </div>
            </div>
            </div>
          
        <div class="row">
       <div class="col-md-3 col-sm-3"> <div class="Infomation_new_frm">
            <asp:Label ID="lblBathroom" runat="server" Text="Number of Bathrooms:"></asp:Label>
           </div>
           </div>
            <div class="col-md-9 col-sm-9"><div class="Infomation_new_frm">
            <asp:TextBox ID="txtBathroom" runat="server" MaxLength="2" PlaceHolder="Number Of Bathrooms"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator4" Display="Dynamic" runat="server" Operator="DataTypeCheck" Type="Integer"
                ControlToValidate="txtBathroom" ErrorMessage="Value must be number" ValidationGroup="FreeHome" />
         </div>
            </div>
            </div>
        <div class="row">
       <div class="col-md-3 col-sm-3"> <div class="Infomation_new_frm">
            <asp:Label ID="lblLotSize" runat="server" Text="Lot Size / Acreage:"></asp:Label>
           </div>
           </div>
            <div class="col-md-9 col-sm-9"><div class="Infomation_new_frm">
            <asp:TextBox ID="txtLotSize" MaxLength="20" runat="server" PlaceHolder="Lot Size"></asp:TextBox>
        </div>
            </div>
            </div>
    </div>
        </div>



    <div class="Free-Home_form_bg">
        <div class="free_home-frm_sect">
       <div class="col-md-4 col-sm-4">
             <div class="left_section_info_new">
            <h2>House type</h2>
            <div class="free_tmp_frmm">
                <asp:RadioButtonList ID="rbHouseType" runat="server">
                    <asp:ListItem Selected>Townhouse</asp:ListItem>
                    <asp:ListItem>Condominium</asp:ListItem>
                    <asp:ListItem>Semi Detached</asp:ListItem>
                    <asp:ListItem >Detached</asp:ListItem>
                    <asp:ListItem>Link</asp:ListItem>
                    <asp:ListItem>Row House</asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>
           </div>
            <div class="col-md-4 col-sm-4">
        <div class="left_section_info_new">
            <h2>Garage</h2>
            <div class="free_tmp_frmm">
                <asp:RadioButtonList ID="rbGarage" runat="server">
                    <asp:ListItem Selected>Single</asp:ListItem>
                    <asp:ListItem>Double</asp:ListItem>
                    <asp:ListItem>Triple</asp:ListItem>
                    <asp:ListItem>No Garage</asp:ListItem>
                    <asp:ListItem>Other</asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>
                </div>
            <div class="col-md-4 col-sm-4">
        <div class="left_section_info_new">
            <h2>Basement Development</h2>
            
              <div class="free_tmp_frmm">
                  <asp:CheckBoxList ID="chkBasement" runat="server">
                <asp:ListItem Selected>Full</asp:ListItem>
                <asp:ListItem>Part</asp:ListItem>
                <asp:ListItem>Finished</asp:ListItem>
                <asp:ListItem>None</asp:ListItem>
            </asp:CheckBoxList>
        </div>
            </div>
                </div>
    </div>
        </div>




           <div class="Free-Home_form_bg">
               <div class="free_home-frm_sect">
                   <div class="col-md-6 col-sm-6">
                       <div class="left_section_info_new">
                           <h2>Approximate Age of Home</h2>
                           <div class="free_tmp_frmm">
                               <asp:RadioButtonList ID="rbHome" runat="server">
                                   <asp:ListItem>1 to 5 years </asp:ListItem>
                                   <asp:ListItem Selected>5 to 10 years</asp:ListItem>
                                   <asp:ListItem>10 to 20 years</asp:ListItem>
                                   <asp:ListItem>20 to 50 years</asp:ListItem>
                                   <asp:ListItem>Over 50 years</asp:ListItem>
                               </asp:RadioButtonList>
                           </div>
                       </div>
                   </div>
                   <div class="col-md-6 col-sm-6">
                       <div class="left_section_info_new">
                           <h2>When Do You Plan To Move?</h2>
                           <div class="free_tmp_frmm">
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
                  
               </div>
           </div>




    <div class="Free-Home_form_bg">
        <div class="left_section_info_new">
             <h2>
            Additional Criteria and Information:
        </h2>
        <asp:TextBox ID="txtAdditionalInfo" runat="server" TextMode="MultiLine" CssClass="txtar_fre_hme" PlaceHolder="Additional Infomation"></asp:TextBox>
        <asp:RegularExpressionValidator runat="server" ID="valInput" ControlToValidate="txtAdditionalInfo"
            ValidationExpression="^[\s\S]{0,100}$" ErrorMessage="Please enter a maximum of 200 characters"
            Display="Dynamic"></asp:RegularExpressionValidator>
    </div>
        </div>




    <div class="Free-Home_form_bg">
         <div class="free_home-frm_sect">
        <h2 >Contact Information:</h2>
         <p>Please answer all fields in this section so that we can send you the information
        you have requested as soon as possible.</p>
          
           <div class="row">
       <div class="col-md-3 col-sm-3"> <div class="Infomation_new_frm">
              <asp:Label ID="lblFirstName" runat="server" Text="First Name"></asp:Label>
           </div>
           </div>
               <div class="col-md-9 col-sm-9"><div class="Infomation_new_frm">
              <asp:TextBox ID="txtFirstName" MaxLength="20" runat="server" PlaceHolder="First Name"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="FreeHome" runat="server" Display="Dynamic" ControlToValidate="txtFirstName" ErrorMessage="FirstName required" SetFocusOnError="true"></asp:RequiredFieldValidator>
              </div>
                   </div>
          </div>

        <div class="row">
       <div class="col-md-3 col-sm-3"> <div class="Infomation_new_frm">
            <asp:Label ID="lblLastName" runat="server" Text="Last Name"></asp:Label>
           </div>
           </div>
                    <div class="col-md-9 col-sm-9"><div class="Infomation_new_frm">
            <asp:TextBox ID="txtLastName" MaxLength="20" runat="server" PlaceHolder="Last Name"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ValidationGroup="FreeHome" runat="server" Display="Dynamic" ControlToValidate="txtLastName" ErrorMessage="LastName required" SetFocusOnError="true"></asp:RequiredFieldValidator>
        </div>
                   </div>
          </div>

      <div class="row">
       <div class="col-md-3 col-sm-3"> <div class="Infomation_new_frm">
            <asp:Label ID="lblPhone" runat="server" Text="Phone"></asp:Label>
            </div>
           </div>
           <div class="col-md-9 col-sm-9"><div class="Infomation_new_frm">
            <asp:TextBox ID="txtPhone" runat="server" PlaceHolder="Phone"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ValidationGroup="FreeHome" Display="Dynamic" ControlToValidate="txtPhone" ErrorMessage="Phone No. required" SetFocusOnError="true"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="regPhone" ValidationGroup="DreamHome" runat="server" Display="Dynamic" ControlToValidate="txtPhone"
                ValidationExpression="^(\(\d{3}\) \d{3}-\d{4}|\d{3}-\d{3}-\d{4}|\d{10})$"
                Text="Enter a valid phone number" />
       </div>
                   </div>
          </div>


        <div class="row">
       <div class="col-md-3 col-sm-3"> <div class="Infomation_new_frm">
            <asp:Label ID="lblEmail" runat="server" Text="E-mail"></asp:Label>
           </div>
           </div>
            <div class="col-md-9 col-sm-9"><div class="Infomation_new_frm">
            <asp:TextBox ID="txtEmail" MaxLength="30" runat="server" PlaceHolder="E-mail"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ValidationGroup="FreeHome" Display="Dynamic" ControlToValidate="txtEmail" ErrorMessage="EmailID required" SetFocusOnError="true"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="rgeEmail" runat="server" ValidationGroup="FreeHome" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Invalid email address." />
           </div>
                   </div>
          </div>

      <div class="row">
       <div class="col-md-3 col-sm-3"> <div class="Infomation_new_frm">
            <asp:Label ID="lblStreet" runat="server" Text="Street Address"></asp:Label>
             </div>
           </div>
          <div class="col-md-9 col-sm-9"><div class="Infomation_new_frm">
            <asp:TextBox ID="txtStreet" MaxLength="50" runat="server" PlaceHolder="Street Address"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="FreeHome" runat="server" Display="Dynamic" ControlToValidate="txtStreet" ErrorMessage="Address required" SetFocusOnError="true"></asp:RequiredFieldValidator>
            </div>
                   </div>
          </div>

       <div class="row">
       <div class="col-md-3 col-sm-3"> <div class="Infomation_new_frm">
            <asp:Label ID="lblCity1" runat="server" Text="City"></asp:Label>
            </div>
           </div>
            <div class="col-md-9 col-sm-9"><div class="Infomation_new_frm">
            <asp:TextBox ID="txtCity1" runat="server" MaxLength="10" PlaceHolder="City"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ValidationGroup="FreeHome" runat="server" Display="Dynamic" ControlToValidate="txtCity1" ErrorMessage="City required" SetFocusOnError="true"></asp:RequiredFieldValidator>
           </div>
                   </div>
          </div>

        <div class="row">
       <div class="col-md-3 col-sm-3"> <div class="Infomation_new_frm">
            <asp:Label ID="lblProvince1" runat="server" Text="Province"></asp:Label>
            </div>
           </div>
                   <div class="col-md-9 col-sm-9"><div class="Infomation_new_frm">
            <asp:TextBox ID="txtProvince1" MaxLength="10" runat="server" PlaceHolder="Province"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="FreeHome" runat="server" Display="Dynamic" ControlToValidate="txtProvince1" ErrorMessage="Province required" SetFocusOnError="true"></asp:RequiredFieldValidator>
       </div>
                   </div>
          </div>

      <div class="row">
       <div class="col-md-3 col-sm-3"> <div class="Infomation_new_frm">
            <asp:Label ID="lblPostalCode" runat="server" Text="Postal Code"></asp:Label>
           </div>
           </div>
                   <div class="col-md-9 col-sm-9"><div class="Infomation_new_frm">
            <asp:TextBox ID="txtlblPostalCode" MaxLength="10" runat="server" PlaceHolder="Postal Code"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ValidationGroup="FreeHome" runat="server" Display="Dynamic" ControlToValidate="txtlblPostalCode" ErrorMessage="Postal Code required" SetFocusOnError="true"></asp:RequiredFieldValidator>
         </div>
                   </div>
                       </div>

     <div class="row">
       <div class="col-md-3 col-sm-3"> <div class="Infomation_new_frm">
            <asp:Label ID="lblCountry" runat="server" Text="Country"></asp:Label>
           </div>
           </div>
          <div class="col-md-9 col-sm-9"><div class="Infomation_new_frm">
            <asp:TextBox ID="txtCountry" MaxLength="10" runat="server" PlaceHolder="Country"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ValidationGroup="FreeHome" runat="server" Display="Dynamic" ControlToValidate="txtCountry" ErrorMessage="Country required" SetFocusOnError="true"></asp:RequiredFieldValidator>
              </div>
                   </div>
                       </div>

    </div>
        </div>



    <div class="Free-Home_form_bg">
         <div class="free_home-frm_sect">
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
       <div class="col-md-2 col-sm-2"></div>
       </div>
    
    
    
    
    
    
</asp:Content>
