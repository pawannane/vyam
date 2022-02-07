import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

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
  late GoogleMapController _mapController;
  late String _mapStyle;

  @override
  void initState() {
    super.initState();

    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }

  // Future<String> getJsonFile(String path) async {
  //   return await rootBundle.loadString(path);
  // }

  // void setMapStyle(String mapStyle) {
  //   _mapController.setMapStyle(mapStyle);
  // }

  // changeMapMode() {
  //   getJsonFile("assets/map_style.json").then(setMapStyle);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Barakar, West Bengal',
            hintStyle: const TextStyle(fontWeight: FontWeight.bold),
            prefixIcon: SvgPicture.asset(
              'assets/Icons/Search.svg',
              fit: BoxFit.none,
            ),
          ),
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
              _mapController = controller;
              _mapController.setMapStyle(_mapStyle);
              // _controller.complete(controller);
            },
            markers: {barakar, asanol1, asanol2},
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              height: 150.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  const SizedBox(width: 10.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _boxes(
                        "https://lh5.googleusercontent.com/p/AF1QipMKRN-1zTYMUVPrH-CcKzfTo6Nai7wdL7D8PMkt=w340-h160-k-no",
                        23.7264376,
                        86.8434882,
                        "Transformers Gym"),
                  ),
                  const SizedBox(width: 10.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _boxes(
                        "https://lh5.googleusercontent.com/p/AF1QipMKRN-1zTYMUVPrH-CcKzfTo6Nai7wdL7D8PMkt=w340-h160-k-no",
                        23.6828365,
                        86.9816039,
                        "Fitness Fantasy"),
                  ),
                  const SizedBox(width: 10.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _boxes(
                        "https://images.unsplash.com/photo-1504940892017-d23b9053d5d4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                        23.6823747,
                        86.9817005,
                        "GymX Studios"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _boxes(String _image, double lat, double long, String locationName) {
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24.0),
                    child: Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(_image),
                    ),
                  ),
                ),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: myDetailsContainer1(locationName),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget myDetailsContainer1(String locationName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            locationName,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 5.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            Text(
              "4.1",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            ),
            Icon(
              CupertinoIcons.star_fill,
              color: Colors.amber,
              size: 15.0,
            ),
            Icon(
              CupertinoIcons.star_fill,
              color: Colors.amber,
              size: 15.0,
            ),
            Icon(
              CupertinoIcons.star_fill,
              color: Colors.amber,
              size: 15.0,
            ),
            Icon(
              CupertinoIcons.star_fill,
              color: Colors.amber,
              size: 15.0,
            ),
            Icon(
              CupertinoIcons.star_lefthalf_fill,
              color: Colors.amber,
              size: 15.0,
            ),
            Text(
              "(946)",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5.0),
        const Text(
          "American \u00B7 \u0024\u0024 \u00B7 1.6 mi",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 18.0,
          ),
        ),
        const SizedBox(height: 5.0),
        const Text(
          "Closed \u00B7 Opens 17:00 Thu",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: 12,
    )));
  }
}

Marker barakar = Marker(
    markerId: const MarkerId('barakar'),
    position: const LatLng(23.7264376, 86.8434882),
    infoWindow: const InfoWindow(title: 'Bus Stand, Barakar'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow));

Marker asanol1 = Marker(
    markerId: const MarkerId('asanol1'),
    position: const LatLng(23.6828365, 86.9816039),
    infoWindow: const InfoWindow(title: 'Ashram More, Asanol'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow));

Marker asanol2 = Marker(
    markerId: const MarkerId('asanol2'),
    position: const LatLng(23.6823747, 86.9817005),
    infoWindow: const InfoWindow(title: 'Ashram More, Asanol'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow));
