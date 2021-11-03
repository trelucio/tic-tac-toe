import 'package:flutter/material.dart';
import 'package:tic_tac_toe/models/box.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Box box1 = Box(num: 1, tapped: false, img: Image.asset('assets/transparent.png'));
  Box box2 = Box(num: 2, tapped: false, img: Image.asset('assets/transparent.png'));
  Box box3 = Box(num: 3, tapped: false, img: Image.asset('assets/transparent.png'));
  Box box4 = Box(num: 4, tapped: false, img: Image.asset('assets/transparent.png'));
  Box box5 = Box(num: 5, tapped: false, img: Image.asset('assets/transparent.png'));
  Box box6 = Box(num: 6, tapped: false, img: Image.asset('assets/transparent.png'));
  Box box7 = Box(num: 7, tapped: false, img: Image.asset('assets/transparent.png'));
  Box box8 = Box(num: 8, tapped: false, img: Image.asset('assets/transparent.png'));
  Box box9 = Box(num: 9, tapped: false, img: Image.asset('assets/transparent.png'));
  int count = 0;
  int player = 0;

  Map playerImage = {
    1: Image.asset('assets/donut.png'),
    2: Image.asset('assets/pretzel.png'),
  };

  Widget gridBox(Box box) {
    if (box.tapped)
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
            count += 1;
            player = count % 2 == 1 ? 1 : 2;
            box.img = playerImage[player];
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
        ),
      ),
    );
  }
}
