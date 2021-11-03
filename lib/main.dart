import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/instructions.dart';

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
            accentColor: Colors.purple[100],
            cardColor: Colors.indigo[50],
            canvasColor: Colors.white,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(primary: Colors.indigo[100]),
            ),
            textTheme: TextTheme(
              headline1: TextStyle(
                  color: Colors.red[300],
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
              subtitle1: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 24,
              ),
              button: TextStyle(
                color: Colors.grey[900],
                fontSize: 20,
              ),
            )),
        home: Instructions());
  }
}
