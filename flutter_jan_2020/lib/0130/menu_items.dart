import 'package:flutter/material.dart';
import 'package:flutter_jan_2020/0130/items_list.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItems extends StatelessWidget {
  final int index;
  final Function onPressed;

  MenuItems({this.onPressed, this.index});

  // double
  double padding = 8.0;
  double radius = 24.0;

  // topRight indicator width
  double indicatorWidth = 8.0;

  // is clicked? or not
  bool isSelected = false;

  // selected container color
  Color _color = Color.fromRGBO(255, 176, 40, 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              child: Stack(
                children: <Widget>[
                  // container
                  InkWell(
                    onTap: onPressed,
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      margin: EdgeInsets.all(padding * 2.5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(radius),
                        color: items[index].isSelected? _color : Colors.black,
                        boxShadow: [BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1.0,
                          blurRadius: 1.0,
                          offset: Offset(1.0, 1.0),
                        )],
                      ),
                      child: Center(
                        child: Icon(
                          items[index].icon,
                          size: 28.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  // topRight indicator
                  Positioned(
                    top: padding,
                    right: padding,
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: indicatorWidth,
                      width: items[index].isSelected? indicatorWidth : 0.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 1.0,
                            blurRadius: 1.0,
                            offset: Offset(1.0, 1.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // text
          Text(
            items[index].title,
            style: GoogleFonts.poppins(
              fontSize: 14.0,
              color: Colors.black,
              fontWeight: FontWeight.w400,
              height: 1.0,
              shadows: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 6.0,
                  blurRadius: 6.0,
                  offset: Offset(6.0, 6.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
