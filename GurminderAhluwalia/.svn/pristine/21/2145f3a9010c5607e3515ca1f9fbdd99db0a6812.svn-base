<%@ Page Title="" Language="C#" MasterPageFile="~/Property.Master" AutoEventWireup="true" CodeBehind="Map.aspx.cs" Inherits="Property.Map" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
<script type="text/javascript">
    $(document).ready(function () {
        initialize();
        var geocoder;
        var map;
    });
    function initialize() {
       
        geocoder = new google.maps.Geocoder();
        var latlng = new google.maps.LatLng(43.747371, -79.714026);
        var mapOptions = {
            zoom: 15,
            center: latlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
        codeAddress();
    }
    function codeAddress() {
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
    <div id="map-canvas" style="height: 439px; width: 645px; margin: 9px 0px 0px 0px;">
    </div>
    <div>
        <asp:HiddenField ID="address" runat="server" />
    </div>
</asp:Content>
