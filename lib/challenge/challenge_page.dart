import 'package:DevQuiz/challenge/widget/question_indicator_widget.dart';
import 'package:DevQuiz/challenge/widget/quiz/quiz_widget.dart';
import 'package:flutter/material.dart';

class ChallegePage extends StatefulWidget {
  const ChallegePage({Key? key}) : super(key: key);
  @override
  _ChallegePageState createState() => _ChallegePageState();
}

class _ChallegePageState extends State<ChallegePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(top: true, child: QuestionIndicatorWidget()),
      ),
      body: QuizWidget(title: "O que o Flutter faz em sua totalidade?"),
    );
  }
}
