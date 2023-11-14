
import 'package:evgo/config/route_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.grey
      )
    );
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
