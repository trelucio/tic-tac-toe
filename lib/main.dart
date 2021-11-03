import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tic-Tac-Toe',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          primaryColor: Colors.red[200],
          accentColor: Colors.purple[50],
          cardColor: Colors.indigo[50],
          canvasColor: Colors.white),
      home: MyHomePage(title: 'Tic-Tac-Toe'),
    );
  }
}