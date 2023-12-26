import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TabIconData {
  TabIconData({
    required this.imagePath,
    this.index = 0,
    required this.selectedImagePath,
    this.isSelected = false,
    this.animationController,
  });

  Icon imagePath;
  Icon selectedImagePath;
  bool isSelected;
  int index;

  AnimationController? animationController;

  static List<TabIconData> tabIconsList = <TabIconData>[
    TabIconData(
      imagePath: Icon(
        FontAwesomeIcons.house,
        color: Colors.grey,
      ),
      selectedImagePath: Icon(
      
      FontAwesomeIcons.house,
        color: Colors.brown,
      ),
      index: 0,
      isSelected: true,
      animationController: null,
    ),
    TabIconData(
      imagePath: Icon(
        FontAwesomeIcons.calendarDays,
        color: Colors.grey,
      ),
      selectedImagePath: Icon(

        FontAwesomeIcons.calendarDays,
        color: Colors.brown,
      ),
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: Icon(
        FontAwesomeIcons.floppyDisk,
        color: Colors.grey,
      ),
      selectedImagePath: Icon(
        FontAwesomeIcons.noteSticky,
        color: Colors.brown,
      ),
      index: 2,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: Icon(
        FontAwesomeIcons.addressBook,
        color: Colors.grey,
      ),
      selectedImagePath: Icon(
        FontAwesomeIcons.addressBook,
        color: Colors.brown,
      ),
      index: 3,
      isSelected: false,
      animationController: null,
    ),
  ];
}
