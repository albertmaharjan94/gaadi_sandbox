import 'package:flutter/material.dart';
import 'package:gaadi/screens/single_car/components/similar_product.dart';
import 'package:gaadi/widgets/single_review.dart';
import 'package:gaadi/size_config.dart';

class PartSingleBody extends StatefulWidget {
  const PartSingleBody({Key? key}) : super(key: key);

  @override
  _PartSingleBodyState createState() => _PartSingleBodyState();
}

class _PartSingleBodyState extends State<PartSingleBody> {
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
