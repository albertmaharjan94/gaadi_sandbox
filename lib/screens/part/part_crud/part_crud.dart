
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'e_overview_part.dart';

class PartCrud extends StatefulWidget {
  PartCrud({Key? key, required this.title}) : super(key: key);
  String? title;
  @override
  _PartCrudState createState() => _PartCrudState();
}

class _PartCrudState extends State<PartCrud>  with SingleTickerProviderStateMixin {
  var _scrollController, _tabController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _tabController = TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return EOverviewPart();
  }

  _pageView() {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Text('List Item $index'),
          ),
        );
      },
    );
  }
}
