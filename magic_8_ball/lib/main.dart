import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: BallPage(),
      ),    
    );


class BallPage extends StatelessWidget {
  const BallPage({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.blue,
    appBar: AppBar(
      title: Text(
        'Ask Me Anything',
        style: TextStyle(
          color: Colors.white
          ),
        ),
      backgroundColor: Colors.blue.shade900,
      elevation: 4,
    ),
    body: Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  const Ball({super.key});

  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 2;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset('images/ball$ballNumber.png'),
    );
  }
}

