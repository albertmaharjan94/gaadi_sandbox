import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:gaadi/screens/auth/login.dart';
import 'package:gaadi/screens/auth/otp.dart';
import 'package:gaadi/screens/auth/register.dart';

import 'Child.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with AutomaticKeepAliveClientMixin<Dashboard> {
  @override
  bool get wantKeepAlive => true;

  var _selectedPageIndex;

  ListQueue<int> _navigationQueue = ListQueue();
  late List<Widget> _screens = [
    Login(changeIndex: changeIndex),
    Register(changeIndex: changeIndex),
    OTP(changeIndex: changeIndex),
  ];
  void changeIndex(index) {
    setState(() => _selectedPageIndex = index);
  }
  @override void initState() {
    super.initState();

    _selectedPageIndex= 0;
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WillPopScope(
        ///this method will be called on press of the back button
        onWillPop: () async {
      /* Use this code if you just want to go back to 0th index
         if(index == 0)
           return true;
         setState(() {
          index = 0;
        });
      return false;
    */

      if (_navigationQueue.isEmpty) return true;

      setState(() {
        _selectedPageIndex = _navigationQueue.last;
        _navigationQueue.removeLast();
      });
      return false;
    },
    child: Container(
      child: _screens[_selectedPageIndex],
    ));
    // return Container(
    //   height: MediaQuery.of(context).size.height,
    //     width: MediaQuery.of(context).size.width,
    //
    //     child: Center(child: ElevatedButton(
    //       onPressed: () {
    //         Navigator.pushNamed(context, Child.routeName);
    //       },
    //       child: Text("Dashboard here"),
    //         )
    // ));
  }
}
