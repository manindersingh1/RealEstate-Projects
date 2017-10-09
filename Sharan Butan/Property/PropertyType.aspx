<%@ Page Title="" Language="C#" MasterPageFile="~/Property.Master" AutoEventWireup="true" CodeBehind="PropertyType.aspx.cs" Inherits="Property.PropertyType" %>
<%@ OutputCache Duration="15" VaryByParam="None" %>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="slider/css/media-queries.css" rel="stylesheet" />
    <link href="slider/css/font.css" rel="stylesheet" />
    <link href="slider/css/style.css" rel="stylesheet" />
   
    
    <script src="slider/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="slider/js/jquery-1.9.1.min.js"></script>
    
  

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-12 col-sm-12 margin_0">
<div class="container">
      <div class="main_contnt_sct">
            <div class="Residential_section_bg" id="divresidential" runat="server" visible="false">
                 <div class="col-md-12 col-sm-12">
                      <div class="Residential_section">
                           <h3>Search by Type</h3>
                      </div>
                  </div>

               <div class="col-md-4 col-sm-4"> <div class="Residential_section">
                    <div class="Residential_section_box"> 
                        <a href="" title="Toronto">
                            <asp:HyperLink ID="hlresi1" runat="server">
                                <asp:Image ID="imgresi1" runat="server" />
                            </asp:HyperLink>
                              <asp:Label ID="resicity1" runat="server">Detached</asp:Label>
                        </a>
                    </div>
                </div> </div>
               <div class="col-md-4 col-sm-4"> <div class="Residential_section">
                    <div class="Residential_section_box">
                          <a href="" title="Mississauga">
                        <asp:HyperLink ID="hlresi2" runat="server">
                            <asp:Image ID="imgresi2" runat="server" />
                        </asp:HyperLink>
                         <asp:Label ID="resicity2" runat="server">Semi-Detached</asp:Label>
                               </a>
                    </div>
                </div> </div>
               <div class="col-md-4 col-sm-4"> <div class="Residential_section">
                    <div class="Residential_section_box">
                         <a href="" title="Brampton">
                        <asp:HyperLink ID="hlresi3" runat="server">
                            <asp:Image ID="imgresi3" runat="server" />
                        </asp:HyperLink>
                         <asp:Label ID="resicity3" runat="server">Condo</asp:Label>
                              </a>
                    </div>
                </div> </div>
               
            </div>
            
        </div>
        </div>
    </div>
</asp:Content>
