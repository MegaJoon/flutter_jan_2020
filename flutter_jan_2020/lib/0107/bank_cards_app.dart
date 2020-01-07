import 'package:flutter/material.dart';

class BankCardsApp extends StatefulWidget {
  @override
  _BankCardsAppState createState() => _BankCardsAppState();
}

class _BankCardsAppState extends State<BankCardsApp> {
  // double
  double padding = 16.0;

  // string
  String title = "Bank Cards";

  // color
  Color _profileColor = Color.fromRGBO(241, 170, 255, 1);
  Color _profileColor1 = Color.fromRGBO(209, 195, 255, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // set background color
      backgroundColor: Colors.black,

      // main: body
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // appbar
          SafeArea(
            top: true,
            left: true,
            right: true,
            child: IconButton(
              onPressed: (){
                print("on clicked: icon arrow");
              },
              icon: Icon(
                Icons.arrow_back,
                size: 28.0,
                color: Colors.white,
              ),
            ),
          ),

          // title
          Container(
            margin: EdgeInsets.only(bottom: padding),
            padding: EdgeInsets.symmetric(horizontal: padding),
            height: 64.0,
            child: Row(
              children: <Widget>[
                // text: title
                Text(title,
                  style: TextStyle(
                    fontSize: 28.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // spacer
                Spacer(),

                // profile image
                Container(
                  height: 32.0,
                  width: 32.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [_profileColor, _profileColor1],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      // icon
                      Positioned(
                        left: -2.0,
                        right: 0,
                        bottom: -6.0,
                        child: Icon(
                          Icons.person,
                          size: 36.0,
                        color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // text: balance
          Padding(
            padding: EdgeInsets.only(left: padding),
            child: RichText(text: TextSpan(children: [
                // text: balance
                TextSpan(text: "Balance\n",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                // text: $2349
                TextSpan(text: "\$2349.15",
                  style: TextStyle(
                    fontSize: 24.0,
                    height: 1.5,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
            ),
          ),


        ],
      ),
    );
  }
}
