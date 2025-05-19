import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_project/database/registrationDatabase.dart';
import 'package:web_project/central_start_of_app/central_home_screen.dart';

class SignUpController extends GetxController {
  final Rx<TextEditingController> nameController = TextEditingController().obs;
  final Rx<TextEditingController> emailController = TextEditingController().obs;
  final Rx<TextEditingController> passwordController =
      TextEditingController().obs;
  final Rx<TextEditingController> confirmPasswordController =
      TextEditingController().obs;
  createUserWithEmailAndPassword(context, email, password, name) async {
    try {
      print('1');
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('2');
      final uid = credential.user!.uid;
      RegistrationDatabase().setUserName(uid, email, name);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AppHomeScreen(),
        ),
      );
      
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('Sorry', 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Sorry', 'The account already exists for that email.');
      }
      else{
        Get.snackbar('Error', '${e}');
      }
    } catch (e) {
      Get.snackbar('Something went wrong', '${e.toString()}');
    }
  }
}
