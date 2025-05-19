
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class NotesAppTheme {
  final backgroundColor= const Color(0xFFFFFFFF);
  static TextTheme _buildTextTheme(TextTheme base) {
    const String fontName = 'WorkSans';
    return base.copyWith(
    
    );
  }

  static ThemeData buildLightTheme() {
    final Color primaryColor = const Color.fromARGB(255, 121, 85, 72);
    final Color secondaryColor = HexColor('#54D3C2');
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
    );
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      indicatorColor: Colors.white,
      splashColor: Colors.white24,
      splashFactory: InkRipple.splashFactory,
      canvasColor: Colors.white,
     // backgroundColor: const Color(0xFFFFFFFF),
      scaffoldBackgroundColor: const Color(0xFFF6F6F6),
     // errorColor: const Color(0xFFB00020),
      buttonTheme: ButtonThemeData(
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      platform: TargetPlatform.iOS,
    );
  }
}
