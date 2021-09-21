import 'package:flutter/material.dart';

class Child extends StatefulWidget {
  const Child({Key? key}) : super(key: key);
  static final String routeName = "/child";

  @override
  _ChildState createState() => _ChildState();
}

class _ChildState extends State<Child> with AutomaticKeepAliveClientMixin<Child>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Child")
    );
  }

  @override
  bool get wantKeepAlive => true;
}
