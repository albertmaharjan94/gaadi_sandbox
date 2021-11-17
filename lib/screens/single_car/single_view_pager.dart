import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gaadi/screens/car/car.dart';
import 'package:gaadi/screens/car/car_view_model.dart';
import 'package:gaadi/screens/single_car/overview.dart';
import 'package:gaadi/widgets/bottom_contact_bar.dart';
import 'package:provider/provider.dart';

class SingleViewPager extends StatefulWidget {
  SingleViewPager({Key? key, required this.title, required this.id}) : super(key: key);
  String? title;
  String? id;

  @override
  _SingleViewPagerState createState() => _SingleViewPagerState();
}

class _SingleViewPagerState extends State<SingleViewPager>  with SingleTickerProviderStateMixin {
  var _scrollController, _tabController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _tabController = TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<CarViewModel>(
        create: (_) => CarViewModel(),
        child: Overview(id: widget.id,)
    );
  }
}
