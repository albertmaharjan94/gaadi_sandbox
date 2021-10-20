import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Review extends StatelessWidget {
  Review({Key? key, required this.title, required this.review, required this.rating, required this.user, required this.date}) : super(key: key);
  String? title;
  String? review;
  double? rating;
  String? user;
  String? date;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SmoothStarRating(
            isReadOnly: true,
            allowHalfRating: false,
            rating: this.rating,
            size: 20,
            starCount: 5,
            color: Colors.yellow.shade700,
            borderColor: Colors.yellow.shade700,
            spacing: 0.0,
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Text(this.review!, style: TextStyle(
              color: Colors.black54
            ),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Text(this.user!, style: TextStyle(
                fontWeight: FontWeight.bold,
            ),),
          ),
          Text(this.date!, style: TextStyle(
            color: Colors.black38
          ),),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: const Divider(
              color: Colors.black54,
              height: 2,
              thickness: 2,
              indent: 0,
              endIndent: 0,
            ),
          ),
        ],
      ),
    );
  }
}
