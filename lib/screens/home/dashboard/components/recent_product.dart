import 'package:flutter/material.dart';
import 'package:gaadi/screens/home/dashboard/components/card.dart';
import 'package:gaadi/screens/home/dashboard/components/section_title.dart';
import 'package:gaadi/size_config.dart';

class RecentProduct extends StatefulWidget {
  RecentProduct({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _RecentProductState createState() => _RecentProductState();
}

class _RecentProductState extends State<RecentProduct> {
  final ScrollController _controller = ScrollController();

  bool _isLoading = false;
  List<String> _dummy = List.generate(20, (index) => 'Item $index');

  List<Map<String, dynamic>> demoRecent = [
    {
      "id": 1,
      "title": "Akd Light for Elantra",
      "price": 800,
      "image": "assets/demo/cars/akdLight.jpg",
      "isFavourite": false
    },
    {
      "id": 2,
      "title": "BridgeStone Tyres",
      "price": 1900,
      "image": "assets/demo/cars/bridgestone.jpg",
      "isFavourite": true
    },
    {
      "id": 3,
      "title": "Dunlop tyres",
      "price": 2000,
      "image": "assets/demo/cars/dunlop.jpg",
      "isFavourite": true
    },
    {
      "id": 4,
      "title": "Echo Guard Air Filter",
      "price": 700,
      "image": "assets/demo/cars/echoGuardAirFIlter.jpg",
      "isFavourite": false
    },
    {
      "id": 5,
      "title": "Fagis Light",
      "price": 1800,
      "image": "assets/demo/cars/fagisLight.jpg",
      "isFavourite": true
    },
    {
      "id": 6,
      "title": "Fram Air Filter",
      "price": 300,
      "image": "assets/demo/cars/framAirFilter.jpg",
      "isFavourite": true
    },
    {
      "id": 7,
      "title": "Chevrolet Malibu",
      "price": 87800,
      "image": "assets/demo/cars/chevroletMalibu.jpg",
      "isFavourite": true
    },
    {
      "id": 8,
      "title": "Ford Focus",
      "price": 78900,
      "image": "assets/demo/cars/fordFocus.jpg",
      "isFavourite": false
    },
    {
      "id": 9,
      "title": "Honda Accord",
      "price": 90000,
      "image": "assets/demo/cars/hondaAccord.jpg",
      "isFavourite": true
    },
    {
      "id": 10,
      "title": "Toyota Corolla",
      "price": 7800,
      "image": "assets/demo/cars/toyotaCorolla.jpg",
      "isFavourite": false
    },
  ];

  @override
  void initState() {
    _controller.addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _onScroll() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        _isLoading = true;
      });
      _fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      physics: PageScrollPhysics(),
          controller: _controller,
      slivers: <Widget>[
        SliverGrid(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 0.8,
            ),
            delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return HomeCard(product: demoRecent[index]);
                },
                childCount: demoRecent.length
            )
        ),
        SliverList(

          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Visibility(
                      visible: _isLoading,
                      child: Center(child: CircularProgressIndicator()));
            },
            childCount: 1,

          ),
        )
        // Container(
        //   child: GridView.builder(
        //     shrinkWrap: true,
        //     physics: ClampingScrollPhysics(),
        //     controller: _controller,
        //     itemCount: _isLoading ? demoRecent.length + 1 : demoRecent.length,
        //     padding: EdgeInsets.symmetric(horizontal: 10),
        //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //       crossAxisCount: 2,
        //       mainAxisSpacing: 1,
        //       crossAxisSpacing: 0,
        //       childAspectRatio: 0.8,
        //     ),
        //     itemBuilder: (context, index) {
        //       if (demoRecent.length == index) {
        //         return Center(child: CircularProgressIndicator());
        //       } else {
        //         return HomeCard(product: demoRecent[index]);
        //       }
        //     },
        //
        //   ),
        // ),
      ],
    );
  }

  Future _fetchData() async {
    await new Future.delayed(new Duration(seconds: 2));
    setState(() {
      demoRecent.addAll({
        {
          "id": 11,
          "title": "Hyundai Elantra",
          "price": 10800,
          "image": "assets/demo/cars/hyundaiElantra.jpg",
          "isFavourite": true
        },
        {
          "id": 1,
          "title": "Akd Light for Elantra",
          "price": 800,
          "image": "assets/demo/cars/akdLight.jpg",
          "isFavourite": false
        },
        {
          "id": 2,
          "title": "BridgeStone Tyres",
          "price": 1900,
          "image": "assets/demo/cars/bridgestone.jpg",
          "isFavourite": true
        },
        {
          "id": 3,
          "title": "Dunlop tyres",
          "price": 2000,
          "image": "assets/demo/cars/dunlop.jpg",
          "isFavourite": true
        },
        {
          "id": 4,
          "title": "Echo Guard Air Filter",
          "price": 700,
          "image": "assets/demo/cars/echoGuardAirFIlter.jpg",
          "isFavourite": false
        },
        {
          "id": 5,
          "title": "Fagis Light",
          "price": 1800,
          "image": "assets/demo/cars/fagisLight.jpg",
          "isFavourite": true
        },
        {
          "id": 6,
          "title": "Fram Air Filter",
          "price": 300,
          "image": "assets/demo/cars/framAirFilter.jpg",
          "isFavourite": true
        },
        {
          "id": 7,
          "title": "Chevrolet Malibu",
          "price": 87800,
          "image": "assets/demo/cars/chevroletMalibu.jpg",
          "isFavourite": true
        },
      });
      _isLoading = false;
    });
  }
}
