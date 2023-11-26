import 'package:cupertino_onboarding/cupertino_onboarding.dart';
import 'package:evgo/screen/sign_up/login_screen.dart';
import 'package:flutter/material.dart';

import '../home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: CupertinoOnboarding(
        onPressedOnLastPage: () =>
            Navigator.pushNamed(context, LoginScreen.screenRoute),
        pages: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    'TOKOTO',
                    style:
                    TextStyle(color: Colors.deepOrange, fontFamily: 'MyFont',fontSize: widthOrHeight(context, choice: 1)*0.1),
                  ),
                  Text(
                    'Welcom to Tokoto, lets shop!',
                    style:
                    TextStyle(color: Colors.grey, fontFamily: 'MyFont',fontSize: widthOrHeight(context, choice: 1)*0.045),
                  ),
                ],
              ),
              Image.asset('assets/images/splash_1.png'),
            ],
          ),
          Image.asset('assets/images/splash_2.png'),
          Image.asset('assets/images/splash_3.png'),
        ],
        bottomButtonColor: Colors.deepOrange,
        bottomButtonChild:
            const Text('Continue', style: TextStyle(fontFamily: 'MyFont')),
      ),
    );
  }
}
