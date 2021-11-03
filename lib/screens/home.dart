import 'package:flutter/material.dart';
import 'package:tic_tac_toe/models/box.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Box box1 =
      Box(num: 1, tapped: false, img: Image.asset('assets/transparent.png'));
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
  // start with player 1 pretzel
  int player = 1;

  Map playerImage = {
    1: Image.asset('assets/donut.png'),
    2: Image.asset('assets/pretzel.png'),
  };

  // individual grid box widget
  // state raised: must be in home to see who is current player
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

  void clear() {
    List boxes = [box1, box2, box3, box4, box5, box6, box7, box8, box9];
    boxes.forEach((box) {
      box.tapped = false;
      box.img = Image.asset('assets/transparent.png');
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Image baguette = Image.asset(
      'assets/baguette.png',
      fit: BoxFit.fill,
    );
    Widget winner() {
      if (box1.img == box2.img && box2.img == box3.img)
        return Container(
            height: 1.5 * (MediaQuery.of(context).size.height / 4),
            alignment: Alignment.centerLeft,
            child: baguette);
      else if (box4.img == box5.img && box5.img == box6.img) {
        return Container(
            height: 1.5 * (MediaQuery.of(context).size.height / 4),
            alignment: Alignment.center,
            child: baguette);
      } else if (box7.img == box8.img && box8.img == box9.img) {
        return Container(
            height: 1.5 * (MediaQuery.of(context).size.height / 4),
            alignment: Alignment.centerRight,
            child: baguette);
      } else if (box1.img == box4.img && box4.img == box7.img) {
        return Container(
            height: 1.25 * (MediaQuery.of(context).size.height / 4),
            alignment: Alignment.topCenter,
            child: RotatedBox(quarterTurns: 1, child: baguette));
      } else if (box2.img == box5.img && box5.img == box8.img) {
        return Container(
            height: 1.25 * (MediaQuery.of(context).size.height / 4),
            alignment: Alignment.center,
            child: RotatedBox(quarterTurns: 1, child: baguette));
      } else if (box3.img == box6.img && box6.img == box9.img) {
        return Container(
            height: 1.25 * (MediaQuery.of(context).size.height / 4),
            alignment: Alignment.bottomCenter,
            child: RotatedBox(quarterTurns: 1, child: baguette));
      } else if (box1.img == box5.img && box5.img == box9.img) {
        return Container(
          height: 1.5 * (MediaQuery.of(context).size.height / 4),
            alignment: Alignment.topCenter,
            child:
                Transform.rotate(angle: 3.14159 / 180 * 135, child: baguette));
      } else if (box3.img == box5.img && box5.img == box7.img) {
        return Container(
          height: 1.5 * (MediaQuery.of(context).size.height / 4),
            alignment: Alignment.topCenter,
            child:
                Transform.rotate(angle: 3.14159 / 180 * 45, child: baguette));
      }

      return Container();
    }

    print(MediaQuery.of(context).size.height);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
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
            winner(),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            clear();
          },
          backgroundColor: Theme.of(context).accentColor,
          tooltip: 'New game',
          child: Icon(Icons.restart_alt)),
    );
  }
}
