import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_jan_2020/0107/card_list.dart';
import 'package:flutter_jan_2020/0107/payment_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scrollable_bottom_sheet/scrollable_bottom_sheet.dart';
import 'package:scrollable_bottom_sheet/scrollable_controller.dart';

// second page

class CardDetailsPage extends StatefulWidget {
  final int index;

  CardDetailsPage(this.index);

  @override
  _CardDetailsPageState createState() => _CardDetailsPageState();
}

class _CardDetailsPageState extends State<CardDetailsPage> {
  // double
  double padding = 16.0;
  double radius = 16.0;

  double positionY = 0.0;

  // string
  String _image = "assets/0107/image.png";
  String _currentState = "min";

  // bool
  bool isBackSide = false;

  // controller
  final controller = ScrollableController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // set background color
      backgroundColor: Colors.black,

      // main-
      body: Stack(
        children: <Widget>[
          // main column
          Column(
            children: <Widget>[
              // appbar
              SafeArea(
                  top: true,
                  left: true,
                  right: true,
                  child: Row(
                    children: <Widget>[
                      // left icon
                      IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          size: 28.0,
                          color: Colors.white,
                        ),
                      ),

                      // spacer
                      Spacer(),

                      // right icon
                      IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.power_settings_new,
                          size: 28.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
              ),

              // text
              _currentState == "min"? RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  // text: Full card
                  TextSpan(text: "Full card\n",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  // text: Rotate -----
                  TextSpan(text: "Rotate the card to view the security code",
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      height: 1.5,
                    ),
                  ),
                ]),
              ) : Container(),

              // card image
              Hero(
                tag: "card ${widget.index}",
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      // on clicked: transform
                      print("on clicked : cards");

                    });
                  },

                  onVerticalDragStart: (DragStartDetails dragDetails){},

                  onVerticalDragUpdate: (DragUpdateDetails dragDetails){
                    setState(() {
                      positionY += dragDetails.delta.dy * 0.05;

                      if(positionY >= pi) positionY = 0.0;
                      if(positionY <= -pi) positionY = 0.0;

                      print("positionY = $positionY");

                      // back side :
                      if((positionY.abs() >= pi/2) && (positionY.abs() <= pi)){
                        print("back side");
                        isBackSide = true;
                      } else isBackSide = false;
                    });
                  },

                  onVerticalDragEnd: (DragEndDetails dragDetails){
                    setState(() {
                      if((positionY.abs() >= 0) && (positionY.abs() <= pi/2)){
                        positionY = 0;
                      } else positionY = pi;
                    });
                  },
                  child: Transform(
                    transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateX(positionY),
                    alignment: FractionalOffset.center,
                    child: isBackSide? Transform.rotate(
                      angle: pi,
                      child: Transform(
                        transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(pi),
                        alignment: FractionalOffset.center,
                        child: Container(
                          margin: EdgeInsets.only(
                            top: padding,
                            left: padding,
                            right: padding,
                          ),
                          height: 200.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(radius),
                            color: cards[widget.index].colors[0],
                          ),
                          child: Stack(
                            children: <Widget>[
                              // grey line
                              Positioned(
                                top: 20.0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: 40.0,
                                  color: Colors.grey.withOpacity(0.50),
                                ),
                              ),

                              // cvc
                              Positioned(
                                top: 80.0,
                                right: 40.0,
                                child: Container(
                                  height: 24.0,
                                  width: 80.0,
                                  color: Colors.white,
                                  child: Center(
                                    child: Text("4200 359",
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              // bottom text
                              Positioned(
                                right: padding,
                                bottom: padding,
                                child: Text("Service Hotline / 028-8278",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ) : Container(
                      padding: EdgeInsets.all(padding),
                      margin: EdgeInsets.only(
                          top: padding,
                          left: padding,
                          right: padding,
                      ),
                      height: 200.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(radius),
                        gradient: LinearGradient(
                          colors: [
                            cards[widget.index].colors[0],
                            cards[widget.index].colors[1],
                            cards[widget.index].colors[2],
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.2, 0.5, 1.0],
                          tileMode: TileMode.clamp,
                        ),
                      ),
                      child: Stack(
                        children: <Widget>[
                          // topLeft text: Credit card
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Text("Credit Card",
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          // topRight wifi icon
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Transform.rotate(
                              angle: 1.56,
                              child: Icon(
                                Icons.wifi,
                                size: 40.0,
                                color: Colors.white,
                              ),
                            ),
                          ),

                          // centerLeft image : sim card
                          Positioned(
                            top: 20.0,
                            left: 0,
                            height: 100.0,
                            width: 100.0,
                            child: Image.asset(_image),
                          ),

                          // bottomRight VISA text
                          cards[widget.index].cardName == "Visa"?
                          Positioned(
                              right: 0,
                              bottom: 0,
                              child: Text("Visa".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 36.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              )) :
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Transform.rotate(
                              angle: 1.56,
                              child: Container(
                                height: 64.0,
                                width: 40.0,
                                child: CustomPaint(
                                  painter: MasterLogo(),
                                ),
                              ),
                            ),
                          ),

                          // centerRight text: account
                          Positioned(
                            right: 0,
                            bottom: 60.0,
                            child: Text("**** **** **** ****",
                              style: TextStyle(
                                fontSize: 24.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // bottom scrollable sheet
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ScrollableBottomSheet(
              autoPop: false,
              snapBelow: true,
              snapAbove: true,
              scrollTo: ScrollState.minimum,
              minimumHeight: 200.0,
              halfHeight: 380.0,
              controller: controller,
              callback: (state){
                setState(() {
                  if(state == ScrollState.minimum){
                    _currentState = "min";
                    print("_currentState = $_currentState");

                  }
                  if(state == ScrollState.half){
                    _currentState = "half";
                    print("_currentState = $_currentState");
                  }
                  if(state == ScrollState.full){
                    _currentState = "full";
                    print("_currentState = $_currentState");
                  }
                });
              },
              child: Container(
                padding: EdgeInsets.only(top: padding, left: padding, right: padding),
                height: screenHeight - 80.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(radius *2),
                    topRight: Radius.circular(radius *2),
                  ),
                  color: Colors.grey[900],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // text: today
                    Text("Today",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // list view
                    Flexible(
                      fit: FlexFit.tight,
                      child: ListView(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: <Widget>[
                          // item
                          PaymentItems(
                            color: Colors.yellow,
                            icon: FontAwesomeIcons.file,
                            text: "Nike(Central Park)",
                            price: "-145.50",
                          ),
                          PaymentItems(
                            color: Colors.pink,
                            icon: FontAwesomeIcons.share,
                            text: "Transfer Into",
                            price: "+2000.00",
                          ),
                          PaymentItems(
                            color: Colors.grey,
                            icon: FontAwesomeIcons.music,
                            text: "Apple Music",
                            price: "-0.55",
                          ),
                          PaymentItems(
                            color: Colors.indigo,
                            icon: FontAwesomeIcons.share,
                            text: "Transfer Into",
                            price: "+2000.00",
                          ),

                          //
                          PaymentItems(
                            color: Colors.yellow,
                            icon: FontAwesomeIcons.file,
                            text: "Nike(Central Park)",
                            price: "-145.50",
                          ),
                          PaymentItems(
                            color: Colors.pink,
                            icon: FontAwesomeIcons.share,
                            text: "Transfer Into",
                            price: "+2000.00",
                          ),
                          PaymentItems(
                            color: Colors.grey,
                            icon: FontAwesomeIcons.music,
                            text: "Apple Music",
                            price: "-0.55",
                          ),
                          PaymentItems(
                            color: Colors.indigo,
                            icon: FontAwesomeIcons.share,
                            text: "Transfer Into",
                            price: "+2000.00",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MasterLogo extends CustomPainter{
  Color _masterColor = Color.fromRGBO(255, 182, 74, 1);
  Color _masterColor1 = Color.fromRGBO(254, 68, 14, 1);

  double padding = 8.0;
  double round = 20.0;
  double width = 40.0;  // r*2

  @override
  void paint(Canvas canvas, Size size) {
    // top circle
    var path1 = Path()
      ..lineTo(padding, padding)
      ..quadraticBezierTo(0.0, round, padding, width - padding)
      ..quadraticBezierTo(round, width - padding *2, width - padding, width - padding)
      ..quadraticBezierTo(width, round, width - padding, padding)
      ..quadraticBezierTo(round, 0.0, padding, padding)
      ..close();

    canvas.drawPath(
      path1,
      Paint()
        ..color = _masterColor,
    );

    // bottom circle
    var path2 = Path()
      ..lineTo(padding, width - padding)
      ..quadraticBezierTo(0.0, size.height - round, padding, size.height - padding)
      ..quadraticBezierTo(round, size.height, width - padding, size.height - padding)
      ..quadraticBezierTo(width, size.height - round, width - padding, width - padding)
      ..quadraticBezierTo(round, width, padding, width - padding)
      ..close();

    canvas.drawPath(
      path2,
      Paint()
        ..color = _masterColor1,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}