import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleJobTitle extends StatefulWidget {
  const SingleJobTitle({Key? key}) : super(key: key);

  @override
  _SingleJobTitleState createState() => _SingleJobTitleState();
}

class _SingleJobTitleState extends State<SingleJobTitle> {
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
                          "Corolla 2020",
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
                              Image.asset("assets/images/portfolio6.png",
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
                                      "Daraz",
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
                                "Oct 12: 2021",
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
                        Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          child: Flexible(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.shopping_bag,
                                  color: Colors.black54,
                                  size: 30,
                                ),
                                Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 5)),
                                Flexible(
                                  child: Text(
                                    "Part Time",
                                    style: TextStyle(
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          child: Flexible(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.supervised_user_circle,
                                  color: Colors.black54,
                                  size: 30,
                                ),
                                Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 5)),
                                Flexible(
                                  child: Text(
                                    "10000 employees",
                                    style: TextStyle(
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          child: Flexible(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.electrical_services,
                                  color: Colors.black54,
                                  size: 30,
                                ),
                                Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 5)),
                                Flexible(
                                  child: Text(
                                    "Car Service Center",
                                    style: TextStyle(
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
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
