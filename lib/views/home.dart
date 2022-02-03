import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vyam/views/gyms.dart';
import 'package:vyam/views/yoga.dart';
import 'package:vyam/views/zumba.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: '2972 Westhelmer Rd, Illinois 85686',
                hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                prefixIcon: SvgPicture.asset(
                  'assets/Icons/Location.svg',
                ),
                suffixIcon: SvgPicture.asset('assets/Icons/notification.svg'),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                prefixIcon: SvgPicture.asset('assets/Icons/Search.svg'),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                height: 150,
                child: Row(
                  children: [
                    Image.asset('assets/cards/50% off.png'),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset('assets/cards/yoga classes.png'),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                height: 150,
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyGyms()));
                        },
                        child: Image.asset('assets/cards/gym.png')),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyZumba()));
                        },
                        child: Image.asset('assets/cards/zumba.png')),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyYoga()));
                        },
                        child: Image.asset('assets/cards/yoga.png')),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Center(
              child: Text("No nearby gyms in your area"),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
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
    );
  }
}
