import 'package:evgo/screen/sign_up/register_screen.dart';
import 'package:evgo/widget/buildtextformfield.dart';
import 'package:evgo/widget/circle_widget.dart';
import 'package:evgo/widget/header_widget.dart';
import 'package:flutter/material.dart';

import '../../widget/button_widget.dart';
import 'complete_profile.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  static const screenRoute = '/register-screen';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          HeaderWidget(width: width, height: height),
          Column(
            children: [
              const SizedBox(height: 30,),
              const Text('Register Account',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontFamily: 'MyFont'),),
              SizedBox(
                width: width*0.5,
                child: const Text('Complete your details or continue with social media',
                  style: TextStyle(color: Colors.grey,fontFamily: 'MyFont'),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(height: height*0.06,),
              BuildTextFormField(width: width,hintText: 'Email',label: 'Enter your email',iconData: Icons.email_outlined,),
              SizedBox(height: height*0.03,),
              BuildTextFormField(width: width,label: 'Password',iconData: Icons.lock_outline,hintText: 'Enter your Password'),
              SizedBox(height: height*0.03,),
              BuildTextFormField(width: width,label: 'Confirm password',iconData: Icons.lock_outline,hintText:'Re-Enter your Password'),
              SizedBox(height: height*0.04,),
              ButtonWidget(width: width,callBack: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CompleteProfileScreen(),));
              },),
            ],
          ),
          SizedBox(height: height*0.07,),
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
              SizedBox(height: height*0.05,),
              const Text('By continuing your confirm that you agree',
                style: TextStyle(color: Colors.grey,fontFamily: 'MyFont'),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5,)
            ],
          )
        ],
      ),
    );
  }




}
