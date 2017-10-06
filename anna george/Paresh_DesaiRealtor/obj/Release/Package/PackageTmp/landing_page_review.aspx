<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/PropertyNew.Master" CodeBehind="landing_page_review.aspx.cs" Inherits="Property.landing_page_review" %>
<%@ Register TagName="GoogleMap" TagPrefix="uc"  Src="~/Controls/GoogleMap.ascx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="js/jquery-1.11.1.min.js"></script>
    <title></title>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDxw4-H4Y1ig9brfwS9Qwt8wCNE96ueVhE&libraries=places,geometry"></script>
    <script>
        $(document).ready(function () {
         
            var geocoder;
            var map;
            var radius=200;
            initialize(radius);

            $('[id$="Radius"]').change(function () {
                radius = 0;
                radius =+$('[id$="Radius"]').val();
                initialize(radius);
            });
            
        });
        function initialize(radius) {
            geocoder = new google.maps.Geocoder();
            var latlng = new google.maps.LatLng(43.747371, -79.714026);
            var mapOptions = {
                zoom: 15,
                center: latlng,
                mapTypeId: google.maps.MapTypeId.SATELLITE
            }
            map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
            codeAddress(radius); 
        }
        function codeAddress(radius) {
           
           var address = document.getElementById('<%= address.ClientID%>').value;
            geocoder.geocode({ 'address': address }, function (results, status) {
                debugger;
                if (status == google.maps.GeocoderStatus.OK) {
                   // alert(results[0].geometry.location);
                    map.setCenter(results[0].geometry.location);
                    // Create marker 
                    var marker = new google.maps.Marker({
                        map: map,
                        position: results[0].geometry.location,
                        title: 'Some location'
                    });

                    var circle = new google.maps.Circle({
                        map: map,
                        center: results[0].geometry.location,
                        radius: radius,
                        strokeColor: "#5a1501",
                        strokeOpacity: 0.4,
                        strokeWeight: 0,
                        fillColor: "#5a1501",
                        fillOpacity: 0.2,

                    });
                    circle.bindTo('center', marker, 'position');
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
        <div class="background_landing_page">
           
            <div class="free_nw_cls_bg">
               
                <div class="col-md-9 col-sm-9">
                    <div class="lndng_page_map_1">
                      <div class="landing_page_p">
                    <p>
                       Good News! We found multiple properties in your selected area. 

                    </p>
                </div>
                    <div class="home_map">
                        <div id="map-canvas" style="height: 530px; width: 100% !important;">
                        </div>
                    </div>
                    <div>
                        <asp:HiddenField ID="address" runat="server" />
                    </div>
                </div>
                    </div>
                <div class="col-md-3 col-sm-3">
                    <div class="review_home_worth_land_1">
                        <h3>Almost done!</h3>
                        <p>Please fill in the information below to get instant updates...</p>
                        <div id="custom-form-aside">
                            <div style="display: block;">
                                <div class="login_input_new_1">
                                    <label for="type">Type of Home:</label>
                                    <asp:DropDownList PlaceHolder="Type of Home" ID="PropertyType" runat="server">
                                        <asp:ListItem Value="Detached" Selected="true">Detached Home</asp:ListItem>
                                        <asp:ListItem Value="Semi-Detached">Semi-Detached Home</asp:ListItem>
                                        <asp:ListItem Value="Condo Townhouse">Condo Townhouse</asp:ListItem>
                                        <asp:ListItem Value="Condo Apt">Condo Apartment</asp:ListItem>
                                        <asp:ListItem Value="Att/Row/Twnhouse">Att/Row/Twnhouse</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="login_input_new_1">
                                    <label for="Radius">Radius:</label>
                                    <asp:DropDownList PlaceHolder="Radius" ID="Radius" runat="server">
                                        <asp:ListItem Value="200" Selected="true">200 Meters</asp:ListItem>
                                        <asp:ListItem Value="250">250 Meters</asp:ListItem>
                                        <asp:ListItem Value="300">300 Meters</asp:ListItem>
                                        <asp:ListItem Value="350">350 Meters</asp:ListItem>
                                        <asp:ListItem Value="400">400 Meters</asp:ListItem>
                                        <asp:ListItem Value="500">500 Meters</asp:ListItem>
                                        <asp:ListItem Value="600">600 Meters</asp:ListItem>
                                        <asp:ListItem Value="700">700 Meters</asp:ListItem>
                                        <asp:ListItem Value="800">800 Meters</asp:ListItem>
                                        <asp:ListItem Value="900">900 Meters</asp:ListItem>
                                        <asp:ListItem Value="1000">1000 Meters</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="login_input_new_1">
                                    <label for="Name">First &amp; Last name:</label>
                                    <asp:TextBox ID="txtName" PlaceHolder="Name" CssClass="CTextBox" runat="server" MaxLength="20"></asp:TextBox>
                                    <span >
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                            ControlToValidate="txtName" ErrorMessage="Only alphabets are allowed"
                                            ForeColor="Red" ValidationGroup="SaveAppointment" Display="Dynamic" ValidationExpression="^[a-zA-Z ]+$"> </asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="reqName" runat="server" ErrorMessage=" Name is Required"
                                ControlToValidate="txtName" ForeColor="Red" ValidationGroup="SaveInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                                    </span>
                                </div>
                                <div class="login_input_new_1">
                                    <label for="PhoneNumber">Phone:</label>
                                    <asp:TextBox ID="txtPhoneNumber" PlaceHolder="Phone" CssClass="CTextBox" runat="server" MaxLength="20"></asp:TextBox>
                                    <span class="help-inline">
                                    <asp:RequiredFieldValidator ID="rfvPhoneNo" runat="server" ErrorMessage="Phone Number is Required"
                                ControlToValidate="txtPhoneNumber" ForeColor="Red" ValidationGroup="SaveInfo"
                                Display="Dynamic"></asp:RequiredFieldValidator>
                                 <asp:RegularExpressionValidator Display="Dynamic" ID="RegularExpressionValidator2" ValidationGroup="SaveInfo" ForeColor="red" runat="server" ErrorMessage="Invalid Phone no."
                                  ControlToValidate="txtPhoneNumber" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                        </span>
                                </div>
                                <div class="login_input_new_1">
                                    <label for="Email">E-mail:</label>
                                    <asp:TextBox ID="txtEmail" CssClass="CTextBox" PlaceHolder="E-mail" runat="server" MaxLength="28"></asp:TextBox>
                                        <span class="help-inline">
                               
                                <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ErrorMessage="E-mail Required" ControlToValidate="txtEmail"
                                    ValidationGroup="SaveInfo" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    ControlToValidate="txtEmail" ValidationGroup="SaveInfo" ForeColor="Red" ErrorMessage="Invalid email!" Display="Dynamic">  
                                </asp:RegularExpressionValidator>
                            </span>
                                </div>
                                <div class="login_input_new_1">
                                    <asp:Button ID="btnSearch" runat="server" ValidationGroup="SaveInfo" Text="Submit" OnClick="btnSearch_Click" />

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
</asp:Content>