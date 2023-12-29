import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_project/controllers/signUpController.dart';

class WelcomeView extends StatefulWidget {
  final AnimationController animationController;
   WelcomeView({Key? key, required this.animationController})
      : super(key: key);

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {


final signUpController = Get.put(SignUpController()); 
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    final _firstHalfAnimation =
        Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0)).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Interval(
          0.6,
          0.8,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
    final _secondHalfAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-1, 0)).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Interval(
          0.8,
          1.0,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    final _welcomeFirstHalfAnimation =
        Tween<Offset>(begin: Offset(2, 0), end: Offset(0, 0))
            .animate(CurvedAnimation(
      parent: widget.animationController,
      curve: Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));

    final _welcomeImageAnimation =
        Tween<Offset>(begin: Offset(4, 0), end: Offset(0, 0))
            .animate(CurvedAnimation(
      parent: widget.animationController,
      curve: Interval(
        0.6,
        0.8,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    return SlideTransition(
      position: _firstHalfAnimation,
      child: SlideTransition(
        position: _secondHalfAnimation,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height:76,),
                  Text('سائن اپ !!',style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'irregular',
                    color: Colors.brown
                  
                  ),),
                  SizedBox(height: 26,),
                  TextFormField(
                  controller: signUpController.nameController.value,
                  decoration: InputDecoration(labelText: 'Name',
                  border: OutlineInputBorder()),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: signUpController.emailController.value,
                  decoration: InputDecoration(labelText: 'Email',
                  border: OutlineInputBorder()),
                  keyboardType: TextInputType.emailAddress,
               
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: signUpController.passwordController.value,
                  decoration: InputDecoration(labelText: 'Password',
                  border: OutlineInputBorder()),
                  obscureText: true,
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller:signUpController.confirmPasswordController.value,
                 
                  decoration: InputDecoration(labelText: 'Confirm Password',
                  border: OutlineInputBorder()
                  ),
                  obscureText: true,
                ),
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}
