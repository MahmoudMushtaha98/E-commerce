

import 'package:evgo/screen/sign_up/otp_screen.dart';
import 'package:evgo/widget/buildtextformfield.dart';
import 'package:evgo/widget/button_widget.dart';
import 'package:evgo/widget/header_widget.dart';
import 'package:flutter/material.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  static const screenRoute = '/complete-screen';

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
              const Text('Complete Profile',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontFamily: 'MyFont'),),
              SizedBox(
                width: width*0.5,
                child: const Text('Complete your details or continue with social media',
                  style: TextStyle(color: Colors.grey,fontFamily: 'MyFont'),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: height*0.06,),
              BuildTextFormField(width:width,hintText: 'First Name',iconData: Icons.person_2_outlined,label:'Enter your first name'),
              SizedBox(height: height*0.04,),
              BuildTextFormField(width: width,hintText: 'Last Name',iconData: Icons.person_2_outlined,label:'Enter your last name'),
              SizedBox(height: height*0.04,),
              BuildTextFormField(width: width,hintText: 'Phone Number', iconData: Icons.phone_android_outlined,label: 'Enter your phone number'),
              SizedBox(height: height*0.04,),
              BuildTextFormField(width: width,hintText: 'Address',iconData: Icons.location_on_outlined,label: 'Enter your phone address'),
              SizedBox(height: height*0.05,),
              ButtonWidget(width: width,callBack: () {
                Navigator.of(context).pushNamed(OtpScreen.screenRoute);
              },),
            ],
          ),
          const SizedBox(height: 20,),
          Column(
            children: [
              SizedBox(
                width: width*0.75,
                child: const Text('By continuing your confirm that you agree with our term and condition' ,
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 10,)
            ],
          )
        ],
      ),
    );
  }

}
