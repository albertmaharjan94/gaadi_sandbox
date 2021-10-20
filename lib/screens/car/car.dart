import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gaadi/constants.dart';
import 'package:gaadi/screens/car/components/car_body.dart';
import 'package:gaadi/screens/car/components/search_field_car.dart';

class Car extends StatefulWidget {
  const Car({Key? key}) : super(key: key);

  @override
  _CarState createState() => _CarState();
}

class _CarState extends State<Car> {

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
            controller: _controller,
            floatHeaderSlivers: true,
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  actionsIconTheme: IconThemeData(color: Colors.black),
                  actions: <Widget>[
                    IconButton(icon: Icon(Icons.favorite_outline), onPressed: () {})
                  ],
                  iconTheme: IconThemeData(color: Colors.black),
                  backgroundColor: Colors.white,
                  title: Text("Cars", style: TextStyle(color: Colors.black),),
                  pinned: false,
                  floating: true,
                  snap: false,
                  elevation: 0,

                ),

                SliverAppBar(
                  expandedHeight: 70,
                  collapsedHeight: 70,
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  flexibleSpace: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: SearchFieldCar()),
                  pinned: true,
                  floating: false,
                  snap: false,
                  forceElevated: innerBoxIsScrolled,

                ),

              ];
            },
            body: CarBody()
        ),
      ),
    );
  }
}
