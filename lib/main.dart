import 'package:flutter/material.dart';
import 'package:quiz/quiz.dart';

void main() {
  runApp(const MyQuiz());
}

class MyQuiz extends StatelessWidget {
  const MyQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Quiz(),
      ),
    );
  }
}
