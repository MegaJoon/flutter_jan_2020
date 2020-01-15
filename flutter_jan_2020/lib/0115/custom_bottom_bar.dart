import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// https://www.instagram.com/p/B6jCBEuAS0h/?igshid=lyswu3mnn67m

class CustomBottomBar extends StatefulWidget {
  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar>
    with SingleTickerProviderStateMixin {
  // widget list
  List<Widget> pages = [];

  // double
  double boxHeight = 150.0;

  double padding = 16.0;

  double itemsHeight = 52.0;
  double iconTopPadding = 74.0;

  double iconSize = 24.0;

  double bottomHeight = 114.0;

  double marginTop = 85.0;

  bool isSelected = false;
  bool animationDone = false;

  // color
  Color _backgroundColor = Colors.amber[300];

  // bottom tabs index
  int currentIndex = 0;

  // bottom selected index Function
  _onPressed(int index){
    setState(() {
      currentIndex = index;
    });
  }

  // animation
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    // animation
    _animationController = AnimationController(duration: Duration(milliseconds: 400), vsync: this);

    _animation = Tween<double>(begin: -1.0, end: 1.0).animate(_animationController)
      ..addListener((){
        setState(() {});
      })
      ..addStatusListener((status){
        if(status == AnimationStatus.completed){
          animationDone = !animationDone;
          print("animationDone = $animationDone");
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setWidget();

    // screen Width
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // main
          Positioned.fill(
            child: pages[currentIndex],
          ),

          // bottom bar
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            height: boxHeight,
            child: Stack(
              children: <Widget>[
                AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  top: isSelected? boxHeight : iconTopPadding,
                  left: padding + screenWidth / 5 * 0,
                  child: InkWell(
                    onTap: (){
                      print("                                on clicked: 0");
                    },
                    child: Container(
                      height: itemsHeight,
                      width: itemsHeight,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1.0,
                          blurRadius: 1.0,
                          offset: Offset(1.0, 1.0),
                        )],
                      ),
                      child: Center(
                        child: Icon(
                          Icons.camera_alt,
                          size: iconSize,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),

                AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  top: isSelected? boxHeight : iconTopPadding / 1.5,
                  left: padding + screenWidth / 5 * 1,
                  child: InkWell(
                    onTap: (){
                      print("                                on clicked: 1");
                    },
                    child: Container(
                      height: itemsHeight,
                      width: itemsHeight,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1.0,
                          blurRadius: 1.0,
                          offset: Offset(1.0, 1.0),
                        )],
                      ),
                      child: Center(
                        child: Icon(
                          Icons.videocam,
                          size: iconSize,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),

                AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  top: isSelected? boxHeight : iconTopPadding / 1.5,
                  left: padding + screenWidth / 5 * 3,
                  child: InkWell(
                    onTap: (){
                      print("                                on clicked: 2");
                    },
                    child: Container(
                      height: itemsHeight,
                      width: itemsHeight,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1.0,
                          blurRadius: 1.0,
                          offset: Offset(1.0, 1.0),
                        )],
                      ),
                      child: Center(
                        child: Icon(
                          Icons.mic,
                          size: iconSize,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),

                AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  top: isSelected? boxHeight : iconTopPadding,
                  left: padding + screenWidth / 5 * 4,
                  child: InkWell(
                    onTap: (){
                      print("                                on clicked: 3");
                    },
                    child: Container(
                      height: itemsHeight,
                      width: itemsHeight,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1.0,
                          blurRadius: 1.0,
                          offset: Offset(1.0, 1.0),
                        )],
                      ),
                      child: Center(
                        child: Icon(
                          Icons.music_note,
                          size: iconSize,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),

                // bottom container
                AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  left: 0.0,
                  right: 0.0,
                  bottom: isSelected? 0.0 : -bottomHeight,
                  child: ClipPath(
                    clipper: CustomNotchedClipper(_animation.value * 54.0),
                    child: Container(
                      padding: EdgeInsets.only(top: boxHeight - bottomHeight),
                      height: bottomHeight,
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          BottomBarItems(
                            icon: Icons.dashboard,
                            isClicked: currentIndex == 0,
                            onPressed: (){
                              _onPressed(0);
                            },
                          ),

                          BottomBarItems(
                            icon: Icons.search,
                            isClicked: currentIndex == 1,
                            onPressed: (){
                              _onPressed(1);
                            },
                          ),

                          Flexible(
                            child: Container(),
                          ),

                          BottomBarItems(
                            icon: Icons.favorite_border,
                            isClicked: currentIndex == 2,
                            onPressed: (){
                              _onPressed(2);
                            },
                          ),

                          BottomBarItems(
                            icon: Icons.person_outline,
                            isClicked: currentIndex == 3,
                            onPressed: (){
                              _onPressed(3);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // floating btn
                AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  top: isSelected? pow(_animation.value * 50.0, 2) / 40.0 : 85.0,
                  left: padding + screenWidth / 5 * 2,
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        isSelected = !isSelected;

                        if(isSelected){
                          // animation.forward
                          _animationController.reset();
                          _animationController.forward();
                        }
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: itemsHeight,
                      width: itemsHeight,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                        boxShadow: [BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1.0,
                          blurRadius: 1.0,
                          offset: Offset(1.0, 1.0),
                        )],
                      ),
                      child: Center(
                        child: Icon(
                          isSelected? Icons.add : Icons.close,
                          size: iconSize,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  setWidget() {
    pages = [
      Container(
        color: Colors.red.withOpacity(0.20),
      ),

      Container(
        color: Colors.amber.withOpacity(0.20),
      ),

      Container(
        color: Colors.teal.withOpacity(0.20),
      ),

      Container(
        color: Colors.indigo.withOpacity(0.20),
      ),
    ];
  }
}

// bottom bar clipper
class CustomNotchedClipper extends CustomClipper<Path> {
  final double notchedMargin;

  CustomNotchedClipper(this.notchedMargin);

  @override
  Path getClip(Size size) {
    var path = Path()
      ..moveTo(0.0, 50.0)
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 50.0)
      ..lineTo(size.width * 0.70, 50.0)
      ..quadraticBezierTo(
          size.width * 0.63, 50.0 + notchedMargin * 0.02,
          size.width * 0.60, 50.0 + notchedMargin * 0.18)

      ..quadraticBezierTo(
          size.width * 0.50, 50.0 + notchedMargin,
          size.width * 0.40, 50.0 + notchedMargin * 0.18)

      ..quadraticBezierTo(
          size.width * 0.37, 50.0 + notchedMargin * 0.02,
          size.width * 0.30, 50.0)

      ..lineTo(0.0, 50.0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

// bottom bar items
class BottomBarItems extends StatelessWidget {
  final IconData icon;
  final bool isClicked;
  final Function onPressed;

  BottomBarItems({this.icon, this.isClicked, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          child: Center(
            child: Icon(
              icon,
              size: 24.0,
              color: isClicked? Colors.red : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}