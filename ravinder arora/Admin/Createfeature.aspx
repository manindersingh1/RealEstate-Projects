<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Createfeature.aspx.cs" Inherits="Property.Admin.Createfeature" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="span9">
        <div class="content">
            <div class="module">
                <div class="module-head">
                    <h3>Create feature</h3>
                </div>
                <div class="module-body">

                    <br />

                    <div class="form-horizontal row-fluid">
                        <div class="control-group">
                            <label class="control-label" for="basicinput">MLS-ID</label>
                            <div class="controls">
                                <asp:TextBox ID="txtFeature" runat="server" PlaceHolder="Enter MLS-ID" class="span8"></asp:TextBox>
                                <span class="help-inline">
                                    <asp:RequiredFieldValidator ID="revBanner" runat="server" ErrorMessage="MLS-ID required" Display="Dynamic"
                                        ControlToValidate="txtFeature" ValidationGroup="SavePage" SetFocusOnError="true"
                                        ForeColor="Red"></asp:RequiredFieldValidator>
                                </span>
                            </div>
                        </div>



                        <div class="control-group">
                            <div class="controls">
                                <asp:Button ID="btnCreateFeature" runat="server" ValidationGroup="SavePage" class="btn btn-primary" Text="Save" OnClick="btnCreateFeature_Click" />
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
