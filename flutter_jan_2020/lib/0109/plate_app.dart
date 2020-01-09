import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_jan_2020/0109/plate_list.dart';

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

  // page view
  PageController _pageController;
  int _currentIndex = 0;

  // scroll controller
  ScrollController _scrollController;

  ValueNotifier<double> notifier;

  _onScroll(){
    notifier.value = _pageController.page;

    onChanged(notifier.value * MediaQuery.of(context).size.width);
  }

  onChanged(double position){
    setState(() {
      _scrollController.animateTo(
          position,
          duration: Duration(microseconds: 10),
          curve: Curves.fastLinearToSlowEaseIn,
      );
    });
  }

  @override
  void initState() {
    notifier = ValueNotifier<double>(0);

    _pageController = PageController(initialPage: _currentIndex)
    ..addListener(_onScroll);

    _scrollController = ScrollController(initialScrollOffset: 0);
    super.initState();
  }

  @override
  void dispose() {
    notifier?.dispose();
    _pageController?.dispose();
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // background top list view
          Positioned(
            top: -150.0,
            left: 0,
            right: 0,
            height: 500.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                controller: _scrollController,
                itemCount: plates.length,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemBuilder: (context, index){
                  return ClipRRect(
                    child: Container(
                      width: screenWidth,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            plates[index].image),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 2.0,
                          sigmaY: 2.0,
                        ),
                        child: Container(
                          color: Colors.white.withOpacity(0.01),
                        ),
                      ),
                    ),
                  );
                },),
          ),

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
                      onPressed: (){
                        setState(() {
                          print("positionY");
                          positionY = -500.0;
                        });
                      },
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
          Positioned(
            top: 150.0,
            left: 0,
            right: 0,
            bottom: 210.0,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: plates.length,
              controller: _pageController,
              onPageChanged: (int currentIndex){
                setState(() {
                  _currentIndex = currentIndex;
                });
                },
              itemBuilder: (context, index){
                double angle = (notifier.value - index) * 8.0;

                return Container(
                  child: Column(
                    children: <Widget>[
                      // image
                      Flexible(
                        fit: FlexFit.tight,
                        child: Transform.translate(
                          offset: Offset(0.0, _currentIndex == index? 0.0 : 80.0),
                          child: Transform(
                            transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..rotateZ(angle),
                            alignment: FractionalOffset.center,
                            child: Image.asset(
                              plates[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),

                      // text: title
                      Text(plates[index].title,
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                        ),
                      ),

                      // text: price
                      Text(plates[index].price,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.pink,
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                );
                },
            ),
          ),

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
              padding: EdgeInsets.all(padding),
              height: 500.0,
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 2.0,
                  blurRadius: 2.0,
                )],

                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 80.0,
                    child: Row(
                      children: <Widget>[
                        // fruit image
                        Container(
                          margin: EdgeInsets.only(right: padding),
                          width: 150.0,
                          child: Image.asset(
                            "assets/0109/image10.png",
                            fit: BoxFit.fill,
                          ),
                        ),

                        // fruit text
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            // text: fruit name
                            Text("Orange",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            // text: weight
                            Text("50g",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 80.0,
                    child: Row(
                      children: <Widget>[
                        // fruit image
                        Container(
                          margin: EdgeInsets.only(right: padding),
                          width: 150.0,
                          child: Image.asset(
                            "assets/0109/image11.png",
                            fit: BoxFit.fill,
                          ),
                        ),

                        // fruit text
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            // text: fruit name
                            Text("Blueberries",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            // text: weight
                            Text("50g",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 80.0,
                    child: Row(
                      children: <Widget>[
                        // fruit image
                        Container(
                          margin: EdgeInsets.only(right: padding),
                          width: 150.0,
                          child: Image.asset(
                            "assets/0109/image12.png",
                            fit: BoxFit.fill,
                          ),
                        ),

                        // fruit text
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            // text: fruit name
                            Text("Pancakes",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            // text: weight
                            Text("50g",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 80.0,
                    child: Row(
                      children: <Widget>[
                        // fruit image
                        Container(
                          margin: EdgeInsets.only(right: padding),
                          width: 150.0,
                          child: Image.asset(
                            "assets/0109/image13.png",
                            fit: BoxFit.fill,
                          ),
                        ),

                        // fruit text
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            // text: fruit name
                            Text("Honey",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            // text: weight
                            Text("50g",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // add ingridients
                  InkWell(
                    onTap: (){
                      print("on clicked");
                    },
                    child: Container(
                      height: 64.0,
                      width: screenWidth,
                      child: CustomPaint(
                        painter: BorderContainer(),
                        child: Center(
                          child: Text("Add Ingridients",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.pink,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
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

class BorderContainer extends CustomPainter{
  double width = 3.0;

  @override
  void paint(Canvas canvas, Size size) {
    var colorPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.pink
      ..strokeWidth = 2.0;

    var spacePaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.white
      ..strokeWidth = 2.0;

    // left line
    for(double i = 0.0; i < size.height - width; i = i + width *2){
      // color line
      canvas.drawLine(
          Offset(0.0, i),
          Offset(0.0, i + width),
          colorPaint);

      // white line
      canvas.drawLine(
          Offset(0.0, i + width),
          Offset(0.0, i + width * 2),
          spacePaint);
    }

    // bottom line
    for(double i = 0.0; i < size.width - width; i = i + width *2){
      // color line
      canvas.drawLine(
          Offset(i, size.height),
          Offset(i + width, size.height),
          colorPaint);

      // white line
      canvas.drawLine(
          Offset(i + width, size.height),
          Offset(i + width * 2, size.height),
          spacePaint);
    }

    // right line
    for(double i = 0.0; i < size.height - width; i = i + width *2){
      // color line
      canvas.drawLine(
          Offset(size.width, i),
          Offset(size.width, i + width),
          colorPaint);

      // white line
      canvas.drawLine(
          Offset(size.width, i + width),
          Offset(size.width, i + width * 2),
          spacePaint);
    }

    // top line
    for(double i = 0.0; i < size.width - width; i = i + width *2){
      // color line
      canvas.drawLine(
          Offset(i, 0.0),
          Offset(i + width, 0.0),
          colorPaint);

      // white line
      canvas.drawLine(
          Offset(i + width, 0.0),
          Offset(i + width * 2, 0.0),
          spacePaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}























