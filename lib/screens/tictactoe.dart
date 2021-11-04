import 'package:flutter/material.dart';
import 'package:tic_tac_toe/models/box.dart';
import 'package:tic_tac_toe/widgets/results.dart';

class TicTacToe extends StatefulWidget {
  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  int player = 1; // player 1 goes first (pretzel)
  bool win = false; // no one has won yet

  // initialize individual Box objects (holds X and O)
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

  // maps player number to their designated image
  Map playerImage = {
    1: Image.asset('assets/pretzel.png'),
    2: Image.asset('assets/donut.png'),
  };

  // individual grid box widget
  // state raised: must be in home to see who is current player
  Widget gridBox(Box box) {
    double width = MediaQuery.of(context).size.width / 4;
    if (box.tapped || win == true)
      return Card(
        color: Theme.of(context).cardColor,
        child: Container(width: width, height: width, child: box.img),
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
              width: width,
              height: width,
              child: box.img),
        ),
      );
    }
  }

  // Restart game by clearing boxes
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
    // width and height as designated
    double width = MediaQuery.of(context).size.width / 4;
    double height = MediaQuery.of(context).size.height / 4;

    // Shows winner and formats it depending on which way won
    Widget winner() {
      Image baguette = Image.asset('assets/baguette.png');
      if (box1.img == box2.img && box2.img == box3.img) {
        win = true;
        return Container(
            width: 2.5 * width,
            height: 1.5 * height,
            alignment: Alignment.centerLeft,
            child: baguette);
      } else if (box4.img == box5.img && box5.img == box6.img) {
        win = true;
        return Container(
            width: 2.5 * height,
            height: 1.5 * height,
            alignment: Alignment.center,
            child: baguette);
      } else if (box7.img == box8.img && box8.img == box9.img) {
        win = true;
        return Container(
            width: 2.5 * width,
            height: 1.5 * height,
            alignment: Alignment.centerRight,
            child: baguette);
      } else if (box1.img == box4.img && box4.img == box7.img) {
        win = true;
        return Container(
            padding: EdgeInsets.only(top: 16),
            width: 1.5 * height,
            alignment: Alignment.topCenter,
            child: RotatedBox(quarterTurns: 1, child: baguette));
      } else if (box2.img == box5.img && box5.img == box8.img) {
        win = true;
        return Container(
            height: 3 * width,
            width: 1.5 * height,
            alignment: Alignment.center,
            child: RotatedBox(quarterTurns: 1, child: baguette));
      } else if (box3.img == box6.img && box6.img == box9.img) {
        win = true;
        return Container(
            height: 3 * width,
            width: 1.5 * height,
            alignment: Alignment.bottomCenter,
            child: RotatedBox(
              quarterTurns: 1,
              child: baguette,
            ));
      } else if (box1.img == box5.img && box5.img == box9.img) {
        win = true;
        return Container(
            height: 1.5 * height,
            alignment: Alignment.topCenter,
            child: Transform.rotate(
              angle: 3.14 / 180 * 135,
              child: baguette,
            ));
      } else if (box3.img == box5.img && box5.img == box7.img) {
        win = true;
        return Container(
            height: 1.5 * height,
            alignment: Alignment.topCenter,
            child: Transform.rotate(
              angle: 3.14 / 180 * 45,
              child: baguette,
            ));
      }
      return Container();
    }

    // list of boxes
    List boxes = [box1, box2, box3, box4, box5, box6, box7, box8, box9];

    return Scaffold(
      appBar: AppBar(
        title: Text('Tic-Tac-Toe'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // build tic-tac-toe grid
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
              // draw baguette over the grids in which player won
              Container(alignment: Alignment.topCenter, child: winner()),
            ]),
          ),
          Results(boxes, player, win) // display results if someone won or if draw
        ],
      ),
      // FAB to restart game by clearing boxes of images
      floatingActionButton: FloatingActionButton(
          onPressed: () => clear(boxes),
          backgroundColor: Theme.of(context).accentColor,
          tooltip: 'New game',
          child: Icon(Icons.restart_alt)),
    );
  }
}
