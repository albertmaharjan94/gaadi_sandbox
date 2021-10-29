import 'package:flutter/material.dart';
import 'package:gaadi/widgets/map_wo_container.dart';

class SingleJobMap extends StatefulWidget {
  const SingleJobMap({Key? key}) : super(key: key);

  @override
  _SingleJobMapState createState() => _SingleJobMapState();
}

class _SingleJobMapState extends State<SingleJobMap> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.white
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Location", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          Padding(padding: EdgeInsets.only(bottom: 10)),
          MapWoContainer(),
        ],
      ),
    );
  }
}
