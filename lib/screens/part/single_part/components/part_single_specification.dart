import 'package:flutter/material.dart';
import 'package:gaadi/size_config.dart';

class PartSingleSpecification extends StatefulWidget {
  PartSingleSpecification({Key? key, required this.specsData}) : super(key: key);
  List<Map<String, String>> specsData = [];
  @override
  _PartSingleSpecificationState createState() =>
      _PartSingleSpecificationState();
}

class _PartSingleSpecificationState extends State<PartSingleSpecification> {
  @override
  Widget build(BuildContext context) {
    return
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0)
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Specifications", style: TextStyle(fontSize: 20)),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  for (final innerTtems in widget.specsData)
                  Card(
                    child: Container(
                      padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                      child: Row(
                        children: [
                          Container(
                            width:
                            getProportionateScreenWidth(
                                100),
                            child: Text(
                              "${innerTtems.keys.first} ",
                              style: TextStyle(
                                  color: Colors
                                      .black87),
                            ),
                          ),
                          Container(
                            width:
                            getProportionateScreenWidth(
                                120),
                            child: Text(
                              "${innerTtems.values.first}",
                              style: TextStyle(
                                  color: Colors
                                      .black54),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
  }
}
