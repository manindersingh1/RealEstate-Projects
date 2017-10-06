<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="CreateVirtualTour.aspx.cs" Inherits="Property.Admin.CreateVirtualTour" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="span9">
        <div class="content">
            <div class="module">
                <div class="module-head">
                    <h3>Create Virtual Tour</h3>
                </div>
                <div class="module-body">

                    <br />

                    <div class="form-horizontal row-fluid">

                          <div class="control-group">
                            <label class="control-label" for="basicinput">Name</label>
                            <div class="controls">
                                <asp:TextBox ID="txtName" runat="server" PlaceHolder="Enter Name" class="span8"></asp:TextBox>
                                <span class="help-inline">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Virtual Link required" Display="Dynamic"
                                        ControlToValidate="txtName" ValidationGroup="SavePage" SetFocusOnError="true"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </span>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="basicinput">Virtual Tour</label>
                            <div class="controls">
                                <asp:TextBox ID="txtLink" runat="server" PlaceHolder="Enter Virtual Tour" class="span8"></asp:TextBox>
                                <span class="help-inline">
                                    <asp:RequiredFieldValidator ID="revBanner" runat="server" ErrorMessage="Virtual Tour required" Display="Dynamic"
                                        ControlToValidate="txtLink" ValidationGroup="SavePage" SetFocusOnError="true"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </span>
                            </div>
                        </div>

                       

                        <div class="control-group">
                            <div class="controls">
                                <asp:Button ID="btnCreateVirtualLink" runat="server" ValidationGroup="SavePage" class="btn btn-primary" Text="Save" OnClick="btnCreateVirtualLink_Click" />
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
