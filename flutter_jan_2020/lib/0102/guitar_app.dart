import 'dart:math';

import 'package:flutter/material.dart';

// https://www.instagram.com/p/B6xmOMFhyvN/?igshid=v3ru2e5ua0ra

class GuitarApp extends StatefulWidget {
  @override
  _GuitarAppState createState() => _GuitarAppState();
}

class _GuitarAppState extends State<GuitarApp> with TickerProviderStateMixin {
  // color
  Color _backgroundColor = Color.fromRGBO(236, 226, 209, 1);
  Color _bottomColor = Color.fromRGBO(229, 220, 204, 1);

  // double
  double padding = 16.0;

  // string
  String title = "product detail";
  String description = "The Fender American Elite Stratocaster takes the classic Strat platform, arguably the most ubiquitous and innovative instrument of its kind since its introduction in 1954, and dresses it up with a serious list of upgrades and new appointments. Improvements include 4th-generation Noiseless pickups, refined bridge and tremolo system, and a compound maple neck with new heel contour. 10 possible sounds come from the S-1 switching system atop the volume control for a range of sounds that make the American Elite Strat somehow more versatile. As usual, these Strats are available in a range of finishes and with your choice of maple, rosewood,";
  String _image = "assets/0102/guitar.png";
  String _image1 = "https://cdn.pixabay.com/photo/2015/07/28/22/03/fireworks-865104__340.jpg";

  // bool
  bool isClicked = false;

  // transform animation
  AnimationController _transformAnimationController;
  Animation<double> transformAnimation;

  // slide animation
  AnimationController _slideAnimationController;
  Animation<double> slideAnimation;

  // click event : animation forward & reverse
  void _onClicked(){
    setState(() {
      isClicked = !isClicked;
      if(isClicked){
        _transformAnimationController.forward();
        _slideAnimationController.forward();
      } else{
        _transformAnimationController.reverse();
        _slideAnimationController.reverse();
      }
    });
  }

  @override
  void initState() {
    // transform animation
    _transformAnimationController = AnimationController(duration: Duration(milliseconds: 1500), vsync: this);
//    ..forward();

    transformAnimation = Tween<double>(begin: 0.0, end: pi /2 - 0.01).animate(
      CurvedAnimation(parent: _transformAnimationController,
      curve: Curves.fastLinearToSlowEaseIn,
      reverseCurve: Curves.fastOutSlowIn,
      ),
    )
    ..addListener((){
      setState(() {
      });
    });
//    ..addStatusListener((status){
//      setState(() {
//        if(status == AnimationStatus.completed){
//          _transformAnimationController.reverse();
//        } else if(status == AnimationStatus.dismissed){
//          _transformAnimationController.forward();
//        }
//      });
//    });

    // slide up animation
    _slideAnimationController = AnimationController(duration: Duration(milliseconds: 1500), vsync: this);
//      ..forward();

    slideAnimation = Tween<double>(begin: 0.0, end: 500.0).animate(
      CurvedAnimation(
        parent: _slideAnimationController,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.fastOutSlowIn,
      ),
    )
      ..addListener((){
        setState(() {
        });
      });
//      ..addStatusListener((status){
//        setState(() {
//          if(status == AnimationStatus.completed){
//            _slideAnimationController.reverse();
//          } else if(status == AnimationStatus.dismissed){
//            _slideAnimationController.forward();
//          }
//        });
//      });

    super.initState();
  }

  @override
  void dispose() {
    _transformAnimationController?.dispose();
    _slideAnimationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // screenHeight
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: isClicked? Colors.grey[300].withOpacity(0.80) : _backgroundColor,
      body: Stack(
        children: <Widget>[
          // top transform page
          Positioned(
            top: -slideAnimation.value/2,
            left: 0,
            right: 0,
            height: screenHeight,
            child: InkWell(
              onTap: (){
                setState(() {
                  _onClicked();
                });
              },
              child: Transform(
                transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateX(-transformAnimation.value),
                alignment: FractionalOffset.center,
                child: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  curve: Curves.fastLinearToSlowEaseIn,
                  color: isClicked? Colors.white : _backgroundColor,
                  child: Stack(
                    children: <Widget>[
                      // text: Fender
                      Positioned(
                        top: 200.0,
                        left: -padding *5.0,
                        child: Transform.rotate(
                          angle: 1.56,
                          child: Text("Fender".toUpperCase(),
                            style: TextStyle(
                              fontSize: 90.0,
                              color: Colors.grey[600].withOpacity(0.50),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      // center image
                      Positioned(
                        top: 80.0,
                          left: 80.0,
                          right: 80.0,
                          bottom: 200.0,
                          child: Image.asset(
                            _image,
                            fit: BoxFit.cover,
                          ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // bottom slide page
          Positioned(
            top: screenHeight - slideAnimation.value * 1.17,
            left: 0,
            right: 0,
            height: screenHeight - 98.0,
            child: Container(
              padding: EdgeInsets.only(
                top: 150.0,
                left: padding,
                right: padding,
                bottom: padding,
              ),
              color: _bottomColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // text: ~~~~~
                  Text(description,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  Spacer(),

                  // image
                  Container(
                    height: 200.0,
                    child: Stack(
                      children: <Widget>[
                        // image
                        Positioned.fill(
                            child: Image.network(
                              _image1,
                              fit: BoxFit.fill,
                            ),
                        ),

                        // center icon
                        Positioned.fill(
                            child: Center(
                              child: Icon(
                                Icons.arrow_right,
                                size: 60.0,
                                color: Colors.white,
                              ),
                            ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // appbar
          Positioned(
            top: 0,
            left: padding,
            right: padding,
            child: SafeArea(
              top: true,
              left: true,
              right: true,
              child: Container(
                height: 40.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // left
                    Icon(
                      isClicked? Icons.close : Icons.menu,
                      size: 28.0,
                      color: Colors.black,
                    ),

                    // center text: title
                    Text(title.toUpperCase(),
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // spacer
                    Container(
                      width: 28.0,
//                      child: Placeholder(),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // bottom text
          Positioned(
            top: screenHeight - 170.0 - slideAnimation.value /1.30,
            left: padding,
            right: padding,
            child: Container(
              height: 110.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  // text: Fender American Elite Strat
                  Text("Fender\nAmerican\nElite Strat",
                    style: TextStyle(
                      fontSize: 36.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      height: 1.0,
                    ),
                  ),

                  Spacer(),

                  // spec
                  isClicked? Container() : Text("Spec".toUpperCase(),
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  isClicked? Container() : Icon(
                    Icons.keyboard_arrow_down,
                    size: 16.0,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
