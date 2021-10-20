import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gaadi/screens/home/dashboard/components/banner.dart';
import 'package:gaadi/screens/home/dashboard/components/categories.dart';
import 'package:gaadi/screens/home/dashboard/components/popular_component.dart';
import 'package:gaadi/screens/home/dashboard/components/popular_part.dart';
import 'package:gaadi/screens/home/dashboard/components/recent_product.dart';
import 'package:gaadi/screens/home/dashboard/components/search_field.dart';
import 'package:gaadi/screens/home/dashboard/components/section_title.dart';
import 'package:gaadi/size_config.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin<Home> {
  @override
  Widget build(BuildContext context) {

    var _body = [
      SizedBox(height: getProportionateScreenWidth(20)),
      PopularComponent(),
      SizedBox(height: getProportionateScreenWidth(20)),
      PopularPart(),
      SizedBox(height: getProportionateScreenWidth(20)),
      Padding(
        padding:
        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SectionTitle(title: "Recent Product", press: () {}),
      ),
      SizedBox(height: getProportionateScreenWidth(20)),
      // RecentProduct(),
      // SizedBox(height: getProportionateScreenWidth(20)),
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

  @override
  bool get wantKeepAlive => true;

}
