import 'package:DevQuiz/challenge/widget/awnser/awnser_widget.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/models/answer_model.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelected;
  const QuizWidget({Key? key, required this.question, required this.onSelected})
      : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  AnswerdModel awnser(int index) => widget.question.answer[index];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 64,
          ),
          Text(
            widget.question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          for (int i = 0; i < widget.question.answer.length; i++)
            AwnserWidget(
              answer: awnser(i),
              disable: indexSelected != -1,
              isSelected: indexSelected == i,
              onTap: (value) {
                indexSelected = i;
                setState(() {});
                Future.delayed(Duration(seconds: 1)).then(
                  (_) => widget.onSelected(value),
                );
              },
            )
          // Com for ou usando os ... também funciona para fazer o loop e carregar na tela
          // ...widget.question.answer
          //     .map((e) => AwnserWidget(
          //           title: e.title,
          //           isRight: e.isRight,
          //         ))
          //     .toList(),
        ],
      ),
    );
  }
}
