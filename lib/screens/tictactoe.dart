import 'package:flutter/material.dart';
import 'package:tic_tac_toe/models/box.dart';

class TicTacToe extends StatefulWidget {
  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  int player = 1; // player 1 goes first (pretzel)
  bool win = false; // no one has won yet

  Box box1 = Box(
    num: 1,
    tapped: false,
    img: Image.asset('assets/transparent.png'),
  );
  Box box2 = Box(
    num: 2,
    tapped: false,
    img: Image.asset('assets/transparent.png'),
  );
  Box box3 = Box(
    num: 3,
    tapped: false,
    img: Image.asset('assets/transparent.png'),
  );
  Box box4 = Box(
    num: 4,
    tapped: false,
    img: Image.asset('assets/transparent.png'),
  );
  Box box5 = Box(
    num: 5,
    tapped: false,
    img: Image.asset('assets/transparent.png'),
  );
  Box box6 = Box(
    num: 6,
    tapped: false,
    img: Image.asset('assets/transparent.png'),
  );
  Box box7 = Box(
    num: 7,
    tapped: false,
    img: Image.asset('assets/transparent.png'),
  );
  Box box8 = Box(
    num: 8,
    tapped: false,
    img: Image.asset('assets/transparent.png'),
  );
  Box box9 = Box(
    num: 9,
    tapped: false,
    img: Image.asset('assets/transparent.png'),
  );

  Map playerImage = {
    1: Image.asset('assets/pretzel.png'),
    2: Image.asset('assets/donut.png'),
  };

  // individual grid box widget
  // state raised: must be in home to see who is current player
  Widget gridBox(Box box) {
    if (box.tapped || win == true)
      return Card(
        color: Theme.of(context).cardColor,
        child: Container(
            width: MediaQuery.of(context).size.width / 4,
            height: MediaQuery.of(context).size.width / 4,
            child: box.img),
      );
    else {
      return Card(
        color: Theme.of(context).cardColor,
        child: InkWell(
          onTap: () {
            box.tapped = true;
            box.img = playerImage[player];
            player = player == 1 ? 2 : 1;
            setState(() {});
          },
          child: Container(
              width: MediaQuery.of(context).size.width / 4,
              height: MediaQuery.of(context).size.width / 4,
              child: box.img),
        ),
      );
    }
  }

  // Restart game
  void clear(List boxes) {
    boxes.forEach((box) {
      box.tapped = false;
      box.img = Image.asset('assets/transparent.png');
      player = 1;
      win = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Image baguette = Image.asset('assets/baguette.png');
    Widget winner() {
      if (box1.img == box2.img && box2.img == box3.img) {
        win = true;
        return Container(
            width: 2.5 * (MediaQuery.of(context).size.width / 4),
            height: 1.5 * (MediaQuery.of(context).size.height / 4),
            alignment: Alignment.centerLeft,
            child: baguette);
      } else if (box4.img == box5.img && box5.img == box6.img) {
        win = true;
        return Container(
            width: 2.5 * (MediaQuery.of(context).size.height / 4),
            height: 1.5 * (MediaQuery.of(context).size.height / 4),
            alignment: Alignment.center,
            child: baguette);
      } else if (box7.img == box8.img && box8.img == box9.img) {
        win = true;
        return Container(
            width: 2.5 * (MediaQuery.of(context).size.width / 4),
            height: 1.5 * (MediaQuery.of(context).size.height / 4),
            alignment: Alignment.centerRight,
            child: baguette);
      } else if (box1.img == box4.img && box4.img == box7.img) {
        win = true;
        return Container(
            width: 1.5 * (MediaQuery.of(context).size.height / 4),
            alignment: Alignment.topCenter,
            child: RotatedBox(quarterTurns: 1, child: baguette));
      } else if (box2.img == box5.img && box5.img == box8.img) {
        win = true;
        return Container(
            height: 3 * (MediaQuery.of(context).size.width / 4),
            width: 1.5 * (MediaQuery.of(context).size.height / 4),
            alignment: Alignment.center,
            child: RotatedBox(quarterTurns: 1, child: baguette));
      } else if (box3.img == box6.img && box6.img == box9.img) {
        win = true;
        return Container(
            height: 3 * (MediaQuery.of(context).size.width / 4),
            width: 1.5 * (MediaQuery.of(context).size.height / 4),
            alignment: Alignment.bottomCenter,
            child: RotatedBox(quarterTurns: 1, child: baguette));
      } else if (box1.img == box5.img && box5.img == box9.img) {
        win = true;
        return Container(
            height: 1.5 * (MediaQuery.of(context).size.height / 4),
            alignment: Alignment.topCenter,
            child: Transform.rotate(angle: 3.14 / 180 * 135, child: baguette));
      } else if (box3.img == box5.img && box5.img == box7.img) {
        win = true;
        return Container(
            height: 1.5 * (MediaQuery.of(context).size.height / 4),
            alignment: Alignment.topCenter,
            child: Transform.rotate(angle: 3.14 / 180 * 45, child: baguette));
      }
      return Container();
    }

    Widget winMessage() {
      player = player == 1 ? 2 : 1;
      return Text('Player $player wins!');
    }

    // IF ALL ARE FILLED AND WIN IS FALSE: WRITE DRAW
    Widget drawMessage(List boxes) {
      int count = 0;
      boxes.forEach((box) {
        if (box.tapped) count++;
      });
      if (count == 9) return Text('Draw!');
      return Text('');
    }

    List boxes = [box1, box2, box3, box4, box5, box6, box7, box8, box9];

    return Scaffold(
      appBar: AppBar(
        title: Text('Tic-Tac-Toe'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Stack(children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(
                  children: [
                    gridBox(box1),
                    gridBox(box2),
                    gridBox(box3),
                  ],
                ),
                Column(
                  children: [
                    gridBox(box4),
                    gridBox(box5),
                    gridBox(box6),
                  ],
                ),
                Column(
                  children: [
                    gridBox(box7),
                    gridBox(box8),
                    gridBox(box9),
                  ],
                ),
              ]),
              Container(alignment: Alignment.topCenter, child: winner()),
            ]),
          ),
          Container(child: win ? winMessage() : drawMessage(boxes))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => clear(boxes),
          backgroundColor: Theme.of(context).accentColor,
          tooltip: 'New game',
          child: Icon(Icons.restart_alt)),
    );
  }
}
