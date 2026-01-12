import 'package:flutter/material.dart';
import 'package:mockgram/features/auth/views/login_screen.dart';
import 'package:mockgram/features/profile/views/profile_screen.dart';
import 'package:mockgram/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: LoginScreen()
    );
  }
}
