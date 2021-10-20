import 'package:flutter/material.dart';
import 'package:gaadi/screens/home/dashboard/components/categories.dart';
import 'package:gaadi/screens/single_product/single_view_pager.dart';
import 'package:gaadi/size_config.dart';

class SingleProduct extends StatefulWidget {
  const SingleProduct({Key? key}) : super(key: key);
  static String routeName = "/single_page";

  @override
  _SingleProductState createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  List bannerList = [
    "assets/demo/cars/chevroletMalibu.jpg",
    "assets/demo/cars/fordFocus.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return SingleViewPager(title: "Singe");
  }

}
