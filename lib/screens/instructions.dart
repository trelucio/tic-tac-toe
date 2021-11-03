import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/tictactoe.dart';

class Instructions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: Column(
            children: [
              Text('Tic-Tac-Toe', style: Theme.of(context).textTheme.headline1),
              Text('Bakery Edition!',
                  style: Theme.of(context).textTheme.subtitle1)
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              Card(
                  color: Colors.pink[50],
                  child: ListTile(
                      leading: Image.asset('assets/pretzel.png'),
                      title: Text('Player 1'))),
              Card(
                  color: Colors.yellow[50],
                  child: ListTile(
                      leading: Image.asset('assets/donut.png'),
                      title: Text('Player 2'))),
              Card(
                  color: Colors.purple[50],
                  child: ListTile(
                      leading: Image.asset('assets/baguette.png'),
                      title: Text('Win!'))),
            ],
          ),
        ),
        Container(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
                style: Theme.of(context).elevatedButtonTheme.style,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TicTacToe()));
                },
                child: Text(
                  'Start Game',
                  style: Theme.of(context).textTheme.button,
                )))
      ],
    ));
  }
}
