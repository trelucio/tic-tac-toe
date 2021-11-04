import 'package:flutter/material.dart';

// displays winner of the game or if there's a draw
class Results extends StatelessWidget {
  final List boxes;
  final int player;
  final bool win;

  Results(this.boxes, this.player, this.win);

  @override
  Widget build(BuildContext context) {
    // if there's a definitive winner based on win bool then display winner
    Widget winMessage(int player) {
      player = player == 1 ? 2 : 1;
      return Text(
        'Player $player wins!',
        style: Theme.of(context).textTheme.bodyText1,
      );
    }

    // if all boxes are filled and no one one -> draw
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
