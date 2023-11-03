import 'dart:async';
import 'package:evgo/screen/login_screen.dart';
import 'package:evgo/screen/register_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
    });
  }



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Column(
              children: [
                Container(
                  width: width,
                  height: height*0.1,
                  color: Colors.grey,
                ),
                SizedBox(height: height*0.05,),
                Text('TOKOTO', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,color: Colors.deepOrange)),
                Text("Welcome to Tokoto, let's shop!",style: TextStyle(color: Colors.grey),),
                SizedBox(height: height*0.1,)
              ],
            ),
            Image.asset('images/splash_1.png'),

          ],
        )
    );
  }
}
