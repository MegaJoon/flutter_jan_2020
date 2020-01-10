import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// https://www.instagram.com/p/B6yDr42paQv/?igshid=1407brpdumzib

class TravelApp extends StatefulWidget {
  @override
  _TravelAppState createState() => _TravelAppState();
}

class _TravelAppState extends State<TravelApp> {
  // list<widget>
  List<Widget> pages = [];

  // double
  double padding = 16.0;

  // string
  String title = "Hello, Alex";
  String _profileImage = "https://cdn.pixabay.com/photo/2019/12/23/19/56/scotland-4715309_960_720.jpg";

  String subTitle = "Where are we\n";
  String subTitle1 = "going today?";

  // bottom bar index
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // build pages widget
    buildWidgetPages();

    return Scaffold(
      body: pages[currentIndex],

      // bottom bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,

        // unselected
        unselectedIconTheme: IconThemeData(
          size: 24.0,
          color: Colors.grey[400],
        ),

        // selected
        selectedIconTheme: IconThemeData(
          size: 24.0,
          color: Colors.black,
        ),

        currentIndex: currentIndex,

        // on clicked event
        onTap: (int _currentIndex){
          setState(() {
            currentIndex = _currentIndex;
          });
        },

        // bottom items
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.compass),
            title: Text(""),
          ),

          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.search),
            title: Text(""),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text(""),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text(""),
          ),
        ],
      ),
    );
  }

  buildWidgetPages(){
    pages = [
      // initial page
      Column(
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

          // page view
          Flexible(
            fit: FlexFit.tight,
            child: Placeholder(),
          ),
        ],
      ),

      // dont use
      Placeholder(color: Colors.teal),
      Placeholder(color: Colors.pink),
      Placeholder(color: Colors.black),
    ];
  }
}























