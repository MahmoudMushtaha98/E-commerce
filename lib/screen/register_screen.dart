import 'package:flutter/material.dart';

import '../widget/button_widget.dart';
import 'complete_profile.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
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
          const SizedBox(height: 30,),
          const Text('Register Account',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          SizedBox(
            width: width*0.5,
            child: const Text('Complete your details or continue with social media',
                style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: height*0.06,),
          buildTextFormField(width,'Email', Icons.email_outlined,'Enter your email'),
          SizedBox(height: height*0.03,),
          buildTextFormField(width,'Password', Icons.lock_outline,'Enter your Password'),
          SizedBox(height: height*0.03,),
          buildTextFormField(width,'Confirm password', Icons.lock_outline,'Re-Enter your Password'),
          SizedBox(height: height*0.04,),
          ButtonWidget(width: width,callBack: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CompleteProfileScreen(),));
          },)
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