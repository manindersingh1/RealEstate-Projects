<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GoogleMap.ascx.cs" Inherits="Property.Controls.GoogleMap" %>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDxw4-H4Y1ig9brfwS9Qwt8wCNE96ueVhE&libraries=places,geometry"></script>

<script>
    var geocoder;
    var map;
    function initialize() {
        
        geocoder = new google.maps.Geocoder();
        var latlng = new google.maps.LatLng(-34.397, 150.644);
         
         
           var   mapOptions = {
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
                //alert('Geocode was not successful for the following reason: ' + status);
            }
        });
    }

</script>
<body onclick="initialize()">
    <div id="map-canvas" style="height:531px; ">
    </div>
    <div>
        <asp:HiddenField ID="address" runat="server" />
    </div>
</body>
