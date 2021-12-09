import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Show.dart';

class Googlemap extends StatefulWidget{
  final int index;
  Googlemap({required this.index});

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
        position: LatLng(double.parse(shows[widget.index].la), double.parse(shows[widget.index].lo)),
        infoWindow: InfoWindow(title: shows[widget.index].center, snippet: shows[widget.index].show_name),
      ),
    );
  }


  // CameraPosition _initialCameraPosition = CameraPosition(
  //   target: LatLng(double.parse(shows[widget.index].la), double.parse(shows[widget.index].lo)),
  //   zoom: 14,
  // );


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
           initialCameraPosition: CameraPosition(
             target: LatLng(double.parse(shows[widget.index].la), double.parse(shows[widget.index].lo)),
             zoom: 14,
           ),
           onMapCreated: _onMapCreated,
            markers: _markers,
         ),
       ],
     ),
   );
  }


}


