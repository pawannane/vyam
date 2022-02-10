import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            CupertinoIcons.back,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Contact us',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              onTap: () {},
              leading: const Icon(
                CupertinoIcons.mail,
                color: Colors.black54,
              ),
              title: const Text(
                "Info@vyam.com",
                style: TextStyle(fontSize: 18, fontFamily: "Poppins"),
              ),
            ),
            const Divider(
              color: Colors.black54,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                CupertinoIcons.photo_camera,
                color: Colors.black54,
              ),
              title: const Text(
                "@vyam",
                style: TextStyle(fontSize: 18, fontFamily: "Poppins"),
              ),
            ),
            const Divider(
              color: Colors.black54,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                CupertinoIcons.phone,
                color: Colors.black54,
              ),
              title: const Text(
                "+9170014562",
                style: TextStyle(fontSize: 18, fontFamily: "Poppins"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
