import 'package:flutter/material.dart';
import 'package:gaadi/widgets/map_wo_container.dart';

class SingleTrainingMap extends StatefulWidget {
  const SingleTrainingMap({Key? key}) : super(key: key);

  @override
  _SingleTrainingMapState createState() => _SingleTrainingMapState();
}

class _SingleTrainingMapState extends State<SingleTrainingMap> {
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
