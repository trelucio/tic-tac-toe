import 'package:flutter/material.dart';
import 'package:tic_tac_toe/models/box.dart';

class GridBox extends StatefulWidget {
  final Box box;

  GridBox(this.box);

  @override
  _GridBoxState createState() => _GridBoxState();
}

class _GridBoxState extends State<GridBox> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      child: InkWell(
        onTap: () {
          widget.box.tapped = true;

          setState(() {});
        },
        child: Container(
            width: MediaQuery.of(context).size.width / 4,
            height: MediaQuery.of(context).size.width / 4,
            child: widget.box.tapped ? Image.asset('assets/donut.png') : null),
      ),
    );
  }
}
