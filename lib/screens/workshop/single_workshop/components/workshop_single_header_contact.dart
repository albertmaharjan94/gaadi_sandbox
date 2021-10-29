import 'package:flutter/material.dart';
import 'package:gaadi/constants.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../../../../size_config.dart';

class WorkshopSingleHeaderContact extends StatefulWidget {
  const WorkshopSingleHeaderContact({Key? key}) : super(key: key);

  @override
  _WorkshopSingleHeaderContactState createState() => _WorkshopSingleHeaderContactState();
}

class _WorkshopSingleHeaderContactState extends State<WorkshopSingleHeaderContact> {
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
                        Text("Workshop", overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                        Text("Wash it here", overflow: TextOverflow.ellipsis),
                        Row(
                          children: [
                            Icon(Icons.verified_user, size: 14,),
                            Container(padding: EdgeInsets.only(left: 5), child: Text("Place Name", overflow: TextOverflow.ellipsis)),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.phone, size: 14,),
                            Container(padding: EdgeInsets.only(left: 5), child: Text("23456789", overflow: TextOverflow.ellipsis)),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.mail, size: 14,),
                            Container(padding: EdgeInsets.only(left: 5), child: Text("aasdf@gmail.com", overflow: TextOverflow.ellipsis)),
                          ],
                        ),
                        Row(
                          children: [
                            SmoothStarRating(
                              isReadOnly: true,
                              allowHalfRating: false,
                              rating: 2,
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
                            Text("(20 Reviews)"),
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
