


import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gaadi/screens/home/dashboard/components/banner.dart';
import 'package:gaadi/screens/home/dashboard/components/categories.dart';
import 'package:gaadi/screens/home/dashboard/components/popular_component.dart';
import 'package:gaadi/screens/home/dashboard/components/popular_part.dart';
import 'package:gaadi/size_config.dart';

import 'components/home_header.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            HomeBanner(),
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(20)),
            Categories(),
            SizedBox(height: getProportionateScreenWidth(20)),
            PopularComponent(),
            SizedBox(height: getProportionateScreenWidth(20)),
            PopularPart(),
            // SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

