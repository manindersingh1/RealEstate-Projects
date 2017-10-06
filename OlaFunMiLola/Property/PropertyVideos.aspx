<%@ Page Title="" Language="C#" MasterPageFile="~/PropertyNew.Master" AutoEventWireup="true"
    CodeBehind="PropertyVideos.aspx.cs" Inherits="Property.PropertyVideos" %>




<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $('.Videoclick').click(function () {
                
                $("#videotag").attr("src",  $(this).attr('title') );
                $('#videoDiv').css('display', 'block')
            })

        })


    </script>


    <div class="video_hdng">
      <h2>Property Videos</h2>
        </div>
    <div class="video_sect_bg">

           <div class="row frnt_line_cls">
              <div class="video_top">
                <div class="col-md-2 col-sm-2"></div>
                <div class="col-md-8 col-sm-8">
        <div id="videoDiv" style="display: none" class="main_video_section">
           <%-- <video id="videotag" src="" autoplay="autoplay" controls="controls" ></video>--%>
            <iframe id="videotag"  width="100%"  src=""></iframe>
        </div>
                    </div>
                 <div class="col-md-2 col-sm-2"></div>
               </div>
        </div>

        <div class="row frnt_line_cls">
            <div class="video_bottom">
                <div id="DivGridSearch" runat="server" class="vdeo_sct_bg">
                    <asp:Repeater ID="rptSearchResults" runat="server">
                 <ItemTemplate>
                            <div class="col-md-3 col-sm-3">
                               
                                    <div class="video_boxx_left">
                                         <a class="Videoclick" href="#" id="OpenVideoid" title="<%#Eval("URL") %>">
                                       <%-- <video src="..//admin/uploadfiles/<%#Eval("Name") %>" controls="controls" muted="muted"  />--%>
                                              <iframe  width="100%"  src="<%#Eval("URL") %>"></iframe>
                                             <button type="button" class="btn btn-primary vdeo_btnn">Click here to see Video</button>
                                              </a>
                                       
                                    </div>
                               
                            </div>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <div class="col-md-3 col-sm-3">
                               
                                    <div class="video_boxx_left">
                                         <a class="Videoclick" href="#" id="OpenVideoid" title="<%#Eval("URL") %>">
                                       <%-- <video src="..//admin/uploadfiles/<%#Eval("Name") %>" controls="controls" muted="muted"  />--%>
                                             <iframe  width="100%"  src="<%#Eval("URL") %>"></iframe>
                                              <button type="button" class="btn btn-primary vdeo_btnn">Click here to see Video</button>
                                              </a>
                                        
                                    </div>
                               
                            </div>
                        </AlternatingItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                    </asp:Repeater>


                </div>
            </div>
        </div>
    </div>


</asp:Content>




