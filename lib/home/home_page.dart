import 'package:DevQuiz/challenge/challenge_page.dart';
import 'package:DevQuiz/challenge/widget/quiz/quiz_widget.dart';
import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/home/home_controller.dart';
import 'package:DevQuiz/home/home_state.dart';
import 'package:DevQuiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:DevQuiz/home/widgets/level_button/level_button_widget.dart';
import 'package:DevQuiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  // Função que inicia antes de todo o processo
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getQuizzes();
    controller.getUser();
    controller.stateNotifier.addListener(() {
      // notifica que ouve uma alteração no controller e precisa ser carregado na tela
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Scaffold(
        appBar: AppBarWidget(
          user: controller.user!, // o ! garante que nessa parte não será null
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LevelButtonWidget(
                    label: "Fácil",
                  ),
                  LevelButtonWidget(
                    label: "Médio",
                  ),
                  LevelButtonWidget(
                    label: "Difícil",
                  ),
                  LevelButtonWidget(
                    label: "Perito",
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  crossAxisCount: 2,
                  children: controller.quizzes!
                      .map(
                        (e) => QuizCardWidget(
                          title: e.title,
                          completed:
                              "${e.questionAnswered}/${e.questions.length}",
                          percent: e.questionAnswered / e.questions.length,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChallegePage(
                                  questions: e.questions,
                                  title: e.title,
                                ),
                              ),
                            );
                          },
                        ),
                      )
                      .toList(),
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}
