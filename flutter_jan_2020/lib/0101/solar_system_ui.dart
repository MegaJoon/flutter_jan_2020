import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jan_2020/0101/card_widget.dart';
import 'package:flutter_jan_2020/0101/item_list.dart';

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

  // pageView controller
  PageController _pageController;

  double currentIndex = items.length - 1.0;

  @override
  void initState() {
    _pageController = PageController(initialPage: currentIndex.toInt())
    ..addListener((){
      setState(() {
        currentIndex = _pageController.page;
        print("currentIndex = $currentIndex");
      });
    });
    super.initState();
  }

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
          Positioned(
            top: 120.0,
            left: 0,
            right: 0,
            bottom: 130.0,
            child: Stack(
              children: <Widget>[
                // main
                CardWidget(currentIndex),

                // pageView
                Positioned.fill(
                    child: PageView.builder(
                        itemCount: items.length,
                        scrollDirection: Axis.horizontal,
                        controller: _pageController,
                        reverse: true,
                        itemBuilder: (context, index){
                          return Container(
                            margin: EdgeInsets.only(
                              left: 180.0,
                              right: 40.0,
                              bottom: 250.0,
                            ),
                            child: Image.asset(
                              items[currentIndex.round()].image,
                              fit: BoxFit.fill,
                            ),
                          );
                        }),
                ),
              ],
            ),
          ),

          // dots indicator
          Positioned(
            left: 0,
            right: 0,
            bottom: 90.0,
            child: Center(
              child: Container(
                height: 32.0,
                child: DotsIndicator(
                  dotsCount: items.length,
                  position: currentIndex,
                  axis: Axis.horizontal,
                  decorator: DotsDecorator(
                    activeShape: StadiumBorder(),

                    color: Colors.grey[600].withOpacity(0.50),
                    activeColor: Colors.brown,

                    size: Size(8.0, 8.0),
                    activeSize: Size(16.0, 8.0),

                    spacing: EdgeInsets.all(4.0),
                  ),
                ),
              ),
            ),
          ),

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
