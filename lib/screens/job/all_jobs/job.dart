import 'package:flutter/material.dart';
import 'package:gaadi/screens/job/all_jobs/components/job_body.dart';
import 'package:gaadi/screens/job/all_jobs/components/search_field_job.dart';

class Job extends StatefulWidget {
  const Job({Key? key}) : super(key: key);

  @override
  _JobState createState() => _JobState();
}

class _JobState extends State<Job> {

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
                  title: Text("Jobs", style: TextStyle(color: Colors.black),),
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
                      child: SearchFieldJob()),
                  pinned: true,
                  floating: false,
                  snap: false,
                  forceElevated: innerBoxIsScrolled,

                ),

              ];
            },
            body: JobBody()
        ),
      ),
    );
  }
}
