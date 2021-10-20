import 'package:flutter/material.dart';
import 'package:gaadi/screens/single_product/components/similar_product.dart';
import 'package:gaadi/screens/single_product/components/single_feature.dart';
import 'package:gaadi/screens/single_product/components/single_header.dart';
import 'package:gaadi/screens/single_product/components/single_header_contact.dart';
import 'package:gaadi/screens/single_product/components/single_review.dart';
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
  List<Widget>? _body;
  @override
  void initState() {
    // TODO: implement initState
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
      SingleFeature(),

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
