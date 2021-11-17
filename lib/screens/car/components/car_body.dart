import 'package:flutter/material.dart';
import 'package:gaadi/api/api.dart';
import 'package:gaadi/api/api_response.dart';
import 'package:gaadi/screens/car/components/search_field_car.dart';
import 'package:gaadi/screens/car/components/single_car_page.dart';
import 'package:gaadi/screens/single_car/single_view_pager.dart';
import 'package:gaadi/size_config.dart';
import 'package:provider/provider.dart';

import '../car_view_model.dart';

class CarBody extends StatefulWidget {
  const CarBody({Key? key}) : super(key: key);

  @override
  _CarBodyState createState() => _CarBodyState();
}

class _CarBodyState extends State<CarBody> {
  List<Widget> cars = [];
  ApiResponse _apiResponse = ApiResponse.loading("Loading");

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<CarViewModel>(context, listen: false).getVehicles();
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      cars = Provider.of<CarViewModel>(context, listen: true)
          .vehicles
          .map((e) => SingleCarPage(
              images: e.image == null
                  ? []
                  : e.image!.map((e) => imageDomain + "/" + e).toList(),
              title: e.title,
              price: e.price.toString(),
              rating: "4.5",
              review: "120",
              user: e.user!.firstname,
              tap: SingleViewPager(
                id: e.id.toString(),
                title: e.title,
              )))
          .toList();

      _apiResponse =
          Provider.of<CarViewModel>(context, listen: true).apiResponse;
    });
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (_apiResponse.status == Status.ERROR)
              Center(
                  child: Container(
                      child: Text("CONNECTION LOST. SCROLL DOWN TO REFRESH"))),
            Expanded(
              child: RefreshIndicator(
                onRefresh: refreshPage,
                child: ListView(children: cars),
              ),
            )
          ]),
    );
  }

  Future<void> refreshPage() async {
    Provider.of<CarViewModel>(context, listen: false).getVehicles();
  }
}
