import 'package:flutter/material.dart';
import 'dart:math';

//Flutter 101: Statefull Widgets
//https://www.youtube.com/watch?v=AqCMFXEmf3w
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue.shade900,
        appBar: AppBar(
          title: Text("Statefull Widgets"),
          backgroundColor: Colors.blue.shade400,
        ),
        body: Dice(),
      ),
    );
  }
}

class Dice extends StatefulWidget {
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: FlatButton(
              onPressed: () {
                //signature for a voidcallback also called in some
                //languages anonymous functions
                //a function with no name
                setState(() {
                  leftDiceNumber = Random().nextInt(6) + 1;
                  //random number between 0 and 5 then add 1
                  print('Left button got pressed');
                  print('diceNumber = $leftDiceNumber');
                });
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),
              //string interpolation with $
            ),
          ),
          Expanded(
            flex: 1,
            child: FlatButton(
              onPressed: () {
                print('Right button got pressed');
              },
              child: Image.asset('images/dice$rightDiceNumber.png'),
              //string interpolation with $
            ),
          ),
        ],
      ),
    );
  }
}
