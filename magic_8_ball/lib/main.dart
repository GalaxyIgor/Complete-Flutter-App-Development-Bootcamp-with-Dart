import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BallPage(),
      ),    
    );


class BallPage extends StatelessWidget {
  const BallPage({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
    appBar: AppBar(
      title: Text(
        'Ask Me Anything...',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white
          ),
        ),
      backgroundColor: Colors.blue.shade900,
      elevation: 8,
      shadowColor: Colors.black,
    ),
    body: Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  const Ball({super.key});

  @override
  BallState createState() => BallState();
}

class BallState extends State<Ball> {
  int ballNumber = 1;



  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          setState(() {
            ballNumber = Random().nextInt(5) + 1;
          });
        },
        child: Image.asset('images/ball$ballNumber.png'),
      ),
    );
  }
}