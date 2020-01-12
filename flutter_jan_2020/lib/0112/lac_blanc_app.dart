import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// https://www.instagram.com/p/B6HdoSfIbFG/

class LacBlancApp extends StatefulWidget {
  @override
  _LacBlancAppState createState() => _LacBlancAppState();
}

class _LacBlancAppState extends State<LacBlancApp>
    with SingleTickerProviderStateMixin {
  // image
  String _image = "assets/0112/image.png";

  String title = "Lac Blanc";

  // animation
  AnimationController _animationController;
  Animation<double> _animation;

  double _fraction = 0.0; // _animation.value

  double padding = 16.0;
  double radius = 12.0;

  double marginBottom = -160.0;
  double marginBottomSheet = -160.0;
  double textMargin = 64.0;
  double columnMargin = 200.0;

  bool showText = false;
  bool showCanvas = false;

  // color
  Color _bottomColor = Color.fromRGBO(232, 91, 107, 1);

  @override
  void initState() {
    _animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this)
          ..forward();

    _animation =
        Tween<double>(begin: 0.0, end: 2.0).animate(_animationController)
          ..addListener(() {
            setState(() {
              _fraction = _animation.value;

              // show bottom sheet
              if (_fraction > 0.0) marginBottom = 0.0;

              if (_fraction > 0.50) {
                marginBottomSheet = 0.0;
              }

              // show text
              if (_fraction > 1.5) {
                showText = true;
                textMargin = padding * 2;
                columnMargin = 140.0;
              }

              // show custom line
              if (_fraction >= 2.0) {
                showCanvas = true;
              }
            });
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
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // background color
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blueGrey,
                    Color.fromRGBO(89, 113, 150, 1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                ),
              ),
              child: Stack(
                children: <Widget>[
                  // image
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.fastLinearToSlowEaseIn,
                    left: 0,
                    right: 0,
                    bottom: 500.0 * (_fraction - 2.0),
                    height: screenHeight,
                    child: Image.asset(
                      _image,
                      fit: BoxFit.cover,
                      color: Colors.blueGrey.withOpacity(0.20),
                      colorBlendMode: BlendMode.darken,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // topLeft container
          Positioned(
            top: padding,
            left: 0,
            child: SafeArea(
              child: Container(
                height: 64.0,
                width: 64.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(radius),
                    bottomRight: Radius.circular(radius),
                  ),
                  color: Colors.grey[500].withOpacity(0.50),
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
                    Icons.arrow_back_ios,
                    size: 12.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          // text: center title
          AnimatedPositioned(
            duration: Duration(seconds: 2),
            curve: Curves.fastLinearToSlowEaseIn,
            top: textMargin,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Center(
                child: showText
                    ? Text(
                        title,
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 4.0,
                              blurRadius: 4.0,
                              offset: Offset(4.0, 4.0),
                            )
                          ],
                        ),
                      )
                    : Container(),
              ),
            ),
          ),

          // text: column
          AnimatedPositioned(
            duration: Duration(seconds: 2),
            curve: Curves.fastLinearToSlowEaseIn,
            top: columnMargin,
            left: padding,
            height: 250.0,
            width: 200.0,
            child: showText
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // 1
                      // text: Sun 12 Jan
                      Text(
                        "Sun 12 Jan",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
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

                      // Row: text: 9도 & icon: sunny
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          // text: 9
                          Text(
                            "9",
                            style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
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

                          SizedBox(width: padding / 3),

                          // text: 도씨
                          Text(
                            "℃",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
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

                          SizedBox(width: padding / 3),

                          // icon: sunny
                          Icon(
                            FontAwesomeIcons.cloudSun,
                            size: 14.0,
                            color: Colors.white,
                          ),
                        ],
                      ),

                      // spacer
                      Spacer(),

                      // 2
                      // text: Distance
                      Text(
                        "Distance",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
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

                      // Row: text: 15 km
                      Row(
                        children: <Widget>[
                          // text: 15
                          Text(
                            "15",
                            style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
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

                          SizedBox(width: padding / 3),

                          // text: km
                          Text(
                            "km",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
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

                      // spacer
                      Spacer(),

                      // 3
                      // text: Price per one
                      Text(
                        "Price per one",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
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

                      // Row: text: 945 won
                      Row(
                        children: <Widget>[
                          // text: 15
                          Text(
                            "945",
                            style: TextStyle(
                              fontSize: 40.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
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

                          SizedBox(width: padding / 3),

                          // text: km
                          Text(
                            "\$",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
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

                      // spacer
                      Spacer(),

                      // 4
                      // text: more in container
                      Container(
                        height: 24.0,
                        width: 64.0,
                        decoration: ShapeDecoration(
                          shape: StadiumBorder(),
                          color: _bottomColor,
                          shadows: [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 1.0,
                              blurRadius: 1.0,
                              offset: Offset(1.0, 1.0),
                            )
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "more",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
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
                        ),
                      ),
                    ],
                  )
                : Container(),
          ),

          // bottom container: book now!
          AnimatedPositioned(
            duration: Duration(seconds: 3),
            curve: Curves.fastLinearToSlowEaseIn,
            left: 0,
            right: 0,
            bottom: marginBottomSheet,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: padding),
              height: 52.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radius),
                  topRight: Radius.circular(radius),
                ),
                color: _bottomColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 1.0,
                    blurRadius: 1.0,
                    offset: Offset(1.0, 1.0),
                  )
                ],
              ),
              child: Row(
                children: <Widget>[
                  // text: Book Now
                  Text(
                    "Book Now",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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

                  // spacer
                  Spacer(),

                  // icon: walking people
                  Icon(
                    Icons.directions_walk,
                    size: 28.0,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),

          // climb line
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: showCanvas? CustomPaint(
              size: Size(400.0, 700.0 * _fraction / 2),
              painter: ClimbLine(showCanvas),
            ) : Container(),
          ),
        ],
      ),
    );
  }
}

class ClimbLine extends CustomPainter {
  final bool showCanvas;

  ClimbLine(this.showCanvas);

  // start point
  double startHeight = 14.0;
  double startWidth = 48.0;

  double margin = 6.0;

  // end point
  double endHeight = 8.0;
  double endWidth = 32.0;

  // startPoint Color
  Color _startColor = Color.fromRGBO(23, 253, 93, 1);

  // endPoint Color
  Color _endColor = Color.fromRGBO(219, 93, 112, 1);

  @override
  void paint(Canvas canvas, Size size) {
    // start point dx dy
    Offset startOffset = Offset(size.width * 0.30, size.height * 0.85);

    // end point dx dy
    Offset endOffset = Offset(size.width * 0.62, size.height * 0.25);

    // start point
    showCanvas? canvas.drawOval(
        Rect.fromCenter(
          height: startHeight,
          width: startWidth,
          center: Offset(startOffset.dx, startOffset.dy),
        ),
        Paint()
          ..style = PaintingStyle.fill
          ..color = _startColor
          ..strokeCap = StrokeCap.round) : Container();

    // start point wave
    showCanvas? canvas.drawOval(
        Rect.fromCenter(
          height: startHeight + margin,
          width: startWidth + margin,
          center: Offset(startOffset.dx, startOffset.dy),
        ),
        Paint()
          ..style = PaintingStyle.stroke
          ..color = _startColor
          ..strokeWidth = 0.50
          ..strokeCap = StrokeCap.round) : Container();

    // line
    var path = Path()
      ..moveTo(endOffset.dx, endOffset.dy)
      ..quadraticBezierTo(size.width * 0.60, size.height * 0.30,
          size.width * 0.75, size.height * 0.35)
      ..quadraticBezierTo(size.width * 0.90, size.height * 0.45,
          size.width * 0.50, size.height * 0.48)
      ..quadraticBezierTo(size.width * 0.40, size.height * 0.50,
          size.width * 0.45, size.height * 0.60)
      ..quadraticBezierTo(size.width * 0.55, size.height * 0.70,
          startOffset.dx, startOffset.dy);

    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..shader = LinearGradient(
        colors: [
          _endColor,
          Colors.orange,
          Colors.yellow,
          _startColor],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [
        0.2,
        0.3,
        0.5,
        1.0
      ])
          .createShader(
          Rect.fromLTWH(16.0, 16.0, 400.0, 700.0),
      )
      ..strokeWidth = 4.0;

    showCanvas? canvas.drawPath(path, paint) : Container();

    // end point
    showCanvas? canvas.drawOval(
        Rect.fromCenter(
          height: endHeight,
          width: endWidth,
          center: Offset(endOffset.dx, endOffset.dy),
        ),
        Paint()
          ..style = PaintingStyle.fill
          ..color = _endColor
          ..strokeCap = StrokeCap.round) : Container();

    // end point wave
    showCanvas? canvas.drawOval(
        Rect.fromCenter(
          height: endHeight + margin,
          width: endWidth + margin,
          center: Offset(endOffset.dx, endOffset.dy),
        ),
        Paint()
          ..style = PaintingStyle.stroke
          ..color = _endColor
          ..strokeWidth = 0.50
          ..strokeCap = StrokeCap.round) : Container();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
