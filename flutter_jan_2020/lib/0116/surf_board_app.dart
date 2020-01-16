import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// https://dribbble.com/shots/9521982-Surfboard-App-Interaction

class SurfBoardApp extends StatefulWidget {
  @override
  _SurfBoardAppState createState() => _SurfBoardAppState();
}

class _SurfBoardAppState extends State<SurfBoardApp> {
  // color
  Color _color = Color.fromRGBO(117, 63, 238, 1);
  Color _color1 = Color.fromRGBO(106, 62, 203, 1);
  Color _appbarColor = Color.fromRGBO(151, 222, 254, 1);

  // string
  String title = "Taylor Swift";
  String subTitle = "Wen, 21 Aug\n";
  String subTitle1 = "Club Devil, 5th Avenue, 287";

  // double
  double padding = 16.0;
  double iconPadding = 32.0;

  double tabHeight = 64.0;

  double marginRight = 0.0;

  @override
  Widget build(BuildContext context) {
    // screen width
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // first page
          Positioned.fill(
              child: Container(
                color: _color,
                child: SafeArea(
                  top: true,
                  left: true,
                  right: true,
                  child: Column(
                    children: <Widget>[
                      // appbar
                      Container(
                        height: 40.0,
                        child: Row(
                          children: <Widget>[
                            // icon
                            IconButton(
                              onPressed: (){},
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: 24.0,
                                color: Colors.white,
                              ),
                            ),

                            // spacer
                            Spacer(),

                            // container
                            Container(
                              margin: EdgeInsets.only(right: padding),
                              height: 32.0,
                              width: 100.0,
                              decoration: ShapeDecoration(
                                shape: StadiumBorder(),
                                color: _appbarColor,
                                shadows: [BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 1.0,
                                  blurRadius: 1.0,
                                  offset: Offset(1.0, 1.0),
                                )],
                              ),
                              child: Center(
                                child: Text("Purchase",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // text: title
                      Text(title,
                        style: GoogleFonts.poppins(
                          fontSize: 40.0,
                          color: Colors.amberAccent,
                          fontWeight: FontWeight.bold,
                          height: 2.0,
                          shadows: [BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 6.0,
                            blurRadius: 6.0,
                            offset: Offset(6.0, 6.0),
                          )],
                        ),
                      ),

                      // text: subTitle
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            // text: subTitle
                            TextSpan(text: subTitle,
                              style: GoogleFonts.poppins(
                                fontSize: 14.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                height: 2.0,
                                shadows: [BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 6.0,
                                  blurRadius: 6.0,
                                  offset: Offset(6.0, 6.0),
                                )],
                              ),
                            ),

                            // text: subTitle1
                            TextSpan(text: subTitle1,
                              style: GoogleFonts.poppins(
                                fontSize: 12.0,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w600,
                                height: 1.5,
                                shadows: [BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 6.0,
                                  blurRadius: 6.0,
                                  offset: Offset(6.0, 6.0),
                                )],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ),

          // swipe tab
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.fastLinearToSlowEaseIn,
            top: 0,
            left: screenWidth - tabHeight + marginRight,
            bottom: 0,
            child: GestureDetector(
              onHorizontalDragStart: (DragStartDetails dragDetails){},
              onHorizontalDragUpdate: (DragUpdateDetails dragDetails){
                setState(() {
                  marginRight += dragDetails.delta.dx;

                  // 0.0 ~ -400.0
                  print("marginRight = $marginRight");

                  if(marginRight > 0.0) marginRight = 0.0;
                  if(marginRight < -400.0) marginRight = -400.0;

                  //
                });
              },
              onHorizontalDragEnd: (DragEndDetails dragDetails){
                setState(() {
                  if(marginRight > -200.0) marginRight = 0.0;
                  if(marginRight <= -200.0) marginRight = -800.0;
                });
              },
              child: ClipPath(
                clipper: TabClipper(screenWidth),
                child: Container(
                  padding: EdgeInsets.only(left: iconPadding),
                  alignment: Alignment.centerLeft,
                  width: tabHeight + screenWidth * 2,
                  color: _color1,
                  child: Icon(
                    Icons.view_column,
                    size: 32.0,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TabClipper extends CustomClipper<Path> {
  final double padding;

  TabClipper(this.padding);

  double tabHeight = 52.0;

  @override
  Path getClip(Size size) {
    var path = Path()
    ..moveTo(size.width, 0.0)
    ..lineTo(size.width - padding, 0.0)
    ..quadraticBezierTo((size.width - tabHeight - padding) * 0.50, (size.height - tabHeight) * 0.45,
        tabHeight, (size.height - tabHeight) * 0.50)
    ..quadraticBezierTo(0.0, size.height * 0.50,
        tabHeight, (size.height + tabHeight) * 0.50)
    ..quadraticBezierTo((size.width - tabHeight - padding) * 0.50, (size.height + tabHeight) * 0.55,
        size.width - padding, size.height)
    ..lineTo(size.width, size.height)
    ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
