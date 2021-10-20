import 'package:flutter/material.dart';
import 'package:gaadi/screens/single_product/components/similar_product.dart';
import 'package:gaadi/screens/single_product/components/single_review.dart';
import 'package:gaadi/size_config.dart';

class SingleBody extends StatefulWidget {
  const SingleBody({Key? key}) : super(key: key);

  @override
  _SingleBodyState createState() => _SingleBodyState();
}

class _SingleBodyState extends State<SingleBody> {
  var _body = [
    SizedBox(height: getProportionateScreenWidth(20)),
    SimilarProduct(),
    SizedBox(height: getProportionateScreenWidth(20)),
    SingleReview(),
    // RecentProduct(),
    // SizedBox(height: getProportionateScreenWidth(20)),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: _body.length,
            itemBuilder: (context, index) {
              return _body[index];
            });
  }
}
