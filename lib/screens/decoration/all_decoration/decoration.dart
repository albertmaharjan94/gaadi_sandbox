import 'package:flutter/material.dart';
import 'components/decoration_body.dart';
import 'components/search_field_decoration.dart';

class DecorationVehicle extends StatefulWidget {
  const DecorationVehicle({Key? key}) : super(key: key);

  @override
  _DecorationVehicleState createState() => _DecorationVehicleState();
}

class _DecorationVehicleState extends State<DecorationVehicle> {

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
                  title: Text("DecorationVehicles", style: TextStyle(color: Colors.black),),
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
                      child: SearchFieldDecoration()),
                  pinned: true,
                  floating: false,
                  snap: false,
                  forceElevated: innerBoxIsScrolled,

                ),

              ];
            },
            body: DecorationBody()
        ),
      ),
    );
  }
}
