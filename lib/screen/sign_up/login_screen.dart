
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderWidget(width: width, height: height),
          Column(
            children: [
              const SizedBox(height: 30,),
              const Text('Welcome Back',style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                fontFamily: 'MyFont'
              ),),
              SizedBox(
                width: width*0.6,
                child: const Text('Sign in with your email and password or continue with social media',
                  style: TextStyle(color: Colors.grey,fontFamily: 'MyFont'),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Column(
            children: [
              BuildTextFormField(width: width, hintText:'Email', iconData:Icons.email_outlined,label:'Enter your email'),
              SizedBox(height:height *0.04,),
              BuildTextFormField(width: width, hintText: 'password', iconData:Icons.lock_outline, label:'Enter your password'),
              SizedBox(height: height*0.03,),
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
              SizedBox(height: height*0.03,),
              ButtonWidget(text: continueButton,width: width, callBack: () {
                Navigator.of(context).pushNamed(HomeScreen.screenRoute);
              },),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleWidget(width: width,url: 'assets/images/google.webp',),
                  SizedBox(width: width*0.05,),
                  CircleWidget(width: width,url: 'assets/images/unnamed.png',),
                  SizedBox(width: width*0.05,),
                  CircleWidget(width: width,url: 'assets/images/Logo_of_Twitter.svg.webp',)

                ],
              ),
              SizedBox(height: height*0.03,),
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


