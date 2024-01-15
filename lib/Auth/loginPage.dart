import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_project/controllers/loginController.dart';
import 'package:web_project/central_start_of_app/central_home_screen.dart';
import 'package:web_project/introduction_animation/introduction_screen.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  final loginController = Get.put(LoginController());

  void _logInClick() {
    if (loginController.emailController.value.text.isNotEmpty &&
        loginController.passwordController.value.text.isNotEmpty) {
      loginController.logInWithEmailAndPassword(
          context,
          loginController.emailController.value.text,
          loginController.passwordController.value.text);
    } else {
      Get.snackbar('Sorry', 'Please fill all the fields');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    loginController.emailController.value.dispose();
    loginController.passwordController.value.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 100, top: 100),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '   لوگ ان   !!',
                      style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'irregular',
                          color: Colors.brown),
                    ),
                    SizedBox(height: 40),
                    TextFormField(
                      controller: loginController.emailController.value,
                      decoration: InputDecoration(
                          labelText: 'Email', border: OutlineInputBorder()),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 40),
                    TextFormField(
                      controller: loginController.passwordController.value,
                      decoration: InputDecoration(
                          labelText: 'Password', border: OutlineInputBorder()),
                      obscureText: true,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: _logInClick,
              child: Container(
                height: 62,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Log In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(Icons.arrow_forward_rounded, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Do not have an account? ',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => IntroductionScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
