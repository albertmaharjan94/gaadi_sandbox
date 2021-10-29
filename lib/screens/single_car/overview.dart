import 'package:flutter/material.dart';
import 'package:gaadi/screens/single_car/components/similar_product.dart';
import 'package:gaadi/screens/single_car/specification.dart';
import 'package:gaadi/widgets/feature.dart';
import 'package:gaadi/widgets/single_feature.dart';
import 'package:gaadi/screens/single_car/components/single_header.dart';
import 'package:gaadi/screens/single_car/components/single_header_contact.dart';
import 'package:gaadi/widgets/single_review.dart';
import 'package:gaadi/size_config.dart';

class Overview extends StatefulWidget {
  const Overview({Key? key}) : super(key: key);

  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  List bannerList = [
    "assets/demo/cars/chevroletMalibu.jpg",
    "assets/demo/cars/fordFocus.jpg"
  ];

  List<Widget> _features = [
    Feature(image: "assets/demo/cars/chevroletMalibu.jpg", text: "Nice Body"),
    Feature(image: "assets/demo/cars/fordFocus.jpg", text: "Nice Windows"),
    Feature(image: "assets/demo/cars/fordFocus.jpg", text: "360 View"),
    Feature(image: "assets/demo/cars/fordFocus.jpg", text: "Camera"),
  ];
  List<Widget>? _body;

  @override
  void initState() {
    super.initState();
    _body = [
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
            SingleHeaderContact(),
            SizedBox(height: getProportionateScreenHeight(20)),
          ],
        ),
      ),

      // review
      SizedBox(height: getProportionateScreenHeight(20)),
      SingleFeature(body: _features,),

      // features
      SizedBox(height: getProportionateScreenHeight(20)),
      SingleReview(),

      // specification
      SizedBox(height: getProportionateScreenHeight(20)),
      Specification(),

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
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(children: _body!),
    );
  }
}
