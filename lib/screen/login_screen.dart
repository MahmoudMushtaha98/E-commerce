import 'package:evgo/screen/forgot_screen.dart';
import 'package:evgo/widget/button_widget.dart';
import 'package:evgo/widget/circle_widget.dart';
import 'package:evgo/widget/header_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);

  bool isChicked=false;

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
              const Text('Welcome Back',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              SizedBox(
                width: width*0.55,
                child: const Text('Sign in with your email and password or continue with social media',
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Column(
            children: [
              buildTextFormField(width, 'Email', Icons.email_outlined, 'Enter your email'),
              SizedBox(height:height *0.04,),
              buildTextFormField(width, 'password', Icons.lock_outline, 'Enter your password'),
              SizedBox(height: height*0.03,),
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceAround,
                children: [
                  Row(children: [Checkbox(value: isChicked, onChanged: (value) {

                  },),
                    const Text('Remember me'),],),

                  TextButton(onPressed: () {

                  }, child: const Text('Forgot password', style: TextStyle(color: Colors.grey),))
                ],
              ),
              SizedBox(height: height*0.03,),
              ButtonWidget(width: width, callBack: () {

              },),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleWidget(width: width,url: 'images/google.webp',),
                  SizedBox(width: width*0.05,),
                  CircleWidget(width: width,url: 'images/unnamed.png',),
                  SizedBox(width: width*0.05,),
                  CircleWidget(width: width,url: 'images/Logo_of_Twitter.svg.webp',)

                ],
              ),
              SizedBox(height: height*0.03,),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? ",style: TextStyle(color: Colors.grey)),
                  InkWell(
                      child: const Text("Sign Up",style: TextStyle(color: Colors.deepOrange)),
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPasswordWidget(),)),
                  ),
                ],
              )
            ],
          ),
          SizedBox()
        ],
      ),
    );
  }
}


SizedBox buildTextFormField(double width, String hintText,IconData iconData,String leabel) {
  return SizedBox(
    width: width*0.9,
    child: TextFormField(
      decoration: InputDecoration(
        floatingLabelBehavior:FloatingLabelBehavior.always ,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.grey)
        ),
        label: Text(hintText),
        hintText: leabel,
        suffixIcon: Icon(iconData),
        contentPadding: const EdgeInsets.only(left: 30,top: 40),
      ),
    ),
  );
}

