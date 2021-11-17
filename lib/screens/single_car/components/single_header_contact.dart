import 'package:flutter/material.dart';
import 'package:gaadi/api/models/vehicle.dart';
import 'package:gaadi/constants.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../../../../size_config.dart';

class SingleHeaderContact extends StatefulWidget {
  SingleHeaderContact({Key? key, this.vehicle}) : super(key: key);
  Vehicle? vehicle;
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
                        Text(  widget.vehicle == null ? "" : widget.vehicle!.title.toString(), overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                        Text("Price:  ${widget.vehicle == null ? "" : widget.vehicle!.price.toString()}", overflow: TextOverflow.ellipsis),
                        Text("Model: ${widget.vehicle == null ? "" : widget.vehicle!.model.toString()}", overflow: TextOverflow.ellipsis),
                        Text("Seller: ${widget.vehicle == null || widget.vehicle!.user == null ? "" : widget.vehicle!.user!.firstname.toString()}", overflow: TextOverflow.ellipsis),
                        // Row(
                        //   children: [
                        //     SmoothStarRating(
                        //       isReadOnly: true,
                        //       allowHalfRating: false,
                        //       rating: 4,
                        //       size: 30,
                        //       starCount: 5,
                        //       color: Colors.yellow.shade700,
                        //       borderColor: Colors.yellow.shade700,
                        //       spacing:0.0,
                        //       onRated: (value) {
                        //         // setState(() {
                        //         //   rating = value;
                        //         // });
                        //       },
                        //     ),
                        //     Text("(210 Reviews)"),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ],
              ))
        ],
      );
  }
}
