import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gaadi/constants.dart';
import 'package:gaadi/size_config.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class WriteReview extends StatefulWidget {
  WriteReview({Key? key}) : super(key: key);
  static String routeName = "/write-review";

  @override
  _WriteReviewState createState() => _WriteReviewState();
}

class _WriteReviewState extends State<WriteReview> {
  var rating = 0.0;

  final _reviewController = TextEditingController();

  FocusNode review = FocusNode();
  FocusNode submit = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: NestedScrollView(
            // floatHeaderSlivers: true,
            dragStartBehavior: DragStartBehavior.start,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  iconTheme: IconThemeData(color: Colors.black),
                  backgroundColor: Colors.white,
                  title: Text(
                    "Write a review",
                    style: TextStyle(color: Colors.black),
                  ),
                  pinned: true,
                  floating: true,
                  snap: false,
                  forceElevated: innerBoxIsScrolled,
                ),
              ];
            },
            body:
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  SmoothStarRating(
                    allowHalfRating: false,
                    rating: 0,
                    size: 50,
                    starCount: 5,
                    color: Colors.yellow.shade700,
                    borderColor: Colors.yellow.shade700,
                    spacing: 0.0,
                    onRated: (value) {
                      this.rating = value;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: TextFormField(
                      minLines: 1,//Normal textInputField will be displayed
                      maxLines: 10,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        labelText: "Review",
                        hintText: "Write a Review",
                        fillColor: Colors.white,
                        errorBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.red),
                          borderRadius:
                          BorderRadius.circular(5.0),
                        ),
                        focusedErrorBorder:
                        OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.red),
                          borderRadius:
                          BorderRadius.circular(5.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: extraDarkBlue,
                            width: 2.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                            color: darkBlue,
                          ),
                        ),
                      ),
                      keyboardType: TextInputType.multiline,
                      controller: _reviewController,
                      focusNode: review,
                      onChanged: (value) {},
                      validator: (value) {
                        // Null check
                        if (value == "") {
                          return 'Please enter review';
                        }
                        // success condition
                        return null;
                      },
                      enableSuggestions: false,

                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        focusNode: submit,
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                kPrimaryColor)),
                        onPressed: () {
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 30),
                          child: Text(
                            "SUBMIT",
                            style: TextStyle(fontSize: 20),
                          ),
                        )),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}
