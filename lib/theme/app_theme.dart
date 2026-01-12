import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  useMaterial3: false,
  fontFamily: 'Roboto',
  brightness: Brightness.light,
  primaryColor: Color(0xFF3797F0),
  scaffoldBackgroundColor: Color(0xFFFFFFFF),
  
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF3797F0),
    secondary: Color(0xFF8DC8F7),
    error: Color(0xFFED4956),
    surface: Color(0xFFFFFFFF),
  ),
  
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFFFFFFF),
    elevation: 0,
    iconTheme: IconThemeData(color: Color(0xFF000000)),
    titleTextStyle: TextStyle(
      color: Color(0xFF000000),
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  ),
  
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFFFFFFF),
    selectedItemColor: Color(0xFF000000),
    unselectedItemColor: Color(0xFF000000),
    type: BottomNavigationBarType.fixed,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    elevation: 0,
  ),
  
  iconTheme: const IconThemeData(color: Color(0xFF000000)),
  dividerColor: Color(0xFFDBDBDB),
  dividerTheme: const DividerThemeData(
    color: Color(0xFFDBDBDB),
    thickness: 1,
  ),
  
  cardColor: Color(0xFFFFFFFF),
  hintColor: Color(0xFF8E8E8E),
);