import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evgo/widget/buildtextformfield.dart';
import 'package:evgo/widget/circle_widget.dart';
import 'package:evgo/widget/header_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../widget/button_widget.dart';
import 'complete_profile.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  static const screenRoute = '/register-screen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = FirebaseAuth.instance;


  final _formKeyEmail = GlobalKey<FormState>();

  final _formKeyPass = GlobalKey<FormState>();

  final _formKeyRePass = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();

  final TextEditingController _rePassword = TextEditingController();

  Future<bool> submitForm()async{
    if(_formKeyEmail.currentState!.validate() && _formKeyPass.currentState!.validate() && _formKeyRePass.currentState!.validate()){
      if(await registration()) {
        return true;
      }else {
        return false;
      }
    }else {
      return false;
    }
  }
  bool load = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: load,
        child: ListView(
          children: [
            HeaderWidget(
                width: widthOrHeight(context, choice: 1),
                height: widthOrHeight(context, choice: 0)),
            Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Register Account',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'MyFont'),
                ),
                SizedBox(
                  width: widthOrHeight(context, choice: 1) * 0.5,
                  child: const Text(
                    'Complete your details or continue with social media',
                    style: TextStyle(color: Colors.grey, fontFamily: 'MyFont'),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: widthOrHeight(context, choice: 0) * 0.06,
                ),
                BuildTextFormField(
                  obscureText: false,
                  controller: _email,
                  callback: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter yor email';
                    } else if (emailValid(value) == true) {
                      return null;
                    } else {
                      return 'Email not valid';
                    }
                  },
                  formKey: _formKeyEmail,
                  width: widthOrHeight(context, choice: 1),
                  hintText: 'Email',
                  label: 'Enter your email',
                  iconData: Icons.email_outlined,
                ),
                SizedBox(
                  height: widthOrHeight(context, choice: 0) * 0.03,
                ),
                BuildTextFormField(
                  obscureText: true,
                    controller: _password,
                    callback: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter yor Password';
                      } else if (passValid(value)) {
                        return null;
                      } else {
                        return 'the password is weak';
                      }
                    },
                    formKey: _formKeyPass,
                    width: widthOrHeight(context, choice: 1),
                    label: 'Password',
                    iconData: Icons.lock_outline,
                    hintText: 'Enter your Password'),
                SizedBox(
                  height: widthOrHeight(context, choice: 0) * 0.03,
                ),
                BuildTextFormField(
                  obscureText: true,
                    controller: _rePassword,
                    callback: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter yor Password';
                      } else if (_password.text.contains(_rePassword.text)) {
                        return null;
                      } else {
                        return 'the password mismatch';
                      }
                    },
                    formKey: _formKeyRePass,
                    width: widthOrHeight(context, choice: 1),
                    label: 'Confirm password',
                    iconData: Icons.lock_outline,
                    hintText: 'Re-Enter your Password'),
                SizedBox(
                  height: widthOrHeight(context, choice: 0) * 0.04,
                ),
                ButtonWidget(
                  text: continueButton,
                  width: widthOrHeight(context, choice: 1),
                  callBack: () async{
                    setState(() {
                      load = false;
                    });
                    if(await submitForm()) {
                      if(mounted) {
                        setState(() {
                          load = false;
                        });
                        Navigator.of(context)
                        .pushNamed(CompleteProfileScreen.screenRoute,arguments: {
                          'email':_email.text,
                          'password':_password.text,
                        });
                      }
                    }
                  },
                ),
              ],
            ),
            SizedBox(
              height: widthOrHeight(context, choice: 0) * 0.07,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleWidget(
                      width: widthOrHeight(context, choice: 1),
                      url: 'assets/images/google.webp',
                    ),
                    SizedBox(
                      width: widthOrHeight(context, choice: 1) * 0.05,
                    ),
                    CircleWidget(
                      width: widthOrHeight(context, choice: 1),
                      url: 'assets/images/unnamed.png',
                    ),
                    SizedBox(
                      width: widthOrHeight(context, choice: 1) * 0.05,
                    ),
                    CircleWidget(
                      width: widthOrHeight(context, choice: 1),
                      url: 'assets/images/Logo_of_Twitter.svg.webp',
                    )
                  ],
                ),
                SizedBox(
                  height: widthOrHeight(context, choice: 0) * 0.05,
                ),
                const Text(
                  'By continuing your confirm that you agree',
                  style: TextStyle(color: Colors.grey, fontFamily: 'MyFont'),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 5,
                )
              ],
            )
          ],
        ),
      ),
    );
  }



  Future<bool> registration() async{
    bool a= false;
    try{
      await _auth.signInWithEmailAndPassword(email: _email.text, password: _password.text);
    }on FirebaseAuthException catch(e){
      if(e.code.contains('invalid-credential')){
        a=true;
      }else {
        a=false;
      }
    }
   return a;
  }
}
