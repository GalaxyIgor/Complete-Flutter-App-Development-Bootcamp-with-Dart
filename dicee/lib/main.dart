import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        appBar: AppBar(
          title: const Text(
            'Dicee',
            style: TextStyle( 
              color: Color.fromARGB(255, 255, 255, 255), 
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Container(
              height: 2,
              color: Colors.white12,
            ),
          ),
        ),
        body: SafeArea(
          child: DicePage(),
       ),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void rollDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Expanded widget to make the image take equal space
          // First Dice Image
          Expanded(
            child: TextButton(
              onPressed: () {
                rollDice();  
              },
              child: Image.asset('images/dice$leftDiceNumber.png')
            )
          ),
          // Second Dice Image
          Expanded(
            child: TextButton(
              onPressed: () {  
                rollDice();
              },
              child: Image.asset('images/dice$rightDiceNumber.png'))
          ),
        ]
      ),
    );
  }
} 