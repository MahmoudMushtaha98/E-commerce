import 'package:evgo/screen/sign_up/otp_screen.dart';
import 'package:evgo/widget/buildtextformfield.dart';
import 'package:evgo/widget/button_widget.dart';
import 'package:evgo/widget/header_widget.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class CompleteProfileScreen extends StatelessWidget {
  CompleteProfileScreen({Key? key}) : super(key: key);

  static const screenRoute = '/complete-screen';

  final TextEditingController _fName = TextEditingController();
  final TextEditingController _lName = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final _formFname = GlobalKey<FormState>();
  final _formLname = GlobalKey<FormState>();
  final _formPhone = GlobalKey<FormState>();
  final _formAddress = GlobalKey<FormState>();

  bool submitForm() {
    if (_formFname.currentState!.validate() &&
        _formLname.currentState!.validate() &&
        _formPhone.currentState!.validate() &&
        _formAddress.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final modalRout = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      body: ListView(
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
                'Complete Profile',
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
              SizedBox(
                height: widthOrHeight(context, choice: 0) * 0.06,
              ),
              BuildTextFormField(
                controller: _fName,
                formKey: _formFname,
                width: widthOrHeight(context, choice: 1),
                hintText: 'First Name',
                iconData: Icons.person_2_outlined,
                label: 'Enter your first name',
                callback: (p0) {
                  if (p0!.isEmpty) {
                    return 'Enter your name';
                  } else if (p0.length < 2) {
                    return 'Invalid name';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: widthOrHeight(context, choice: 0) * 0.04,
              ),
              BuildTextFormField(
                formKey: _formLname,
                controller: _lName,
                width: widthOrHeight(context, choice: 1),
                hintText: 'Last Name',
                iconData: Icons.person_2_outlined,
                label: 'Enter your last name',
                callback: (p0) {
                  if (p0!.isEmpty) {
                    return 'Enter your name';
                  } else if (p0.length < 2) {
                    return 'Invalid name';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: widthOrHeight(context, choice: 0) * 0.04,
              ),
              BuildTextFormField(
                controller: _phone,
                formKey: _formPhone,
                width: widthOrHeight(context, choice: 1),
                hintText: 'Phone Number',
                iconData: Icons.phone_android_outlined,
                label: 'Enter your phone number',
                callback: (p0) {
                  if (p0!.isEmpty) {
                    return 'Enter your phone number';
                  } else if (p0!.length < 10) {
                    return 'Invalid phone number';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: widthOrHeight(context, choice: 0) * 0.04,
              ),
              BuildTextFormField(
                formKey: _formAddress,
                controller: _address,
                width: widthOrHeight(context, choice: 1),
                hintText: 'Address',
                iconData: Icons.location_on_outlined,
                label: 'Enter your phone address',
                callback: (p0) {
                  if (p0!.isEmpty) {
                    return 'Enter your name';
                  } else if (p0.length < 2) {
                    return 'Invalid name';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: widthOrHeight(context, choice: 0) * 0.05,
              ),
              ButtonWidget(
                text: continueButton,
                width: widthOrHeight(context, choice: 1),
                callBack: () {
                  if (submitForm()) {
                    Navigator.of(context).pushNamed(OtpScreen.screenRoute);
                  }
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              SizedBox(
                width: widthOrHeight(context, choice: 1) * 0.75,
                child: const Text(
                  'By continuing your confirm that you agree with our term and condition',
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          )
        ],
      ),
    );
  }
}

double widthOrHeight(BuildContext context, {required int choice}) {
  if (choice != 0) {
    return MediaQuery.of(context).size.width;
  } else {
    return MediaQuery.of(context).size.height;
  }
}
