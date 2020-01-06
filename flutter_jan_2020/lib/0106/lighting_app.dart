import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LightingApp extends StatefulWidget {
  @override
  _LightingAppState createState() => _LightingAppState();
}

class _LightingAppState extends State<LightingApp> {
  // color list
  Color _backgroundColor = Color.fromRGBO(69, 11, 254, 1);
  Color _startColor = Colors.orange;
  Color _endColor = Colors.pinkAccent;
  Color _color = Color.fromRGBO(58, 13, 204, 1);

  // double
  double padding = 16.0;
  double radius = 24.0;

  double marginTop = 0.0;
  double marginLeft = 0.0;

  double ratioX = 1.0;
  // string
  String title = "Lighting";

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // background color
      backgroundColor: _backgroundColor.withOpacity(max(ratioX, 0.10)),

      // body
      body: Column(
        children: <Widget>[
          // appbar
          SafeArea(
            top: true,
            left: true,
            right: true,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: padding),
              height: 40.0,
              child: Row(
                children: <Widget>[
                  // text: title
                  Text(title,
                    style: TextStyle(
                      fontSize: 28.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  // spacer
                  Spacer(),

                  // icon: setting icon
                  Icon(
                    Icons.settings,
                    size: 24.0,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),

          // main
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              padding: EdgeInsets.only(top: 50.0, bottom: 50.0),
              width: screenWidth *2,
              child: Stack(
                children: <Widget>[
                  // bedroom
                  Positioned(
                    top: 0,
                    right: 50.0,
                    height: 150.0,
                    width: 150.0,
                    child: Container(
                      padding: EdgeInsets.all(padding),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [_backgroundColor, Colors.blueAccent.withOpacity(0.50)],
                            stops: [0.80, 1.0],
                          ),
                        boxShadow: [BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1.0,
                          blurRadius: 1.0,
                          offset: Offset(1.0, 1.0),
                        )],
                      ),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // icon
                            Icon(Icons.wb_sunny, size: 16.0, color: Colors.white,),

                            SizedBox(height: 8.0),

                            // text
                            Text("Bedroom",
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
                    bottom: 80.0,
                    right: -20.0,
                    height: 200.0,
                    width: 200.0,
                    child: Container(
                      padding: EdgeInsets.all(padding),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [_backgroundColor, Colors.blueAccent.withOpacity(0.50)],
                          stops: [0.80, 1.0],
                        ),
                        boxShadow: [BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1.0,
                          blurRadius: 1.0,
                          offset: Offset(1.0, 1.0),
                        )],
                      ),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // icon
                            Icon(Icons.wb_sunny, size: 16.0, color: Colors.white,),

                            SizedBox(height: 8.0),

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
                    top: 80.0,
                    left: 20.0,
                    height: 200.0,
                    width: 200.0,
                    child: Container(
                      padding: EdgeInsets.all(padding),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _color,
                        boxShadow: [BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1.0,
                          blurRadius: 1.0,
                          offset: Offset(1.0, 1.0),
                        )],
                      ),
                      child: Stack(
                        children: <Widget>[
                          // real bubble
                          Positioned(
                            top: marginTop,
                            left: marginLeft,
                            right: marginLeft,
                            bottom: 0.0,
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
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: GestureDetector(
                              // horizontal
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

                                  print("marginTop = $marginTop");
                                  print("marginLeft = $marginLeft");

                                  ratioX = (177.40 - marginTop) / 177.40;
                                });
                              },
                              onVerticalDragEnd: (DragEndDetails dragDetails){},
                            ),
                          ),

                          // icon & text
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                // icon
                                Icon(Icons.wb_sunny, size: 32.0 * max(ratioX, 0.10), color: Colors.white,),

                                SizedBox(height: 8.0),

                                // text
                                Text("Bedroom",
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // bath
                  Positioned(
                    left: 100.0,
                    bottom: 00.0,
                    height: 150.0,
                    width: 150.0,
                    child: Container(
                      padding: EdgeInsets.all(padding),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _color,
                        boxShadow: [BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1.0,
                          blurRadius: 1.0,
                          offset: Offset(1.0, 1.0),
                        )],
                      ),
                      child: Stack(
                        children: <Widget>[
                          // real bubble
                          Positioned(
                            top: 70.0,
                            left: 10.0,
                            right: 10.0,
                            bottom: 0.0,
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

                          // icon & text
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                // icon
                                Icon(Icons.wb_sunny, size: 24.0, color: Colors.white,),

                                SizedBox(height: 8.0),

                                // text
                                Text("Bath",
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // bottom bar
          Container(
            height: 88.0,
            child: Stack(
              children: <Widget>[
                // background
                Positioned(
                  top: padding * 1.50,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(radius),
                        topRight: Radius.circular(radius),
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),

                // bottom indicator
                Positioned(
                  top: 0,
                  left: padding * 0.80 + screenWidth / 5,
                  bottom: 64.0,
                  child: ClipPath(
                    clipper: BottomClipper(),
                    child: Container(
                      height: 24.0,
                      width: 56.0,
                      color: Colors.white,
                    ),
                  ),
                ),

                // bottom items
                Positioned.fill(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: Center(
                          child: Icon(
                            Icons.keyboard,
                            size: 28.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),

                      // circle
                      Flexible(
                        child: Center(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 8.0),
                            padding: EdgeInsets.all(padding),
                            height: 52.0,
                            width: 52.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [_startColor, _endColor, _endColor],
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
                            size: 28.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),

                      Flexible(
                        child: Center(
                          child: Icon(
                            Icons.compare_arrows,
                            size: 28.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),

                      Flexible(
                        child: Center(
                          child: Icon(
                            Icons.account_circle,
                            size: 28.0,
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

class BottomClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path()
    ..moveTo(0.0, size.height)
      ..quadraticBezierTo(2.0, size.height - 1.0, 3.0, size.height - 2.0)
    ..quadraticBezierTo(size.width / 2, 0.0, size.width - 3.0, size.height - 2.0)
      ..quadraticBezierTo(size.width - 2.0, size.height - 1.0, size.width, size.height)
    ..lineTo(0.0, size.height)
    ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}