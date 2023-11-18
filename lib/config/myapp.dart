
import 'package:evgo/config/route_file.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      routes: routes(),
      theme: ThemeData(
        textTheme: const TextTheme(
            bodyLarge: TextStyle(fontFamily:'MyFont')
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }


}
