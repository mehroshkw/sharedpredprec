import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharedpredprec/signup.dart';

import 'auth_controller.dart';
import 'components/resuable_field.dart';
import 'components/reusable_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(children: [
            SizedBox(
              height: 20.0,
            ),
            ReusableField(
              labelText: 'Phone/Email',
              controller: authController.loginEmailController,
            ),
            SizedBox(
              height: 20.0,
            ),
            ReusableField(
              labelText: 'Password',
              controller: authController.loginPasswordController,
            ),
            SizedBox(
              height: 20,
            ),
            reuseable_button(
              onTap: () {
                authController.userLogin();
              },
              ButtonText: "Login",
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't Have An Account?"),
                TextButton(
                    onPressed: () {
                      Get.to(SignUpScreen());
                    },
                    child: Text("Sign Up"))
              ],
            )
          ]),
        ),
      ),
    );
  }
}
