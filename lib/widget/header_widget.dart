
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}
