import 'package:flutter/material.dart';

class BankCardsApp extends StatefulWidget {
  @override
  _BankCardsAppState createState() => _BankCardsAppState();
}

class _BankCardsAppState extends State<BankCardsApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // set background color
      backgroundColor: Colors.black,

      // main: body
      body: Column(
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
        ],
      ),
    );
  }
}
