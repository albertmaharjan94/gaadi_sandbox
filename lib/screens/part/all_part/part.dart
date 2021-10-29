import 'package:flutter/material.dart';
import 'package:gaadi/Transitions/RouteSlide.dart';
import 'package:gaadi/constants.dart';
import 'package:gaadi/screens/part/all_part/components/part_body.dart';
import 'package:gaadi/screens/part/full_profile.dart';
import 'package:gaadi/screens/part/part_crud/part_crud.dart';

import 'components/search_field_part.dart';

class Part extends StatefulWidget {
  const Part({Key? key}) : super(key: key);

  @override
  _PartState createState() => _PartState();
}

class _PartState extends State<Part> {

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        backgroundColor: kPrimaryColor,
        child: Icon(Icons.add, size: 30,), //child widget inside this button
        onPressed: (){
          // Navigator.push(context, SlideLeftRoute(page: FullProfile()));
          // Navigator.push(context, SlideLeftRoute(page: SingleImageUpload()));
          // Navigator.push(context, SlideLeftRoute(page: AddSpecification()));
          Navigator.push(context, SlideLeftRoute(page: PartCrud(title: 'Add',)));
          //task to execute when this button is pressed
        },
      ),
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
                  title: Text("Parts", style: TextStyle(color: Colors.black),),
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
                      child: SearchFieldPart()),
                  pinned: true,
                  floating: false,
                  snap: false,
                  forceElevated: innerBoxIsScrolled,

                ),

              ];
            },
            body: PartBody()
        ),
      ),
    );
  }
}
