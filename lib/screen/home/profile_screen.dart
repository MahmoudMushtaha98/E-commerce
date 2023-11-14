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
          Stack(
            children: [
              Container(
                width: widthOrHeight(context,choice:1),
                  height: widthOrHeight(context,choice:0)*0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: widthOrHeight(context, choice: 1)*0.2,
                      child: Image.asset('assets/images/Profile Image.png'),
                    ),
                    SizedBox(height: widthOrHeight(context, choice: 0)*0.02,),
                    const Text('Mahmoud Mushtaha',style: TextStyle(
                        fontWeight: FontWeight.bold,
                      fontFamily: 'MyFont'
                    ),),

                  ],
                ),
              ),

            ],
          ),
          const SizedBox(height: 20,),

        ],
      ),
    );
  }
}
