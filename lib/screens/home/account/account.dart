
import 'package:flutter/material.dart';
import 'package:gaadi/Transitions/RouteSlide.dart';
import 'package:gaadi/screens/auth/canvas.dart';
import 'package:gaadi/screens/home/account/profile/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../size_config.dart';
import 'components/single_setting.dart';


class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> with AutomaticKeepAliveClientMixin<Account> {
  @override
  Widget build(BuildContext context) {

    var _body = [
      SingleSetting(title: "Account",subTitle: "See all your listings",onTap: () {
        Navigator.push(context, SlideLeftRoute(page: Profile()));
      },),
      SingleSetting(title: "Listings",subTitle: "See all your listings",onTap: () {},),
      SingleSetting(title: "Orders",subTitle: "See all your listings",onTap: () {},),
      SizedBox(height: getProportionateScreenWidth(20)),
      // RecentProduct(),
      // SizedBox(height: getProportionateScreenWidth(20)),
    ];

    return SafeArea(
      bottom: false,
      child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            // These are the slivers that show up in the "outer" scroll view.
            return <Widget>[
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverBody()
              ),

            ];
          },
          body:
          Builder(builder: (context) {
            return CustomScrollView(
              slivers: <Widget>[
                SliverOverlapInjector(
                  handle:
                  NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
                SliverToBoxAdapter(
                    child: Column(children: [..._body,
                    ElevatedButton(onPressed: () async {
                      SharedPreferences localStorage = await SharedPreferences.getInstance();
                      await localStorage.remove("LoggedInUser");
                      await localStorage.remove("user");
                      await localStorage.remove("token");
                      Navigator.popAndPushNamed(context, Canvas.routeName);
                    }, child: Text("Logout"))],)),
              ],
            );
          }),
          //
          // SafeArea(
          //
          //   child: ListView.builder(
          //       padding: EdgeInsets.zero,
          //       itemCount: _body.length,
          //       itemBuilder: (context, index) {
          //         return _body[index];
          //       }),
          // )),
    ));
  }


  SliverAppBar SliverBody() {
    var _filter = TextEditingController();
    return SliverAppBar(
        backgroundColor: Colors.white,
        expandedHeight: 160,
        collapsedHeight: 160,
        pinned: true,
        floating: false,
        flexibleSpace: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(child: Text("My Profile", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),),
              SizedBox(height: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child:
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            "assets/images/default.jpg",
                            fit: BoxFit.fill,
                            height: 70,
                            width: 70,
                          )
                        )
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text("Albert Maharjan", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text("albert.asdf.gmail.com", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        );
  }

  @override
  bool get wantKeepAlive => true;

}
