import 'package:flutter/material.dart';
import 'package:gaadi/screens/workshop/all_workshop/components/search_field_workshop.dart';
import 'package:gaadi/screens/workshop/all_workshop/components/workshop_body.dart';


class Workshop extends StatefulWidget {
  const Workshop({Key? key}) : super(key: key);

  @override
  _WorkshopState createState() => _WorkshopState();
}

class _WorkshopState extends State<Workshop> {

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
            controller: _controller,
            floatHeaderSlivers: true,
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  actionsIconTheme: IconThemeData(color: Colors.black),
                  actions: <Widget>[
                    IconButton(icon: Icon(Icons.favorite_outline), onPressed: () {})
                  ],
                  iconTheme: IconThemeData(color: Colors.black),
                  backgroundColor: Colors.white,
                  title: Text("Workshops", style: TextStyle(color: Colors.black),),
                  pinned: false,
                  floating: true,
                  snap: false,
                  elevation: 0,

                ),

                SliverAppBar(
                  expandedHeight: 70,
                  collapsedHeight: 70,
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  flexibleSpace: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: SearchFieldWorkshop()),
                  pinned: true,
                  floating: false,
                  snap: false,
                  forceElevated: innerBoxIsScrolled,

                ),

              ];
            },
            body: WorkshopBody()
        ),
      ),
    );
  }
}
