import 'dart:async';

import 'package:flutter/material.dart';

import '../const/img_urls.dart';
import 'Regitation_Page.dart';
import 'otp_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    Timer(Duration(seconds: 3),() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => RegitrationPage()),
      );
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => OtpSCreen(Id: "297",)),
      // );
    });
    super.initState();
  }


  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Image.asset(
      SplashImgUrl, // replace with your image path
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    ),
  );
}
}
