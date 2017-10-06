<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true"
    CodeBehind="ListOfBlogs.aspx.cs" Inherits="Property.Admin.ListOfBlogs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="span9">
        <div class="content">
            <div class="module">
                <div class="module-head">
                    <h3>Blog Manager</h3>
                </div>
                <div class="module-body">
                    <p>
                        <asp:Button ID="btnCreateBlog" runat="server" class="btn btn-primary" Text="Create Blog" OnClick="btnCreateBlog_Click" />
                    </p>
                    <asp:GridView ID="GrdBlogList" class="table table-striped table-bordered table-condensed" AutoGenerateColumns="False" runat="server" PageSize="10"
                        AllowPaging="true"
                        OnPageIndexChanging="GrdBlogList_PageIndexChanging" OnSorting="GrdBlogList_Sorting"
                        OnRowCommand="GrdBlogList_RowCommand" OnRowDeleting="GrdBlogList_RowDeleting"
                        OnRowEditing="GrdBlogList_RowEditing" OnRowCreated="GrdBlogList_RowCreated">
                        <Columns>
                            <asp:BoundField DataField="PageName" HeaderText="Blog Name" SortExpression="PageName"></asp:BoundField>
                            <asp:BoundField DataField="PageTitle" HeaderText="Blog Title" SortExpression="PageTitle"></asp:BoundField>
                            <asp:BoundField DataField="CreatedDate" HeaderText="Dated" SortExpression="Dated"></asp:BoundField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="lnkEdit" runat="server" CommandName="Edit" CommandArgument='<%#Eval("ID") %>'
                                        ImageUrl="~/images/edit.png" />
                                    <asp:ImageButton ID="LinkButton2" runat="server" CommandName="Delete" CommandArgument='<%#Eval("ID") %>'
                                        OnClientClick="return confirm('Are You Sure You Want to Delete this Record');"
                                        ImageUrl="~/images/negative.png" />
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
