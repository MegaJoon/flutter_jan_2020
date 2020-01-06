import 'dart:math';

import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  final int index;

  CardList(this.index);

  final double widgetWidth = 120.0;

  // offset Function
  _offSetXY(int index){
    switch (index) {
      case 0:
        return Offset(0.0, 0.0);
        break;

      case 1:
        return Offset(widgetWidth * 1.70, 120.0);
        break;

      case 2:
        return Offset(widgetWidth * 1.70, 340.0);
        break;

      case 3:
        return Offset(0.0, 460.0);
        break;

      case 4:
        return Offset(-widgetWidth * 1.70, 340.0);
        break;

      case 5:
        return Offset(-widgetWidth * 1.70, 120.0);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // color
    List<Color> _colors = [
      Colors.red,
      Colors.amber,
      Colors.teal,
      Colors.indigo,
      Colors.pink,
      Colors.black,
    ];

    List<Widget> cards = [];

    for(int i = 0; i < _colors.length; i++){
      var cardItem = Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Transform.translate(
          offset: _offSetXY((i + index) %6),
          child: Transform.rotate(
            angle: pi / 3 * (i + index),
            child: Center(
              child: Container(
                height: 180.0,
                width: widgetWidth,
                color: _colors[i],
                child: Center(
                  child: Text(i.toString(),
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      cards.add(cardItem);
    }

    return Stack(
      children: cards,
    );
  }
}
