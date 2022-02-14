import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyZumba extends StatefulWidget {

  @override
  State<MyZumba> createState() => _MyZumbaState();
}

class _MyZumbaState extends State<MyZumba> {
  final appBarColor =Colors.grey[300];

  var groupValue = 0;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: appBarColor,
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
        title: const Text(""
            "Zumba",
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
                  thumbColor: Colors.black38,
                  padding: const EdgeInsets.all(8),
                  children:  {
                    0: buildSegment("All"),
                    1: buildSegment("Male"),
                    2: buildSegment("Female"),
                    3: buildSegment("Unisex")
                  },
                  onValueChanged: (groupValue){
                    setState(() {
                      this.groupValue = groupValue!;
                    });
                  }),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: size.height*.25,
                  width: size.width*.94,
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context,int index){
                      return Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              'assets/photos/zumba 1.jfif',
                              fit: BoxFit.cover,
                              height: size.height*.25,
                              width: size.width*.94,
                            ),
                          ),
                          Positioned(
                            bottom: size.height*.009,
                            left: 5,
                            child: Container(
                              height: size.height*.078,
                              width: size.width*.45,
                              color: Colors.black26,
                              padding: const EdgeInsets.only(left: 8, bottom: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Golds Gym",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Bus stand, Barakar",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Poppins",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            right: 5,
                            bottom: size.height*.008,
                            child: Container(
                              color: Colors.black26,
                              alignment: Alignment.bottomRight,
                              height: size.height*.08,
                              width: size.width*.22,
                              padding: const EdgeInsets.only(right: 8, bottom: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [
                                      // SvgPicture.asset(
                                      //     'assets/Icons/rating star small.svg'),
                                      Icon(
                                        CupertinoIcons.star_lefthalf_fill,
                                        color: Colors.yellow,
                                        size: 18,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "4.7",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Poppins",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [
                                      // SvgPicture.asset(
                                      //   'assets/Icons/Location.svg',
                                      //   color: Colors.white,
                                      // ),
                                      Icon(
                                        CupertinoIcons.location,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "1 KM",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    // itemCount: 1,
                    // children: [
                    //
                    // ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSegment(String text)=>Text(
      text,
      style: const TextStyle(
          color: Colors.black
      )
  );
}
