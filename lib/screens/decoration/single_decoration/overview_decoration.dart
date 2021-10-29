import 'package:flutter/material.dart';
import 'package:gaadi/screens/single_car/components/similar_product.dart';
import 'package:gaadi/widgets/feature.dart';
import 'package:gaadi/widgets/map_card.dart';
import 'package:gaadi/widgets/single_feature.dart';
import 'package:gaadi/widgets/single_review.dart';
import 'package:gaadi/size_config.dart';

import 'components/decoration_single_header.dart';
import 'components/decoration_single_header_contact.dart';

class OverviewDecoration extends StatefulWidget {
  const OverviewDecoration({Key? key}) : super(key: key);

  @override
  _OverviewDecorationState createState() => _OverviewDecorationState();
}

class _OverviewDecorationState extends State<OverviewDecoration> {
  List bannerList = [
    "assets/demo/cars/decoration1.jpg",
    "assets/demo/cars/decoration2.jpg"
  ];
  List<Widget>? _body;

  List<Widget> _features = [
    Feature(image: "assets/demo/cars/decoration1.jpg", text: "Wedding"),
    Feature(image: "assets/demo/cars/decoration2.jpg", text: "Welcoming"),
    Feature(image: "assets/demo/cars/decoration3.jpg", text: "Parting"),
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
            DecorationSingleHeader(carousel: bannerList),
            SizedBox(height: getProportionateScreenHeight(20)),
            DecorationSingleHeaderContact(),
          ],
        ),
      ),

      // feature
      SizedBox(height: getProportionateScreenHeight(20)),
      SingleFeature(title: "Specification",body: _features,),

      // map
      SizedBox(height: getProportionateScreenHeight(20)),
      MapCard(),

      // review
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
