import 'package:flutter/material.dart';
import 'package:tic_tac_toe/models/player.dart';
import 'package:tic_tac_toe/widgets/grid_box.dart';

import 'screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic-Tac-Toe',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          primaryColor: Colors.red[200],
          accentColor: Colors.purple[50],
          cardColor: Colors.indigo[50],
          canvasColor: Colors.yellow[50]),
      home: MyHomePage(title: 'Tic-Tac-Toe'),
    );
  }
}