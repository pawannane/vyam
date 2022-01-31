import 'package:flutter/material.dart';
import 'package:vyam/views/gyms.dart';
import 'package:vyam/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: const MyHome(),
    );
  }
}
