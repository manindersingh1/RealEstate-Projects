<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" 
    CodeBehind="CreateTestimonial.aspx.cs" Inherits="Property.Admin.CreateTestimonial" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtoolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
            <ajaxtoolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </ajaxtoolkit:ToolkitScriptManager>
    <div class="span9">
        <div class="content">
            <div class="module">
                <div class="module-head">
                    <h3>Create Testimonial</h3>
                </div>
                <div class="module-body">

                    <br />

                    <div class="form-horizontal row-fluid">
                          <div class="control-group">
                            <label class="control-label" for="basicinput">First Name</label>
                            <div class="controls">
                                <asp:TextBox ID="txtName" runat="server" PlaceHolder="Enter First Name" class="span8"></asp:TextBox>
                                <span class="help-inline">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name required" Display="Dynamic"
                                        ControlToValidate="txtName" ValidationGroup="SavePage" SetFocusOnError="true"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </span>
                            </div>
                        </div>
                          <div class="control-group">
                            <label class="control-label" for="basicinput">Last Name</label>
                            <div class="controls">
                                <asp:TextBox ID="txtlname" runat="server" PlaceHolder="Enter Last Name" class="span8"></asp:TextBox>
                                <span class="help-inline">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Last Name required" Display="Dynamic"
                                        ControlToValidate="txtlname" ValidationGroup="SavePage" SetFocusOnError="true"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </span>
                            </div>
                        </div>



                         <div class="control-group">
                            <label class="control-label" for="basicinput">Date</label>
                            <div class="controls">
                               <asp:TextBox ID="txtDate" runat="server" PlaceHolder="Date"></asp:TextBox>
                                <span class="help-inline">
                                   <ajaxtoolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDate"
                                                PopupButtonID="txtDate">
                                            </ajaxtoolkit:CalendarExtender>
                                            <asp:RequiredFieldValidator ID="reqAppointmentDate" runat="server" ErrorMessage="Date is Required"
                                                ControlToValidate="txtDate" ForeColor="Red" ValidationGroup="SaveAppointment"
                                                Display="Dynamic"></asp:RequiredFieldValidator>
                                </span>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="basicinput">Comments</label>
                            <div class="controls">
                                <asp:TextBox ID="txtcomment" runat="server" TextMode="MultiLine" Height="90px" PlaceHolder="Comments" class="span8"></asp:TextBox>
                                <span class="help-inline">
                                    <asp:RequiredFieldValidator ID="revBanner" runat="server" ErrorMessage="Comments required" Display="Dynamic"
                                        ControlToValidate="txtcomment" ValidationGroup="SavePage" SetFocusOnError="true"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </span>
                            </div>
                        </div>

                       

                        <div class="control-group">
                            <div class="controls">
                                <asp:Button ID="btnCreateTestimonial" runat="server" ValidationGroup="SavePage" class="btn btn-primary" Text="Save" OnClick="btnCreateTestimonial_Click" />

                                   <asp:Button ID="btnCancel" runat="server"  class="btn btn-primary" Text="Cancel" OnClick="btnCancel_Click" />
                                <span class="help-inline">
                                    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



        </div>
        <!--/.content-->
    </div>
    <!--/.span9-->

</asp:Content>
