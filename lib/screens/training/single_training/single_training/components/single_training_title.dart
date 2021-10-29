import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleTrainingTitle extends StatefulWidget {
  const SingleTrainingTitle({Key? key}) : super(key: key);

  @override
  _SingleTrainingTitleState createState() => _SingleTrainingTitleState();
}

class _SingleTrainingTitleState extends State<SingleTrainingTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.only(
            bottomLeft: Radius.circular(16.0),
            bottomRight: Radius.circular(16.0)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mechanic",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset("assets/images/portfolio9.png",
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topLeft),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                mainAxisAlignment:
                                    MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      "Softwarica",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(
                                      "Kathmandu, Bagmati",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Text(
                                "Oct 29: 2021",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.black54),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Icon(
                                  Icons.circle,
                                  size: 3,
                                ),
                              ),
                              Text(
                                "10 opening",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.greenAccent.shade700),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
