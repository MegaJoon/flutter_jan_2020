import 'package:flutter/material.dart';

// https://www.instagram.com/p/B4KVPEBgSlM/?igshid=mf7es8ogwyaw

class PlateApp extends StatefulWidget {
  @override
  _PlateAppState createState() => _PlateAppState();
}

class _PlateAppState extends State<PlateApp> {
  // string
  String _bottomImage = "assets/0109/image3.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // background top list view

          // main page view

          // add to cart container

          // bottom image
          Positioned(
            left: 0,
            right: 0,
            bottom: -50.0,
            height: 150.0,
            child: Image.asset(
              _bottomImage,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
