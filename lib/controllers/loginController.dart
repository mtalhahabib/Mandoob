import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_project/Auth/loginPage.dart';
import 'package:web_project/fitness_app/fitness_app_home_screen.dart';

class LoginController extends GetxController {
  final Rx<TextEditingController> emailController = TextEditingController().obs;
  final Rx<TextEditingController> passwordController =
      TextEditingController().obs;

  logInWithEmailAndPassword(context,email,password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FitnessAppHomeScreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Sorry', 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Sorry', 'Wrong password.');
      } else {
        Get.snackbar('Something Went Wrong', '${e.toString()}');
      }
    }
  }

  logOutUser(context) {
    FirebaseAuth.instance.signOut();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}
