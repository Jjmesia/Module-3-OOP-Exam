import 'package:flutter/material.dart';
import 'package:main/screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Angry Twitter',
      theme: ThemeData(
        fontFamily: 'Lato',
        primaryColor: const Color(0xFF8D47A0),
        primaryColorDark: const Color(0xFF53004B),
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
