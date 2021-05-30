import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:roistegapp/constants/constants.dart';
import 'package:roistegapp/services/keyGen.dart';

// ignore: must_be_immutable
class ProcessImage extends StatefulWidget {
  File image;

  ProcessImage({Key key, this.image});

  @override
  _ProcessImageState createState() => _ProcessImageState();
}

class _ProcessImageState extends State<ProcessImage> {
  GenerateKey _generateKey = GenerateKey();
  String key;
  String getKey() {
    key = _generateKey.keyGen();
    return key;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(title: 'Add Message'),
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
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FormField(
                      builder: (FormFieldState<dynamic> field) {
                        return Container(
                          padding: EdgeInsets.only(top: 8, left: 2, right: 2),
                          width: MediaQuery.of(context).size.width / 1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: brown)),
                          child: TextFormField(
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
                              onTap: () {
                                //TODO: implement quick copy
                                print(getKey());
                              },
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 22),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
