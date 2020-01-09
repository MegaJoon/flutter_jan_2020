import 'package:flutter/material.dart';

// https://www.instagram.com/p/B6vBB7DHAkJ/

class SecondLightingApp extends StatefulWidget {
  @override
  _SecondLightingAppState createState() => _SecondLightingAppState();
}

class _SecondLightingAppState extends State<SecondLightingApp> {
  // color
  Color _backgroundColor = Color.fromRGBO(69, 11, 254, 1);

  // string
  String title = "Lighting";

  // double
  double padding = 16.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // set background color
      backgroundColor: _backgroundColor,

      // body
      body: Column(
        children: <Widget>[
          // appbar
          SafeArea(
            top: true,
            left: true,
            right: true,
            child: Container(
              margin: EdgeInsets.only(left: padding),
              height: 40.0,
              child: Row(
                children: <Widget>[
                  // text: title
                  Text(title,
                    style: TextStyle(
                      fontSize: 28.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // spacer
                  Spacer(),

                  // icon: setting
                  IconButton(
                    onPressed: (){},
                    icon: Icon(
                      Icons.settings,
                      size: 20.0,
                      color: Colors.white,
                    ),
                  ),

                ],
              ),
            ),
          ),

          // main
          Flexible(
            fit: FlexFit.tight,
            child: Placeholder(),
          ),

          // bottom bar
          Container(
            height: 80.0,
            child: Placeholder(),
          ),
        ],
      ),
    );
  }
}
