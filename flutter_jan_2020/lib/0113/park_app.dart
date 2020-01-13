import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_jan_2020/0113/tab_list.dart';
import 'package:flutter_jan_2020/0113/timeline_items.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

// https://dribbble.com/shots/6566062-Circular-Carousel-UI-Open-Source-Library

class ParkApp extends StatefulWidget {
  @override
  _ParkAppState createState() => _ParkAppState();
}

class _ParkAppState extends State<ParkApp> {
  // widget list
  List<Widget> pages = [];

  // image
  String _backgroundImage = "assets/0113/image.png";

  // color
  Color _color = Color.fromRGBO(52, 111, 229, 1);

  // double
  double paddingImage = 0;
  double padding = 16.0;
  double radius = 16.0;

  // bottom sheet position
  double positionY = 500.0;

  // bottom sheet height
  double bottomSheetHeight = 64.0 + (300.0 + 8.0) * timeline.length;

  // page view
  PageController _pageController;

  // page view index
  int currentIndex = 3;

  @override
  void initState() {
    _pageController =
        PageController(initialPage: currentIndex, viewportFraction: 0.20);
    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // screen height & width
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // set widget list
    setWidgetList();

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // background title & image
          Positioned(
            top: paddingImage *2,
            left: paddingImage,
            right: paddingImage,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(top: padding *4 - paddingImage *2),
              width: screenWidth,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [_color, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: <Widget>[
                  // text: Hello
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        // text: national park
                        TextSpan(
                          text: "national park\n".toUpperCase(),
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            height: 1.0,
                            shadows: [
                              BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 4.0,
                                blurRadius: 4.0,
                                offset: Offset(4.0, 4.0),
                              )
                            ],
                          ),
                        ),

                        // text: yosemite park
                        TextSpan(
                          text: "Yosemite\npark\n".toUpperCase(),
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 44.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            height: 1.0,
                            letterSpacing: 2.0,
                            shadows: [
                              BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 4.0,
                                blurRadius: 4.0,
                                offset: Offset(4.0, 4.0),
                              )
                            ],
                          ),
                        ),

                        // text: guides
                        TextSpan(
                          text: "guides".toUpperCase(),
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            height: 1.0,
                            shadows: [
                              BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 4.0,
                                blurRadius: 4.0,
                                offset: Offset(4.0, 4.0),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Spacer(),

                  // background image
                  Image.asset(
                    _backgroundImage,
                    height: screenHeight * 0.70 - paddingImage *2,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
          ),

          // bottom sheet
          AnimatedPositioned(
            duration: Duration(seconds: 1),
            curve: Curves.fastLinearToSlowEaseIn,
            top: positionY,
            left: 0,
            right: 0,
            height: bottomSheetHeight,
            child: GestureDetector(
              onVerticalDragStart: (DragStartDetails dragDetails) {},
              onVerticalDragUpdate: (DragUpdateDetails dragDetails) {
                setState(() {
                  positionY += dragDetails.delta.dy;

                  paddingImage = (positionY - 500.0) / 10.0;

                  if (positionY > 500.0) {
                    positionY = 500.0;
                  }

                  print("positionY = $positionY");

                  if (positionY < -bottomSheetHeight + screenHeight + padding)
                    positionY = -bottomSheetHeight + screenHeight + padding;
                });
              },
              onVerticalDragEnd: (DragEndDetails dragDetails) {},
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: <Widget>[
                    // top page view
                    Container(
                      height: 64.0,
                      child: Stack(
                        children: <Widget>[
                          // background white container
                          Positioned(
                            top: 32.0,
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Container(
                              color: Colors.white,
                            ),
                          ),

                          // page view
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 64.0,
                              child: PageView.builder(
                                scrollDirection: Axis.horizontal,
                                controller: _pageController,
                                onPageChanged: (int _currentIndex) {
                                  setState(() {
                                    currentIndex = _currentIndex;
                                  });
                                },
                                itemBuilder: (context, index) {
                                  // now page == currentIndex?
                                  bool isNowPage =
                                  currentIndex == index ? true : false;

                                  // diff between currentIndex and index
                                  double diff =
                                  (currentIndex - index).abs().toDouble();
                                  double marginY = diff * 8.0;

                                  return AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    margin: EdgeInsets.symmetric(
                                        vertical: marginY,
                                        horizontal: padding / 2),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(radius),
                                      color: isNowPage ? _color : Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          spreadRadius: 1.0,
                                          blurRadius: 1.0,
                                          offset: Offset(1.0, 1.0),
                                        )
                                      ],
                                    ),
                                    child: Center(
                                      child: Icon(
                                        tabsList[index % 4],
                                        size: 28.0 * (1.0 - diff / 5.0),
                                        color: isNowPage
                                            ? Colors.white
                                            : Colors.grey[300],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // timeline list
                    pages[currentIndex %4],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  setWidgetList(){
    pages = [
      ////////////////////////////////////////////////////////////////////////
      ////////////////////////////////////////////////////////////////////////
      // dont use
      SizedBox(
        height: bottomSheetHeight - 64.0,
        child: Container(
            color: Colors.white,
            child: Placeholder(color: Colors.red),
        ),
      ),

      SizedBox(
        height: bottomSheetHeight - 64.0,
        child: Container(
          color: Colors.white,
          child: Placeholder(color: Colors.teal),
        ),
      ),

      SizedBox(
        height: bottomSheetHeight - 64.0,
        child: Container(
          color: Colors.white,
          child: Placeholder(color: Colors.indigo),
        ),
      ),
      ////////////////////////////////////////////////////////////////////////
      ////////////////////////////////////////////////////////////////////////

      // initial page
      SizedBox(
        height: bottomSheetHeight - 64.0,
        child: ListView.separated(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: timeline.length,
          physics: NeverScrollableScrollPhysics(),

          // time line container
          itemBuilder: (context, index) {
            return Container(
              height: 300.0,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  // text: title, subTitle
                  Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: padding),
                    height: 64.0,
                    child: Row(
                      children: <Widget>[
                        // text: title, subTitle
                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: <Widget>[
                            // text: title
                            Text(
                              timeline[index].title,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            // text: subTitle
                            Text(
                              timeline[index].subTitle,
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),

                        Spacer(),

                        // icon & text: score 4.3
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              size: 16.0,
                              color: Colors.grey[500],
                            ),

                            SizedBox(width: 4.0),

                            Text(
                              "4.7",
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // image
                  Flexible(
                    fit: FlexFit.tight,
                    child: Image.asset(
                      timeline[index].image,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),

                  // icon & text: 10
                  Container(
                    padding:
                    EdgeInsets.symmetric(horizontal: padding),
                    height: 40.0,
                    child: Row(
                      crossAxisAlignment:
                      CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.comment,
                          size: 16.0,
                          color: Colors.grey[500],
                        ),

                        SizedBox(width: 4.0),

                        Text(
                          "10",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w300,
                          ),
                        ),

                        SizedBox(width: padding),

                        Icon(
                          Icons.favorite_border,
                          size: 16.0,
                          color: Colors.grey[500],
                        ),

                        SizedBox(width: 4.0),

                        Text(
                          "10",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },

          // divider
          separatorBuilder: (context, index) {
            return Container(
              height: padding /2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.grey[400], Colors.grey[200]],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            );
          },
        ),
      ),
    ];
  }
}
