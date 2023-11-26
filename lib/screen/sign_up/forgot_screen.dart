import 'package:evgo/screen/sign_up/register_screen.dart';
import 'package:evgo/widget/button_widget.dart';
import 'package:evgo/widget/header_widget.dart';
import 'package:flutter/material.dart';

import '../home/home_screen.dart';
import 'login_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  static const screenRoute = '/Forgot-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.topLeft,
            width: double.infinity,
            child: IconButton(onPressed: () {
              Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back,color: Colors.black,)),
          ),
          Column(children: [
            const Text('Forgot Password',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            SizedBox(
              width: widthOrHeight(context,choice:1)*0.6,
              child: const Text('Pleas enter your email and we well send you a link to return to your account',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
          ],),
          // BuildTextFormField(width: widthOrHeight(context,choice:1),hintText: 'Email',iconData:Icons.email_outlined,label:'Enter your email'),
          ButtonWidget(text: continueButton,width: widthOrHeight(context,choice:1), callBack: () {

          },),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account? ",style: TextStyle(color: Colors.grey)),
              InkWell(
                onTap: () => Navigator.pushNamed(context, RegisterScreen.screenRoute),
                child: const Text("Sign Up",style: TextStyle(color: Colors.deepOrange)),
              ),
            ],
          ),
          const SizedBox()
        ],
      ),
    );
  }
}