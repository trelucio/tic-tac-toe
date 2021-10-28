import 'package:flutter/material.dart';
import 'package:tic_tac_toe/models/player.dart';
import 'package:tic_tac_toe/widgets/grid_box.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Player player1 = Player(id: 1, image: Image.asset('assets/donut.png'));
  Player player2 = Player(id: 2, image: Image.asset('assets/pretzel.png'));
  Player currentPlayer = Player(id: 1, image: Image.asset('assets/donut.png'));

  Player takeTurns(){
    Player player = currentPlayer;

    if (currentPlayer.id == 1) currentPlayer = player2;
    else currentPlayer = player1;

    return player;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Column(
                children: [
                  GridBox(takeTurns()),
                  GridBox(takeTurns()),
                  GridBox(takeTurns()),
                ],
              ),
              Column(
                children: [
                  GridBox(takeTurns()),
                  GridBox(takeTurns()),
                  GridBox(takeTurns()),
                ],
              ),
              Column(
                children: [
                  GridBox(takeTurns()),
                  GridBox(takeTurns()),
                  GridBox(takeTurns()),
                ],
              ),
            ]),
          ),
        ));
  }
}
