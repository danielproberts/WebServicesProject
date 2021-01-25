<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MapPage.aspx.cs" Inherits="WebServicesProject.MapPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
            <script type="text/javascript">
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(function (p) {
                        var Lat = <%=this.strLatitude%>;
                        var Long = <%=this.strLongitude%>;
                        var MapType = <%=this.strMapType%>;


                        //Determine Which Map will be Displayed
                        /*
                        if (MapType == "RoadView") {
                        }
                        else if (MapType == "SatelliteView") {
                            var mapOptions = { center: LatLng, zoom: 13, mapTypeId: google.maps.MapTypeId.satellite };
                        }
                        else if (MapType == "HybridView")
                        {
                            var mapOptions = { center: LatLng, zoom: 13, mapTypeId: google.maps.MapTypeId.HYBRID };
                        }
                        */

                        var LatLng = new google.maps.LatLng(Lat, Long);
                        var mapOptions = { center: LatLng, zoom: 13, mapTypeId: google.maps.MapTypeId.ROADMAP };
                        var map = new google.maps.Map(document.getElementById("dvMap"), mapOptions);
                        
                        if (MapType == '2')
                        {
                            map.setMapTypeId('satellite');
                        }
                        else if (MapType == '3')
                        {
                            map.setMapTypeId('hybrid');
                        }

                        var marker = new google.maps.Marker({ position: LatLng, map: map, title: "Your Location:\nLatitude: " + Lat + "\nLongitude: " + Long});

                        google.maps.event.addListener(marker, "click", function (e) {
                            var infoWindow = new google.maps.infoWindow();
                            infoWindow.setContent(marker.title);
                            infoWindow.open(map, marker);
                        });
                    });
                } else {
                    alert('Geolocation feature is not supported in the browser.');
                }
            </script>

            <asp:Button ID="btnReturn" runat="server" OnClick="btnReturn_Click" Text="Return" />
            <br />
            <br />
            <div id="dvMap" style="width:500px;height:500px">

            </div>


        </div>
    </form>
</body>
</html>
