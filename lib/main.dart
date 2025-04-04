import 'package:flutter/material.dart';
import 'package:openhack/pages/login_page.dart';
import 'package:openhack/pages/sign_in_page.dart';
import 'package:openhack/pages/student_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personalized Learning App',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/home': (context) => const StudentHomePage(),
      },
    );
  }
}
