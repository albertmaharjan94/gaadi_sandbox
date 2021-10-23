import 'package:flutter/material.dart';
import 'package:gaadi/constants.dart';
import 'package:gaadi/size_config.dart';

class Feature extends StatefulWidget {

  Feature({Key? key, required this.image, required this.text}) : super(key: key);
  String? image;
  String? text;

  @override
  _FeatureState createState() => _FeatureState();
}

class _FeatureState extends State<Feature> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right:20, bottom: 5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.2,
            blurRadius: 3,
            offset: Offset(0, 0.5), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Colors.white,
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: getProportionateScreenHeight(200),
              width: getProportionateScreenWidth(220),
              decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Hero(
                tag: widget.text!,
                child: ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                    child: Image.asset(
                      widget.image!,
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              widget.text!,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
