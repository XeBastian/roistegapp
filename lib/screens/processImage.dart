import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:roistegapp/constants/constants.dart';
import 'package:roistegapp/screens/stegieChoice.dart';
import 'package:roistegapp/services/keyGen.dart';

// ignore: must_be_immutable
class ProcessImage extends StatefulWidget {
  File image;
  List<Image> processedImages = [];
  ProcessImage({Key key, this.image});

  @override
  _ProcessImageState createState() => _ProcessImageState();
}

class _ProcessImageState extends State<ProcessImage> {
  String bottomInfoMessage;

  GenerateKey _generateKey = GenerateKey();
  String key;
  String getKey() {
    key = _generateKey.keyGen();
    return key;
  }

  _decideWidget() {
    HapticFeedback.heavyImpact();
    setState(() {
      _toogleView();
    });
  }

  Widget _toogleView() {
    if (bottomInfoMessage != null) {
      return Text(bottomInfoMessage);
    } else
      return Text(' ');
    //
  }

  addImage() {
    ProcessImage().processedImages.add(Image.file(widget.image));
    Get.to(Choice());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: 'Add Message', context: context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 4.0, left: 8, right: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.file(
                widget.image,
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormField(
                    builder: (FormFieldState<dynamic> field) {
                      return Container(
                        padding: EdgeInsets.only(top: 4, left: 2, right: 2),
                        width: MediaQuery.of(context).size.width / 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: brown),
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          style: TextStyle(fontSize: 20, color: Colors.brown),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Add your Message...',
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      InkWell(
                        // splashColor: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          HapticFeedback.heavyImpact();
                          setState(() {
                            //TODO Implement the storing of a Random key
                            getKey();
                          });
                        },
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2.55,
                          decoration: BoxDecoration(
                            border: Border.all(color: brown),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text('Generate Key'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 60,
                        // width: MediaQuery.of(context).size.width / 1.15,

                        child: Center(
                          child: SelectableText(
                            '${getKey()}',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 22),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      HapticFeedback.heavyImpact();

                      Get.bottomSheet(
                        GestureDetector(
                          onVerticalDragDown: (value) {
                            if (true) {
                              print('g');
                            }
                          },
                          child: Container(
                            height: Get.mediaQuery.size.height / 3.5,
                            child: Center(
                              child: Text(
                                'Message Hidden Successfully.',
                                style: TextStyle(
                                  color: white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                        enableDrag: true,
                        backgroundColor: Colors.brown[500],
                        isDismissible: true,
                        elevation: 0.0,
                      );
                    },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: brown,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Hide Message',
                          style: TextStyle(
                            color: white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  _toogleView(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
