import 'package:flutter/material.dart';
import 'package:vyam/views/bookings.dart';
import 'package:vyam/views/contact_us.dart';
import 'package:vyam/views/explore.dart';
import 'package:vyam/views/faq.dart';
import 'package:vyam/views/home.dart';
import 'package:vyam/views/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;
  final screens = [
    const Home(),
    const Bookings(),
    const Explore(),
    const Faq(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          onTap: (index) => setState(() {
            currentIndex = index;
          }),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.note),
                label: 'Bookings',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: 'Explore',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box),
                label: 'Profile',
                backgroundColor: Colors.black),
          ],
        ),
      ),
    );
  }
}
