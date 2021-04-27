import 'dart:developer';
import 'dart:typed_data';

import 'package:DevQuiz/challenge/challenge_controller.dart';
import 'package:DevQuiz/challenge/widget/next_button/next_button_widget.dart';
import 'package:DevQuiz/challenge/widget/question_indicator_widget.dart';
import 'package:DevQuiz/challenge/widget/quiz/quiz_widget.dart';
import 'package:DevQuiz/result/result_page.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class ChallegePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;
  const ChallegePage({Key? key, required this.questions, required this.title})
      : super(key: key);
  @override
  _ChallegePageState createState() => _ChallegePageState();
}

class _ChallegePageState extends State<ChallegePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
    super.initState();
  }

  void nextPage() {
    if (controller.currentPage < widget.questions.length)
      pageController.nextPage(
          duration: Duration(milliseconds: 200), curve: Curves.linear);
  }

  void onSelected(bool value) {
    if (value) {
      controller.acertos++;
    }
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(),
              // backButton ou a função Navigator.pop para voltar a pagina
              // IconButton(
              //     icon: Icon(Icons.close),
              //     onPressed: () {
              //       Navigator.pop(context);
              //     }),
              //
              // Build apenas uma parte do componente, que nesse caso seria o QuestionIndicator
              ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => QuestionIndicatorWidget(
                    currentPage: value, length: widget.questions.length),
              )
            ],
          ),
        ),
      ),
      body: PageView(
          physics:
              NeverScrollableScrollPhysics(), // Trava a rollagem de tela para o lado
          controller: pageController,
          children: widget.questions
              .map(
                (e) => QuizWidget(
                  question: e,
                  onSelected: onSelected,
                ),
              )
              .toList()),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ValueListenableBuilder<int>(
              valueListenable: controller.currentPageNotifier,
              builder: (context, value, _) => Row(
                    children: [
                      if (value < widget.questions.length)
                        Expanded(
                          child: NextButtonWidget.white(
                            label: "Pular",
                            onTap: nextPage,
                          ),
                        ),
                      if (value == widget.questions.length)
                        Expanded(
                          child: NextButtonWidget.green(
                            label: "Confirmar",
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ResultPage(
                                    title: widget.title,
                                    length: widget.questions.length,
                                    result: controller.acertos,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                    ],
                  )),
        ),
      ),
    );
  }
}
