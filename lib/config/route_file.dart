import 'package:evgo/screen/home/details_screen.dart';
import 'package:evgo/screen/home/home_screen.dart';
import 'package:evgo/screen/home/shop_screen.dart';
import 'package:evgo/screen/sign_up/complete_profile.dart';
import 'package:evgo/screen/sign_up/forgot_screen.dart';
import 'package:evgo/screen/sign_up/login_screen.dart';
import 'package:evgo/screen/sign_up/otp_screen.dart';
import 'package:evgo/screen/sign_up/register_screen.dart';
import 'package:evgo/screen/sign_up/splash_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes() {
  return {
    '/':(context) =>  const SplashScreen(),
    LoginScreen.screenRoute : (context) => const LoginScreen(),
    HomeScreen.screenRoute : (context) => const HomeScreen(),
    ShopScreen.screenRoute : (context) => const ShopScreen(),
    RegisterScreen.screenRoute : (context) => const RegisterScreen(),
    CompleteProfileScreen.screenRoute : (context) => CompleteProfileScreen(),
    OtpScreen.screenRoute : (context) => const OtpScreen(),
    ForgotPasswordScreen.screenRoute : (context) => const ForgotPasswordScreen(),
    DetailsScreen.screenRoute : (context) =>  const DetailsScreen()
  };
}