import 'package:flutter/material.dart';
import 'package:flutter_jan_2020/0130/custom_bottom/bottom_items.dart';

import 'bottom_items_list.dart';

// https://www.pinterest.co.kr/pin/395050198579811531/

class CustomBottom extends StatefulWidget {
  @override
  _CustomBottomState createState() => _CustomBottomState();
}

class _CustomBottomState extends State<CustomBottom> {
  // list<widget> pages
  List<Widget> pages;

  // double
  double padding = 16.0;

  // floating btn height
  double boxHeight = 80.0;

  // bottom bar index
  int currentIndex = 0;

  // btn padding
  double btnPadding = 5.0;

  // moving floating btn padding
  double positionX = 16.0;

  // bottom bar on clicked event Function
  _onPressed(int index){
    setState(() {
      currentIndex = index;
      print("currentIndex = $currentIndex");
    });
  }

  @override
  Widget build(BuildContext context) {
    // set pages widget
    setPages();

    // space == spacer between boxHeight in bottom container
    double space = (MediaQuery.of(context).size.width  // screen Width
        - padding * 2  // remove side padding
        - boxHeight * 4)   // btn size
        / 3;

    // floating btn moving distance
    positionX = padding + (boxHeight + space) * currentIndex;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // background pages
          Positioned.fill(
              child: pages[currentIndex],
          ),

          // bottom bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: boxHeight + 28.0,
            child: Stack(
              children: <Widget>[
                // white box
                Positioned(
                  top: boxHeight / 2,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        BottomItems(
                          index: 0,
                          isSelected: currentIndex == 0,
                          onPressed: (){
                            _onPressed(0);
                          },
                        ),

                        BottomItems(
                          index: 1,
                          isSelected: currentIndex == 1,
                          onPressed: (){
                            _onPressed(1);
                          },
                        ),

                        BottomItems(
                          index: 2,
                          isSelected: currentIndex == 2,
                          onPressed: (){
                            _onPressed(2);
                          },
                        ),

                        BottomItems(
                          index: 3,
                          isSelected: currentIndex == 3,
                          onPressed: (){
                            _onPressed(3);
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                // moving floating btn
                AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  top: 0,
                  left: positionX,
                  child: Container(
                    padding: EdgeInsets.all(btnPadding),
                    height: boxHeight,
                    width: boxHeight,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: items[currentIndex].color,
                      ),
                      child: Center(
                        child: Icon(
                          items[currentIndex].icon,
                          size: 40.0,
                          color: Colors.white,
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
    );
  }

  // set pages
  setPages(){
    pages = [
      // initial pages
      Container(color: items[0].color),

      // ex
      Container(color: items[1].color),
      Container(color: items[2].color),
      Container(color: items[3].color),
    ];
  }
}
