import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        appBar: AppBar(
          title: Text(
            'Dicee',
            style: TextStyle(
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            ),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatelessWidget {
  const DicePage({super.key});

  @override
  Widget build(BuildContext context) {
    var leftDiceNumber = 1;
    var rightDiceNumber = 1;

    
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
                print('The left button was clicked!');
              },
              child: Image.asset('images/dice$leftDiceNumber.png')
            )
          ),
          // Second Dice Image
          Expanded(
            child: TextButton(
              onPressed: () { 
                print('The right button was clicked!');
              },
              child: Image.asset('images/dice$rightDiceNumber.png'))
          ),
        ]
      ),
    );
  }
} 