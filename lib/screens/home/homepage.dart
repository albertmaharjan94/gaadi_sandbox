import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:gaadi/constants.dart';
import 'package:gaadi/screens/decoration/map_picker.dart';
import 'package:gaadi/screens/home/dashboard/components/recent_product.dart';
import 'package:gaadi/screens/home/dashboard/dashboard.dart';
import 'package:gaadi/screens/home/maps/map.dart';

import 'account/Sc.dart';
import 'account/account.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String routeName = "/homepage";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedPageIndex;
  late List<Widget> _pages;
  late PageController _pageController;

  ListQueue<int> _navigationQueue = ListQueue();

  @override
  void initState() {
    super.initState();

    _selectedPageIndex = 0;

    _pageController = PageController(initialPage: _selectedPageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      ///this method will be called on press of the back button
      onWillPop: () async {
        /* Use this code if you just want to go back to 0th index

    */

        if (_selectedPageIndex == 0) return true;
        setState(() {
          _selectedPageIndex = 0;
          _pageController.jumpToPage(_selectedPageIndex);
        });
        return false;
      },
      child: Scaffold(
          body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: [
              Dashboard(),
              Account(),
              MapPicker()
              // MapRender(),
              // MainCollapsingToolbar()
            ],
            onPageChanged: (value) {
              setState(() => _selectedPageIndex = value);
              _pageController.jumpToPage(_selectedPageIndex);
            },
          ),
          // _pages![_selectedPageIndex],
          bottomNavigationBar: BottomNavigationBar(
            elevation: 10,
            selectedItemColor: kPrimaryColor,
            currentIndex: _selectedPageIndex,
            onTap: (value) {
              _navigationQueue.addLast(_selectedPageIndex);
              setState(() => _selectedPageIndex = value);
              _pageController.jumpToPage(_selectedPageIndex);
              print(_pageController.page.toString());
            },
            // onTap: (selectedPageIndex) {
            //
            //   setState(() {
            //     _selectedPageIndex = selectedPageIndex;
            //     _pageController!.jumpToPage(selectedPageIndex);
            //   });
            // },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.map),
                label: 'Map',
              ),
            ],
          )),
    );
  }
}

class Ho extends StatefulWidget {
  const Ho({Key? key}) : super(key: key);

  @override
  _HoState createState() => _HoState();
}

class _HoState extends State<Ho> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("HI"),
    );
  }
}
