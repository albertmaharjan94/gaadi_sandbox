import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
class EventModal extends StatefulWidget {
  const EventModal({Key? key}) : super(key: key);

  @override
  _EventModalState createState() => _EventModalState();
}

class _EventModalState extends State<EventModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Event Name", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          Row(
            children: [
              Icon(Icons.calendar_today_outlined),
              Text("Feb 2020")
            ],
          ),
          Row(
            children: [
              Icon(Icons.watch_later_outlined),
              Text("10:00")
            ],
          ),
          Text("TOOOO"),
          Text("TOOOO"),
          Text("TOOOO"),
        ],
      ),

    );
  }
}
