import 'dart:math';

import 'package:flutter/material.dart';

// https://www.instagram.com/p/B6xmOMFhyvN/?igshid=v3ru2e5ua0ra

class GuitarApp extends StatefulWidget {
  @override
  _GuitarAppState createState() => _GuitarAppState();
}

class _GuitarAppState extends State<GuitarApp> with TickerProviderStateMixin {
  // transform animation
  AnimationController _transformAnimationController;
  Animation<double> transformAnimation;

  // slide animation
  AnimationController _slideAnimationController;
  Animation<double> slideAnimation;

  @override
  void initState() {
    // transform animation
    _transformAnimationController = AnimationController(duration: Duration(seconds: 2), vsync: this)
    ..forward();

    transformAnimation = Tween<double>(begin: 0.0, end: pi /2 - 0.01).animate(
      CurvedAnimation(parent: _transformAnimationController,
      curve: Curves.fastLinearToSlowEaseIn),
    )
    ..addListener((){
      setState(() {
      });
    })
    ..addStatusListener((status){
      setState(() {
        if(status == AnimationStatus.completed){
          _transformAnimationController.reverse();
        } else if(status == AnimationStatus.dismissed){
          _transformAnimationController.forward();
        }
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _transformAnimationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // screenHeight
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // top transform page
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: screenHeight,
            child: Transform(
              transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateX(-transformAnimation.value),
              alignment: FractionalOffset.center,
              child: Container(
                color: Colors.teal,
                child: Placeholder(),
              ),
            ),
          ),

          // bottom slide page
          Positioned(
            top: screenHeight,
            left: 0,
            right: 0,
            height: screenHeight,
            child: Container(
              color: Colors.amber,
              child: Placeholder(),
            ),
          ),
        ],
      ),
    );
  }
}
