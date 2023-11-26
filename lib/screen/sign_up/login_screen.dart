import 'package:dio/dio.dart';
import 'package:evgo/screen/home/home_screen.dart';
import 'package:evgo/screen/sign_up/forgot_screen.dart';
import 'package:evgo/screen/sign_up/register_screen.dart';
import 'package:evgo/widget/buildtextformfield.dart';
import 'package:evgo/widget/button_widget.dart';
import 'package:evgo/widget/circle_widget.dart';
import 'package:evgo/widget/header_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../model/items_model.dart';

String continueButton = 'continue';

class LoginScreen extends StatefulWidget {
  static const screenRoute = '/login-screen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKeyEmail = GlobalKey<FormState>();
  final _formKeyPassword = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isChecked = false;
  final _auth = FirebaseAuth.instance;


  Future<bool> submitValid()async{
    if(_formKeyEmail.currentState!.validate() && _formKeyPassword.currentState!.validate()){
      if(await loginGenerate()) {
        return true ;
      }else {
        return false;
      }
    }else{
      return false;
    }
  }


  bool load = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: ModalProgressHUD(
        inAsyncCall: load,
        child: ListView(
          children: [
            Container(
              alignment: Alignment.topLeft,
              width: double.infinity,
              child: IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon: const Icon(Icons.arrow_back,color: Colors.black,)),
            ),
            SizedBox(height: widthOrHeight(context, choice: 0)*0.03,),
            Column(
              children: [
                SizedBox(
                  height: widthOrHeight(context, choice: 0)*0.03,
                ),
                Text(
                  'Welcome Back',
                  style: TextStyle(
                      fontSize: widthOrHeight(context, choice: 1)*0.08,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'MyFont'),
                ),
                SizedBox(
                  width: widthOrHeight(context, choice: 1) * 0.6,
                  child: const Text(
                    'Sign in with your email and password or continue with social media',
                    style: TextStyle(color: Colors.grey, fontFamily: 'MyFont'),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: widthOrHeight(context, choice: 0)*0.04,),
              ],
            ),
            Column(
              children: [
                Form(
                    child: BuildTextFormField(
                      obscureText: false,
                      controller: _email,
                        formKey: _formKeyEmail,
                        width: widthOrHeight(context, choice: 1),
                        hintText: 'Email',
                        iconData: Icons.email_outlined,
                        label: 'Enter your email',
                      callback: (p0) {
                        if(emailValid(p0!)){
                          return null;
                        }else {
                          return 'Invalid email';
                        }
                      },
                    ),
                ),
                SizedBox(
                  height: widthOrHeight(context, choice: 0) * 0.04,
                ),
                BuildTextFormField(
                  obscureText: true,
                  controller: _password,
                    formKey: _formKeyPassword,
                    width: widthOrHeight(context, choice: 1),
                    hintText: 'password',
                    iconData: Icons.lock_outline,
                    label: 'Enter your password',
                callback: (p0) {
                  if(p0!.isEmpty){
                    return 'Enter your password';
                  }else if(p0.length<6){
                    return 'The password not correct';
                  }else{
                    return null ;
                  }
                },),
                SizedBox(
                  height: widthOrHeight(context, choice: 0) * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          },
                        ),
                        const Text('Remember me',
                            style: TextStyle(fontFamily: 'MyFont')),
                      ],
                    ),
                    TextButton(
                        onPressed: () {},
                        child: InkWell(
                            onTap: () => Navigator.of(context)
                                .pushNamed(ForgotPasswordScreen.screenRoute),
                            child: const Text(
                              'Forgot password',
                              style: TextStyle(
                                  color: Colors.grey, fontFamily: 'MyFont'),
                            )))
                  ],
                ),
                SizedBox(
                  height: widthOrHeight(context, choice: 0) * 0.03,
                ),
                ButtonWidget(
                  text: continueButton,
                  width: widthOrHeight(context, choice: 1),
                  callBack: () async {
                    setState(() {
                      load=true;
                    });
                    if(await submitValid()) {
                      if(mounted) {
                        setState(() {
                          load=false;
                        });
                        Navigator.of(context).pushNamed(HomeScreen.screenRoute,);
                      }
                    }else {
                      setState(() {
                        load=false;
                      });
                    }
                  },
                ),
                SizedBox(height: widthOrHeight(context, choice: 0)*0.04,),
              ],
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
                  height: widthOrHeight(context, choice: 0) * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? ",
                        style:
                            TextStyle(color: Colors.grey, fontFamily: 'MyFont')),
                    InkWell(
                      child: const Text("Sign Up",
                          style: TextStyle(
                              color: Colors.deepOrange, fontFamily: 'MyFont')),
                      onTap: () => Navigator.pushNamed(
                          context, RegisterScreen.screenRoute),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox()
          ],
        ),
      ),
    );
  }



 Future<bool> loginGenerate() async{
    try{
      await _auth.signInWithEmailAndPassword(email: _email.text, password: _password.text);
      return true;
    }on FirebaseAuthException catch(e){
      return false;
    }
 }
}



AppBar myAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.grey,
    automaticallyImplyLeading: false,
    toolbarHeight: widthOrHeight(context, choice: 0)*0.03 ,
  );
}