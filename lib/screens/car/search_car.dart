import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gaadi/api/api.dart';
import 'package:gaadi/constants.dart';
import 'package:gaadi/screens/part/part_view_model.dart';
import 'package:gaadi/screens/part/single_part/single_part_page.dart';
import 'package:gaadi/screens/single_car/single_view_pager.dart';
import 'package:gaadi/size_config.dart';
import 'package:provider/provider.dart';

import 'car_view_model.dart';
import 'components/single_car_page.dart';

class SearchCar extends StatefulWidget {
  const SearchCar({Key? key}) : super(key: key);

  @override
  _SearchCarState createState() => _SearchCarState();
}

class _SearchCarState extends State<SearchCar> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CarViewModel>(
      create: (_) => CarViewModel(),
      child: Scaffold(backgroundColor: Colors.white, body: SearchBody()),
    );
  }
}

class SearchBody extends StatefulWidget {
  const SearchBody({Key? key}) : super(key: key);

  @override
  _SearchBodyState createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  ScrollController _scrollController = new ScrollController();
  var searchTextEditingController = TextEditingController();
  FocusNode searchNode = FocusNode();
  List<Widget> cars = [];
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
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
              user: e.user == null ? "": e.user!.firstname.toString(),
              tap: SingleViewPager(
                id: e.id.toString(),
                title: e.title,
              )))
          .toList();
    });
    return SafeArea(
      child: NestedScrollView(
          controller: _scrollController,
          // floatHeaderSlivers: true,
          dragStartBehavior: DragStartBehavior.start,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                iconTheme: IconThemeData(color: Colors.black),
                backgroundColor: Colors.white,
                flexibleSpace: Align(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: TextField(
                        focusNode: searchNode,
                        autofocus: true,
                        controller: searchTextEditingController,
                        textAlignVertical: TextAlignVertical.center,
                        onChanged: (value) {
                          if (_debounce?.isActive ?? false) _debounce?.cancel();
                          _debounce =
                              Timer(const Duration(milliseconds: 500), () {
                            _searchData();
                          });
                        },
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {
                              searchTextEditingController.clear();
                              _clearList();
                            },
                            icon: Icon(
                              Icons.clear,
                              size: 20,
                            ),
                          ),
                          alignLabelWithHint: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(20),
                              vertical: getProportionateScreenWidth(9)),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: "Search cars...",
                        )),
                  ),
                ),
                pinned: true,
                floating: true,
                snap: false,
                forceElevated: innerBoxIsScrolled,
              ),
            ];
          },
          body: RefreshIndicator(
              onRefresh: () => refreshPage(),
              child: new ListView(
                children: [
                  if (cars.length == 0 &&
                      searchTextEditingController.text.isNotEmpty)
                    Center(
                        child: Container(
                      child: Text("No result found"),
                    )),
                  ...cars
                ],
              ))),
    );
  }

  Future<void> refreshPage() async {
    Provider.of<CarViewModel>(context, listen: false)
        .searchVehicles(searchTextEditingController.text.toString());
  }

  Future<void> _searchData() async {
    if (searchTextEditingController.text.isEmpty)
      _clearList();
    else
      Provider.of<CarViewModel>(context, listen: false)
          .searchVehicles(searchTextEditingController.text.toString());
  }

  Future<void> _clearList() async {
    Provider.of<CarViewModel>(context, listen: false).setVehicles([]);
  }
}
