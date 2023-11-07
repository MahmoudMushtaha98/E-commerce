import 'package:evgo/screen/sign_up/register_screen.dart';
import 'package:evgo/widget/buildtextformfield.dart';
import 'package:evgo/widget/button_widget.dart';
import 'package:evgo/widget/header_widget.dart';
import 'package:flutter/material.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderWidget(width: width, height: height),
          Column(children: [
            const Text('Forgot Password',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            SizedBox(
              width: width*0.6,
              child: const Text('Pleas enter your email and we well send you a link to return to your account',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
          ],),
          BuildTextFormField(width: width,hintText: 'Email',iconData:Icons.email_outlined,label:'Enter your email'),
          ButtonWidget(width: width, callBack: () {

          },),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account? ",style: TextStyle(color: Colors.grey)),
              InkWell(
                child: const Text("Sign Up",style: TextStyle(color: Colors.deepOrange)),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen(),)),
              ),
            ],
          ),
          const SizedBox()
        ],
      ),
    );
  }
}