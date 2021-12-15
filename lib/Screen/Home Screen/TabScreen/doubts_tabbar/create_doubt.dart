import 'dart:io';

import 'package:education/Style/Utility.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CreateDoubtPage extends StatefulWidget {
  const CreateDoubtPage({Key? key}) : super(key: key);

  @override
  _CreateDoubtPageState createState() => _CreateDoubtPageState();
}

class _CreateDoubtPageState extends State<CreateDoubtPage> {
  Utility util = Utility();

  XFile? _image;

  File? _cropImage;

  getImage()async{
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if(image != null){
        File? croppedFile = await ImageCropper.cropImage(
            sourcePath: image.path,
            aspectRatioPresets: [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9
            ],
            androidUiSettings: AndroidUiSettings(
                toolbarTitle: 'Cropper',
                toolbarColor: Colors.deepOrange,
                toolbarWidgetColor: Colors.white,
                initAspectRatio: CropAspectRatioPreset.original,
                lockAspectRatio: false),
            iosUiSettings: IOSUiSettings(
              minimumAspectRatio: 1.0,
            )
        );
        if(croppedFile != null){
          setState(() {
            _cropImage = croppedFile;
          });
        }else{
          util.showSnackBar(context, "No Image Cropped");
        }
    }else{
      util.showSnackBar(context, "No Image Selected");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("POST"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              maxLines:_cropImage == null? 20 : 3,
              decoration: InputDecoration(hintText: "Ask a Doubt"),
            ),
          ),
           _cropImage != null ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Card(
                        elevation: 4,
                        child: Image.file(File(_cropImage!.path))),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                          child: IconButton(onPressed: (){
                            setState(() {
                              _cropImage = null;
                            });
                          }, icon: Icon(Icons.clear, color: Colors.white,))),
                    )
                  ],
                ),
                Text("Warning : If Upload image found to be not according to terms and condition to App, Post would be remove or"
                    " your account will be blocked permanently" , style: TextStyle(fontSize: 10 , color: Colors.red),)
              ],
            ),
          ) : Container()
        ],
      ),
      bottomSheet: Container(
        child: Row(children: [
          IconButton(onPressed: (){
            getImage();
          }, icon: Icon(Icons.camera_alt)),
          Expanded(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: (){}, child: Text("NEXT")),
          ))
        ],),
      ),
    );
  }
}
