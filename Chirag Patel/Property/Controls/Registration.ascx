<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Registration.ascx.cs"
    Inherits="Property.Controls.Registration" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<div class="span9">
     <asp:ScriptManager runat="server" ID="update"></asp:ScriptManager>
    <div class="content">
        <div class="module">
            <div class="module-head">
                <h3>Registration</h3>
            </div>
            <div class="module-body">

                <br />

                <div class="form-horizontal row-fluid">
                    <div class="control-group">
                        <label class="control-label" for="basicinput">Name</label>
                        <div class="controls">
                            <asp:TextBox ID="txtFirstName" runat="server" MaxLength="50" PlaceHolder="First Name.." class="span8"></asp:TextBox>
                            <span class="help-inline">
                                  <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Name is Required"
                                        ControlToValidate="txtFirstName" ForeColor="Red"  ValidationGroup="SaveInfo" Display="Dynamic"></asp:RequiredFieldValidator>
                                     <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                       ControlToValidate="txtFirstName" ErrorMessage="Only alphabets are allowed"  ValidationGroup="SaveInfo"
                       ForeColor="Red" Display="Dynamic" ValidationExpression="^[a-zA-Z ]+$"  > </asp:RegularExpressionValidator> 
                            </span>
                        </div>
                    </div>
                     <div class="control-group">
                        <label class="control-label" for="basicinput">Date of Birth</label>
                        <div class="controls">
                            <asp:TextBox ID="txtDateofBirth" runat="server" MaxLength="20" PlaceHolder="Date of Birth.."  class="span8"></asp:TextBox>
                            <ajaxtoolkit:CalendarExtender ID="txtDate_CalendarExtender" Format="MM-dd-yyyy" TargetControlID="txtDateofBirth" runat="server"></ajaxtoolkit:CalendarExtender>
                            <span class="help-inline">
                                  <asp:RequiredFieldValidator ID="rfvDateofBirth" runat="server" ErrorMessage="Date of Birth is Required"
                                        ControlToValidate="txtDateofBirth" ForeColor="Red"  ValidationGroup="SaveInfo" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server"
                       ControlToValidate="txtDateofBirth" ErrorMessage="Only mm/dd/yyyy Format is allowed"  ValidationGroup="SaveInfo"
                       ForeColor="Red" Display="Dynamic" ValidationExpression="^(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d+$"  > </asp:RegularExpressionValidator> 
                            </span>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="basicinput">Address</label>
                        <div class="controls">
                            <asp:TextBox ID="txtAddress" runat="server" MaxLength="255" PlaceHolder="Address.." class="span8"></asp:TextBox>
                            <span class="help-inline">
                                <asp:RequiredFieldValidator ID="reqAddress" runat="server" ErrorMessage="Address required"
                                    ControlToValidate="txtAddress"  ValidationGroup="SaveInfo" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </span>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label" for="basicinput">City</label>
                        <div class="controls">
                            <asp:TextBox ID="txtCity" runat="server" class="span8" MaxLength="50" PlaceHolder="City.."></asp:TextBox>
                            <span class="help-inline">
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                       ControlToValidate="txtCity" ErrorMessage="Only alphabets are allowed"  ValidationGroup="SaveInfo"
                       ForeColor="Red" Display="Dynamic" ValidationExpression="^[a-zA-Z ]+$"  > </asp:RegularExpressionValidator> 
                                <asp:RequiredFieldValidator ID="reqCity" runat="server" ErrorMessage="City required"
                                    ControlToValidate="txtCity" ValidationGroup="SaveInfo" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </span>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label" for="basicinput">State</label>
                        <div class="controls">
                            <asp:TextBox ID="txtState" runat="server" class="span8" MaxLength="50" PlaceHolder="State.."></asp:TextBox>
                            <span class="help-inline">
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server"
                       ControlToValidate="txtState" ErrorMessage="Only alphabets are allowed"   ValidationGroup="SaveInfo"
                       ForeColor="Red" Display="Dynamic" ValidationExpression="^[a-zA-Z ]+$"  > </asp:RegularExpressionValidator> 
                                <asp:RequiredFieldValidator ID="reqState" runat="server" ErrorMessage="State required"
                                    ControlToValidate="txtState" ValidationGroup="SaveInfo" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </span>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label" for="basicinput">Phone No.</label>
                        <div class="controls">
                            <asp:TextBox ID="txtPhoneNo" runat="server" MaxLength="10" class="span8" PlaceHolder="Phone Number.."></asp:TextBox>
                            <span class="help-inline">
                                    
                                    <asp:RequiredFieldValidator ID="reqPhoneno" runat="server" ErrorMessage="Phone Number Required " ControlToValidate="txtPhoneNo"
                                        ValidationGroup="SaveInfo"  ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationGroup="SaveInfo"  runat="server" ErrorMessage="Invalid Phone no."
                                        ControlToValidate="txtPhoneNo" Display="Dynamic" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                            </span>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="basicinput">Email</label>
                        <div class="controls">
                            <asp:TextBox ID="txtUsername" runat="server" MaxLength="50" class="span8"  PlaceHolder="User Name.." OnTextChanged="txtUsername_TextChanged"></asp:TextBox>
                            <span class="help-inline">
                                <asp:Label ID="lblUsernamemsg" runat="server" ForeColor="Red"></asp:Label>
                                <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ErrorMessage="E-mail Required" ControlToValidate="txtUsername"
                                    ValidationGroup="SaveInfo" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    ControlToValidate="txtUsername" ValidationGroup="SaveInfo" ForeColor="Red" ErrorMessage="Invalid email!" Display="Dynamic">  
                                </asp:RegularExpressionValidator>
                            </span>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label" for="basicinput">Password</label>
                        <div class="controls">
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" class="span8" MaxLength="50" PlaceHolder="Password"></asp:TextBox>
                            <span class="help-inline">
                                <asp:RequiredFieldValidator ID="reqPassword" runat="server" ErrorMessage="Password required"
                                    ControlToValidate="txtPassword" ValidationGroup="SaveInfo" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ValidationExpression="^[\s\S]{6,14}$"
                                        ControlToValidate="txtPassword" ForeColor="Red" ErrorMessage="Minimum 6 characters and Maximum 14 characters !" Display="Dynamic" ValidationGroup="SaveRegInfo">  
                                    </asp:RegularExpressionValidator>
                            </span>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label" for="basicinput">Confirm Password</label>
                        <div class="controls">
                            <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password" class="span8" MaxLength="50" PlaceHolder="Confirm Password.."></asp:TextBox>
                            <span class="help-inline">
                                <asp:RequiredFieldValidator ID="reqConfirm" runat="server" ErrorMessage="Confirm password required"
                                    ControlToValidate="txtConfirm" ValidationGroup="SaveInfo" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cmpPassword" runat="server" ControlToValidate="txtConfirm"
                                    ControlToCompare="txtPassword" ForeColor="Red" ValidationGroup="SaveInfo" Display="Dynamic"
                                    ErrorMessage="Password Don't Match"></asp:CompareValidator>
                            </span>
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <asp:Button ID="btnSaveInfo" runat="server"  class="btn btn-primary" ValidationGroup="SaveInfo" Text="Submit"
                                OnClick="btnSaveInfo_Click" />
                            <asp:Button ID="btnCancel" runat="server"    class="btn" Text="Cancel" OnClick ="btnCancel_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>



    </div>
    <!--/.content-->
</div>
<!--/.span9-->
