import 'dart:math';

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
  Color _color = Color.fromRGBO(58, 13, 204, 1);

  // string
  String title = "Lighting";

  // double
  double padding = 16.0;
  double radius = 16.0;

  double marginTop = 0.0;
  double marginLeft = 0.0;

  double ratio = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // set background color
      backgroundColor: _backgroundColor.withOpacity(max(ratio, 0.10)),

      // body
      body: Column(
        children: <Widget>[
          // appbar
          SafeArea(
            top: true,
            left: true,
            right: true,
            child: Container(
              margin: EdgeInsets.only(top: padding /2, left: padding),
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
            child: Stack(
              children: <Widget>[
                // bedroom
                Positioned(
                  top: 40.0,
                  right: 50.0,
                  height: 150.0,
                  width: 150.0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [_backgroundColor,
                          Colors.blueAccent.withOpacity(0.50)
                        ],

                        stops: [0.80, 1.0],
                      ),

                      boxShadow: [BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 1.0,
                        blurRadius: 1.0,
                      )],
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // icon
                          Icon(
                            Icons.wb_sunny,
                            size: 16.0,
                            color: Colors.white,
                          ),

                          // spacer
                          SizedBox(height: 6.0),

                          // text
                          Text("BedRoom",
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // living room
                Positioned(
                  right: -20.0,
                  bottom: 140.0,
                  height: 200.0,
                  width: 200.0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [_backgroundColor,
                          Colors.blueAccent.withOpacity(0.50)
                        ],

                        stops: [0.80, 1.0],
                      ),

                      boxShadow: [BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 1.0,
                        blurRadius: 1.0,
                      )],
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // icon
                          Icon(
                            Icons.wb_sunny,
                            size: 16.0,
                            color: Colors.white,
                          ),

                          // spacer
                          SizedBox(height: 6.0),

                          // text
                          Text("Living Room",
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // kitchen
                Positioned(
                  top: 100.0,
                  left: 30.0,
                  height: 200.0,
                  width: 200.0,
                  child: Container(
                    padding: EdgeInsets.only(
                      top: padding,
                      left: padding /2,
                      right: padding /2,
                      bottom: padding /4,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _color,
                    ),
                    child: Stack(
                      children: <Widget>[
                        // real bubble
                        Positioned(
                          top: marginTop,
                          left: marginLeft,
                          right: marginLeft,
                          bottom: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [_startColor, _endColor],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ),

                        // bubble cover
                        Positioned.fill(
                          child: GestureDetector(
                            // vertical
                            onVerticalDragStart: (DragStartDetails dragDetails){},
                            onVerticalDragUpdate: (DragUpdateDetails dragDetails){
                              setState(() {
                                // marginTop range: 6.80 - 177.40
                                if(marginTop <= 6.80) marginTop = 6.80;
                                if(marginTop >= 177.40) marginTop = 177.40;

                                // marginLeft range: 3.40 - 88.70
                                if(marginLeft <= 3.40) marginLeft = 3.40;
                                if(marginLeft >= 88.70) marginLeft = 88.70;

                                marginTop += dragDetails.delta.dy *2;
                                marginLeft += dragDetails.delta.dy;

                                ratio = (177.40 - marginTop) / 177.40;
                              });
                            },
                            onVerticalDragEnd: (DragEndDetails dragDetails){},

                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  // icon
                                  Icon(
                                    Icons.wb_sunny,
                                    size: 32.0 * max(ratio, 0.30),
                                    color: Colors.white,
                                  ),

                                  // spacer
                                  SizedBox(height: 6.0),

                                  // text
                                  Text("Kitchen",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // bath
                Positioned(
                  left: 100.0,
                  bottom: 80.0,
                  height: 150.0,
                  width: 150.0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [_backgroundColor,
                          Colors.blueAccent.withOpacity(0.50)
                        ],

                        stops: [0.80, 1.0],
                      ),

                      boxShadow: [BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 1.0,
                        blurRadius: 1.0,
                      )],
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // icon
                          Icon(
                            Icons.wb_sunny,
                            size: 16.0,
                            color: Colors.white,
                          ),

                          // spacer
                          SizedBox(height: 6.0),

                          // text
                          Text("BathRoom",
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
