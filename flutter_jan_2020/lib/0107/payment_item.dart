import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentItems extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final String price;

  PaymentItems({this.color, this.icon, this.text, this.price});

  @override
  Widget build(BuildContext context) {
    double padding = 16.0;

    return Container(
      margin: EdgeInsets.only(top: padding, bottom: padding),
      height: 36.0,
      child: Row(
        children: <Widget>[
          // left circle container
          Container(
            margin: EdgeInsets.only(right: padding),
            height: 36.0,
            width: 36.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
              boxShadow: [BoxShadow(
                color: Colors.black12,
                spreadRadius: 2.0,
                blurRadius: 2.0,
                offset: Offset(2.0, 2.0),
              )],
            ),
            child: Center(
              child: Icon(
                icon,
                size: 16.0,
                color: Colors.white,
              ),
            ),
          ),

          // center column
          Flexible(
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // text: Transfer into
                Text(text,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                // text: biya
                Text("Biya",
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),

          // text: price
          Text(price,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
