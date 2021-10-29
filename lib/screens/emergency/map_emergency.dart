import 'dart:async';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gaadi/services/phone_call.dart';
import 'package:gaadi/size_config.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class MapEmergency extends StatefulWidget {
  const MapEmergency({Key? key}) : super(key: key);

  @override
  _MapEmergencyState createState() => _MapEmergencyState();
}

class _MapEmergencyState extends State<MapEmergency> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  LatLng? currentLatLng;

  bool showTooltip = false;
  int? currentMarker;
  Set<Map<dynamic, Object>> locations = {
    {
      "co-ordinate": LatLng(27.728357802577833, 85.3342696067071),
      "title": "European Bakery",
      "sub": "Bishal Nagar",
      "type": "G"
    },
    {
      "co-ordinate": LatLng(27.71791085132242, 85.33139427865751),
      "title": "Calm",
      "sub": "Tangal",
      "type": "W"
    },
    {
      "co-ordinate": LatLng(27.722849534843323, 85.35645683961414),
      "title": "Hyatt Regency",
      "sub": "Boudha",
      "type": "W"
    },
    {
      "co-ordinate": LatLng(27.722849534843323, 85.35645683961414),
      "title": "Hyatt Regency",
      "sub": "Boudha",
      "type": "G"
    },
    {
      "co-ordinate": LatLng(27.710008492231204, 85.32675942148427),
      "title": "City Centre",
      "sub": "Gyaneshowr",
      "type": "G"
    },
  };
  List _marker = [];
  Set<Circle>? circles;
  Completer<GoogleMapController> _controller = Completer();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(27.71854418056574, 85.3315035005705),
    zoom: 14.0,
  );
  List<MarkerId> listMarkerIds = List<MarkerId>.empty(growable: true);

  //final MarkerId markerId = MarkerId("current");

  LocationData? currentLocation;
  Location? location;

  @override
  void initState() {
    super.initState();

    location = new Location();

    // subscribe to changes in the user's location
    // by "listening" to the location's onLocationChanged event
    location!.onLocationChanged.listen((LocationData cLoc) {
      currentLocation = cLoc;
      print("Current location : " + StackTrace.current.toString());
    });

    // set markers
    locations.toList().asMap().forEach((index, element) async {
      Uint8List markerIcon;
      if (element["type"] == "W") {
        markerIcon = await getBytesFromAsset('assets/images/workshop.png', 100);
      } else {
        markerIcon = await getBytesFromAsset('assets/images/garage.png', 100);
      }
      MarkerId _markerId = MarkerId(Random().nextInt(100).toString());
      Marker tmp = Marker(
          onTap: () {
            setState(() {
              currentMarker = index;
              showTooltip = true;
            });
          },
          icon: BitmapDescriptor.fromBytes(markerIcon),
          markerId: _markerId,
          position: element["co-ordinate"] as LatLng,

          infoWindow: InfoWindow(
              title: element["title"].toString(),
              snippet: element["sub"].toString())
      );
      setState(() {
        markers[_markerId] = tmp;
      });
    });

    Geolocator.getCurrentPosition().then((currLocation) {
      setState(() {

        currentLatLng =
            new LatLng(currLocation.latitude, currLocation.longitude);

        circles = Set.from([
          Circle(
              circleId: CircleId("current"),
              center: currentLatLng,
              strokeColor: Colors.green.withOpacity(0.8),
              strokeWidth: 1,
              fillColor: Colors.green.withOpacity(0.3),
              radius: 1500)
        ]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            child: GoogleMap(
                padding: showTooltip ? EdgeInsets.only(bottom: 110, left: 15) : EdgeInsets.only(bottom: 10, left: 15),
                gestureRecognizers: [
                  Factory<OneSequenceGestureRecognizer>(
                      () => EagerGestureRecognizer())
                ].toSet(),
                initialCameraPosition: _kGooglePlex,
                onTap: (_) {
                  setState(() {
                    showTooltip = false;
                  });
                  print(showTooltip);
                },
                myLocationEnabled: true,
                mapType: MapType.normal,
                circles: circles,
                markers: Set<Marker>.of(markers.values),
                onMapCreated: (GoogleMapController controller) {
                  controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                      target: currentLatLng,
                    zoom: 14.0,)));
                  _controller.complete(controller);
                }),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Visibility(
              visible: showTooltip,
              child: showTooltip
                  ? Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 1.0,
                              spreadRadius: 2.0,
                              offset: Offset(-1, -1.0), // shadow direction: bottom right
                            )
                          ],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular((16)))
                      ),
                      width: double.infinity,
                      height: getProportionateScreenHeight(120),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    locations
                                        .elementAt(currentMarker!)["title"]
                                        .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 20),
                                  ),
                                  Text(
                                    locations
                                        .elementAt(currentMarker!)["sub"]
                                        .toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 16),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "1234567890",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 16),
                                  ),Text(
                                    "1234567890",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 16),
                                  ),
                                ],
                              ),

                            ],
                          ),

                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10))),
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      kPrimaryColor)),
                              onPressed: () {
                                PhoneCall.makePhoneCall("tel://9860311104");
                              },
                              child: Text("Call"),
                            ),
                          )
                        ],
                      ),
                    )
                  : Container(
                      child: Text("Hello"),
                    ),
            ),
          )
        ],
      ),
    );
  }

  measure(lat1, lon1, lat2, lon2) {
    // generally used geo measurement function
    var R = 6378.137; // Radius of earth in KM
    var dLat = lat2 * pi / 180 - lat1 * pi / 180;
    var dLon = lon2 * pi / 180 - lon1 * pi / 180;
    var a = sin(dLat / 2) * sin(dLat / 2) +
        cos(lat1 * pi / 180) *
            cos(lat2 * pi / 180) *
            sin(dLon / 2) *
            sin(dLon / 2);
    var c = 2 * atan2(sqrt(a), sqrt(1 - a));
    var d = R * c;
    return d * 1000; // meters
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
}
