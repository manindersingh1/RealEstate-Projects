<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="Property.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Multiple File Upload</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    
    <style type="text/css">
        #divFile p { 
            font:13px tahoma, arial; 
        }
        #divFile h3 { 
            font:16px arial, tahoma; 
            font-weight:bold;
        }
    </style>
</head>
<body>
     <form id="form1" runat="server">
        <div id="divFile">
            <h3>Multiple File Upload in Asp.Net (C#)</h3>
            
            <p><asp:FileUpload ID="fileUpload" multiple="true" runat="server" /></p>
            <p>
                <p><asp:Button ID="btUpload" Text ="Upload Files" 
                    OnClick="Upload_Files" runat="server" /></p>
            </p>
            <p><asp:label ID="lblFileList" runat="server"></asp:label></p>
            <p><asp:Label ID="lblUploadStatus" runat="server"></asp:Label></p>
            <p><asp:Label ID="lblFailedStatus" runat="server"></asp:Label></p>
        </div>
    </form>
</body>
</html>
