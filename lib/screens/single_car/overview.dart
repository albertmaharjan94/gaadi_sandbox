import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gaadi/api/api.dart';
import 'package:gaadi/api/models/user.dart';
import 'package:gaadi/api/models/vehicle.dart';
import 'package:gaadi/screens/car/car_view_model.dart';
import 'package:gaadi/screens/home/homepage.dart';
import 'package:gaadi/screens/single_car/components/similar_product.dart';
import 'package:gaadi/screens/single_car/specification.dart';
import 'package:gaadi/widgets/bottom_contact_bar.dart';
import 'package:gaadi/widgets/feature.dart';
import 'package:gaadi/widgets/single_feature.dart';
import 'package:gaadi/screens/single_car/components/single_header.dart';
import 'package:gaadi/screens/single_car/components/single_header_contact.dart';
import 'package:gaadi/widgets/single_review.dart';
import 'package:gaadi/size_config.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';

class Overview extends StatefulWidget {
  Overview({Key? key, required this.id}) : super(key: key);
  String? id;

  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  List bannerList = [];
  Vehicle _vehicle = new Vehicle();

  List<Widget> _features = [];

  var _scrollController;

  SharedPreferences? sharedPreferences;
  User? _loggedInUser;

  @override
  void initState() {
    _scrollController = ScrollController();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<CarViewModel>(context, listen: false)
          .getOneVehicle(widget.id);
    });

    getLoggedIn();
    super.initState();
  }

  getLoggedIn() async {
    sharedPreferences = await SharedPreferences.getInstance().then((value) {
      setState(() {
        _loggedInUser =
            User.fromJson(jsonDecode(value.getString("LoggedInUser")));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      List<Widget> _tmp = [];
      _vehicle = Provider.of<CarViewModel>(context, listen: true).vehicle;
      _vehicle.features?.forEach((element) {
        _tmp.add(Feature(
            image: element.values.first.toString(),
            text: element.keys.first.toString()));
      });
      print("Specifications ::  " + _vehicle.specification.toString());
      _features = _tmp;
      bannerList = _vehicle.image == null
          ? []
          : _vehicle.image!.map((e) => imageDomain + "/" + e).toList();
      print(bannerList);
    });

    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        bottomNavigationBar: ButtomContactBar(
          tel: _vehicle.user == null || _vehicle.user?.contact == null
              ? "0909"
              : _vehicle.user!.contact.toString(),
          from: _loggedInUser,
          bookNow: () { print("Booked");},
        ),
        body: SafeArea(
            child: NestedScrollView(
                controller: _scrollController,
                // floatHeaderSlivers: true,
                dragStartBehavior: DragStartBehavior.start,
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
                        _vehicle.title.toString(),
                        style: TextStyle(color: Colors.black),
                      ),
                      pinned: true,
                      floating: true,
                      snap: false,
                      forceElevated: innerBoxIsScrolled,
                    ),
                  ];
                },
                body: Container(
                  child: ListView(children: [
                    // header
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(16.0),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          SingleHeader(carousel: bannerList),
                          SizedBox(height: getProportionateScreenHeight(20)),
                          SingleHeaderContact(
                            vehicle: _vehicle,
                          ),
                          SizedBox(height: getProportionateScreenHeight(20)),
                        ],
                      ),
                    ),

                    // feature
                    SizedBox(height: getProportionateScreenHeight(20)),
                    SingleFeature(
                      body: _features,
                    ),

                    // // review
                    // SizedBox(height: getProportionateScreenHeight(20)),
                    // SingleReview(),

                    // specification
                    SizedBox(height: getProportionateScreenHeight(20)),
                    Specification(
                      vehicle: _vehicle,
                    ),

                    // similar products
                    SizedBox(height: getProportionateScreenHeight(20)),
                    Container(
                        decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(16.0),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          children: [
                            SimilarProduct(),
                          ],
                        )),
                    SizedBox(height: getProportionateScreenHeight(20)),
                  ]),
                ))));
  }
}
