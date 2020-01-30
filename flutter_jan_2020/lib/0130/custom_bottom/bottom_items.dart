import 'package:flutter/material.dart';

import 'bottom_items_list.dart';

class BottomItems extends StatelessWidget {
  final int index;
  final bool isSelected;
  final Function onPressed;

  BottomItems({this.index, this.isSelected, this.onPressed});

  double boxHeight = 80.0;  // == boxWidth

  Color _color = Color.fromRGBO(128, 198, 246, 1);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: boxHeight,
        width: boxHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // icon
            Icon(
              items[index].icon,
              size: 32.0,
              color: Colors.grey[300],
            ),

            // text
            isSelected? Text(items[index].title,
              style: TextStyle(
                fontSize: 14.0,
                color: items[index].color,
                fontWeight: FontWeight.w600,
                shadows: [BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 6.0,
                  blurRadius: 6.0,
                  offset: Offset(6.0, 6.0),
                )],
              ),
            ) : Container(),
          ],
        ),
      ),
    );
  }
}
