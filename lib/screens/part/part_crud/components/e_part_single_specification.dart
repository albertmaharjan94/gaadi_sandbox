import 'package:flutter/material.dart';

class EPartSingleSpecification extends StatelessWidget {
  EPartSingleSpecification({Key? key}) : super(key: key);
  List<Map<String, String>> specs = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Specification", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
              ElevatedButton.icon(
                  icon: Icon(Icons.add),
                  label: Text("Add"),
                  onPressed: () {})
            ],
          ),
          specs.length == 0 ? Text("Add the specifications of parts", style: TextStyle(
              fontStyle: FontStyle.italic, color: Colors.black45),) : Container()
        ],
      ),
    );
  }
}
