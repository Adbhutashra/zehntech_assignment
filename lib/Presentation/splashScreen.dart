import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zehntech_assignment/Presentation/loginScreen.dart';
import 'package:zehntech_assignment/Providers/loginProvider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final signInProvider = LoginProvider();

  @override
  void initState() {

    super.initState();
     Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
   return Scaffold(
        body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/splash.png")))));
  }
}
