import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gaadi/screens/part/single_part/overview_part.dart';
import 'package:gaadi/widgets/bottom_contact_bar.dart';

class SinglePartPage extends StatefulWidget {
  SinglePartPage({Key? key, required this.title}) : super(key: key);
  String? title;
  @override
  _SinglePartPageState createState() => _SinglePartPageState();
}

class _SinglePartPageState extends State<SinglePartPage>  with SingleTickerProviderStateMixin {
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: ButtomContactBar(tel: "9860311104"),
      body: SafeArea(
        child: NestedScrollView(
          controller: _scrollController,
          // floatHeaderSlivers: true,
          dragStartBehavior: DragStartBehavior.start,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                actionsIconTheme: IconThemeData(color: Colors.black54),
                actions: <Widget>[
                  IconButton(icon: Icon(Icons.favorite_outline), onPressed: () {})
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
          body: OverviewPart()
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
