

import 'package:flutter/material.dart';

class FinishPage extends StatelessWidget {
  final int totalScore;
  final int totalQuestions;

  const FinishPage({
    super.key, 
    required this.totalScore, 
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(child: Text("Quizzler", style: TextStyle(color: Colors.white))),
        backgroundColor: const Color.fromARGB(255, 18, 141, 207),
      ),
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.emoji_events, size: 100, color: Colors.yellow),
                    const SizedBox(height: 20),
                    const Text(
                      'Quiz Finalizado!',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Você acertou $totalScore de $totalQuestions',
                      style: TextStyle(
                        fontSize: 22, 
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 18, 141, 207),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                      elevation: 4,
                    ),
                    child: const Text('Reset', style: TextStyle(fontSize: 20.0, color: Colors.white)),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}