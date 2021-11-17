import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gaadi/Transitions/RouteSlide.dart';
import 'package:gaadi/constants.dart';
import 'package:gaadi/screens/car/components/car_body.dart';
import 'package:gaadi/screens/car/components/search_field_car.dart';
import 'package:gaadi/screens/home/homepage.dart';
import 'package:provider/provider.dart';

import 'car_crud/car_crud.dart';
import 'car_view_model.dart';

class Car extends StatefulWidget {
  const Car({Key? key}) : super(key: key);

  @override
  _CarState createState() => _CarState();
}

class _CarState extends State<Car> {
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CarViewModel>(
        create: (_) => CarViewModel(),
        child: Scaffold(
          backgroundColor: Colors.white,
          floatingActionButton: FloatingActionButton(
            elevation: 10,
            backgroundColor: kPrimaryColor,
            child: Icon(
              Icons.add,
              size: 30,
            ), //child widget inside this button
            onPressed: () {
              // Navigator.push(context, SlideLeftRoute(page: FullProfile()));
              // Navigator.push(context, SlideLeftRoute(page: SingleImageUpload()));
              Navigator.push(
                  context,
                  SlideLeftRoute(
                      page: CarCrud(
                    title: 'Add Vehicle',
                  )));
              //task to execute when this button is pressed
            },
          ),
          body: SafeArea(
            child: NestedScrollView(
              controller: _controller,
              floatHeaderSlivers: true,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    actionsIconTheme: IconThemeData(color: Colors.black),
                    actions: <Widget>[
                      IconButton(
                          icon: Icon(Icons.home),
                          onPressed: () {
                            goHome(context, HomePage());
                          })
                    ],
                    iconTheme: IconThemeData(color: Colors.black),
                    backgroundColor: Colors.white,
                    title: Text(
                      "Cars",
                      style: TextStyle(color: Colors.black),
                    ),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: SearchFieldCar()),
                    pinned: true,
                    floating: false,
                    snap: false,
                    forceElevated: innerBoxIsScrolled,
                  ),
                ];
              },
              body: CarBody())
                  ),
            ),
          );
  }

}
