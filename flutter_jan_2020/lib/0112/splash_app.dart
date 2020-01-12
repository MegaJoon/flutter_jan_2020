import 'dart:math';

import 'package:flutter/material.dart';

// https://www.pinterest.co.kr/pin/337207090844787954/

class SplashApp extends StatefulWidget {
  @override
  _SplashAppState createState() => _SplashAppState();
}

class _SplashAppState extends State<SplashApp> {
  // list<emotion>
  List<Widget> emotions = [];

  // string
  String title = "Please rate your\nexperience";
  String subTitle = "\nDo let us know your thoughts.\nYour feedback matters!";

  // double
  double padding = 16.0;

  // widget index
  int currentIndex = 0;

  // fill white color sig
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // background color
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange, Colors.deepOrange],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),

          // column
          Positioned(
            top: padding,
            left: padding,
            right: padding,
            bottom: padding,
            child: SafeArea(
              top: true,
              left: true,
              right: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // text: title
                  Text(title,
                    style: TextStyle(
                      fontSize: 36.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      height: 0.8,
                    ),
                  ),

                  // text: subTitle
                  Text(subTitle,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      height: 1.0,
                    ),
                  ),

                  SizedBox(height: padding /2),

                  // btn: SKIP
                  InkWell(
                    onTap: (){
                      print("on clicked: SKIP btn");
                    },
                    child: Text("SKIP".toUpperCase(),
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),

                  // emotion
                  Flexible(
                    fit: FlexFit.tight,
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      padding: EdgeInsets.only(top: padding),
                      width: MediaQuery.of(context).size.width,
                      child: CustomPaint(
                        painter: CustomEmotions(currentIndex),
                      ),
                    ),
                  ),

                  // index indicator
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    margin: EdgeInsets.only(top: padding),
                    height: 52.0,
                    decoration: ShapeDecoration(
                      shape: StadiumBorder(),
                      color: Colors.black12,
                    ),
                    child: Placeholder(),
                  ),

                  // container: submit
                  InkWell(
                    onTap: (){
                      setState(() {
//                        print("Submit: currentIndex++");
                        currentIndex++;
                        print("currentIndex = $currentIndex");
                        isClicked = true;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      margin: EdgeInsets.only(top: padding),
                      height: 52.0,
                      decoration: ShapeDecoration(
                        shape: StadiumBorder(
                          side: BorderSide(
                              color: Colors.white,
                              width: 2.5,
                          ),
                        ),
                        color: isClicked? Colors.white : null,
                      ),
                      child: Center(
                        child: Text("Submit",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
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

class CustomEmotions extends CustomPainter {
  final int index;

  CustomEmotions(this.index);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..strokeWidth = 2.0
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    // left eye
    canvas.drawCircle(Offset(16.0, 16.0), 16.0, paint);

    // right eye
    canvas.drawCircle(Offset(size.width - 16.0, 16.0), 16.0, paint);

    // mouse
    switch (index) {
      case 0:
        var path = Path()
          ..moveTo(size.width / 2 - 80.0, 150.0)
          ..lineTo(size.width / 2 + 80.0, 120.0)
          ..close();

        var paint = Paint()
          ..strokeWidth = 32.0
          ..color = Colors.black
          ..style = PaintingStyle.stroke;

        canvas.drawPath(path, paint);
        break;

      case 1:
        var path = Path()
          ..moveTo(size.width /2 - 80.0, 180.0)
          ..quadraticBezierTo(size.width /2, 150.0, size.width /2 + 80.0, 180.0)
          ..close();

        var paint1 = Paint()
          ..strokeWidth = 32.0
          ..color = Colors.black
          ..style = PaintingStyle.stroke;

        // mouse
        canvas.drawPath(path, paint1);
        break;

    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
