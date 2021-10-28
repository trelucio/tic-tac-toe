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
  Player currentPlayer = Player(id: 2, image: Image.asset('assets/donut.png'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Column(
                children: [
                  GridBox(currentPlayer),
                  GridBox(currentPlayer),
                  GridBox(currentPlayer),
                ],
              ),
              Column(
                children: [
                  GridBox(currentPlayer),
                  GridBox(currentPlayer),
                  GridBox(currentPlayer),
                ],
              ),
              Column(
                children: [
                  GridBox(currentPlayer),
                  GridBox(currentPlayer),
                  GridBox(currentPlayer),
                ],
              ),
            ]),
          ),
        ));
  }
}
