import 'package:flutter/material.dart';

// https://dribbble.com/shots/9177633-Solar-system-UI

class SolarSystemUI extends StatefulWidget {
  @override
  _SolarSystemUIState createState() => _SolarSystemUIState();
}

class _SolarSystemUIState extends State<SolarSystemUI> {
  // image
  String _backgroundImage = "assets/0101/image.jpg";

  // text
  String title = "Solar system";

  // double
  double padding = 16.0;
  double radius = 24.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // background image
          Positioned.fill(
            child: Image.asset(
              _backgroundImage,
              fit: BoxFit.fill,
            ),
          ),

          // appbar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              top: true,
              left: true,
              right: true,
              child: Container(
                height: 40.0,
                child: Row(
                  children: <Widget>[
                    // left icon
                    IconButton(
                      onPressed: (){
                        print("on Clicked!!");
                      },

                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 16.0,
                        color: Colors.grey,
                      ),
                    ),

                    // text: title
                    Text(title,
                      style: TextStyle(
                        fontSize: 28.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          

        ],
      ),
    );
  }
}
