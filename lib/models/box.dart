import 'package:flutter/material.dart';

// Box class with 3 values: num in grid, tapped, img
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
