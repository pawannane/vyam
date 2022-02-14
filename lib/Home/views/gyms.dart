import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vyam_2_final/Home/views/product_gym.dart';
import 'package:get/get.dart';
import 'package:vyam_2_final/controllers/home_controller.dart';

class GymOption extends StatefulWidget {
  const GymOption({Key? key}) : super(key: key);

  @override
  State<GymOption> createState() => _GymOptionState();
}

class _GymOptionState extends State<GymOption> {
  var groupValue = 0;
  final appBarColor = Colors.grey[100];
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[100],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            // Get.back();
            Navigator.pop(context);
          },
        ),
        title: const Text(
          ""
          "Gyms",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CupertinoSlidingSegmentedControl<int>(
                  groupValue: groupValue,
                  thumbColor: Colors.yellowAccent,
                  padding: const EdgeInsets.all(8),
                  children: {
                    0: buildSegment("All"),
                    1: buildSegment("Male"),
                    2: buildSegment("Female"),
                    3: buildSegment("Unisex")
                  },
                  onValueChanged: (groupValue) {
                    setState(() {
                      this.groupValue = groupValue!;
                    });
                  }),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: ProductGyms(controller.GymLists, size.height * .78),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSegment(String text) =>
      Text(text, style: const TextStyle(color: Colors.black));
}
