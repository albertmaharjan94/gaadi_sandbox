import 'package:flutter/material.dart';
import 'package:gaadi/constants.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../../../../size_config.dart';

class SingleHeaderContact extends StatefulWidget {
  const SingleHeaderContact({Key? key}) : super(key: key);

  @override
  _SingleHeaderContactState createState() => _SingleHeaderContactState();
}

class _SingleHeaderContactState extends State<SingleHeaderContact> {
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
                        Text("Corolla 2020", overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                        Text("Model: CTLASD780", overflow: TextOverflow.ellipsis),
                        Text("Seller: Seller", overflow: TextOverflow.ellipsis),
                        Row(
                          children: [
                            SmoothStarRating(
                              isReadOnly: true,
                              allowHalfRating: false,
                              rating: 4,
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
                            Text("(210 Reviews)"),
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
