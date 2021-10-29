import 'package:flutter/material.dart';
import 'package:gaadi/size_config.dart';

class SingleFeature extends StatefulWidget {
  SingleFeature({Key? key, required this.body, this.title}) : super(key: key);
  List<Widget> body = [];
  String? title;
  @override
  _SingleFeatureState createState() => _SingleFeatureState();
}

class _SingleFeatureState extends State<SingleFeature> {

  @override
  void initState() {
    super.initState();
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
              widget.title != null ? widget.title.toString(): "Features" ,
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
              child: ListView(scrollDirection: Axis.horizontal, children: widget.body),
            ),
          ),
        ],
      ),
    );
  }
}
