
import 'package:flutter/material.dart';

class BuildTextFormField extends StatelessWidget {
  final double width;
  final String hintText;
  final String label;
  final IconData iconData;
  final GlobalKey<FormState> formKey;
  final String? Function(String?)? callback;
  final TextEditingController controller ;
  final bool obscureText;
   const BuildTextFormField({
    super.key, required this.width, required this.hintText, required this.label, required this.iconData, required this.formKey, this.callback, required this.controller, required this.obscureText,
  });





  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SizedBox(
        width: width*0.9,
        child: TextFormField(
          obscureText: obscureText,
          controller: controller,
          validator: callback,
          decoration: InputDecoration(
            floatingLabelBehavior:FloatingLabelBehavior.always ,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Colors.grey)
            ),
            label: Text(hintText,style: const TextStyle(fontFamily: 'MyFont'),),
            hintText: label,
            hintStyle: const TextStyle(fontFamily: 'MyFont'),
            suffixIcon: Icon(iconData),
            contentPadding: const EdgeInsets.only(left: 30,top: 40),
          ),
        ),
      ),
    );
  }
}


bool emailValid(String email){
  final bool emailMatch =
  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  return emailMatch;
}


bool passValid(String pass){
  final bool passChick =
      (pass.length < 6)? false:true;
  return passChick;
}

