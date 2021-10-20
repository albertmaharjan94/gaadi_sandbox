import 'package:flutter/material.dart';
import 'package:gaadi/screens/single_product/components/feature.dart';
import 'package:gaadi/size_config.dart';

class SingleFeature extends StatefulWidget {
  const SingleFeature({Key? key}) : super(key: key);

  @override
  _SingleFeatureState createState() => _SingleFeatureState();
}

class _SingleFeatureState extends State<SingleFeature> {
  List<Widget> body = [];

  @override
  void initState() {
    super.initState();
    body = [
      Feature(image: "assets/demo/cars/chevroletMalibu.jpg", text: "Nice Body"),
      Feature(image: "assets/demo/cars/fordFocus.jpg", text: "Nice Windows"),
      Feature(image: "assets/demo/cars/fordFocus.jpg", text: "360 View"),
      Feature(image: "assets/demo/cars/fordFocus.jpg", text: "Camera"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(320),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: getProportionateScreenWidth(20)),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Text(
              "Features",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenWidth(20)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: getProportionateScreenHeight(240),
              child: ListView(scrollDirection: Axis.horizontal, children: body),
            ),
          ),
        ],
      ),
    );
  }
}
