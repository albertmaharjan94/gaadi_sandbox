import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gaadi/size_config.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapWoContainer extends StatefulWidget {
  const MapWoContainer({Key? key}) : super(key: key);

  @override
  _MapWoContainerState createState() => _MapWoContainerState();
}

class _MapWoContainerState extends State<MapWoContainer> {
  Completer<GoogleMapController> _controller = Completer();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  static CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(27.71854418056574, 85.3315035005705),
    zoom: 14.0,
  );

  @override
  void initState() {
    super.initState();
  }
  GoogleMapController? mapController;
  void _onMapCreated(GoogleMapController controller){
    mapController = controller;
    // mapController!.showMarkerInfoWindow(MarkerId("0"));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(400),
      child: Stack(
        children: [
          Positioned.fill(
            child: GoogleMap(
              initialCameraPosition: _kGooglePlex,
              buildingsEnabled: false,
              onTap: (_) {
                return;
              },
              rotateGesturesEnabled: false,
              tiltGesturesEnabled: false,
              zoomGesturesEnabled: false,
              scrollGesturesEnabled: false,
              mapToolbarEnabled: true,
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              markers:Set<Marker>.of({
                Marker(
                    markerId: MarkerId("0"),
                    position:LatLng(27.71854418056574, 85.3315035005705),
                    infoWindow: InfoWindow(
                        title: "Test",
                        snippet: "Testtig"
                    )
                )
              }),
              onMapCreated: _onMapCreated,
            ),
          ),
        ],
      ),
    );
  }

}
