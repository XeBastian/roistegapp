import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roistegapp/constants/constants.dart';
import 'package:roistegapp/models/imagesModel.dart';
import 'package:roistegapp/screens/processImage.dart';
import 'package:roistegapp/services/stateInject.dart';

class RevealMessage extends StatefulWidget {
  const RevealMessage({Key key}) : super(key: key);

  @override
  _RevealMessageState createState() => _RevealMessageState();
}

class _RevealMessageState extends State<RevealMessage> {
  // Controller c = Get.find();
  Controller c = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context: context, title: 'Reveal Message'),
      body: GridView.builder(
        itemCount: ProcessImage().processedImages.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Center(child: Text('Hello There'));
          // /Image.memory(processedImages[index]);
        },
      ),
    );
  }
}
