import 'package:flutter/material.dart';

// https://www.instagram.com/p/B6yDr42paQv/?igshid=1407brpdumzib

class TravelApp extends StatefulWidget {
  @override
  _TravelAppState createState() => _TravelAppState();
}

class _TravelAppState extends State<TravelApp> {
  // double
  double padding = 16.0;

  // string
  String title = "Hello, Alex";
  String _profileImage = "https://cdn.pixabay.com/photo/2019/12/23/19/56/scotland-4715309_960_720.jpg";

  String subTitle = "Where are we\n";
  String subTitle1 = "going today?";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // appbar
          SafeArea(
            top: true,
            left: true,
            right: true,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: padding),
              height: 64.0,
              child: Row(
                children: <Widget>[
                  // left title
                  Text(title,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  // spacer
                  Spacer(),

                  // right profile image
                  Container(
                    height: 32.0,
                    width: 32.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(_profileImage),
                        fit: BoxFit.fill,
                      ),
                    ),
//                    child: Placeholder(),
                  ),
                ],
              ),
            ),
          ),

          // text: title
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: RichText(
              text: TextSpan(
                children: [
                  // line 1
                  TextSpan(text: subTitle,
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                  ),

                  // line 2
                  TextSpan(text: subTitle1,
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
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
