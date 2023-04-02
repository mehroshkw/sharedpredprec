
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';
import 'components/resuable_field.dart';
import 'components/reusable_button.dart';
import 'login.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("SharedPreference"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              ReusableField(
                labelText: 'Phone/Email',
                controller: authController.emailController,
              ),
              SizedBox(
                height: 20.0,
              ),
              ReusableField(
                labelText: 'Password',
                controller: authController.passwordController,
              ),
              SizedBox(
                height: 20,
              ),
              reuseable_button(
                onTap: () {
                  authController.createAccount();
                },
                ButtonText: "Sign Up",
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already Have An Account?"),
                  TextButton(
                      onPressed: () {
                        Get.to(LoginScreen());
                      },
                      child: Text("Login"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
