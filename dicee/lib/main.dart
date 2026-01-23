import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        appBar: AppBar(
          title: Text('Dicee'),
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
                print('The button was clicked!');
              },
              child: Image.asset('images/dice1.png')
            )
          ),
          // Second Dice Image
          Expanded(
            child: TextButton(
              onPressed: () { 
                print('The button was clicked!');
              },
              child: Image.asset('images/dice2.png'))
          ),
        ]
      ),
    );
  }
} 