import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:vyam_2_final/models/gym_models.dart';
import '../../controllers/gym_controller.dart';

const String api = "AIzaSyBdpLJQN_y-VtLZ2oLwp8OEE5SlR8cHHcQ";

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(23.7217038, 86.7921423),
    zoom: 11.5,
  );

  final Completer<GoogleMapController> _controller = Completer();
  final GymController controller = Get.put(GymController());
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  List<GymModel> filteredGymLists = [];

  void initMarker(specify, specifyId) async {
    var markerIdVal = specifyId;
    final MarkerId markerId = MarkerId(markerIdVal);
    final Marker marker = Marker(
      markerId: markerId,
      position:
          LatLng(specify['location'].latitude, specify['location'].longitude),
      infoWindow: InfoWindow(title: 'Gym', snippet: specify['name']),
    );
    setState(() {
      markers[markerId] = marker;
    });
  }

  getMarkerData() async {
    await Firebase.initializeApp();
    FirebaseFirestore.instance
        .collection('product_details')
        .get()
        .catchError((e) {
      print("Error: " + e.toString());
    }).then((myMockData) {
      if (myMockData.docs.isNotEmpty) {
        for (int i = 0; i < myMockData.docs.length; i++) {
          initMarker(myMockData.docs[i].data(), myMockData.docs[i].id);
        }
      }
    });
  }

  void _runFilter(String enteredKeyword) {
    List<GymModel> results = [];
    if (enteredKeyword.isEmpty) {
      results = controller.gymLists;
    } else {
      results = controller.gymLists
          .where((g) =>
              g.location.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      filteredGymLists = results;
    });
  }

  @override
  void initState() {
    getMarkerData();
    filteredGymLists = controller.gymLists;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) => _runFilter(value),
          decoration: const InputDecoration(
              hintText: 'Barakar, West Bengal',
              hintStyle: TextStyle(fontWeight: FontWeight.bold),
              prefixIcon: Icon(Icons.search)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.terrain,
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            markers: Set<Marker>.of(markers.values),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Expanded(
              child: filteredGymLists.isNotEmpty
                  ? Container(
                      margin: const EdgeInsets.symmetric(vertical: 20.0),
                      height: 150.0,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: filteredGymLists.length,
                          itemBuilder: (context, index) {
                            final gym = controller.gymLists[index];
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              elevation: 8,
                              child: Row(
                                children: [
                                  _boxes(gym.image, gym.lat, gym.lon, gym.name,
                                      gym.location, gym.address, gym.review)
                                ],
                              ),
                            );
                          }),
                    )
                  : const Text(
                      "No results found",
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _boxes(String _image, double lat, double long, String name,
      String location, String address, String review) {
    return GestureDetector(
      onTap: () {
        _gotoLocation(lat, long);
      },
      child: FittedBox(
        child: Material(
            color: Colors.white,
            elevation: 14.0,
            borderRadius: BorderRadius.circular(24.0),
            shadowColor: Colors.black87,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: 180,
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage(_image),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 30),
                    child: myDetailsContainer1(name, location, address, review),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget myDetailsContainer1(
      String name, String location, String address, String review) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            name,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 22.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 5.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Icon(
              CupertinoIcons.location_solid,
              color: Colors.black,
            ),
            Text(
              location,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5.0),
        Text(
          address,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 20.0,
          ),
        ),
        const SizedBox(height: 5.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              CupertinoIcons.star_fill,
              color: Colors.amber,
            ),
            Text(
              review,
              style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: 17,
    )));
  }
}
