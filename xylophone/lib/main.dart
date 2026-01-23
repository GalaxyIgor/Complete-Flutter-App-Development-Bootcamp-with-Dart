import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});
                
  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();
    
    final colors = [
      const Color(0xFF0FC2C0),
      const Color(0xFF0CABA8),
      const Color(0xFF008F8C),
      const Color(0xFF017A78),
      const Color(0xFF016563),
      const Color(0xFF015958),
      const Color(0xFF014443),
    ];


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
                    player.play(AssetSource('note1.wav'));
                  },
                  child: Container(color: colors[0]),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    player.play(AssetSource('note2.wav'));
                  },
                  child: Container(color: colors[1]),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    player.play(AssetSource('note3.wav'));
                  },
                  child: Container(color: colors[2]),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    player.play(AssetSource('note4.wav'));
                  },
                  child: Container(color: colors[3]),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    player.play(AssetSource('note5.wav'));
                  },
                  child: Container(color: colors[4]),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    player.play(AssetSource('note6.wav'));
                  },
                  child: Container(color: colors[5]),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    player.play(AssetSource('note7.wav'));
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
