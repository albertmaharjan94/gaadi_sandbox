import 'package:flutter/material.dart';
import 'package:gaadi/constants.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../../../../size_config.dart';

class PartSingleHeaderContact extends StatefulWidget {
  const PartSingleHeaderContact({Key? key}) : super(key: key);

  @override
  _PartSingleHeaderContactState createState() => _PartSingleHeaderContactState();
}

class _PartSingleHeaderContactState extends State<PartSingleHeaderContact> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Headlight 2020", overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                        Text("Model: 34567890", overflow: TextOverflow.ellipsis),
                        Text("Seller: Seller Part", overflow: TextOverflow.ellipsis),
                        Row(
                          children: [
                            SmoothStarRating(
                              isReadOnly: true,
                              allowHalfRating: false,
                              rating: 3,
                              size: 30,
                              starCount: 5,
                              color: Colors.yellow.shade700,
                              borderColor: Colors.yellow.shade700,
                              spacing:0.0,
                              onRated: (value) {
                                // setState(() {
                                //   rating = value;
                                // });
                              },
                            ),
                            Text("(200 Reviews)"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ))
        ],
      );
  }
}
