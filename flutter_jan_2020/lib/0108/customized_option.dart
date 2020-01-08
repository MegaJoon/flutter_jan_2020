import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// https://www.instagram.com/p/B3vE9t3A2Lu/?igshid=u2rv4ko1i8dr

class CustomizedOption extends StatefulWidget {
  @override
  _CustomizedOptionState createState() => _CustomizedOptionState();
}

class _CustomizedOptionState extends State<CustomizedOption> with SingleTickerProviderStateMixin {
  // color
  Color _backgroundColor = Color.fromRGBO(225, 241, 254, 1);

  // double
  double padding = 24.0;
  double bottomPosition = -150.0;

  // animation
  AnimationController _animationController;

  // on clicked floating btn
  bool isClicked = false;

  // onClicked Function
  _onPressed(){
    setState(() {
      print("on clicked : floating btn");
      isClicked = !isClicked;

      if(isClicked){
        // on clicked => forward
        _animationController.forward();
        bottomPosition = 0.0;
      } else {

        // on clicked again => reverse
        _animationController.reverse();
        bottomPosition = -150.0;
      }
    });
  }

  @override
  void initState() {
    _animationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // set background color
      backgroundColor: _backgroundColor,

      // body -*
      body: Stack(
        children: <Widget>[
          // bottom sheet
          AnimatedPositioned(
            // add animation
            duration: Duration(seconds: 1),
            curve: Curves.fastLinearToSlowEaseIn,
            left: 0,
            right: 0,
            bottom: bottomPosition,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: padding),
              height: 200.0,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // top container
                  Container(
                    height: 50.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        isClicked? Container() : Icon(
                          FontAwesomeIcons.wallet,
                          size: 24.0,
                          color: Colors.black,
                        ),
                        isClicked? Container() : Icon(
                          FontAwesomeIcons.chartBar,
                          size: 24.0,
                          color: Colors.grey,
                        ),

                        // center : floating btn
                        InkWell(
                          onTap: (){
                            _onPressed();
                          },
                          child: Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            child: Center(
                              child: AnimatedIcon(
                                icon: AnimatedIcons.menu_close,
                                size: 20.0,
                                color: Colors.white,
                                progress: _animationController,
                              ),
                            ),
                          ),
                        ),

                        isClicked? Container() : Icon(
                          Icons.credit_card,
                          size: 24.0,
                          color: Colors.grey,
                        ),
                        isClicked? Container() : Icon(
                          Icons.person_outline,
                          size: 24.0,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),

                  // bottom container
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: padding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // list 1
                          Row(
                            children: <Widget>[
                              // left icon
                              Icon(
                                FontAwesomeIcons.landmark,
                                size: 20.0,
                                color: Colors.blueGrey,
                              ),

                              // spacer
                              SizedBox(
                                width: padding,
                              ),

                              // right text
                              Text("Bank transfer",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),

                          // list 2
                          Row(
                            children: <Widget>[
                              // left icon
                              Icon(
                                FontAwesomeIcons.moneyBill,
                                size: 20.0,
                                color: Colors.blueGrey,
                              ),

                              // spacer
                              SizedBox(
                                width: padding,
                              ),

                              // right text
                              Text("Request",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),

                          // list 3
                          Row(
                            children: <Widget>[
                              // left icon
                              Icon(
                                FontAwesomeIcons.exchangeAlt,
                                size: 20.0,
                                color: Colors.blueGrey,
                              ),

                              // spacer
                              SizedBox(
                                width: padding,
                              ),

                              // right text
                              Text("Exchange",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
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
