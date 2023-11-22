import 'dart:async';
import 'dart:math';
import 'package:evgo/screen/sign_up/login_screen.dart';
import 'package:flutter/material.dart';

import '../home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  Random a = Random();

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  LoginScreen(),));
    }
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Column(
              children: [
        Container(
        width: widthOrHeight(context,choice:1),
          height: widthOrHeight(context,choice:0)*0.06,
          color: Colors.grey,
        ),
                SizedBox(height: widthOrHeight(context,choice:0)*0.05,),
                const Text('TOKOTO', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.deepOrange)),
                const Text("Welcome to Tokoto, let's shop!",style: TextStyle(color: Colors.grey),),
                SizedBox(height: widthOrHeight(context,choice:0)*0.1,)
              ],
            ),
            Image.asset('assets/images/splash_1.png'),

          ],
        )
    );
  }
}
