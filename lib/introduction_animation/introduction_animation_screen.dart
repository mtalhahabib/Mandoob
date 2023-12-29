import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_project/Auth/signUp.dart';
import 'package:web_project/controllers/signUpController.dart';
import 'package:web_project/fitness_app/fitness_app_home_screen.dart';
import 'package:web_project/introduction_animation/components/care_view.dart';
import 'package:web_project/introduction_animation/components/center_next_button.dart';
import 'package:web_project/introduction_animation/components/mood_diary_vew.dart';
import 'package:web_project/introduction_animation/components/relax_view.dart';
import 'package:web_project/introduction_animation/components/splash_view.dart';
import 'package:web_project/introduction_animation/components/top_back_skip_view.dart';
import 'package:web_project/introduction_animation/components/welcome_view.dart';

class IntroductionAnimationScreen extends StatefulWidget {
  const IntroductionAnimationScreen({Key? key}) : super(key: key);

  @override
  _IntroductionAnimationScreenState createState() =>
      _IntroductionAnimationScreenState();
}

class _IntroductionAnimationScreenState
    extends State<IntroductionAnimationScreen> with TickerProviderStateMixin {
  AnimationController? _animationController;

  final signUpController = Get.put(SignUpController());
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 8));
    _animationController?.animateTo(0.0);
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();

    signUpController.nameController.value.dispose();
    signUpController.emailController.value.dispose();
    signUpController.passwordController.value.dispose();
    signUpController.confirmPasswordController.value.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(_animationController?.value);
    return Scaffold(
      backgroundColor: Colors.white,
      body: ClipRect(
        child: Stack(
          children: [
            SplashView(
              animationController: _animationController!,
            ),
            RelaxView(
              animationController: _animationController!,
            ),
            CareView(
              animationController: _animationController!,
            ),
            MoodDiaryVew(
              animationController: _animationController!,
            ),
            WelcomeView(
              animationController: _animationController!,
            ),
            TopBackSkipView(
              onBackClick: _onBackClick,
              onSkipClick: _onSkipClick,
              animationController: _animationController!,
            ),
            CenterNextButton(
              animationController: _animationController!,
              onNextClick: _onNextClick,
            ),
          ],
        ),
      ),
    );
  }

  void _onSkipClick() {
    _animationController?.animateTo(0.8, duration: Duration(milliseconds: 10));
  }

  void _onBackClick() {
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.2) {
      _animationController?.animateTo(0.0);
    } else if (_animationController!.value > 0.2 &&
        _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.2);
    } else if (_animationController!.value > 0.4 &&
        _animationController!.value <= 0.6) {
      _animationController?.animateTo(0.4);
    } else if (_animationController!.value > 0.6 &&
        _animationController!.value <= 0.8) {
      _animationController?.animateTo(0.6);
    } else if (_animationController!.value > 0.8 &&
        _animationController!.value <= 1.0) {
      _animationController?.animateTo(0.8);
    }
  }

  void _onNextClick() {
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.2) {
      _animationController?.animateTo(0.4);
    } else if (_animationController!.value > 0.2 &&
        _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.6);
    } else if (_animationController!.value > 0.4 &&
        _animationController!.value <= 0.6) {
      _animationController?.animateTo(0.8);
    } else if (_animationController!.value > 0.6 &&
        _animationController!.value <= 0.8) {
      _signUpClick();
    }
  }

  void _signUpClick() {
    if (signUpController.nameController.value.text.isNotEmpty &&
        signUpController.emailController.value.text.isNotEmpty &&
        signUpController.passwordController.value.text.isNotEmpty &&
        signUpController.confirmPasswordController.value.text.isNotEmpty) {
      if (signUpController.passwordController.value.text ==
          signUpController.confirmPasswordController.value.text) {
        signUpController.createUserWithEmailAndPassword(
            context,
            signUpController.emailController.value.text.trim(),
            signUpController.passwordController.value.text.trim());
      } else {
        Get.snackbar('Sorry', 'Password and confirm password does not match');
      }
    } else {
      Get.snackbar('Sorry', 'Please fill all the fields');
    }
  }
}
