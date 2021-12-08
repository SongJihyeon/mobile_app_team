import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Googlemap extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _GooglemapState();
}

class _GooglemapState extends State<Googlemap> {
  Completer<GoogleMapController> _controller = Completer();
  MapType _googleMapType = MapType.normal;
  int _mapType = 0;
  Set <Marker> _markers = Set();
  GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  void initState(){
    super.initState();
    _markers.add(
      Marker(
        markerId: MarkerId('myInitialPosition'),
        position: LatLng(37.382782, 127.1189054),
        infoWindow: InfoWindow(title: 'My Position', snippet: 'Where an I?'),
      ),
    );
  }


  CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(37.382782, 127.1189054),
    zoom: 14,
  );


  void _onMapCreated(GoogleMapController controller){
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
      title: Text('공연장소찾기'),
     ),
     body: Stack(
       children: <Widget>[
         GoogleMap(
           mapType: _googleMapType,
           initialCameraPosition: _initialCameraPosition,
           onMapCreated: _onMapCreated,
            markers: _markers,
         ),
       ],
     ),
   );
  }


}


