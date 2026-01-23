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
  BallState createState() => BallState();
}

class BallState extends State<Ball> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          print('I got clicked');
        },
        child: Image.asset('images/ball1.png'),
      ),
    );
  }
}