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
  
  // color
  Color _color = Color.fromRGBO(247, 210, 129, 1);

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

          // main pageView
          

          // bottom bar
          Positioned(
            left: padding,
            right: padding,
            bottom: padding /2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: padding),
              height: 64.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                color: Colors.grey[900],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // selected container
                  Container(
                    width: 64.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // selected icon
                        Icon(
                          Icons.favorite_border,
                          size: 28.0,
                          color: _color,
                        ),

                        // selected text
                        Text("Explore",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: _color,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // unselected container
                  Container(
                    width: 64.0,
                    child: Center(
                      child: Icon(
                        Icons.explore,
                        size: 28.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),

                  Container(
                    width: 64.0,
                    child: Center(
                      child: Icon(
                        Icons.search,
                        size: 28.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),

                  Container(
                    width: 64.0,
                    child: Center(
                      child: Icon(
                        Icons.favorite_border,
                        size: 28.0,
                        color: Colors.grey,
                      ),
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
