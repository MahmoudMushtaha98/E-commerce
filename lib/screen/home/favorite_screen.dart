import 'package:evgo/screen/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../../widget/popular_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
        backgroundColor: Colors.grey,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: GridView.builder(
        itemCount: fav.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4
        ),
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Positioned(
                right: widthOrHeight(context, choice: 1)*0.04,
                  bottom: widthOrHeight(context, choice: 0)*0.02,
                  child: const Icon(Icons.favorite,color: Colors.red,)),
              Container(
                margin: EdgeInsets.all(widthOrHeight(context, choice: 1)*0.02),
                height: widthOrHeight(context, choice: 0)*3,
                width: widthOrHeight(context, choice: 1)*0.5,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(fav[index].path),
              ),
            ],
          );
        },
      ),
    );
  }
}
