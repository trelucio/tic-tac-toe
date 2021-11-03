import 'package:flutter/material.dart';

class Box {
  int num;
  bool tapped;
  Image img;

  Box({
    this.num = 0,
    this.tapped = false,
    required this.img
  });
}
