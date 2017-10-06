<%@ Page Title="" Language="C#" MasterPageFile="~/PropertyNew.Master" AutoEventWireup="true"
    CodeBehind="ScheduleAppointment.aspx.cs" Inherits="Property.ScheduleAppointment" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
     <link href="css/style.css" rel="stylesheet" />
    <link href="css/style_002.css" rel="stylesheet" />
    <link href="slider/css/style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ajaxtoolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </ajaxtoolkit:ToolkitScriptManager>
    <div class="free_nw_cls_bg">
      <div class="col-md-2 col-sm-2"></div>
        <div class="col-md-8 col-sm-8">
            <div class="schedule_appointment_bg">
               <%-- <ul class="dt-sc-tabs-frame">
                    <li><a class="current" href="#">Schedule Your Appointment</a></li>
                </ul>--%>
                <div style="display: block;" class="schedule_appointment">  
                    <h2>
                        Schedule Your Appointment
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
                            <asp:TextBox ID="txtPhoneNo" runat="server" MaxLength="50" PlaceHolder="Phone Number" onkeypress="return IsNumeric(event);" ondrop="return false;" onpaste="return false;" ></asp:TextBox>
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
                                Appointment Date</label>
                            <asp:TextBox ID="txtAppointmentDate" runat="server"  PlaceHolder="Date"></asp:TextBox>
                           <span class="help-inline">
                                   <ajaxtoolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtAppointmentDate"
                                                PopupButtonID="txtAppointmentDate">
                                            </ajaxtoolkit:CalendarExtender>
                                            <asp:RequiredFieldValidator ID="reqAppointmentDate" runat="server" ErrorMessage="Appointment Date is Required"
                                                ControlToValidate="txtAppointmentDate" ForeColor="Red" ValidationGroup="SaveAppointment"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                </span>
                        </div>
                    </div>
                    <div>
                        <div class="login_input">

                            <label>
                                Appointment Time</label>
                            <asp:DropDownList ID="ddlAppointmentTime" runat="server">
                                <asp:ListItem Value="0" Text="--select--"></asp:ListItem>
                                <asp:ListItem Value="9am-11am" Text="9am-11am"></asp:ListItem>
                                <asp:ListItem Value="11am-1pm" Text="11am-1pm"></asp:ListItem>
                                <asp:ListItem Value="1pm-3pm" Text="1pm-3pm"></asp:ListItem>
                                <asp:ListItem Value="3pm-5pm" Text="3pm-5pm"></asp:ListItem>
                                <asp:ListItem Value="5pm-7pm" Text="5pm-7pm"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="reqAppointmentTime" runat="server" ErrorMessage="Appointment Time is required"
                                InitialValue="0" ControlToValidate="ddlAppointmentTime" ValidationGroup="SaveAppointment"
                                SetFocusOnError="true" Display="Dynamic" CssClass="Red"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div>
                        <div class="login_input">
                       
                            <label>
                                Notes</label>
                            <asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine" Text="" PlaceHolder="Notes"></asp:TextBox>
                        </div>
                    </div>
                    
                    <div class="login_input_regstrtn">
                        <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="SaveAppointment"
                            OnClick="btnSave_Click" />
                    </div>
                     <asp:Label ID="lblmsg" runat="server" ForeColor="Red" ></asp:Label>
                </div>
            </div>
        </div>
       <div class="col-md-2 col-sm-2"></div>
        </div>
</asp:Content>
