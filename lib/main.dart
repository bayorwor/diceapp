import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          title: Text(
            'Dicee Game App',
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
          backgroundColor: Colors.yellow,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeDiceFace() {
    setState(() {
      rightDiceNumber = Random().nextInt(6) + 1;
      leftDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      changeDiceFace();
                    },
                    child: Image.asset(
                      'images/dice$leftDiceNumber.png',
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      changeDiceFace();
                    },
                    child: Image.asset(
                      "images/dice$rightDiceNumber.png",
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            TextButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all<Size>(Size(200, 40)),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                changeDiceFace();
              },
              child: Text('PLAY NOW'),
            )
          ],
        ),
      ),
    );
  }
}
