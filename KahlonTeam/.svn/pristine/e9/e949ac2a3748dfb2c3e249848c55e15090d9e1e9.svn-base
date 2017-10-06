<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Registration.ascx.cs"
    Inherits="Property.Controls.Registration" %>

<div class="span9">
    <div class="content">
        <div class="module">
            <div class="module-head">
                <h3>Registration</h3>
            </div>
            <div class="module-body">

                <%--  <div class="alert">
                        <button type="button" class="close" data-dismiss="alert">×</button>
                        <strong>Warning!</strong> Something fishy here!
                    </div>--%>
                <%--  <div class="alert alert-error">
                        <button type="button" class="close" data-dismiss="alert">×</button>
                        <strong>Error !</strong> <asp:Label ID="lblerror" runat="server"></asp:Label> 
                    </div>--%>
                <%--<div class="alert alert-success">
                        <button type="button" class="close" data-dismiss="alert">×</button>
                        <strong>Well done!</strong> Now you are listening me :) 
                    </div>--%>

                <br />

                <div class="form-horizontal row-fluid">
                    <div class="control-group">
                        <label class="control-label" for="basicinput">First Name</label>
                        <div class="controls">
                            <asp:TextBox ID="txtFirstName" runat="server" MaxLength="50" PlaceHolder="First Name.." class="span8"></asp:TextBox>
                            <span class="help-inline">
                                <asp:RequiredFieldValidator ID="reqFirstName" runat="server" ErrorMessage="First name required"
                                    ControlToValidate="txtFirstName" ValidationGroup="SaveInfo" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </span>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label" for="basicinput">Last Name</label>
                        <div class="controls">
                            <asp:TextBox ID="txtLastName" runat="server" MaxLength="50" class="span8" PlaceHolder="Last Name.."></asp:TextBox>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label" for="basicinput">Company</label>
                        <div class="controls">
                            <asp:TextBox ID="txtCompanyName" runat="server" MaxLength="50" PlaceHolder="Comapany Name.." class="span8"></asp:TextBox>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label" for="basicinput">Address</label>
                        <div class="controls">
                            <asp:TextBox ID="txtAddress" runat="server" MaxLength="255" PlaceHolder="Address.." class="span8"></asp:TextBox>
                            <span class="help-inline">
                                <asp:RequiredFieldValidator ID="reqAddress" runat="server" ErrorMessage="Address required"
                                    ControlToValidate="txtAddress" ValidationGroup="SaveInfo" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </span>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label" for="basicinput">City</label>
                        <div class="controls">
                            <asp:TextBox ID="txtCity" runat="server" class="span8" MaxLength="50" PlaceHolder="City.."></asp:TextBox>
                            <span class="help-inline">
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
                                <asp:RequiredFieldValidator ID="reqState" runat="server" ErrorMessage="State required"
                                    ControlToValidate="txtState" ValidationGroup="SaveInfo" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </span>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label" for="basicinput">Phone No.</label>
                        <div class="controls">
                            <asp:TextBox ID="txtPhoneNo" runat="server" MaxLength="50" class="span8" PlaceHolder="Phone Number.."></asp:TextBox>
                            <span class="help-inline">
                                <asp:RequiredFieldValidator ID="reqPhoneNo" runat="server" ErrorMessage="Phone number required"
                                    ControlToValidate="txtPhoneNo" ValidationGroup="SaveInfo" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </span>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label" for="basicinput">Profile Photo</label>
                        <div class="controls">
                            <asp:FileUpload ID="ImageUpload" runat="server" class="span8" />
                            <asp:Image ID="imgProfile" Width="200px" runat="server" Visible="false" />
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label" for="basicinput">Website URL</label>
                        <div class="controls">
                            <asp:TextBox ID="txtWebsite" runat="server" MaxLength="50" class="span8" PlaceHolder="Website URL.."></asp:TextBox>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label" for="basicinput">User Name</label>
                        <div class="controls">
                            <asp:TextBox ID="txtUsername" runat="server" MaxLength="50" class="span8" AutoPostBack="true" PlaceHolder="User Name.." OnTextChanged="txtUsername_TextChanged"></asp:TextBox>
                            <span class="help-inline">
                                <asp:Label ID="lblUsernamemsg" runat="server" ForeColor="Red"></asp:Label>
                                <asp:RequiredFieldValidator ID="reqUsername" runat="server" ErrorMessage="Username required"
                                    ControlToValidate="txtUsername" ValidationGroup="SaveInfo" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
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
                            <asp:Button ID="btnSaveInfo" runat="server" class="btn btn-primary" ValidationGroup="SaveInfo" Text="Submit"
                                OnClick="btnSaveInfo_Click" />
                            <asp:Button ID="btnCancel" runat="server" class="btn" Text="Cancel" OnClick="btnCancel_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>



    </div>
    <!--/.content-->
</div>
<!--/.span9-->
