

import 'package:evgo/widget/button_widget.dart';
import 'package:flutter/material.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                width: width,
                height: height*0.1,
                color: Colors.grey,
              ),
              Row(
                children: [
                  IconButton(onPressed: () {
                  }, icon: const Icon(Icons.arrow_back_outlined,color: Colors.black,)),
                ],
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(height: 30,),
              const Text('Complete Profile',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              SizedBox(
                width: width*0.5,
                child: const Text('Complete your details or continue with social media',
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: height*0.06,),
              buildTextFormField(width,'First Name', Icons.person_2_outlined,'Enter your first name'),
              SizedBox(height: height*0.04,),
              buildTextFormField(width,'Last Name', Icons.person_2_outlined,'Enter your last name'),
              SizedBox(height: height*0.04,),
              buildTextFormField(width,'Phone Number', Icons.phone_android_outlined,'Enter your phone number'),
              SizedBox(height: height*0.04,),
              buildTextFormField(width,'Address', Icons.location_on_outlined,'Enter your phone address'),
              SizedBox(height: height*0.05,),
              ButtonWidget(width: width,callBack: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CompleteProfileScreen(),));
              },),
            ],
          ),
          Column(
            children: [
              SizedBox(
                width: width*0.6,
                child: const Text('By continuing your confirm that you agree with our term and condition' ,
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )
        ],
      ),
    );
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
}
