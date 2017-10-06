<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/PropertyNew.Master" CodeBehind="Review_home_worth.aspx.cs" Inherits="Property.Review_home_worth" %>
<%@ Register TagName="GoogleMap" TagPrefix="uc"  Src="~/Controls/GoogleMap.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


    <script src="js/jquery-1.11.1.min.js"></script>
    <title></title>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDxw4-H4Y1ig9brfwS9Qwt8wCNE96ueVhE&libraries=places,geometry"></script>
    <script>
        $(document).ready(function () {
            debugger;
            initialize();
            var geocoder;
            var map;
        });
        function initialize() {
            debugger;
            geocoder = new google.maps.Geocoder();
            var latlng = new google.maps.LatLng(43.747371, -79.714026);
            var mapOptions = {
                zoom: 25,
                center: latlng,
                mapTypeId: google.maps.MapTypeId.SATELLITE
            }
            map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
            codeAddress();
        }
        function codeAddress() {
            debugger;
            var address = document.getElementById('<%= address.ClientID%>').value;
            geocoder.geocode({ 'address': address }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    map.setCenter(results[0].geometry.location);
                    var marker = new google.maps.Marker({
                        map: map,
                        position: results[0].geometry.location
                    });
                    var contentString = address;
                    var infowindow = new google.maps.InfoWindow({
                        content: contentString
                    });
                    google.maps.event.trigger(map, "resize");//if map not display correct
                    google.maps.event.addListener(marker, 'click', function () {
                        infowindow.open(map, marker); //infowindow add in map
                        google.maps.event.addDomListener(window, 'load', initialize);
                    });
                    infowindow.open(map, marker);
                } else {
                    alert('Geocode was not successful for the following reason: ' + status);
                }
            });
        }
</script>
 </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <div class="background_home_worth">
            <div class="free_nw_cls_bg_new">
                <div class="col-md-9 col-sm-9">
                    <div class="lndng_page_map_1">
                        <div class="landing_page_p">
                            <p>
                                Who do we send the evaluation to?
                            </p>
                        </div>
                        <div class="home_map">
                            <div id="map-canvas" style="height:420px; width: 100% !important;">
                            </div>
                        </div>
                        <div>
                            <asp:HiddenField ID="address" runat="server" />
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-3">
                    <div class="review_home_worth_di">
                        <div id="custom-form-aside">
                            <div style="display: block;">
                                <div class="login_input_new_1">
                                    <label for="Name">First Name :</label>
                                    <asp:TextBox ID="Name" CssClass="CTextBox" PlaceHolder="First Name"  runat="server" MaxLength="20"></asp:TextBox>
                                </div>
                                <div class="login_input_new_1">
                                    <label for="Name">Last name:</label>
                                    <asp:TextBox ID="txtlastname" CssClass="CTextBox" PlaceHolder="Last name" runat="server" MaxLength="20"></asp:TextBox>
                                </div>
                                <div class="login_input_new_1">
                                    <label for="PhoneNumber">Phone:</label>
                                    <asp:TextBox ID="PhoneNumber" CssClass="CTextBox" PlaceHolder="Phone" runat="server" MaxLength="20"></asp:TextBox>
                                </div>
                                <div class="login_input_new_1">
                                    <label for="Email">E-mail:</label>
                                    <asp:TextBox ID="Email" CssClass="CTextBox" PlaceHolder="E-mail" runat="server" MaxLength="30"></asp:TextBox>
                                </div>
                                <div class="login_input_new_1">
                                    <label for="Email">Selling in ?</label>
                                    <asp:DropDownList  PlaceHolder="Selling in ?" ID="ddl" runat="server">
                                        <asp:ListItem>Right Away</asp:ListItem>
                                        <asp:ListItem>In 2 Months</asp:ListItem>
                                        <asp:ListItem>In 4 Months</asp:ListItem>
                                        <asp:ListItem>In 6 Months</asp:ListItem>
                                        <asp:ListItem>In a Year</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="login_input_new_1">
                                    <asp:Button ID="btnSearch" runat="server" Text="Submit" OnClick="btnSearch_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>