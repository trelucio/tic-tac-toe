import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  final List boxes;
  final int player;
  final bool win;

  Results(this.boxes, this.player, this.win);

  @override
  Widget build(BuildContext context) {
    Widget winMessage(int player) {
      player = player == 1 ? 2 : 1;
      return Text(
        'Player $player wins!',
        style: Theme.of(context).textTheme.bodyText1,
      );
    }

    // IF ALL ARE FILLED AND WIN IS FALSE: WRITE DRAW
    Widget drawMessage(List boxes) {
      int count = 0;
      boxes.forEach((box) {
        if (box.tapped) count++;
      });
      if (count == 9)
        return Text(
          'Draw!',
          style: Theme.of(context).textTheme.bodyText1,
        );
      return Text('');
    }

    return Container(child: win ? winMessage(player) : drawMessage(boxes));
  }
}
