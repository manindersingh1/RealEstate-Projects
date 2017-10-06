<%@ Page Title="" Language="C#" MasterPageFile="~/PropertyNew.Master" AutoEventWireup="true" CodeBehind="UpcomingProjects.aspx.cs" Inherits="Property.UpcomingProjects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" id="containerdiv">
        <div>
            <div id="MainContent_cmnsoon" class="vrtual_bg">
                <div class="property-search-container">
                    <div class="dt-sc-tabs-container" style="width: 100%;">
                        <ul class="dt-sc-tabs-frame">
                            <li><a class="current" href="#">Upcoming Projects</a></li>
                        </ul>
                        <div style="display: block;" class="dt-sc-tabs-frame-content">
                            <div class="projectsbg">
                                <div class="col-md-4">
                                    <div class="projects">
                                        <%--<img alt="" class="virtl_image_cmgsoon" src="images/Grand-Palace-Condo.jpg" /> --%>
                                        <a href="ProjectDetails.aspx?ProjectName=Grand-Palace-Condo&ProjectType=UpcomingProjects">
                                            <img src="images/thumb2.jpg" alt="" /></a>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="projects">
                                        <%-- <img alt="" class="virtl_image_cmgsoon" src="images/Spring-Luxary.jpg"/>--%>
                                        <a href="ProjectDetails.aspx?ProjectName=Spring-Luxary&ProjectType=UpcomingProjects">
                                            <img src="images/thumb4.jpg" alt="" /></a>
                                    </div>
                                </div>
                                 <div class="col-md-4"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
