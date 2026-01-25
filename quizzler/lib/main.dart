import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quizzler",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 18, 141, 207),
        ),
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionNumber = 0;
  int scoreCount = 0;

  List<Icon> scoreKeeper = [];



  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.questionBank[questionNumber].questionAnswer;

    setState(() {
      if (userPickedAnswer == correctAnswer) {
        scoreCount++;
        scoreKeeper.add(const Icon(
          Icons.check,
          color: Color.fromARGB(255, 0, 198, 7),
        ));
      } else {
        scoreKeeper.add(const Icon(
          Icons.close,
          color: Color.fromARGB(255, 239, 16, 0),
        ));
      }

      if (questionNumber < quizBrain.questionBank.length - 1) {
        questionNumber++;
      } else {
        // Navegação enviando o scoreCount atualizado
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => FinishPage(
              totalScore: scoreCount, // Passando o valor local para o parâmetro da FinishPage
              totalQuestions: quizBrain.questionBank.length,
            ),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        ).then((value) {
          // Resetar ao voltar
          setState(() {
            questionNumber = 0;
            scoreCount = 0;
            scoreKeeper = [];
          });
        });
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.questionBank[questionNumber].questionText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 198, 7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                elevation: 4,
              ),
              child: const Text('True', style: TextStyle(color: Colors.white, fontSize: 20.0)),
              onPressed: () => checkAnswer(true),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 239, 16, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                elevation: 4,
              ),
              child: const Text('False', style: TextStyle(color: Colors.white, fontSize: 20.0)),
              onPressed: () => checkAnswer(false),
            ),
          ),
        ),
        Row(children: scoreKeeper)
      ],
    );
  }
}

// A classe FinishPage deve estar fora de qualquer outra classe
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