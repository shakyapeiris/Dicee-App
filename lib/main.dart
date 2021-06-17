import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  int total = 0;
  bool isFirst = true;

  void updateDice() {
    if (isFirst) {
      setState(() {
        isFirst = false;
      });
    }
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
    total = rightDiceNumber + leftDiceNumber;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text("Dicee"),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              isFirst ? "Click on Dice to start" : "Toatal is $total",
              textAlign: TextAlign.center,
              style: TextStyle(
                 fontSize: 20.0,
                 color: Colors.white, 
                 fontWeight:FontWeight.bold,
              )
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    child: Image.asset('images/dice$leftDiceNumber.png'),
                    onPressed: updateDice,
                  ),
                ),
                Expanded(
                  child: TextButton(
                    child: Image.asset('images/dice$rightDiceNumber.png'),
                    onPressed: updateDice,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
