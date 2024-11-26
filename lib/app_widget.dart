import 'package:be_talent/views/home_screen.dart';
import 'package:be_talent/views/splash_screen.dart';
import 'package:flutter/material.dart';

class BeTalentApp extends StatelessWidget {
  const BeTalentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (_) => const SplashScreen(),
        '/home': (_) => const HomeScreen(),
      },
    );
  }
}
