import 'dart:math';

import 'package:flutter/material.dart';

// https://www.instagram.com/p/B1yZ_jEgc_I/?igshid=1ko34i9ovlbbr

class ChooseCharacterApp extends StatefulWidget {
  @override
  _ChooseCharacterAppState createState() => _ChooseCharacterAppState();
}

class _ChooseCharacterAppState extends State<ChooseCharacterApp> {
  double itemsWidth = 140.0;
  double marginLeft = 2 * 140.0;

  List<Color> _colors = [Colors.red, Colors.amber, Colors.teal, Colors.pink, Colors.indigo, Colors.black];

  // return offset Function
  _positionXY(int index){
    double boxWidth = 140.0 * index;

    switch (index) {
      case 0:
        return Offset(0.0  - 10.0 * index, 0.0);
        break;

      case 1:
        return Offset(60.0 - 10.0 * index, 30.0);
        break;

      case 2:
        return Offset(60.0 - 10.0 * index, 80.0);
        break;

      case 3:
        return Offset(0.0 - 10.0 * index, 120.0);
        break;

      case 4:
        return Offset(-60.0 - 10.0 * index, 80.0);
        break;

      case 5:
        return Offset(-60.0 - 10.0 * index, 30.0);
        break;
    }
  }

  // list view controller
  ScrollController _scrollController;

  // animate list view
  _scrollPage(bool direction){
    setState(() {
      _scrollController.animateTo(
//        marginLeft += direction? itemsWidth/2 : -itemsWidth/2,
        marginLeft += direction? -50.0 : 50.0,
        duration: Duration(milliseconds: 100),
        curve: Curves.fastLinearToSlowEaseIn,
      );
      print("marginLeft = $marginLeft");
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController(
      initialScrollOffset: marginLeft
    )
    ..addListener((){
      setState(() {
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // container
          Positioned(
            top: 150.0,
            left: -150.0,
            right: -500.0,
            bottom: -100.0,
            // list view
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _colors.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(left: marginLeft),
//              physics: NeverScrollableScrollPhysics(),
              controller: _scrollController,
              itemBuilder: (context, index){
                return Container(
                  margin: EdgeInsets.only(bottom: 400.0),
                  width: itemsWidth,
                  color: _colors[index],
                  child: Center(
                    child: Text(index.toString(),
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // center btn
          Positioned(
            bottom: 120.0,
            left: 0,
            right: 0,
            child: Container(
              height: 40.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // prev btn
                  InkWell(
                    onTap: (){
                      print("prev btn");
                      _scrollPage(false);
                    },
                    child: Container(
                      height: 40.0,
                      width: 100.0,
                      child: Placeholder(),
                    ),
                  ),

                  // next btn
                  InkWell(
                    onTap: (){
                      print("next btn");
                      _scrollPage(true);
                    },
                    child: Container(
                      height: 40.0,
                      width: 100.0,
                      child: Placeholder(),
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