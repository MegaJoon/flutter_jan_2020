import 'package:flutter/material.dart';
import 'package:flutter_jan_2020/0110/second_travel_page.dart';
import 'package:flutter_jan_2020/0110/travel_items_list.dart';
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
  double radius = 16.0;

  // string
  String title = "Hello, Alex";
  String _profileImage = "https://cdn.pixabay.com/photo/2019/12/23/19/56/scotland-4715309_960_720.jpg";

  String subTitle = "Where are we\n";
  String subTitle1 = "going today?";

  // bottom bar index
  int currentIndex = 0;

  // page view controller
  PageController _pageController;

  // page view index
  int selectedIndex = 0;

  @override
  void initState() {
    _pageController = PageController(
        initialPage: selectedIndex,
        viewportFraction: 0.70,
    )
    ..addListener((){
      setState(() {
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

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
            child: PageView.builder(
              itemCount: travels.length,
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              onPageChanged: (int _selectedIndex){
                setState(() {
                  selectedIndex = _selectedIndex;
                });
                },
              itemBuilder: (context, index){
                return InkWell(
                  onTap: (){
                    print("on clicked page view image");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondTravelPage(index),
                        ),
                    );
                  },
                  child: Hero(
                    tag: "travel $index",
                    child: Container(
                      padding: EdgeInsets.only(
                        top: padding,
                        left: padding,
                        right: padding,
                        bottom: padding *2,
                      ),
                      margin: EdgeInsets.only(
                          top: padding *2,
                          right: padding *2,
                          bottom: padding *2,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(radius),
//                    color: Colors.pink,
                        image: DecorationImage(
                          image: AssetImage(travels[index].image),
                          fit: BoxFit.fill,
                        ),
                        boxShadow: [BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 2.0,
                          blurRadius: 2.0,
                          offset: Offset(2.0, 2.0),
                        )],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // container: score
                          Container(
                            height: 20.0,
                            width: 48.0,
                            decoration: ShapeDecoration(
                              shape: StadiumBorder(),
                              color: Colors.white.withOpacity(0.20),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                // icon: star
                                Icon(
                                  Icons.star,
                                  size: 12.0,
                                    color: Colors.white,
                                ),

                                // text: score
                                Text(travels[index].score,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // spacer
                          Spacer(),

                          // text: title
                          Text(travels[index].title,
                            style: TextStyle(
                              fontSize: 28.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          // text: subTitle
                          Row(
                            children: <Widget>[
                              // icon: location
                              Icon(
                                Icons.location_on,
                                size: 12.0,
                                color: Colors.white,
                              ),

                              // spacer
                              SizedBox(width: 4.0),

                              // text: subtitle
                              Text(travels[index].subTitle,
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
                },
            ),
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























