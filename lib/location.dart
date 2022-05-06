import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const LatLng SOURCE_LOCATION = LatLng(42.7477863, -71.1699932);
const LatLng DESTNATION_LOCATION = LatLng(42.743902, -71.170009);
const double CAMERA_ZOOM = 16;
const double CAMERA_TILT = 80;
const double CAMERA_BEARING = 30;

class MapPage extends StatefulWidget {
  const MapPage({ Key? key }) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();
  late BitmapDescriptor sourceIcon;
  late BitmapDescriptor destinationIcon;

  Set<Marker> _markers = Set<Marker>();

  late LatLng currentLocation;
  late LatLng destinationLocation;
  
  @override
  void initState(){
    super.initState();
    setInitialLocation();
    setSourceAndDestinationMarkerIcons();
  }

  void setSourceAndDestinationMarkerIcons() async{
    sourceIcon = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(devicePixelRatio: 2.0), 'assets/images/source_pin.png');
    destinationIcon = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(devicePixelRatio: 2.0), 'assets/images/destination_pin.png');
  }

  void setInitialLocation(){
    currentLocation = LatLng(SOURCE_LOCATION.latitude, SOURCE_LOCATION.longitude);
    destinationLocation = LatLng(DESTNATION_LOCATION.latitude, DESTNATION_LOCATION.longitude);
  }
  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = const CameraPosition(
      zoom: CAMERA_ZOOM,
      tilt: CAMERA_TILT,
      bearing: CAMERA_BEARING,
      target: SOURCE_LOCATION
    );

    return Scaffold(
      body: Container(
        child: GoogleMap(
          myLocationEnabled: true,
          compassEnabled: false,
          tiltGesturesEnabled: false,
          markers: _markers,
          mapType: MapType.normal,
          initialCameraPosition: initialCameraPosition,
          onMapCreated: (GoogleMapController controller){
            _controller.complete(controller);
          },
        ),
      )
    );
  }
}