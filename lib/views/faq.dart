import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vyam/controllers/faq_controller.dart';

class Faq extends StatefulWidget {
  const Faq({Key? key}) : super(key: key);

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  final FaqController controller = Get.put(FaqController());

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
          'FAQ',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: controller.faqLists.length,
          itemBuilder: (context, index) {
            final faq = controller.faqLists[index];
            return Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ExpansionPanelList(
                animationDuration: const Duration(milliseconds: 1000),
                elevation: 0,
                expandedHeaderPadding: const EdgeInsets.symmetric(vertical: 0),
                children: [
                  ExpansionPanel(
                    body: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Divider(
                            color: Colors.black54,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            faq.ans,
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 15,
                                letterSpacing: 0.3,
                                height: 1.3),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(16),
                        child: Text(
                          faq.que,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                    isExpanded: faq.isExpanded,
                  )
                ],
                expansionCallback: (int item, bool status) {
                  setState(() {
                    faq.isExpanded = !faq.isExpanded;
                  });
                },
              ),
            );
          }),
    );
  }
}
