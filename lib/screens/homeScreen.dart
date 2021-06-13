import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:roistegapp/constants/constants.dart';
import 'package:roistegapp/screens/allImages.dart';
import 'package:roistegapp/screens/processImage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File imageFile;
  final picker = ImagePicker();

  Future pickImageFromGallery() async {
    HapticFeedback.heavyImpact();
    final picture = await picker.getImage(source: ImageSource.gallery);

    this.setState(() {
      imageFile = File(picture.path);
    });
  }

  Future pickImageFromCamera() async {
    HapticFeedback.heavyImpact();
    final picture = await picker.getImage(source: ImageSource.camera);

    this.setState(() {
      imageFile = File(picture.path);
    });
  }

  Widget decideView() {
    if (imageFile != null)
      return Expanded(
        flex: 16,
        child: Column(
          children: [
            Expanded(
              flex: 16,
              child: Image.file(
                imageFile,
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4.0,
                  horizontal: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      // splashColor: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        HapticFeedback.heavyImpact();
                        _cropImage();
                      },
                      child: Container(
                        height: 90,
                        width: MediaQuery.of(context).size.width / 2.15,
                        decoration: BoxDecoration(
                          border: Border.all(color: brown),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Process Image',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      // splashColor: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        HapticFeedback.heavyImpact();
                        setState(() {
                          imageFile = null;
                        });
                      },
                      child: Container(
                        height: 90,
                        width: MediaQuery.of(context).size.width / 5.55,
                        decoration: BoxDecoration(
                          border: Border.all(color: brown),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Icon(Icons.autorenew),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    else
      return Expanded(
        flex: 16,
        child: Center(
          child: Text(
            'First things first, Let\'s take an Image.\nPress any Button Below to begin',
            textAlign: TextAlign.center,
            style: defaultTextStyle,
          ),
        ),
      );
  }

  Future<Null> _cropImage() async {
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: Platform.isAndroid
          ? [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9
            ]
          : [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9
            ],
      androidUiSettings: AndroidUiSettings(
          activeControlsWidgetColor: Colors.blue,
          showCropGrid: true,
          toolbarTitle: 'Select Region',
          toolbarColor: white,
          toolbarWidgetColor: brown,
          statusBarColor: white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      cropStyle: CropStyle.rectangle,
      compressQuality: 99,
      compressFormat: ImageCompressFormat.png,
    );

    if (croppedFile != null) {
      imageFile = croppedFile;
      print('achiswa');
      Get.to(ProcessImage(
        image: imageFile,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: 'Stegie', context: context),
      body: Column(
        children: [
          decideView(),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  BuildBottomContainer(
                    kColor: brown,
                    kIcon: Icons.photo,
                    kSplashColor: splashColor,
                    kTapFunction: pickImageFromGallery,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  BuildBottomContainer(
                    kColor: Colors.lightBlue,
                    kIcon: Icons.camera_alt,
                    kSplashColor: splashColor,
                    kTapFunction: pickImageFromCamera,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BuildBottomContainer extends StatelessWidget {
  final Color kColor;
  final IconData kIcon;
  final Color kSplashColor;
  final Function kTapFunction;

  const BuildBottomContainer(
      {Key key, this.kColor, this.kIcon, this.kSplashColor, this.kTapFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        constraints: BoxConstraints(
          minHeight: double.infinity,
          minWidth: double.infinity,
        ),
        decoration: BoxDecoration(
          color: kColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Material(
          elevation: 0.0,
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            splashColor: kSplashColor,
            child: Icon(
              kIcon,
              size: 85,
              color: white,
            ),
            onLongPress: () {
              HapticFeedback.heavyImpact();
            },
            onTap: kTapFunction,
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final destination;
  final displayText;

  const CustomButton({Key key, this.destination, this.displayText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0, left: 8, right: 8),
      child: InkWell(
        // splashColor: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          HapticFeedback.heavyImpact();
          Get.to(destination);
        },
        child: Container(
          height: 90,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: brown),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              '$displayText',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
