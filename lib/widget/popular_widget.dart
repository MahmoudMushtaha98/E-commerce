
import 'package:evgo/screen/home/details_screen.dart';
import 'package:flutter/material.dart';

class PopularProduct extends StatefulWidget {
  const PopularProduct({
    super.key,
    required this.width, required this.path, required this.title, required this.price,
  });

  final double width;
  PopularModel popularModel;

  @override
  State<PopularProduct> createState() => _PopularProductState();
}

class _PopularProductState extends State<PopularProduct> {

  bool iconColor = false;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pushNamed(DetailsScreen.screenRoute),
          child: Container(
            width: widget.width*0.5,
            height: widget.width*0.5,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.all(Radius.circular(20))
            ),
            child: Image.asset(
              widget.path,
            ),
          ),
        ),
        SizedBox(
          width: widget.width*0.55,
          child: Text(widget.title,
            style: const TextStyle(
                color: Colors.black,
                fontFamily: 'MyFont',
                fontSize: 16
            ),),
        ),
        Row(
          children: [
            Text(widget.price,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.deepOrange),),
            SizedBox(width: widget.width*0.25,),
            GestureDetector(
              onTap: () {
                setState(() {
                  iconColor=!iconColor;
                });

              },
              child: Container(
                width: widget.width*0.075,
                height: widget.width*0.1,
                decoration: BoxDecoration(
                    color: Colors.pink[50],
                    shape: BoxShape.circle
                ),
                child: Icon(size: widget.width*0.045,Icons.favorite,color: iconColor?Colors.redAccent:Colors.grey,)
              ),
            )
          ],
        )
      ],
    );
  }
}


List