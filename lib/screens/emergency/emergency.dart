import 'package:flutter/material.dart';
import 'package:gaadi/screens/emergency/map_emergency.dart';

class Emergency extends StatefulWidget {
  const Emergency({Key? key}) : super(key: key);

  @override
  _EmergencyState createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
            physics: NeverScrollableScrollPhysics(),
            controller: _controller,
            floatHeaderSlivers: true,
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: Colors.white,
                  iconTheme: IconThemeData(color: Colors.black),
                  title: Text("Emergency", style: TextStyle(color: Colors.black),),
                  pinned: true,
                  floating: true,
                  snap: false,
                  elevation: 0,
                ),
              ];
            },
            body: MapEmergency(),
        ),
      ),
    );
  }
}
