import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});
                
  @override
  Widget build(BuildContext context) { 
    final colors = [
      const Color(0xFF0FC2C0),
      const Color(0xFF0CABA8),
      const Color(0xFF008F8C),
      const Color(0xFF017A78),
      const Color(0xFF016563),
      const Color(0xFF015958),
      const Color(0xFF014443),
    ];

    
    void playSound(int soundNumber) {
      final player = AudioPlayer();
      player.play(AssetSource('note$soundNumber.wav'));
    }

    Widget buildkey(int value) {
      return Expanded(
        child: GestureDetector(
          onTap: () {
            playSound(value + 1);
          },
          child: Container(color: colors[value]),
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Green Xylophone App',
            style: TextStyle(
              color: Colors.white
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF014443),
          elevation: 4,
          shadowColor: Colors.black,
        ),
        backgroundColor: const Color(0xFF014443),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildkey(0),
              buildkey(1),
              buildkey(2),
              buildkey(3),
              buildkey(4),
              buildkey(5),
              buildkey(6),
            ],
          )

        ),
      ),
    );
  }
}
