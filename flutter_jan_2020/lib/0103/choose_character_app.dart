import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_jan_2020/0103/card_list.dart';

// https://www.instagram.com/p/B1yZ_jEgc_I/?igshid=1ko34i9ovlbbr

class ChooseCharacterApp extends StatefulWidget {
  @override
  _ChooseCharacterAppState createState() => _ChooseCharacterAppState();
}

class _ChooseCharacterAppState extends State<ChooseCharacterApp> {
  // double
  double radius = 12.0;
  double padding = 16.0;

  // page index
  int index = 0;

  // string
  String title = "Choose a Character";

  Color _backgroundColor = Colors.deepPurple.withOpacity(0.30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          // appbar
          Container(
            height: 180.0,
            child: Stack(
              children: <Widget>[
                // left background
                Positioned(
                  top: 0,
                  left: -50.0,
                  child: Transform.rotate(
                    angle: 0.78,
                    child: Container(
                      height: 150.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(radius),
                        color: _backgroundColor,
                      ),
                    ),
                  ),
                ),

                // right background
                Positioned(
                  top: 20.0,
                  left: 80.0,
                  child: Transform.rotate(
                    angle: 0.78,
                    child: Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(radius),
                        color: _backgroundColor,
                      ),
                    ),
                  ),
                ),

                // text: title
                Positioned(
                  top: padding,
                  left: padding,
                  child: SafeArea(
                    top: true,
                    left: true,
                    right: true,
                    child: Text(title,
                      style: TextStyle(
                        fontSize: 28.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // main
          Flexible(
            fit: FlexFit.tight,
            child: Stack(
              children: <Widget>[
                // card
                Positioned.fill(
                    child: CardList(index),
                ),

                // center container
                Positioned(
                  top: 300.0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      height: 40.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // prev btn
                          InkWell(
                            onTap: (){
                              setState(() {
                                index++;
                              });
                            },
                            child: Container(
                              width: 100.0,
                              child: Placeholder(),
                            ),
                          ),

                          SizedBox(width: padding),

                          // next btn
                          InkWell(
                            onTap: (){
                              setState(() {
                                index--;
                              });
                            },
                            child: Container(
                              width: 100.0,
                              child: Placeholder(),
                            ),
                          ),
                        ],
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
}