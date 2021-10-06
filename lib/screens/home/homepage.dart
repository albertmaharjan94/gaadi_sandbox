import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:gaadi/constants.dart';
import 'package:gaadi/screens/home/account/dashboard.dart';
import 'package:gaadi/screens/home/dashboard/dashboard.dart';

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
    _pages = [
      Dashboard(),
      Account(),
      Account(),
    ];

    _pageController = PageController(initialPage: _selectedPageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_pages);
    return WillPopScope(
      ///this method will be called on press of the back button
      onWillPop: () async {
        /* Use this code if you just want to go back to 0th index

    */

        if(_selectedPageIndex == 0)
          return true;
        setState(() {
          _selectedPageIndex = 0;
          _pageController.jumpToPage(_selectedPageIndex);
        });
        return false;
      },
      child: Scaffold(
          body:
          PageView(
            controller: _pageController,
            children: _pages,
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
                icon: Icon(Icons.business),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'School',
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
