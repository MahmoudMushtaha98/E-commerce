
import 'package:flutter/material.dart';

class ColorWidget extends StatelessWidget {
  const ColorWidget({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      width: width*0.1,
      height: width*0.1,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color
      ),
    );
  }
}