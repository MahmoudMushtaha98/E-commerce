import 'package:evgo/screen/sign_up/login_screen.dart';
import 'package:evgo/widget/button_widget.dart';
import 'package:evgo/widget/header_widget.dart';
import 'package:flutter/material.dart';

import '../home/home_screen.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  static const screenRoute = '/otp-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderWidget(width: widthOrHeight(context,choice:1), height: widthOrHeight(context,choice:0)),
          Column(
            children: [
              const Text('OTP Verfication',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontFamily: 'Myfont')),
              SizedBox(
                width: widthOrHeight(context,choice:1)*0.7,
                child: const Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                        text: 'We sent your code to +1 898 860 *** This code will expired in',
                        style: TextStyle(fontFamily: 'Myfont'),
                        children: [
                          TextSpan(
                            text: ' 00:13',style: TextStyle(color: Colors.deepOrange,fontFamily: 'Myfont'),
                          )
                        ]
                    )
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildTextField(widthOrHeight(context,choice:1)),
              buildTextField(widthOrHeight(context,choice:1)),
              buildTextField(widthOrHeight(context,choice:1)),
              buildTextField(widthOrHeight(context,choice:1)),
            ],
          ),
          ButtonWidget(text: continueButton,width: widthOrHeight(context,choice:1)*0.9, callBack: () {
            Navigator.of(context).pushNamedAndRemoveUntil(LoginScreen.screenRoute,ModalRoute.withName('/'));
          },),
          TextButton(onPressed: () {
            
          }, child: const Text('Resend OTP code',style: TextStyle(color: Colors.grey),))
        ],
      ),
    );
  }

  SizedBox buildTextField(double width) {
    return SizedBox(
          width: width*0.16,
          child: TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15)
              )
            ),
          ),
        );
  }
}
