import 'package:flutter/material.dart';
import 'package:gaadi/screens/single_car/components/similar_product.dart';
import 'package:gaadi/widgets/feature.dart';
import 'package:gaadi/widgets/map_card.dart';
import 'package:gaadi/widgets/single_feature.dart';
import 'package:gaadi/widgets/single_review.dart';
import 'package:gaadi/size_config.dart';

import 'components/workshop_single_header.dart';
import 'components/workshop_single_header_contact.dart';

class OverviewWorkshop extends StatefulWidget {
  const OverviewWorkshop({Key? key}) : super(key: key);

  @override
  _OverviewWorkshopState createState() => _OverviewWorkshopState();
}

class _OverviewWorkshopState extends State<OverviewWorkshop> {
  List bannerList = [
    "assets/images/portfolio1.png",
    "assets/images/portfolio2.png",
    "assets/images/portfolio3.png",
    "assets/images/portfolio4.png",
  ];
  List<Widget>? _body;

  List<Widget> _features = [
    Feature(image: "assets/images/portfolio1.png", text: "Washing"),
    Feature(image: "assets/images/portfolio10.png", text: "Servicing"),
    Feature(image: "assets/images/portfolio12.png", text: "Cleaning"),
    Feature(image: "assets/images/portfolio13.png", text: "Diagonistics"),
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
            WorkshopSingleHeader(carousel: bannerList),
            SizedBox(height: getProportionateScreenHeight(20)),
            WorkshopSingleHeaderContact(),
          ],
        ),
      ),

      // review
      SizedBox(height: getProportionateScreenHeight(20)),
      SingleFeature(title: "Specification",body: _features,),

      // mapcard
      SizedBox(height: getProportionateScreenHeight(20)),
      MapCard(),

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
