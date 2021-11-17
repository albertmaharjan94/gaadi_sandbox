import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gaadi/api/models/part.dart';
import 'package:gaadi/screens/part/single_part/overview_part.dart';
import 'package:gaadi/widgets/bottom_contact_bar.dart';
import 'package:provider/provider.dart';

import '../part_view_model.dart';

class SinglePartPage extends StatefulWidget {
  SinglePartPage({Key? key, required this.title, required this.id})
      : super(key: key);
  String? title;
  String? id;

  @override
  _SinglePartPageState createState() => _SinglePartPageState();
}

class _SinglePartPageState extends State<SinglePartPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<PartViewModel>(
      create: (_) => PartViewModel(),
      child: OverviewPart(id: widget.id,)
    );
  }
}
