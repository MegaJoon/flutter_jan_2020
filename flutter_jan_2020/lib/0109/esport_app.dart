import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

// https://dribbble.com/shots/9193202--19-Esport-Social-Media-MobileApp-Concept/attachments/1236503?mode=media

class EsportApp extends StatefulWidget {
  @override
  _EsportAppState createState() => _EsportAppState();
}

class _EsportAppState extends State<EsportApp> {
  // double
  double padding = 16.0;
  
  // color
  Color _color = Color.fromRGBO(104, 254, 154, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // main column
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                Placeholder(),
                Placeholder(),
                Placeholder(),
                Placeholder(),
                Placeholder(),
              ],
            ),
          ),

          // bottom navigation bar
          Positioned(
            left: padding,
            right: padding,
            bottom: padding,
            child: Container(
              height: 64.0,
              child: Row(
                children: <Widget>[
                  // circle container
                  Container(
                    margin: EdgeInsets.only(right: padding /2),
                    height: 64.0,
                    width: 64.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _color,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        size: 28.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  
                  // stadium container
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: padding /2),
                      padding: EdgeInsets.symmetric(horizontal: padding *3),
                      decoration: ShapeDecoration(
                        shape: StadiumBorder(),
                        color: Colors.black,
                      ),
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            // icon: home
                            Icon(
                              Icons.home,
                              size: 20.0,
                              color: _color,
                            ),

                            // icon: search
                            Icon(
                              Icons.search,
                              size: 20.0,
                              color: Colors.white,
                            ),

                            // icon: favorite
                            Badge(
                              badgeColor: _color,
                              badgeContent: Text("2",
                                style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              child: Icon(
                                Icons.favorite_border,
                                size: 20.0,
                                color: Colors.white,
                              ),
                            ),

                            // icon: mail
                            Badge(
                              badgeColor: _color,
                              badgeContent: Text("3",
                                style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              child: Icon(
                                Icons.mail_outline,
                                size: 20.0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
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
