import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.width, required this.callBack,
  });

  final double width;
  final VoidCallback callBack;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width*0.9,
      height: 50,
      child: TextButton(onPressed:callBack,
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.deepOrangeAccent),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
        ), child: const Text('Continue',style: TextStyle(color: Colors.white,fontSize: 20),),
      ),
    );
  }
}
