import 'package:flutter/material.dart';

// https://www.instagram.com/p/B4KVPEBgSlM/?igshid=mf7es8ogwyaw

class PlateApp extends StatefulWidget {
  @override
  _PlateAppState createState() => _PlateAppState();
}

class _PlateAppState extends State<PlateApp> {
  // string
  String _bottomImage = "assets/0109/image3.png";

  // double
  double padding = 16.0;
  double radius = 8.0;

  double swipeDirection = 0.0;
  double positionY = -500.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // background top list view

          // appbar
          Positioned(
            top: 0,
            left: 0,
            right: padding,
            child: SafeArea(
              top: true,
              left: true,
              right: true,
              child: Container(
                height: 40.0,
                child: Row(
                  children: <Widget>[
                    // left icon
                    IconButton(
                      onPressed: (){},
                      icon: Icon(
                        Icons.arrow_back,
                        size: 28.0,
                        color: Colors.pink,
                      ),
                    ),

                    // spacer
                    Spacer(),

                    // right icon
                    Container(
                      height: 40.0,
                      width: 40.0,
                      child: Stack(
                        children: <Widget>[
                          // icon in container
                          Positioned(
                            top: 2.0,
                            left: 2.0,
                            right: 2.0,
                            bottom: 2.0,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.pink,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.shopping_basket,
                                  size: 16.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),

                          // badges
                          Positioned(
                            top: 2.0,
                            right: 2.0,
                            child: Container(
                              height: 12.0,
                              width: 12.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.pink,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1.0,
                                ),
                              ),
                              child: Center(
                                child: Text("1",
                                  style: TextStyle(
                                    fontSize: 6.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
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
              ),
            ),
          ),

          // main page view

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

          // add to cart container
          Positioned(
            left: padding,
            right: padding,
            bottom: 80.0,
            child: Container(
              height: 48.0 + 64.0,
              child: Column(
                children: <Widget>[
                  // add to cart
                  Container(
                    height: 48.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      color: Colors.black,
                    ),
                    child: Center(
                      child: Text("add to cart",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),

                  // swipe to see recipe
                  GestureDetector(
                    onVerticalDragStart: (DragStartDetails dragDetails){},
                    onVerticalDragUpdate: (DragUpdateDetails dragDetails){
                      setState(() {
                        swipeDirection = dragDetails.delta.direction;

//                        print("swipeDirection = $swipeDirection");

                        if(swipeDirection > 0){
                          print("swipe up");
                          positionY = -500.0;
                        } else {
                          print("swipe down");
                          positionY = 0.0;
                        }
                      });
                    },
                    onVerticalDragEnd: (DragEndDetails dragDetails){},
                    child: Container(
                      height: 64.0,
                      child: Center(
                        child: Text("Swipe To See Recipe",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // recipe page
          AnimatedPositioned(
            duration: Duration(seconds: 2),
            curve: Curves.fastLinearToSlowEaseIn,
            left: 0,
            right: 0,
            bottom: positionY,
            child: Container(
              height: 500.0,
              child: Placeholder(),
            ),
          ),
        ],
      ),
    );
  }
}
