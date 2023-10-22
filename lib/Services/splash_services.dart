import 'dart:async';
import 'package:flutter/material.dart';
import 'package:student_information/Screens/home_page.dart';

class SplashServices {
  void splash(BuildContext context) {
    Timer(const Duration(seconds: 3),
            () =>
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()))
    );
  }
}