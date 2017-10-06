<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true"
    CodeBehind="ListOfPages.aspx.cs" Inherits="Property.Admin.ListOfPages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="span9">
        <div class="content">
            <div class="module">
                <div class="module-head">
                    <h3>Page Manager</h3>
                </div>
                <div class="module-body">
                    <div class="alert alert-error" runat="server" id="alrtmsg" visible="false">                        
                        <strong>Access denied !</strong> you can't delete this page.
                    </div>
                    <p>
                        <asp:Button ID="btnCreatePage" class="btn btn-primary" runat="server" Text="Create Page" OnClick="btnCreatePage_Click" />
                    </p>
                    <asp:GridView ID="GrdPageList" class="table table-striped table-bordered table-condensed" PageSize="10" AutoGenerateColumns="False" runat="server"
                        AllowPaging="true"
                        OnPageIndexChanging="GrdPageList_PageIndexChanging" OnSorting="GrdPageList_Sorting"
                        OnRowCommand="GrdPageList_RowCommand" OnRowDeleting="GrdPageList_RowDeleting"
                        OnRowEditing="GrdPageList_RowEditing" OnRowCreated="GrdPageList_RowCreated" OnRowDataBound="GrdPageList_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="PageName" HeaderText="Page Name" SortExpression="PageName"></asp:BoundField>
                            <asp:BoundField DataField="PageTitle" HeaderText="Page Title" SortExpression="PageTitle"></asp:BoundField>
                            <asp:BoundField DataField="DisplayIndex" HeaderText="Page Index" SortExpression="DisplayIndex"></asp:BoundField>
                            <asp:BoundField DataField="CreatedDate" HeaderText="Dated" SortExpression="Dated"></asp:BoundField>
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:HiddenField ID="hdnTitle" runat="server" Value='<%#Eval("PageTitle") %>' />
                                    <asp:HiddenField ID="hdnPageName" runat="server" Value='<%#Eval("PageName") %>' />
                                    <asp:ImageButton ID="lnkEdit" runat="server" ToolTip="Edit" CommandName="Edit" CommandArgument='<%#Eval("ID") %>' ImageUrl="~/images/edit.png" />
                                    <asp:ImageButton ID="lnkDelete" runat="server" ToolTip="Delete" CommandName="Delete" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('Are You Sure You Want to Delete this Record');" ImageUrl="~/images/negative.png" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <asp:Label ID="lblemptymsg" runat="server"></asp:Label>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
