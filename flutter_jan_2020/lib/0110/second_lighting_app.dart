import 'package:flutter/material.dart';

// https://www.instagram.com/p/B6vBB7DHAkJ/

class SecondLightingApp extends StatefulWidget {
  @override
  _SecondLightingAppState createState() => _SecondLightingAppState();
}

class _SecondLightingAppState extends State<SecondLightingApp> {
  // color
  Color _backgroundColor = Color.fromRGBO(69, 11, 254, 1);
  Color _startColor = Color.fromRGBO(247, 155, 145, 1);
  Color _endColor = Color.fromRGBO(252, 136, 197, 1);

  // string
  String title = "Lighting";

  // double
  double padding = 16.0;
  double radius = 16.0;

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
            child: Stack(
              children: <Widget>[
                // bottom bar
                Positioned(
                  top: padding,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(radius),
                        topRight: Radius.circular(radius),
                      ),
                      color: Colors.white,
                      boxShadow: [BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 2.0,
                        blurRadius: 2.0,
                      )],
                    ),
                  ),
                ),

                // bottom items
                Positioned.fill(
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          child: Center(
                            child: Icon(
                              Icons.keyboard,
                              size: 24.0,
                              color: Colors.grey,
                            ),
                          ),
                        ),

                        // circle items
                        Flexible(
                          fit: FlexFit.tight,
                          child: Container(
                            padding: EdgeInsets.all(4.0),
                            margin: EdgeInsets.only(bottom: 8.0),
                            height: 60.0,
                            width: 60.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Container(
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [_startColor, _endColor],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),

                        Flexible(
                          child: Center(
                            child: Icon(
                              Icons.favorite,
                              size: 24.0,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Center(
                            child: Icon(
                              Icons.compare_arrows,
                              size: 24.0,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Center(
                            child: Icon(
                              Icons.account_circle,
                              size: 24.0,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
