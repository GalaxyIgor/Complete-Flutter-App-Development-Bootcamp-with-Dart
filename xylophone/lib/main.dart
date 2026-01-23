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
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    playSound(1);
                  },
                  child: Container(color: colors[0]),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    playSound(2);
                  },
                  child: Container(color: colors[1]),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    playSound(3);
                  },
                  child: Container(color: colors[2]),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    playSound(4);
                  },
                  child: Container(color: colors[3]),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    playSound(5);
                  },
                  child: Container(color: colors[4]),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    playSound(6);
                  },
                  child: Container(color: colors[5]),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    playSound(7);
                  },
                  child: Container(color: colors[6]),
                ),
              ),
            ],
          )

        ),
      ),
    );
  }
}
