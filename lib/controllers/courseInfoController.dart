import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_project/design_course/course_info_screen.dart';

class CourseInfoController extends GetxController{
   moveTo(context) {
    Navigator.push<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => CourseInfoScreen(),
      ),
    );
  }
}