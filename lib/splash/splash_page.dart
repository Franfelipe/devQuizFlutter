import 'package:DevQuiz/core/app_gradients.dart';
import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/home/home_page.dart';
import 'package:DevQuiz/login/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  SplashPage() {}
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1)).then(
      (value) => Navigator.pushReplacement(
        // Adiciona a proxima pagina no inicio da pilha, assim impossibilitando de o usuario voltar para a splash
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      ),
    );
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppGradients.linear),
        child: Center(
          child: Image.asset(AppImages.logo),
        ),
      ),
    );
  }
}
