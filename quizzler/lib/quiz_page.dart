
import 'package:flutter/material.dart';
import 'package:quizzler/finish_page.dart';
import 'package:quizzler/quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> scoreKeeper = [];



  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();
    int totalQuestions = quizBrain.getQuestionLength();

    setState(() {
      if (userPickedAnswer == correctAnswer) {
        quizBrain.addScore();
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

      if (quizBrain.isFinished() == false) {
        quizBrain.nextQuestion();
      } else {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => FinishPage(
              totalScore: quizBrain.scoreCount, 
              totalQuestions: totalQuestions,
            ),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        ).then((value) {
          setState(() {
            quizBrain.reset();
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
                quizBrain.getQuestionText(),
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
