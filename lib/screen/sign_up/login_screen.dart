
import 'package:evgo/screen/home/home_screen.dart';
import 'package:evgo/screen/sign_up/forgot_screen.dart';
import 'package:evgo/screen/sign_up/register_screen.dart';
import 'package:evgo/widget/buildtextformfield.dart';
import 'package:evgo/widget/button_widget.dart';
import 'package:evgo/widget/circle_widget.dart';
import 'package:evgo/widget/header_widget.dart';
import 'package:flutter/material.dart';

String continueButton = 'continue';

class LoginScreen extends StatefulWidget {

  static const screenRoute = '/login-screen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderWidget(width: widthOrHeight(context,choice:1), height: widthOrHeight(context,choice:0)),
          Column(
            children: [
              const SizedBox(height: 30,),
              const Text('Welcome Back',style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                fontFamily: 'MyFont'
              ),),
              SizedBox(
                width: widthOrHeight(context,choice:1)*0.6,
                child: const Text('Sign in with your email and password or continue with social media',
                  style: TextStyle(color: Colors.grey,fontFamily: 'MyFont'),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Column(
            children: [
              BuildTextFormField(width: widthOrHeight(context,choice:1), hintText:'Email', iconData:Icons.email_outlined,label:'Enter your email'),
              SizedBox(height:widthOrHeight(context,choice:0) *0.04,),
              BuildTextFormField(width: widthOrHeight(context,choice:1), hintText: 'password', iconData:Icons.lock_outline, label:'Enter your password'),
              SizedBox(height: widthOrHeight(context,choice:0)*0.03,),
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceAround,
                children: [
                  Row(children: [Checkbox(value: isChecked, onChanged: (value) {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },),
                    const Text('Remember me',style: TextStyle(fontFamily: 'MyFont')),],),

                  TextButton(onPressed: () {

                  }, child: InkWell(
                      onTap: () => Navigator.of(context).pushNamed(ForgotPasswordScreen.screenRoute),
                      child: const Text('Forgot password', style: TextStyle(color: Colors.grey,fontFamily: 'MyFont'),)))
                ],
              ),
              SizedBox(height: widthOrHeight(context,choice:0)*0.03,),
              ButtonWidget(text: continueButton,width: widthOrHeight(context,choice:1), callBack: () {
                Navigator.of(context).pushNamed(HomeScreen.screenRoute);
              },),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleWidget(width: widthOrHeight(context,choice:1),url: 'assets/images/google.webp',),
                  SizedBox(width: widthOrHeight(context,choice:1)*0.05,),
                  CircleWidget(width: widthOrHeight(context,choice:1),url: 'assets/images/unnamed.png',),
                  SizedBox(width: widthOrHeight(context,choice:1)*0.05,),
                  CircleWidget(width: widthOrHeight(context,choice:1),url: 'assets/images/Logo_of_Twitter.svg.webp',)

                ],
              ),
              SizedBox(height: widthOrHeight(context,choice:0)*0.03,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? ",style: TextStyle(color: Colors.grey,fontFamily: 'MyFont')),
                  InkWell(
                    child: const Text("Sign Up",style: TextStyle(color: Colors.deepOrange,fontFamily: 'MyFont')),
                    onTap: () => Navigator.of(context).pushNamed(RegisterScreen.screenRoute),
                  ),
                ],
              )
            ],
          ),
          const SizedBox()
        ],
      ),
    );
  }
}


