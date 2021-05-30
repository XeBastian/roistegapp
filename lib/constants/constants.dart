import 'package:flutter/material.dart';

Color white = Color(0xFFFFFFFF);
Color brown = Colors.brown;
Color splashColor = Color(0xFF1B3065);
TextStyle defaultTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w600,
  fontFamily: 'ABeeZee',
  color: brown,
);

defaultAppBar({String title}) {
  return AppBar(
    title: Text(
      title,
      style: defaultTextStyle,
    ),
    centerTitle: true,
    elevation: 0.0,
    backgroundColor: white,
  );
}
