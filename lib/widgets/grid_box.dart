import 'package:flutter/material.dart';
import 'package:tic_tac_toe/models/player.dart';

class GridBox extends StatefulWidget {
  final Player currentPlayer;
  GridBox(this.currentPlayer);

  @override
  _GridBoxState createState() => _GridBoxState();
}

class _GridBoxState extends State<GridBox> {
  bool tapped = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          tapped = true;
          setState(() {});
        },
        child: Card(
          color: Theme.of(context).cardColor,
          child: Container(
              width: 100,
              height: 100,
              child: tapped ? widget.currentPlayer.image : null),
        ));
  }
}
