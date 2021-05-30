import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_steganography/requests/encode_request.dart';
import 'dart:math';

class Encrypt {
  File croppedImage;
  TextEditingController _textEditingController;
  Random _random = Random();
  List alpha = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z'
  ];
  List numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];

  String generatedKey;

  encode(File imageFile) {
    imageFile = Image.file(croppedImage) as File;
    EncodeRequest _encodeRequest;
    _encodeRequest = null;
  }
}
