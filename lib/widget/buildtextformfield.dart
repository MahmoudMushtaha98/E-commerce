
import 'package:flutter/material.dart';

class BuildTextFormField extends StatelessWidget {
  final double width;
  final String hintText;
  final String label;
  final IconData iconData;
  const BuildTextFormField({
    super.key, required this.width, required this.hintText, required this.label, required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width*0.9,
      child: TextFormField(
        decoration: InputDecoration(
          floatingLabelBehavior:FloatingLabelBehavior.always ,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.grey)
          ),
          label: Text(hintText),
          hintText: label,
          suffixIcon: Icon(iconData),
          contentPadding: const EdgeInsets.only(left: 30,top: 40),
        ),
      ),
    );
  }
}


