<%@ Page Title="" Language="C#" MasterPageFile="~/PropertyNew.Master" AutoEventWireup="true" CodeBehind="Error_503.aspx.cs" Inherits="Property.Error_503" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 <div align="center">
        <h1>
            <b>503</b></h1>
        <p class="description">
            <b>Service Unavailable</b></p>
            <p class="description">
            The Web server (running the Web site) is currently unable to handle the HTTP request due to a temporary overloading or maintenance of the server. The implication is that this is a temporary condition which will be alleviated after some delay. Some servers in this state may also simply refuse the socket connection, in which case a different error may be generated because the socket creation timed out. 
   The Web server is effectively 'closed for repair'. It is still functioning minimally because it can at least respond with a 503 status code, but full service is impossible i.e. the Web site is simply unavailable. There are a myriad possible reasons for this, but generally it is because of some human intervention by the operators of the Web server machine. You can usually expect that someone is working on the problem, and normal service will resume as soon as possible.
   </p>
    </div>
</asp:Content>
