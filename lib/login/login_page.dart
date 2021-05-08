import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/home/home_page.dart';
import 'package:DevQuiz/shared/models/user_model.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final user = UserModel();
  final _fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Form(
        key: _fromKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Username",
                  labelStyle: TextStyle(color: AppColors.purple),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.purple),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppColors.purple,
                    ),
                  )),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Username obrigatório";
                }
                return null;
              },
              onChanged: (value) => user.username = value,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(color: AppColors.purple),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.purple),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppColors.purple,
                    ),
                  )),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Username obrigatório";
                }
                return null;
              },
              onChanged: (value) => user.password = value,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  if (_fromKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  }
                },
                child: Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
