﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true"
    CodeBehind="Features.aspx.cs" Inherits="Property.Admin.Features" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="span9">
        <div class="content">
            <div class="module">
              <div class="module-body">
                    <br />
                  <div class="form-horizontal row-fluid">
                      <div class="control-group">
                          <label class="control-label" for="basicinput">Search MLS-ID</label>
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
                              <asp:Button ID="btnCreateFeature" runat="server" ValidationGroup="SavePage" class="btn btn-primary" Text="Search" OnClick="btnCreateFeature_Click" />
                              <span class="help-inline">
                                  <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                              </span>
                          </div>
                      </div>
                  </div>
                </div>
                <div class="module-body">
                    <asp:GridView ID="grdFeatures" AllowPaging="true" class="table table-striped table-bordered table-condensed" PageSize="10" AutoGenerateColumns="False"
                        runat="server" OnPageIndexChanging="grdFeatures_PageIndexChanging" OnSorting="grdFeatures_Sorting"
                        OnRowCommand="grdFeatures_RowCommand" OnRowDeleting="grdFeatures_RowDeleting">
                        <Columns>
                            <asp:BoundField DataField="MLS" HeaderText="MLS" SortExpression="MLS"></asp:BoundField>
                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address"></asp:BoundField>
                            <asp:BoundField DataField="PostalCode" HeaderText="Postal Code" SortExpression="PostalCode"></asp:BoundField>
                            <asp:BoundField DataField="Province" HeaderText="Province" SortExpression="Province"></asp:BoundField>
                             <asp:TemplateField  >
                                    <ItemTemplate>
                                        <asp:Button CommandName="Add" Visible='<%# (Convert.ToBoolean(Eval("IsActive")))?false:true%>' ID="btnCreate" runat="server" CssClass="btn btn-primary" Text="Add To Feature" />
                                        <asp:Button CommandName="remove" Visible='<%# (Convert.ToBoolean(Eval("IsActive")))?true:false%>' ID="btnDelete" runat="server" class="btn btn-primary" Text="Remove from Feature" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                           
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
