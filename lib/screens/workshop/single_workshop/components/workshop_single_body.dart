import 'package:flutter/material.dart';
import 'package:gaadi/screens/single_car/components/similar_product.dart';
import 'package:gaadi/widgets/single_review.dart';
import 'package:gaadi/size_config.dart';

class WorkshopSingleBody extends StatefulWidget {
  const WorkshopSingleBody({Key? key}) : super(key: key);

  @override
  _WorkshopSingleBodyState createState() => _WorkshopSingleBodyState();
}

class _WorkshopSingleBodyState extends State<WorkshopSingleBody> {
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
