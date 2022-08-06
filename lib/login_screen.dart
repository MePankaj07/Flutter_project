import 'package:demo_project/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Text('LoginScreen'),
        SizedBox(height: 20),
        TextFormField(
          controller: username,
          decoration: InputDecoration(
            labelText: 'Enter your username',
          ),
        ),
        SizedBox(height: 20),
        TextFormField(
          controller: password,
          decoration: InputDecoration(
            labelText: 'Enter your password',
          ),
        ),
        SizedBox(height: 20),
        GestureDetector(
          onTap: () {
            authController.login(username.text, password.text);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(10)),
              child: Text('Login'),
            ),
          ),
        )
      ],
    ));
  }
}
