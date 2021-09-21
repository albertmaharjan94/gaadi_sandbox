import 'dart:collection';

import 'package:flutter/material.dart';

import 'TestWi.dart';
import 'dashboard/dashboard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String routeName = "/homepage";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedPageIndex;
  List<Widget>? _pages;
  PageController? _pageController;

  ListQueue<int> _navigationQueue = ListQueue();

  @override
  void initState() {
    super.initState();

    _selectedPageIndex = 0;
    _pages = [
      Dashboard(),
      Dashboard(),
      Dashboard(),
    ];

    _pageController = PageController(initialPage: _selectedPageIndex);
  }

  @override
  void dispose() {
    _pageController?.dispose();

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
        });
        return false;
      },
      child: Scaffold(
          body: PageView(
            controller: _pageController,
            children: _pages!,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedPageIndex,
            onTap: (value) {
              _navigationQueue.addLast(_selectedPageIndex);
              setState(() => _selectedPageIndex = value);
              print(_pages.toString());
              print(_pageController!.page.toString());
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
