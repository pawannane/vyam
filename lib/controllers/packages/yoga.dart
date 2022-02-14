import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vyam_2_final/controllers/packages/bookingDetails.dart';

import '../package_controller.dart';

class YogaList extends StatelessWidget {
  YogaList({
    Key? key,
    required double width,
  })  : _width = width,
        super(key: key);

  final double _width;
  BookingDetails bookingDetails = BookingDetails();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width * 0.95,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          backgroundColor: Colors.transparent,
          title: Text("Yoga",
              style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: HexColor("3A3A3A"),
                  fontWeight: FontWeight.w600)),
          children: [
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: yoga.length,
                itemBuilder: (context, snapshot) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: _width * 0.9,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Column(
                          children: [
                            const Divider(
                              color: Colors.grey,
                            ),
                            Row(
                              children: [
                                Text(
                                  yoga[snapshot].title,
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      color: HexColor("3A3A3A"),
                                      fontWeight: FontWeight.w600),
                                ),
                                const Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.all(5.0),
                                          padding: const EdgeInsets.only(
                                              top: 2.0,
                                              bottom: 2.0,
                                              left: 5,
                                              right: 5),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: HexColor("49C000"))),
                                          child: Text(
                                            '20% off',
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 9,
                                                color: HexColor("49C000")),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "\$${yoga[snapshot].orginalPrice}",
                                              style: GoogleFonts.poppins(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  fontSize: 14,
                                                  color: HexColor("BFB9B9"),
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            const SizedBox(
                                              width: 1,
                                            ),
                                            Text(
                                              "\$${yoga[snapshot].price}",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  color: HexColor("3A3A3A"),
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "Inc. of all taxes",
                                      style: GoogleFonts.poppins(
                                          fontSize: 9,
                                          color: HexColor("B2B2B2"),
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/yogaCartoon.png",
                                  height: 70,
                                ),
                                const Spacer(),
                                RaisedButton(
                                  elevation: 0,
                                  onPressed: () {
                                    bookingDetails.bookingDetails(
                                        context, snapshot, yoga, "Yoga ");
                                  },
                                  color: HexColor("292F3D"),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: Text("Buy now",
                                          style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              color: HexColor("FFFFFF"),
                                              fontWeight: FontWeight.w600))),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
