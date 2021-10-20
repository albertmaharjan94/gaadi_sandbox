import 'package:flutter/material.dart';
import 'package:gaadi/Transitions/RouteSlide.dart';
import 'package:gaadi/constants.dart';
import 'package:gaadi/screens/single_product/components/review.dart';
import 'package:gaadi/screens/single_product/review/write_review.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class SingleReview extends StatefulWidget {
  const SingleReview({Key? key}) : super(key: key);

  @override
  _SingleReviewState createState() => _SingleReviewState();
}

class _SingleReviewState extends State<SingleReview> {
  var rating = 0.0;
  List<Widget> reviewList = [
    Review(title: "Nice Car", review: "I have owned this car for 3 years its very nice. I have owned this car for 3 years its very nice.I have owned this car for 3 years its very nice", rating: 4,date: "Oct 2, 2020", user: "Albert Maharjan"),
    Review(title: "Not so nice", review: "This is very low i didn't like it", rating: 1,date: "Oct 1, 2020", user: "Bipash Chayantal"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Reviews and Ratings",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                SmoothStarRating(
                  isReadOnly: true,
                  allowHalfRating: false,
                  rating: 1,
                  size: 30,
                  starCount: 1,
                  color: Colors.yellow.shade700,
                  borderColor: Colors.yellow.shade700,
                  spacing: 0.0,
                  onRated: (value) {
                    // setState(() {
                    //   rating = value;
                    // });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "4.6",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "Based on",
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    Text("400 users")
                  ],
                )
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, SlideLeftRoute(page: WriteReview()));
            },
            child: Text("Write a Review"),
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
            ),
          ),
          const Divider(
            color: Colors.black54,
            height: 10,
            thickness: 2,
            indent: 0,
            endIndent: 0,
          ),
          Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: reviewList
            ),
          ),
          InkWell(
            child: Padding(padding: EdgeInsets.only(top: 5),child: Text("VIEW ALL REVIEWS", style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),),),
          )

        ],
      ),
    );
  }
}
