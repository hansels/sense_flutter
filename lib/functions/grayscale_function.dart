import 'package:flutter/material.dart';

class GrayscaleFunction {
  static List<double> _grayscaleMatrix = [
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
  ];

  static transparent() {
    return ColorFilter.mode(Colors.transparent, BlendMode.multiply);
  }

  static grayscale() {
    return ColorFilter.matrix(_grayscaleMatrix);
  }
}
