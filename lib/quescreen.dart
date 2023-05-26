import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/analysis.dart';
import 'package:quiz/answerbutton.dart';
import 'package:quiz/qs/questions.dart';
import 'package:quiz/result.dart';

TextStyle _getTextStyle2() {
  return GoogleFonts.katibeh(
    textStyle: const TextStyle(
      color: Colors.black,
      fontSize: 30,
    ),
  );
}

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var current_question_index = 0;

  void nextquestion() {
    setState(() {
      current_question_index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final current_question = questions[current_question_index];
    var correct_answered = 0;

    return Scaffold(
      backgroundColor: Color.fromARGB(250, 81, 226, 187),
      body: SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                current_question.text,
                style: _getTextStyle2(),
                textAlign: TextAlign.center,
                
              ),
              
              const SizedBox(
                height: 30,
              ),
              ...current_question.getshuffledanswers().map((answer) {
                return AnswerButton(
                    answertext: answer,
                    ontap: () {
                      answered_ques.add(answer);
                      // ignore: iterable_contains_unrelated_type
                      if (correct_answers.contains(answer)) {
                        correctly_answered.add(answer);
                      }
                      if (current_question_index == 5) {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return Result(
                            chosen_answers: correct_answered,
                          );
                        }));
                      } else {
                        nextquestion();
                      }
                    });
              })
            ],
          ),
        ),
      ),
    );
  }
}
