
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'e_overview_car.dart';

class CarCrud extends StatefulWidget {
  CarCrud({Key? key, required this.title}) : super(key: key);
  String? title;
  @override
  _CarCrudState createState() => _CarCrudState();
}

class _CarCrudState extends State<CarCrud>  with SingleTickerProviderStateMixin {
  var _scrollController, _tabController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _tabController = TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return EOverviewCar();
  }
}
