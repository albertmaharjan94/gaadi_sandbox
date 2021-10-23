import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gaadi/constants.dart';
import 'package:gaadi/size_config.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  ScrollController _scrollController = new ScrollController();
  var _controller = TextEditingController();

  List<String> list = [];
  Timer? _debounce;
  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NestedScrollView(
            controller: _scrollController,
            // floatHeaderSlivers: true,
            dragStartBehavior: DragStartBehavior.start,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  iconTheme: IconThemeData(color: Colors.black),
                  backgroundColor: Colors.white,
                  flexibleSpace: Align(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: TextField(
                          controller: _controller,
                          textAlignVertical: TextAlignVertical.center,
                          onChanged: (value) {
                            if (_debounce?.isActive ?? false) _debounce?.cancel();
                            _debounce = Timer(const Duration(milliseconds: 500), () {
                              // do something with query
                              _createList();
                            });
                          },
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                _controller.clear();
                                _createList();
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
                            hintText: "Search product...",
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
            body: new Expanded(
                child: new ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return new Card(
                          child: Container(
                          padding: EdgeInsets.all(16.0),
                      child: Text('${list[index]}'),
                      ));
                    }))),
      ),
    );
  }

  _pageView() {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Text('List Item $index'),
          ),
        );
      },
    );
  }

  void _createList() {
    if (_controller.text.length > 0) {
      setState(() {
        list = ["Corollo", "Hondo", "Hyundo", "Mundo", "Hyundo", "Mundo", "Hyundo", "Mundo", "Hyundo", "Mundo"];
      });
    } else {
      setState(() {
        list = [];
      });
    }
  }

}

