import 'package:flutter/material.dart';
import 'package:gaadi/Transitions/RouteSlide.dart';
import 'package:gaadi/constants.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
            controller: _controller,
            floatHeaderSlivers: true,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  actionsIconTheme: IconThemeData(color: Colors.black),
                  iconTheme: IconThemeData(color: Colors.black),
                  backgroundColor: Colors.white,
                  title: Text(
                    "Edit Profile",
                    style: TextStyle(color: Colors.black),
                  ),
                  pinned: true,
                  floating: true,
                  snap: false,
                  elevation: 0,
                ),
              ];
            },
            body: Container(
              child: Column(
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
            )),
      ),
    );
  }
}
