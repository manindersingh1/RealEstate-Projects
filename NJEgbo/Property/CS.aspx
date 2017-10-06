<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CS.aspx.cs" Inherits="Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:FileUpload ID="FileUpload1" runat="server" />
    <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
    <hr />
    
        <asp:DataList ID="DataList2" Visible="true" runat="server" AutoGenerateColumns="false"
        RepeatColumns="2" CellSpacing="5">
            <ItemTemplate>
            <u>
                <%# Eval("Name") %></u>
            <hr />
            <a class="player" style="height: 300px; width: 300px; display: block" href='<%# Eval("Id", "FileCS.ashx?Id={0}") %>'>
            </a>
        </ItemTemplate>
        </asp:DataList>
    <script src="FlowPlayer/flowplayer-3.2.12.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        flowplayer("a.player", "FlowPlayer/flowplayer-3.2.16.swf", {
            plugins: {
                pseudo: { url: "FlowPlayer/flowplayer.pseudostreaming-3.2.12.swf" }
            },
            clip: { provider: 'pseudo', autoPlay: false},
        });
    </script>
    </form>
</body>
</html>
