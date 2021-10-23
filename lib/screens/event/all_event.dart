import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gaadi/constants.dart';
import 'package:gaadi/screens/event/components/all_calendar.dart';
import 'package:table_calendar/table_calendar.dart';


class AllEvent extends StatefulWidget {
  @override
  _AllEventState createState() => _AllEventState();
}

class _AllEventState extends State<AllEvent> {
  ScrollController _scrollController = new ScrollController();
  List<Widget> _body = [
    AllCalendar(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: NestedScrollView(
            controller: _scrollController,
            // floatHeaderSlivers: true,
            dragStartBehavior: DragStartBehavior.start,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  iconTheme: IconThemeData(color: Colors.black),
                  backgroundColor: Colors.white,
                  title: Text(
                    "All Events",
                    style: TextStyle(color: Colors.black),
                  ),
                  pinned: true,
                  floating: true,
                  snap: false,
                  forceElevated: innerBoxIsScrolled,
                ),

              ];
            },
            body: ListView(
              children: _body,
            )),
      ),
    );
  }
}