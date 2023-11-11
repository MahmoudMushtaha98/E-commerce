import 'package:evgo/widget/button_widget.dart';
import 'package:evgo/widget/header_widget.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  static const screenRoute = '/otp-screen';

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
              const Text('OTP Verfication',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontFamily: 'Myfont')),
              SizedBox(
                width: width*0.7,
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
              buildTextField(width),
              buildTextField(width),
              buildTextField(width),
              buildTextField(width),
            ],
          ),
          ButtonWidget(width: width*0.9, callBack: () {

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
