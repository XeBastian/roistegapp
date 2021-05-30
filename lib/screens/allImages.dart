import 'package:flutter/material.dart';
import 'package:roistegapp/constants/constants.dart';

class AllImages extends StatefulWidget {
  const AllImages({Key key}) : super(key: key);

  @override
  _AllImagesState createState() => _AllImagesState();
}

class _AllImagesState extends State<AllImages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: 'All Images'),
      body: Column(
        children: [
          Text('1'),
        ],
      ),
    );
  }
}
