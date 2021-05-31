import 'package:flutter/cupertino.dart';
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

defaultAppBar({String title, BuildContext context}) {
  return AppBar(
    iconTheme: IconTheme.of(context).copyWith(color: brown),
    title: Text(
      title,
      style: defaultTextStyle,
    ),
    centerTitle: true,
    elevation: 0.0,
    backgroundColor: white,
  );
}
