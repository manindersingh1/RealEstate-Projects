<%@ Page Title="" Language="C#" MasterPageFile="~/PropertyNew.Master" AutoEventWireup="true"
    CodeBehind="PropertyVideos.aspx.cs" Inherits="Property.PropertyVideos" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   
     <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>

    <script type="text/javascript">
        $(function () 
        {
            $('a').click(function () {
               
                $("#videotag").attr("src", "/admin/uploadfiles/" + $(this).attr('title') + "");
                $('#myModal').click();
            })

        })

      
    </script>


     <div>
         <video  id="videotag" src="video/back.mp4" controls="controls" ></video>
     </div> 
    
       
    <div>
        <div class="row frnt_line_cls">
            <div id="DivGridSearch" runat="server" class="In_bg">
                <asp:Repeater ID="rptSearchResults" runat="server">

                    <HeaderTemplate>
                        <div class="row nooo_mrgnnn">Property Videos</div>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="col-md-3 col-sm-3">
                            <a href="#" id="OpenVideoid" title="<%#Eval("Name") %>">
                                <div class="search_boxx_left2">
                                    <video src="..//admin/uploadfiles/<%#Eval("Name") %>" controls="controls" width="180px" height="134" />
                                </div>
                            </a>
                        </div>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <a href="#" title="<%#Eval("Name") %>">
                            <div class="col-md-3 col-sm-3">
                                <div class="search_boxx_left2">
                                    <video src="..//admin/uploadfiles/<%#Eval("Name") %>" controls="controls" width="180px" height="134" />
                                </div>
                            </div>
                        </a>
                    </AlternatingItemTemplate>
                    <FooterTemplate>
                    </FooterTemplate>
                </asp:Repeater>


            </div>
        </div>
    </div>

  

</asp:Content>

