
import 'package:evgo/screen/home/details_screen.dart';
import 'package:flutter/material.dart';

import '../model/popular_model.dart';
import '../screen/home/home_screen.dart';

class PopularProduct extends StatefulWidget {
   const PopularProduct({
    super.key, required this.path, required this.title, required this.price,
  });

   final String path;
   final String title;
   final String price;

  @override
  State<PopularProduct> createState() => _PopularProductState();
}

class _PopularProductState extends State<PopularProduct> {

  bool iconColor = false;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widthOrHeight(context, choice: 0)*0.36,
      width: widthOrHeight(context, choice: 1)*0.34,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Image.network(

              widget.path,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: widthOrHeight(context, choice: 0)*0.01,),
          Expanded(flex: 1,child: Text(widget.title,maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(fontFamily: 'MyFont',fontSize: widthOrHeight(context, choice: 1)*0.04),)),
          SizedBox(height: widthOrHeight(context, choice: 0)*0.01,),
          Expanded(flex: 1,child: Text("\$ ${widget.price}",style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold,fontFamily: 'MyFont',fontSize: widthOrHeight(context, choice: 1)*0.04)))
        ],
      ),
    );
  }
}



List<PopularModel> fav = [];