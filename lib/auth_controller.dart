import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
import 'login.dart';

class AuthController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createAccount() async {
    final user = await _auth.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    final firestore = FirebaseFirestore.instance;
    firestore.collection('users').doc(user.user!.uid).set(
        {"email": emailController.text, "password": passwordController.text});
    if (user != null) {
      Get.to(LoginScreen());
    } else {
      print('error');
    }
  }

  Future<void> userLogin() async {
    final user = await _auth.signInWithEmailAndPassword(
        email: loginEmailController.text,
        password: loginPasswordController.text);
    if (user != null) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("email", loginEmailController.toString());
      print(user.user!.uid);
      Get.to(HomeScreen());
    } else {
      print("error");
    }
  }

  Future<void> logoutUser() async {
    await _auth.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Get.offAll(LoginScreen());
  }

 readPrefStr(String email) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    var email=pref.getString('email');
    return email;
  }
}
