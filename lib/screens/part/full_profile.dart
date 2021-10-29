import 'dart:convert';
import 'dart:io' as Io;
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gaadi/size_config.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:image_picker/image_picker.dart';

const darkBlue = Color(0xFF265E9E);
const extraDarkBlue = Color(0xFF91B4D8);

class FullProfile extends StatefulWidget {
  @override
  _FullProfileState createState() => _FullProfileState();
}

class _FullProfileState extends State<FullProfile> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _modelController = TextEditingController();

  // final _priceController = TextEditingController();
  // final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final titleNode = FocusNode();
  final priceNode = FocusNode();
  final modelNode = FocusNode();

  late File? _image;
  var name = '';
  var phone;
  var image;
  var showSnipper = false;
  var image64;
  var imageData;
  var changeName;
  var completeImage = '';
  var nameChange = 0;
  var proPicChange = 0;
  var passwordCheck = 0;

  @override
  void initState() {
    super.initState();
    _image = null;
  }

  //
  // Future<void> updateImage() async {
  //   setState(() {
  //     showSnipper = true;
  //   });
  //   var res = await CallApi().postDataWithToken(imageData, 'update_image');
  //   var body = json.decode(res.body);
  //   if (body['success'] == true) {
  //     Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => CustomDrawer(),
  //         ));
  //   } else {
  //     showDialog(
  //       builder: (context) => AlertDialog(
  //         title: Text('Image error'),
  //         content: Text(body['data'].toString()),
  //         actions: <Widget>[
  //           FlatButton(
  //             onPressed: () async {
  //               Navigator.pop(context);
  //             },
  //             child: Text('OK'),
  //           )
  //         ],
  //       ),
  //       context: context,
  //     );
  //   }
  //   setState(() {
  //     showSnipper = false;
  //   });
  // }
  //
  // Future<void> updateName(apiName) async {
  //   setState(() {
  //     showSnipper = true;
  //   });
  //   var res = await CallApi().postDataWithToken(apiName, 'update_profile');
  //   var body = json.decode(res.body);
  //   if (body['success'] == true) {
  //     Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => CustomDrawer(),
  //         ));
  //   } else {
  //     showDialog(
  //       builder: (context) => AlertDialog(
  //         title: Text('Name error'),
  //         content: Text(body['data'].toString()),
  //         actions: <Widget>[
  //           FlatButton(
  //             onPressed: () async {
  //               Navigator.pop(context);
  //             },
  //             child: Text('OK'),
  //           )
  //         ],
  //       ),
  //       context: context,
  //     );
  //   }
  //   setState(() {
  //     showSnipper = false;
  //   });
  // }

  _imgFromCamera() async {
    image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);
    final bytes = Io.File(image.path).readAsBytesSync();
    String img64 = base64Encode(bytes);
    image64 = img64;
    setState(() {
      _image = image;
      imageData = {"image": "$image64"};
    });
  }

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);
    final bytes = Io.File(image.path).readAsBytesSync();
    String img64 = base64Encode(bytes);
    image64 = img64;
    setState(() {
      _image = image;
      imageData = {"image": "$image64"};
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Colors.grey.shade400,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(
            "TEST",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SafeArea(
          child: ModalProgressHUD(
            inAsyncCall: showSnipper,
            child: GestureDetector(
              onTap: () {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: Stack(
                children: [
                  ListView(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(16.0)),
                        ),
                        child: Stack(
                          children: [
                            InkWell(
                              onTap: () {
                                proPicChange = 1;
                                _showPicker(context);
                              },
                              child: Center(
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            width: 150,
                                            height: 150,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 3.0,
                                              ),
                                            ),
                                            child: CircleAvatar(
                                              radius: 50,
                                              child: _image != null
                                                  ? ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      child: Image.file(
                                                        _image!,
                                                        width: 150,
                                                        height: 150,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    )
                                                  : ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      child: Image.network(
                                                        completeImage,
                                                        width: 150,
                                                        height: 150,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 10.0,
                                            right: 10.0,
                                            child: Container(
                                              height: 30.0,
                                              width: 30.0,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                shape: BoxShape.circle,
                                              ),
                                              child: IconButton(
                                                padding: EdgeInsets.zero,
                                                icon: Icon(
                                                  Icons.camera_alt,
                                                  color: darkBlue,
                                                ),
                                                onPressed: () {
                                                  proPicChange = 1;
                                                  _showPicker(context);
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(20)),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.0)),
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Title',
                              style: TextStyle(
                                color: extraDarkBlue,
                                fontSize: 14,
                              ),
                            ),
                            TextFormField(
                              controller: _titleController,
                              enableSuggestions: false,
                              focusNode: titleNode,
                              keyboardType: TextInputType.text,
                              onFieldSubmitted: (a) {
                                titleNode.unfocus();
                                FocusScope.of(context).requestFocus(priceNode);
                              },
                              validator: (value) {
                                // Null check
                                if (value == "") {
                                  return 'Please enter title';
                                }
                                // success condition
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Title',
                                hintStyle: TextStyle(
                                  color: darkBlue,
                                  fontSize: 18,
                                  letterSpacing: 0.2,
                                ),
                              ),
                              style: TextStyle(
                                color: darkBlue,
                                fontSize: 18,
                                letterSpacing: 0.2,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Price',
                              style: TextStyle(
                                color: extraDarkBlue,
                                fontSize: 14,
                              ),
                            ),
                            TextFormField(
                              controller: _priceController,
                              enableSuggestions: false,
                              focusNode: priceNode,
                              keyboardType: TextInputType.number,
                              onFieldSubmitted: (a) {
                                priceNode.unfocus();
                                FocusScope.of(context).requestFocus(modelNode);
                              },
                              validator: (value) {
                                // Null check
                                if (value == "") {
                                  return 'Please enter price';
                                }
                                // success condition
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Price',
                                hintStyle: TextStyle(
                                  color: darkBlue,
                                  fontSize: 18,
                                  letterSpacing: 0.2,
                                ),
                              ),
                              style: TextStyle(
                                color: darkBlue,
                                fontSize: 18,
                                letterSpacing: 0.2,
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'Model',
                              style: TextStyle(
                                color: extraDarkBlue,
                                fontSize: 14,
                              ),
                            ),
                            TextFormField(
                              controller: _priceController,
                              enableSuggestions: false,
                              focusNode: modelNode,
                              keyboardType: TextInputType.number,
                              onFieldSubmitted: (a) {
                                modelNode.unfocus();
                                // FocusScope.of(context).requestFocus(priceNode);
                              },
                              validator: (value) {
                                // Null check
                                if (value == "") {
                                  return 'Please enter model';
                                }
                                // success condition
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Model',
                                hintStyle: TextStyle(
                                  color: darkBlue,
                                  fontSize: 18,
                                  letterSpacing: 0.2,
                                ),
                              ),
                              style: TextStyle(
                                color: darkBlue,
                                fontSize: 18,
                                letterSpacing: 0.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AddSpecification extends StatefulWidget {
  const AddSpecification({Key? key}) : super(key: key);

  @override
  _AddSpecificationState createState() => _AddSpecificationState();
}

class _AddSpecificationState extends State<AddSpecification> {
  TextEditingController _key = TextEditingController();
  TextEditingController _value = TextEditingController();

  FocusNode keyNode = FocusNode();
  FocusNode valueNode = FocusNode();
  FocusNode submitNode = FocusNode();

  List<Widget> specs = [
    Container(
      child: Text("HERE"),
    )
  ];

  Widget _makeSpecification(String title, String detail) {
    return Container(
      child: Row(
        children: [
          Text(title),
          Text(detail),
        ],
      ),
    );
  }

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add Specification'),
            content: Container(
              height: 150.0,
              child: Column(
                children: [
                  TextFormField(
                    controller: _key,
                    enableSuggestions: false,
                    focusNode: keyNode,
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (a) {
                      keyNode.unfocus();
                      FocusScope.of(context).requestFocus(valueNode);
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
                    controller: _value,
                    enableSuggestions: false,
                    focusNode: valueNode,
                    keyboardType: TextInputType.text,
                    onFieldSubmitted: (a) {
                      valueNode.unfocus();
                      FocusScope.of(context).requestFocus(submitNode);
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
                                focusNode: submitNode,
                                onPressed: () {
                                  setState(() {
                                    Navigator.pop(context);
                                    specs.add(_makeSpecification(_key.text.toString(), _value.text.toString()));
                                    _key.text = "";
                                    _value.text = "";
                                  });
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
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            ...specs,
            ElevatedButton(
                onPressed: () => {_displayTextInputDialog(context)},
                child: Text("Add"))
          ],
        ),
      ),
    );
  }
}

class SingleImageUpload extends StatefulWidget {
  @override
  _SingleImageUploadState createState() {
    return _SingleImageUploadState();
  }
}

class _SingleImageUploadState extends State<SingleImageUpload> {
  List<Object> images = [];
  Future<File>? _imageFile;

  @override
  void initState() {
    super.initState();
    setState(() {
      images.add("Add Image");
      images.add("Add Image");
      images.add("Add Image");
      images.add("Add Image");
      images.add("Add Image");
      images.add("Add Image");
      images.add("Add Image");
      images.add("Add Image");
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: buildGridView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGridView() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 4,
      childAspectRatio: 1,
      children: List.generate(images.length, (index) {
        if (images[index] is ImageUploadModel) {
          ImageUploadModel? uploadModel = images[index] as ImageUploadModel?;
          return Card(
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: <Widget>[
                Image.file(
                  uploadModel!.imageFile!,
                  width: 300,
                  height: 300,
                ),
                Positioned(
                  right: 5,
                  top: 5,
                  child: InkWell(
                    child: Icon(
                      Icons.remove_circle,
                      size: 20,
                      color: Colors.red,
                    ),
                    onTap: () {
                      setState(() {
                        images.replaceRange(index, index + 1, ['Add Image']);
                      });
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return Card(
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _onAddImageClick(index);
              },
            ),
          );
        }
      }),
    );
  }

  Future _onAddImageClick(int index) async {
    setState(() {
      _imageFile = ImagePicker.pickImage(source: ImageSource.gallery);
      getFileImage(index);
    });
  }

  void getFileImage(int index) async {
//    var dir = await path_provider.getTemporaryDirectory();

    _imageFile!.then((file) async {
      setState(() {
        ImageUploadModel imageUpload = new ImageUploadModel();
        imageUpload.isUploaded = false;
        imageUpload.uploading = false;
        imageUpload.imageFile = file;
        imageUpload.imageUrl = '';
        images.replaceRange(index, index + 1, [imageUpload]);
      });
    });
  }
}

class ImageUploadModel {
  bool? isUploaded;
  bool? uploading;
  File? imageFile;
  String? imageUrl;

  ImageUploadModel({
    this.isUploaded,
    this.uploading,
    this.imageFile,
    this.imageUrl,
  });
}
