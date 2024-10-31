import 'package:flutter/material.dart';
import 'custom_text_theme.dart';

class AppTheme {
  static CustomTextTheme getCustomTextTheme(){
    return CustomTextTheme(
      clubName: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xFF515050),),
      schoolName: TextStyle(fontSize: 23, fontWeight: FontWeight.w600, color: Color(0xFF757575)),
      pageTabs: TextStyle(fontSize: 16, color: Colors.black),
      bodyText: TextStyle(fontSize: 10, color: const Color.fromARGB(255, 250, 249, 249)),
    );
  }


  static ThemeData getTheme() {
    final customTextTheme = getCustomTextTheme();

    return ThemeData(
      primaryColor: Color(0xFFEFF5FF),
      textTheme: TextTheme(
        displayLarge: customTextTheme.clubName,
        displayMedium: customTextTheme.schoolName,
        bodyMedium: customTextTheme.pageTabs,
        bodySmall: customTextTheme.bodyText,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor:  Color(0xFF86acee), // Background color
        textTheme: ButtonTextTheme.primary, // Text color
        shape: ContinuousRectangleBorder(borderRadius: BorderRadius.zero,),
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 35),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: ContinuousRectangleBorder(borderRadius: BorderRadius.zero,),
          padding: EdgeInsets.symmetric(horizontal:97, vertical: 25),
          backgroundColor:  Color(0xFF86acee),
        ),
        
      ),
      scaffoldBackgroundColor: Color(0xFFEFF5FF),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFFEFF5FF),

      ),
    );
  }
}
