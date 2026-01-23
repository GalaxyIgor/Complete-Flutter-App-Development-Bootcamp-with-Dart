import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: MagicBallPage(),
      ),    
    );


class MagicBallPage extends StatelessWidget {
  const MagicBallPage({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.blue,
    appBar: AppBar(
      title: Text('Ask Me Anything'),
      backgroundColor: Colors.blue.shade900,
    ),
    body: null,
    );
  }
}
