import 'package:flutter/material.dart';

import '../sign_up/complete_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: widthOrHeight(context,choice:1),
                    height: widthOrHeight(context,choice:0)*0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: widthOrHeight(context, choice: 1)*0.2,
                            child: Image.asset('assets/images/Profile Image.png'),
                          ),
                          Positioned(
                            bottom: 0,
                              right: widthOrHeight(context, choice: 1)*0.01,

                              child: Container(
                            width: widthOrHeight(context, choice: 1)*0.08,
                            height: widthOrHeight(context, choice: 0)*0.04,
                            decoration:  BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[900]
                            ),
                                child: Icon(size: widthOrHeight(context, choice: 1)*0.05,Icons.camera_alt,color: Colors.grey,),
                          ))
                        ],
                      ),
                      SizedBox(height: widthOrHeight(context, choice: 0)*0.02,),
                        Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           const Text('Mahmoud Mushtaha',style: TextStyle(
                              fontWeight: FontWeight.bold,
                            fontFamily: 'MyFont'
                      ),),
                           const SizedBox(width: 5,),
                           Icon(Icons.edit,color: Colors.grey,size: widthOrHeight(context, choice: 1)*0.04,)
                         ],
                       ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(widthOrHeight(context, choice: 1)*0.1),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: () {
                        Navigator.pop(context);
                      }, icon: const Icon(Icons.arrow_back_ios_sharp)),
                      IconButton(onPressed: () {
                        Navigator.pop(context);
                      }, icon: const Icon(Icons.logout_outlined)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            const Row(
              children: [
                Expanded(child: Column(
                  children: [
                    Text('44',style: TextStyle(fontFamily: 'MyFont'),),
                    Text('Favorite',style: TextStyle(fontFamily: 'MyFont'),)
                  ],
                )),
                Text('|',style: TextStyle(color: Colors.black,fontSize: 30),),
                Expanded(child: Column(
                  children: [
                    Text('17',style: TextStyle(fontFamily: 'MyFont'),),
                    Text('Items Bought',style: TextStyle(fontFamily: 'MyFont'),)
                  ],
                )
                )
              ],
            ),
            Divider(color: Colors.grey,

            indent: widthOrHeight(context, choice: 1)*0.07,
              endIndent: widthOrHeight(context, choice: 1)*0.07,
            ),
            const ListTile(
              leading: Icon(Icons.email_outlined),
              title: Text('mahmoud_musht@hotmail.com'),
              trailing: Icon(Icons.edit),
            ),
            const ListTile(
              leading: Icon(Icons.lock_outline),
              title: Text('********'),
              trailing: Icon(Icons.edit),
            ),
            const ListTile(
              leading: Icon(Icons.phone),
              title: Text('0790696272'),
              trailing: Icon(Icons.edit),
            ),
            const ListTile(
              leading: Icon(Icons.location_on_outlined),
              title: Text('Amman - Jordan'),
              trailing: Icon(Icons.edit),
            ),
          ],
        ),
      ),
    );
  }
}
// const Icon(Icons.email_outlined,color: Colors.grey),
// Text('mahmoud_mushtaha@hotmail.com',style: TextStyle(fontSize: widthOrHeight(context, choice: 1)*0.04,fontFamily: 'MyFont'),),
// Icon(Icons.edit,color: Colors.grey,size: widthOrHeight(context, choice: 1)*0.04,)
