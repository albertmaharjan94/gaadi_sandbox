import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gaadi/constants.dart';
import 'package:gaadi/screens/single_product/overview.dart';
import 'package:gaadi/size_config.dart';

class SingleViewPager extends StatefulWidget {
  SingleViewPager({Key? key, required this.title}) : super(key: key);
  String? title;
  @override
  _SingleViewPagerState createState() => _SingleViewPagerState();
}

class _SingleViewPagerState extends State<SingleViewPager>  with SingleTickerProviderStateMixin {
  var _scrollController, _tabController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _tabController = TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        isExtended: true,
        backgroundColor: kPrimaryColor,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        icon: Icon(Icons.phone),
        label: Text('CONTACT', style: TextStyle(fontSize: 15),),
      ),
      body: SafeArea(
        child: NestedScrollView(
          controller: _scrollController,
          // floatHeaderSlivers: true,
          dragStartBehavior: DragStartBehavior.start,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                actionsIconTheme: IconThemeData(color: Colors.redAccent.shade400),
                actions: <Widget>[
                  IconButton(icon: Icon(Icons.favorite), onPressed: () {})
                ],
                iconTheme: IconThemeData(color: Colors.black),
                backgroundColor: Colors.white,
                title: Text(widget.title!, style: TextStyle(color: Colors.black),),
                pinned: true,
                floating: true,
                snap: false,
                forceElevated: innerBoxIsScrolled,

              ),
            ];
          },
          body: Overview()
        ),
      ),
    );
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
