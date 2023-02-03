import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  
 GoogleMapController? mapController;
  Set<Marker> markers={};
  LatLng mylocation =const LatLng(27.7047139,85.3295421);

  @override
  
  void initState() {
    markers.add(
      Marker(
        markerId:MarkerId(mylocation.toString()),
        position:mylocation,
        infoWindow:const InfoWindow(
          title:'Gopal dai ko momo',
          snippet:'momopasal'
        ),
        icon:BitmapDescriptor.defaultMarker,
      )
    );

    
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Google map in flutter"),
        backgroundColor: Colors.deepOrange,
      ),
      body: GoogleMap(
        zoomGesturesEnabled: true,
        initialCameraPosition: CameraPosition(
          target: mylocation,
          zoom: 10,
        ),
        markers: markers,
        mapType: MapType.normal,
        onMapCreated: (controller){
          setState(() {
            mapController=controller;
          });
        },
      ),
    );
  }
}