import 'package:flutter/material.dart';
import 'package:tic_tac_toe/screens/home.dart';

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
              style: ElevatedButton.styleFrom(primary: Colors.indigo[200]),
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
              subtitle2: TextStyle(
                fontSize: 20,
              ),
              bodyText1: TextStyle(
                fontSize: 24,
              ),
              button: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            )),
        // home page is landing page to start game
        home: Home());
  }
}
