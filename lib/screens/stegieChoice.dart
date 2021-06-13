import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:roistegapp/constants/constants.dart';
import 'package:roistegapp/screens/homeScreen.dart';
import 'package:roistegapp/screens/revealMessage.dart';

class Choice extends StatefulWidget {
  @override
  _ChoiceState createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: 'Stegie', context: context),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  BuildBottomContainer(
                    kColor: brown,
                    kLabel: 'Reveal Data',
                    kSplashColor: splashColor,
                    kTapFunction: () {
                      HapticFeedback.heavyImpact();
                      Get.to(RevealMessage());
                    },
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  BuildBottomContainer(
                    kColor: Colors.lightBlue,
                    kLabel: 'Hide Data',
                    kSplashColor: splashColor,
                    kTapFunction: () {
                      HapticFeedback.heavyImpact();
                      Get.to(Home());
                    },
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
  final String kLabel;
  final Color kSplashColor;
  final Function kTapFunction;

  const BuildBottomContainer(
      {Key key, this.kColor, this.kLabel, this.kSplashColor, this.kTapFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
              child: Center(
                child: Text(
                  kLabel,
                  style: TextStyle(color: white, fontSize: 28),
                ),
              ),
              onLongPress: () {
                HapticFeedback.heavyImpact();
              },
              onTap: kTapFunction,
            ),
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
