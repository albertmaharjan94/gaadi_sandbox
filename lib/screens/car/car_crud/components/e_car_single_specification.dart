import 'package:flutter/material.dart';
import 'package:gaadi/api/models/vehicle.dart';
import 'package:gaadi/constants.dart';
import 'package:gaadi/size_config.dart';

class ECarSingleSpecification extends StatefulWidget {
  ECarSingleSpecification({Key? key, required this.updateSpecification})
      : super(key: key);
  Function? updateSpecification;

  @override
  _ECarSingleSpecificationState createState() =>
      _ECarSingleSpecificationState();
}

class _ECarSingleSpecificationState extends State<ECarSingleSpecification> {
  List<Widget> specs = [];

  List<SingleSpecification> specsData = [];

  TextEditingController title = new TextEditingController();
  TextEditingController description = new TextEditingController();

  TextEditingController innerTitle = new TextEditingController();
  TextEditingController innerDescription = new TextEditingController();

  FocusNode titleNode = new FocusNode();
  FocusNode descriptionNode = new FocusNode();
  FocusNode submitNode = new FocusNode();

  FocusNode innerTitleNode = new FocusNode();
  FocusNode innerDescriptionNode = new FocusNode();
  FocusNode innerSubmitNode = new FocusNode();

  final _formKey = GlobalKey<FormState>();
  final _innerFormKey = GlobalKey<FormState>();

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add Specification'),
            content: Form(
              key: _formKey,
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: double.infinity,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: title,
                      enableSuggestions: false,
                      focusNode: titleNode,
                      keyboardType: TextInputType.text,
                      onFieldSubmitted: (a) {
                        titleNode.unfocus();
                        FocusScope.of(context).requestFocus(descriptionNode);
                      },
                      validator: (value) {
                        // Null check
                        if (value == "") {
                          return 'Please enter title';
                        }
                        // success condition
                        return null;
                      },
                      onChanged: (value) {},
                      decoration:
                          InputDecoration(hintText: "Specification Title"),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                                margin: EdgeInsets.only(right: 10, top: 5),
                                child: ElevatedButton(
                                  focusNode: submitNode,
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      Navigator.pop(context);
                                      setState(() {
                                        specsData.add(SingleSpecification(
                                            title: title.text,
                                        key: []));
                                      });
                                      title.text = "";
                                      print("Specs Data : " +
                                          specsData.toString());
                                    }
                                  },
                                  child: Text("Save"),
                                ))),
                        Expanded(
                            child: Container(
                                margin: EdgeInsets.only(left: 10, top: 5),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Close"),
                                )))
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<void> _displayInnerSpecs(BuildContext context, int index) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add Specification'),
            content: Form(
              key: _innerFormKey,
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: double.infinity,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: innerTitle,
                      enableSuggestions: false,
                      focusNode: innerTitleNode,
                      keyboardType: TextInputType.text,
                      onFieldSubmitted: (a) {
                        innerTitleNode.unfocus();
                        FocusScope.of(context)
                            .requestFocus(innerDescriptionNode);
                      },
                      validator: (value) {
                        // Null check
                        if (value == "") {
                          return 'Please enter title';
                        }
                        // success condition
                        return null;
                      },
                      onChanged: (value) {},
                      decoration:
                          InputDecoration(hintText: "Specification Title"),
                    ),
                    TextFormField(
                      controller: innerDescription,
                      enableSuggestions: false,
                      focusNode: innerDescriptionNode,
                      keyboardType: TextInputType.text,
                      onFieldSubmitted: (a) {
                        innerDescriptionNode.unfocus();
                        FocusScope.of(context).requestFocus(innerSubmitNode);
                      },
                      validator: (value) {
                        // Null check
                        if (value == "") {
                          return 'Please enter title';
                        }
                        // success condition
                        return null;
                      },
                      onChanged: (value) {},
                      decoration:
                          InputDecoration(hintText: "Specification Detail"),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                                margin: EdgeInsets.only(right: 10, top: 5),
                                child: ElevatedButton(
                                  focusNode: innerSubmitNode,
                                  onPressed: () {
                                    if (_innerFormKey.currentState!
                                        .validate()) {
                                      Navigator.pop(context);
                                      setState(() {
                                        specsData[index]
                                            .key!
                                            .add(
                                              {innerTitle.text : innerDescription.text});
                                            widget.updateSpecification!(specsData);
                                      });
                                      // specs.add(_makeSpecification(title.text.toString(), description.text.toString()));
                                      innerTitle.text = "";
                                      innerDescription.text = "";
                                      print("Specs Data : " +
                                          specsData[index].toString());
                                    }
                                  },
                                  child: Text("Save"),
                                ))),
                        Expanded(
                            child: Container(
                                margin: EdgeInsets.only(left: 10, top: 5),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Close"),
                                )))
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  void reorderData(int oldindex, int newindex) {
    setState(() {
      if (newindex > oldindex) {
        newindex -= 1;
      }
      final items = specsData.removeAt(oldindex);
      specsData.insert(newindex, items);
      widget.updateSpecification!(specsData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Specification",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              ElevatedButton.icon(
                  icon: Icon(Icons.add),
                  label: Text("Add"),
                  onPressed: () {
                    _displayTextInputDialog(context);
                  })
            ],
          ),
          specsData.length == 0
              ? Text(
                  "Add the specifications of parts",
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.black45),
                )
              : ReorderableListView(
                  onReorder: reorderData,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                      for (final items in specsData)
                        ListTile(
                          contentPadding: EdgeInsets.all(0),
                          key: ValueKey(items),
                          title: Card(
                            child: ExpansionTile(
                              expandedAlignment: Alignment.bottomLeft,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                      child: specsData[specsData.indexOf(items)]
                                                  .key!.length != 0
                                          ? Column(
                                              children: [

                                                for (final innerTtems in specsData[specsData.indexOf(items)].key!)
                                                Card(
                                                  child: Container(
                                                    padding: EdgeInsets.only(left: 10),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          width:
                                                              getProportionateScreenWidth(
                                                                  100),
                                                          child: Text(
                                                            "${innerTtems.keys.first} ",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black87),
                                                          ),
                                                        ),
                                                        Container(
                                                          width:
                                                              getProportionateScreenWidth(
                                                                  120),
                                                          child: Text(
                                                            "${innerTtems.values.first}",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black54),
                                                          ),
                                                        ),
                                                        ElevatedButton(
                                                          style: ButtonStyle(
                                                              elevation:
                                                              MaterialStateProperty.all<double>(
                                                                  0),
                                                              backgroundColor:
                                                              MaterialStateProperty.all<Color>(
                                                                  Colors.white),
                                                              shape: MaterialStateProperty.all<
                                                                  RoundedRectangleBorder>(
                                                                  RoundedRectangleBorder(
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          8.0),
                                                                      side: BorderSide(
                                                                          color: Colors.transparent)))),
                                                          child: Icon(
                                                            Icons.clear,
                                                            color: kPrimaryColor,
                                                          ),
                                                          onPressed: () {
                                                            print("pressed");
                                                            setState(() {
                                                              specsData[specsData.indexOf(items)].key!.removeAt(
                                                                  specsData[specsData.indexOf(items)].key!.indexOf(innerTtems));
                                                              widget.updateSpecification!(specsData);
                                                            });
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : Container(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              child: Container(
                                                child: Text(
                                                  "Add the specifications of cars",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      color: Colors.black45),
                                                ),
                                              ),
                                            )),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Container(
                                    padding: EdgeInsets.only(left: 10),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          _displayInnerSpecs(context, specsData.indexOf(items));
                                        },
                                        child: Icon(Icons.add)),
                                  ),
                                ),
                              ],
                              tilePadding: EdgeInsets.zero,
                              initiallyExpanded: true,
                              title: Container(
                                width: 200,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: getProportionateScreenWidth(100),
                                      child: Text(
                                        "${items.title} ",
                                        style: TextStyle(color: Colors.black87),
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                          elevation:
                                              MaterialStateProperty.all<double>(
                                                  1),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.white),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  side: BorderSide(
                                                      color: kPrimaryColor)))),
                                      child: Icon(
                                        Icons.delete,
                                        color: kPrimaryColor,
                                      ),
                                      onPressed: () {
                                        print("pressed");
                                        setState(() {
                                          specsData.removeAt(
                                              specsData.indexOf(items));
                                          widget.updateSpecification!(specsData);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                    ]

                  // Card(
                  //   child: Container(
                  //     padding: EdgeInsets.all(16.0),
                  //     child: Text('${specsData[index]}'),
                  //   ));
                  )
        ],
      ),
    );
  }
}
