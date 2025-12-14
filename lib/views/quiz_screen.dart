import 'package:broadway_example_ui/brains/quiz_brain.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Icon> scoreKeeper = [];
  QuizBrain quizBrain = QuizBrain();
  int correct = 0;

  void checkAnswer(bool userPickAnser) {
    bool correctAnswer = quizBrain.getCorrectAnswer();
    if (quizBrain.isFinished()) {
      // setState(() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Finished ${result()}",
              // "Finished with correct anwser $correct and wrong answer is ${(quizBrain.questionBank.length - 1) - correct}",
            ),

            actions: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    quizBrain.reset();
                    scoreKeeper = [];
                    correct = 0;
                  });
                  Navigator.pop(context);
                },
                child: Text("Restart"),
              ),
            ],
          );
        },
      );
      // });
    } else {
      if (correctAnswer == userPickAnser) {
        correct++;
        scoreKeeper.add(Icon(Icons.check, color: Colors.green));
      } else {
        scoreKeeper.add(Icon(Icons.close, color: Colors.red));
      }
      quizBrain.nextQuestion();
    }
  }

  String result() {
    if (correct > 10) {
      return "Excelent";
    } else if (correct >= 8) {
      return "very Good";
    } else if (correct > 6) {
      return "Good";
    } else {
      return "Have to work on";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue, title: Text("Quiz App")),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(quizBrain.getQuestion(), style: TextStyle(fontSize: 22)),
            SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  checkAnswer(true);
                });
              },
              child: Text("True"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  checkAnswer(false);
                });
              },
              child: Text("False"),
            ),
            SizedBox(height: 100),
            Row(children: scoreKeeper),
          ],
        ),
      ),
    );
  }
}
//  Icon(Icons.close, color: Colors.red),