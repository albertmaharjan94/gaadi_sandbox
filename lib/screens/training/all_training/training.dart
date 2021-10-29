import 'package:flutter/material.dart';
import 'package:gaadi/screens/training/all_training/components/search_field_training.dart';
import 'package:gaadi/screens/training/all_training/components/training_body.dart';

class Training extends StatefulWidget {
  const Training({Key? key}) : super(key: key);

  @override
  _TrainingState createState() => _TrainingState();
}

class _TrainingState extends State<Training> {

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
                  title: Text("Trainings", style: TextStyle(color: Colors.black),),
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
                      child: SearchFieldTraining()),
                  pinned: true,
                  floating: false,
                  snap: false,
                  forceElevated: innerBoxIsScrolled,

                ),

              ];
            },
            body: TrainingBody()
        ),
      ),
    );
  }
}
