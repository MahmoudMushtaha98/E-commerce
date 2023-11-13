import 'package:flutter/material.dart';

import '../sign_up/complete_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: widthOrHeight(context,choice:1),
              height: widthOrHeight(context,choice:0)*0.5,
              color: Colors.deepOrange,
              child: Image.asset('assets/images/images/WhatsApp Image 2023-11-13 at 5.12.54 PM.jpeg')
          )
        ],
      ),
    );
  }
}
