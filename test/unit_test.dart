import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:tic_tac_toe/models/box.dart';

void main(){
  test('check initial values', (){
    // check for box's initial values
    final box = Box(img: Image.asset('assets/transparent.png'));
    expect(box.num, 0);
    expect(box.tapped, false);
  });
}