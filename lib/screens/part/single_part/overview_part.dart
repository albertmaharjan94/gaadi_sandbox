import 'package:flutter/material.dart';
import 'package:gaadi/screens/single_car/components/similar_product.dart';
import 'package:gaadi/widgets/feature.dart';
import 'package:gaadi/widgets/single_feature.dart';
import 'package:gaadi/widgets/single_review.dart';
import 'package:gaadi/size_config.dart';

import 'components/part_single_header.dart';
import 'components/part_single_header_contact.dart';

class OverviewPart extends StatefulWidget {
  const OverviewPart({Key? key}) : super(key: key);

  @override
  _OverviewPartState createState() => _OverviewPartState();
}

class _OverviewPartState extends State<OverviewPart> {
  List bannerList = [
    "assets/demo/cars/akdLight.jpg",
    "assets/demo/cars/dunlop.jpg"
  ];
  List<Widget>? _body;

  List<Widget> _features = [
    Feature(image: "assets/demo/cars/dunlop.jpg", text: "Grip"),
    Feature(image: "assets/demo/cars/bridgestone.jpg", text: "Circular"),
    Feature(image: "assets/demo/cars/dunlop.jpg", text: "Grip"),
    Feature(image: "assets/demo/cars/bridgestone.jpg", text: "Circular"),
  ];

  @override
  void initState() {
    super.initState();
    _body = [
      // header
      Container(
        padding: EdgeInsets.only(bottom: 20),
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(16.0), bottomLeft: Radius.circular(16.0)),
          color: Colors.white,
        ),
        child: Column(
          children: [
            PartSingleHeader(carousel: bannerList),
            SizedBox(height: getProportionateScreenHeight(20)),
            PartSingleHeaderContact(),
          ],
        ),
      ),

      // review
      SizedBox(height: getProportionateScreenHeight(20)),
      SingleFeature(body: _features,),

      // features
      SizedBox(height: getProportionateScreenHeight(20)),
      SingleReview(),

      // similar products
      SizedBox(height: getProportionateScreenHeight(20)),
      Container(
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.circular(16.0),
            color: Colors.white,
          ),
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(children: [
          SimilarProduct(),
      ],)
      ),
      SizedBox(height: getProportionateScreenHeight(20)),
    ];
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: _body!
      ),
    );
  }
}
