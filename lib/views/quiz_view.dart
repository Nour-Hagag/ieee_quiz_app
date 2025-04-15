import 'package:flutter/material.dart';
import 'package:ieee_quiz/data/questions_data.dart';
import 'package:ieee_quiz/views/result_view.dart';
import 'package:ieee_quiz/widgets/answer_button.dart';

class QuizView extends StatefulWidget {
  const QuizView({super.key});

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  List<String> selectedAnswers = [];
  var currentQuestionIndex = 0;
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ResultView(selectedAnswers: selectedAnswers);
            },
          ),
        );
        selectedAnswers = [];
        currentQuestionIndex = 0;
      });
    }
  }

  void nextQuestion() {
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.red],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 50),
            ...currentQuestion.getShuffledAnswers().map((e) {
              return Container(
                margin: EdgeInsets.all(5),
                child: Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: AnswerButton(
                    answerText: e,
                    onTap: () {
                      nextQuestion();
                      chooseAnswer(e);
                    },
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
