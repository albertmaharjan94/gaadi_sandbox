import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class GridImagePicker extends StatefulWidget {

  GridImagePicker({Key? key, required this.setImageList}) : super(key: key);

  Function? setImageList;
  @override
  _GridImagePickerState createState() => _GridImagePickerState();
}

class _GridImagePickerState extends State<GridImagePicker> {
  final ImagePicker _picker = ImagePicker();

  List<PickedFile> _imageList = [];
  static const int limit = 6;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinedButton(
          onPressed: () {
            if (_imageList.length < limit) selectImage();
          },
          child: Text("Select Photo"),
        ),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          // to disable GridView's scrolling
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemCount: limit,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.all(5),
              child: (index <= _imageList.length - 1)
                  ? Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.file(
                          File(_imageList[index].path),
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(255, 255, 254, 0.7)),
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _imageList.removeAt(index);
                                      widget.setImageList!(
                                          _imageList.map((e) => e.path).toList());

                                    });

                                  },
                                  child: Icon(Icons.delete_outline,
                                      color: Colors.red[600]))),
                        )
                      ],
                    )
                  : InkWell(
                      onTap: () => selectImage(),
                      child: Image.asset(
                        "assets/images/default.jpg",
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
            );
          },
        ),
      ],
    );
  }

  void selectImage() async {
    final PickedFile selected =
        await _picker.getImage(source: ImageSource.gallery);
    if (selected.path.isNotEmpty) {
      setState(() {
        _imageList.add(selected);
        widget.setImageList!(
            _imageList.map((e) => e.path).toList());
      });
    }
  }
}
