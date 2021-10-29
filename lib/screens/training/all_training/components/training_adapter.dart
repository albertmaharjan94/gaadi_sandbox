import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gaadi/Transitions/RouteSlide.dart';

class TrainingAdapter extends StatefulWidget {
  TrainingAdapter(
      {Key? key,
      required this.image,
      required this.title,
      required this.location,
      required this.company,
      required this.date,
      required this.opening,
      required this.isFavorite,
      required this.tap})
      : super(key: key);
  String image;
  String? title;
  String? location;
  String? company;
  String? date;
  String? opening;
  Widget? tap;
  bool? isFavorite;

  @override
  _TrainingAdapterState createState() => _TrainingAdapterState();
}

class _TrainingAdapterState extends State<TrainingAdapter> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.only(bottom: 20),
        child: InkWell(
          onTap: () {
            Navigator.push(context, SlideLeftRoute(page: widget.tap!));
          },
          child: Container(
            padding: EdgeInsets.only(top:5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  widget.image,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  alignment: Alignment.topLeft,
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          widget.title!,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          widget.company!,
                          style: TextStyle(
                              fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          widget.location!,
                          style: TextStyle(
                              fontSize: 16, color: Colors.black54),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 0),
                              child: Text(
                                widget.date!,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black54),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                "${widget.opening!} opening",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold, color: Colors.greenAccent.shade700),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ]),
              ],
            ),
          ),
        ));
  }
}
