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
      Placeholder(color: Colors.red),
      Placeholder(color: Colors.teal),
      Placeholder(color: Colors.pink),
      Placeholder(color: Colors.black),
    ];
  }
}























