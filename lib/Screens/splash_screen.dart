import 'package:flutter/material.dart';
import 'package:student_information/Services/splash_services.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen>{

  SplashServices splashScreen = SplashServices();

  @override
  void initState(){
    super.initState();
    splashScreen.splash(context);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  const Scaffold(
      body: Center(
        child: Text("Welcome",style: TextStyle(
            fontSize: 35,
            color: Colors.black
        ),),
      ),
    );
  }
}