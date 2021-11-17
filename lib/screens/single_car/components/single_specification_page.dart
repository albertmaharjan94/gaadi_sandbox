import 'package:flutter/material.dart';
import 'package:gaadi/constants.dart';

class SingleSpecificationPage extends StatefulWidget {
  SingleSpecificationPage({Key? key, required this.heading, required this.specs})
      : super(key: key);
  List<Map<String, String>> specs = [];
  String heading = "";

  @override
  _SingleSpecificationPageState createState() => _SingleSpecificationPageState();
}

class _SingleSpecificationPageState extends State<SingleSpecificationPage> {
  List<Widget> _body = [];

  @override
  void initState() {
    super.initState();
    widget.specs.forEach((element) {
      setState(() {
        _body.add(SingleSpecificationDetail(
          title: element.keys.first,
          subTitlte: element.values.first,
        ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              widget.heading.toString(),
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: kPrimaryColor),
            ),
          ),
          Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: _body,
          )),
        ],
      ),
    );
  }
}

class SingleSpecificationDetail extends StatelessWidget {
  SingleSpecificationDetail({Key? key, this.title, this.subTitlte})
      : super(key: key);
  String? title = "";
  String? subTitlte = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title.toString(),
            style: TextStyle(color: Colors.black45, fontSize: 14),
          ),
          Text(
            subTitlte.toString(),
            style: TextStyle(color: Colors.black, fontSize: 16),
          )
        ],
      ),
    );
  }
}
