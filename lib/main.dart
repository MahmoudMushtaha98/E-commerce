import 'package:evgo/screen/home/home_screen.dart';
import 'package:evgo/screen/home/shop_screen.dart';
import 'package:evgo/screen/sign_up/complete_profile.dart';
import 'package:evgo/screen/sign_up/forgot_screen.dart';
import 'package:evgo/screen/sign_up/login_screen.dart';
import 'package:evgo/screen/sign_up/otp_screen.dart';
import 'package:evgo/screen/sign_up/register_screen.dart';
import 'package:evgo/screen/sign_up/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      routes: {
        '/':(context) => const SplashScreen(),
        LoginScreen.screenRoute : (context) => LoginScreen(),
        HomeScreen.screenRoute : (context) => HomeScreen(),
        ShopScreen.screenRoute : (context) => ShopScreen(),
        RegisterScreen.screenRoute : (context) => RegisterScreen(),
        CompleteProfileScreen.screenRoute : (context) => CompleteProfileScreen(),
        OtpScreen.screenRoute : (context) => OtpScreen(),
        ForgotPasswordScreen.screenRoute : (context) => ForgotPasswordScreen()
      },
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily:'MyFont')
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
