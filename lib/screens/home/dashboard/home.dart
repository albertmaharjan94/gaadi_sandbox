import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gaadi/screens/home/dashboard/components/banner.dart';
import 'package:gaadi/screens/home/dashboard/components/categories.dart';
import 'package:gaadi/screens/home/dashboard/components/popular_component.dart';
import 'package:gaadi/screens/home/dashboard/components/popular_part.dart';
import 'package:gaadi/screens/home/dashboard/components/search_field.dart';
import 'package:gaadi/size_config.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var itemList = [
      "ITEM 1",
      "ITEM 2",
      "ITEM 3",
      "ITEM 4",
      "ITEM 5",
      "ITEM 6",
      "ITEM 7",
      "ITEM 8",
      "ITEM 9",
      "ITEM 1",
      "ITEM 2",
      "ITEM 3",
      "ITEM 4",
      "ITEM 5",
      "ITEM 6",
      "ITEM 7",
      "ITEM 8",
      "ITEM 9",
    ];

    var _body = [
      SizedBox(height: getProportionateScreenWidth(20)),
      PopularComponent(),
      SizedBox(height: getProportionateScreenWidth(20)),
      PopularPart(),
      SizedBox(height: getProportionateScreenWidth(20)),
    ];
    return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
          return <Widget>[SliverBanner(), SliverBody()];
        },
        body: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: _body.length,
            itemBuilder: (context, index) {
              return _body[index];
            }));
  }

  SliverAppBar SliverBanner() {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      expandedHeight: 200,
      floating: false,
      elevation: 0,
      flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return HomeBanner();
      }),
    );
  }

  SliverAppBar SliverBody() {
    var _filter = TextEditingController();
    return SliverAppBar(
        backgroundColor: Colors.white,
        expandedHeight: 240,
        collapsedHeight: 240,
        pinned: true,
        floating: false,
        flexibleSpace: Column(
          children: [
            SizedBox(height: getProportionateScreenWidth(60)),
            Categories(),
          ],
        ),
        title: SearchField());
  }
}
