import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/analysis.dart';
import 'package:quiz/qs/questions.dart';
import 'package:quiz/qsumm.dart';
import 'package:quiz/quescreen.dart';
import 'package:lottie/lottie.dart';

void refreshBuffer() {
  answered_ques.clear();
  correctly_answered.clear();

  }

  TextStyle _getTextStyle1() {
  return GoogleFonts.cardo(
    textStyle: const TextStyle(
      color: Color.fromARGB(255, 63, 20, 3),
      fontSize: 23,
      fontWeight: FontWeight.normal,
    ),
  );
}

  TextStyle _getTextStyle2() {
  return GoogleFonts.katibeh(
    textStyle: const TextStyle(
      color: Colors.white,
      fontSize: 30,
    ),
  );
}

class Result extends StatelessWidget {
  Result({super.key, required this.chosen_answers});

  int chosen_answers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < answered_ques.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'user_answered': answered_ques[i],
        'correct_answer': correct_answers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 221, 21),
      body: SizedBox(
        width: double.infinity,
        child: Container(
          margin: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Row(
            children: [

              Container(
                height: 100,
                width: 100,
                child: correctly_answered.isEmpty ? Lottie.asset('lib/anim/anim2.json') : correctly_answered.length != 0 && correctly_answered.length <= 3 ?  Lottie.asset('lib/anim/anim4.json') :  correctly_answered.length > 3 && correctly_answered.length != 6 ? Lottie.asset('lib/anim/anim1.json') : Lottie.asset('lib/anim/anim3.json'),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Your Score : ${correctly_answered.length} / ${answered_ques.length}',
                      style: _getTextStyle1(),textAlign: TextAlign.center,
                    ),

                    Text(correctly_answered.isEmpty ? 'Sorry, Better luck next time' : correctly_answered.length <= 3 && correctly_answered.isNotEmpty ? 'Improvement needed' : correctly_answered.length > 3 && correctly_answered.length != 6 ? 'Well done': 'Congratulations!!!' ,style: _getTextStyle1(),textAlign: TextAlign.center,),
                  ],
                ),
              ),
            ],
          ),
    
          const SizedBox(height: 60,),
    
          QuesSumm(getSummaryData()),
    
          SizedBox(height: 30,),
    
          Padding(
            padding: const EdgeInsets.only(top:50.0),
            child: OutlinedButton.icon(
              onPressed: () {
                refreshBuffer();
                Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return const QuestionsScreen();
                          }));
                
              },
              style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  side: const BorderSide(
                    width: 1.0,
                    color: Colors.black,
                  ),
                  backgroundColor: const Color.fromARGB(255, 29, 3, 3)),
              icon: const Icon(Icons.restart_alt_outlined),
              label: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
                child: Text(
                  'Restart Quiz',
                  textAlign: TextAlign.center,
                  style: _getTextStyle2(),
                ),
              ),
            ),
          ),
    
    
            ],
          ),
        ),
      ),
    );
  }
}
