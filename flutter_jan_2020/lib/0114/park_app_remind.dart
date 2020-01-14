import 'package:flutter/material.dart';
import 'package:flutter_jan_2020/0114/park_tabs_list.dart';
import 'package:flutter_jan_2020/0114/park_timeline_items.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

// https://dribbble.com/shots/6566062-Circular-Carousel-UI-Open-Source-Library

class ParkAppRemind extends StatefulWidget {
  @override
  _ParkAppRemindState createState() => _ParkAppRemindState();
}

class _ParkAppRemindState extends State<ParkAppRemind> {
  // list widget
  List<Widget> pages = [];

  // double
  double padding = 16.0;
  double radius = 16.0;

  // bottom sheet top margin
  double positionY = 500.0;

  // bottom sheet height
  double bottomSheetHeight = 64.0 + (300.0 + 8.0) * parkTimeLine.length;

  // padding image
  double paddingImage = 0;

  // color
  Color _color = Color.fromRGBO(52, 111, 229, 1);

  // background image
  String _backgroundImage = "assets/0113/image.png";

  // page view controller
  PageController _pageController;

  // page view index
  int currentIndex = 3;

  @override
  void initState() {
    _pageController = PageController(initialPage: currentIndex, viewportFraction: 0.20);
    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // set widget list
    setWidgetList();

    // screen height, width
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // background
          Positioned(
            top: paddingImage *2,
              left: paddingImage,
              right: paddingImage,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(top: padding *4 - paddingImage *2),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [_color, Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    // text: hello
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          // text: national park
                          TextSpan(text: "National Park\n".toUpperCase(),
                              style: GoogleFonts.playfairDisplay(
                                fontSize: 14.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                height: 1.0,
                                shadows: [BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 4.0,
                                  blurRadius: 4.0,
                                  offset: Offset(4.0, 4.0),
                                )],
                              ),
                          ),

                          // text: yosemite park
                          TextSpan(text: "yosemite\npark\n".toUpperCase(),
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 44.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              height: 1.0,
                              letterSpacing: 2.0,
                              shadows: [BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 4.0,
                                blurRadius: 4.0,
                                offset: Offset(4.0, 4.0),
                              )],
                            ),
                          ),

                          // text: guides
                          TextSpan(text: "guides".toUpperCase(),
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 14.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              height: 1.0,
                              shadows: [BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 4.0,
                                blurRadius: 4.0,
                                offset: Offset(4.0, 4.0),
                              )],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // spacer
                    Spacer(),

                    // image
                    Image.asset(
                      _backgroundImage,
                      height: screenHeight * 0.70 - paddingImage *2,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
          ),

          // bottom sheet
          AnimatedPositioned(
            duration: Duration(seconds: 1),
            curve: Curves.fastLinearToSlowEaseIn,
            top: positionY,
            left: 0,
            right: 0,
            child: GestureDetector(
              onVerticalDragStart: (DragStartDetails dragDetails){},
              onVerticalDragUpdate: (DragUpdateDetails dragDetails){
                setState(() {
                  positionY += dragDetails.delta.dy;

                  // when scroll up, set padding image
                  paddingImage = (positionY - 500.0) / 10.0;

                  // positionY limit
                  if (positionY > 500.0) positionY = 500.0;

                  // bottom sheet scroll up limit
                  if (positionY < -bottomSheetHeight + screenHeight + padding) positionY = -bottomSheetHeight + screenHeight + padding;
                });
              },
              onVerticalDragEnd: (DragEndDetails dragDetails){},
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: <Widget>[
                    // top page view
                    Container(
                      height: 64.0,
                      child: Stack(
                        children: <Widget>[
                          // background white color container
                          Positioned(
                            top: 32.0,
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Container(
                              color: Colors.white,
                            ),
                          ),

                          // page view
                          Positioned.fill(
                            child: PageView.builder(
                                scrollDirection: Axis.horizontal,
                                controller: _pageController,
                                onPageChanged: (int _currentIndex){
                                  setState(() {
                                    currentIndex = _currentIndex;
                                  });
                                },
                                itemBuilder: (context, index){
                                  // nowPage == currentIndex?
                                  bool isNowPage = currentIndex == index? true : false;

                                  // diff between currentIndex and index
                                  double diff = (currentIndex - index).abs().toDouble();
                                  double marginY = diff * 8.0;

                                  return AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.fastLinearToSlowEaseIn,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: padding /2,
                                        vertical: marginY),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(radius),
                                      color: isNowPage? _color : Colors.white,
                                      boxShadow: [BoxShadow(
                                        color: Colors.black12,
                                        spreadRadius: 1.0,
                                        blurRadius: 1.0,
                                        offset: Offset(1.0, 1.0),
                                      )],
                                    ),
                                    child: Center(
                                      child: Icon(
                                        parkTabsList[index %4],
                                        size: 28.0 * (1.0 - diff / 5.0),
                                        color: isNowPage? Colors.white : Colors.grey[300],
                                      ),
                                    ),
                                  );
                                },
                            ),
                          ),
                        ],
                      ),
                    ),

                    // time line containers
                    pages[currentIndex %4],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  setWidgetList(){
    pages = [
      // dont use
      SizedBox(
        height: bottomSheetHeight - 64.0,
        child: Container(
          color: Colors.white,
          child: Placeholder(
            color: Colors.red,
          ),
        ),
      ),
      SizedBox(
        height: bottomSheetHeight - 64.0,
        child: Container(
          color: Colors.white,
          child: Placeholder(
            color: Colors.teal,
          ),
        ),
      ),
      SizedBox(
        height: bottomSheetHeight - 64.0,
        child: Container(
          color: Colors.white,
          child: Placeholder(
            color: Colors.indigo,
          ),
        ),
      ),

      // initial page
      SizedBox(
        height: bottomSheetHeight - 64.0,
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: parkTimeLine.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index){
            return Container(
              height: 300.0,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  // text: title, subTitle
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    height: 64.0,
                    child: Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // text: title
                            Text(parkTimeLine[index].title,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            // text: subTitle
                            Text(parkTimeLine[index].subTitle,
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),

                        Spacer(),

                        // icon & text: score 4.3
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.star,
                              size: 16.0,
                              color: Colors.grey[500],
                            ),

                            SizedBox(width: 4.0),

                            Text("4.7",
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // image
                  Flexible(
                    fit: FlexFit.tight,
                    child: Image.asset(
                      parkTimeLine[index].image,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // icon & text: 10
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    height: 40.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.comment,
                          size: 16.0,
                          color: Colors.grey[500],
                        ),

                        SizedBox(width: 4.0),

                        Text("10",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w300,
                          ),
                        ),

                        SizedBox(width: padding),

                        Icon(
                          Icons.favorite_border,
                          size: 16.0,
                          color: Colors.grey[500],
                        ),

                        SizedBox(width: 4.0),

                        Text("10",
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },

          // divider
          separatorBuilder: (context, index){
            return Container(
              height: padding /2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.grey[400], Colors.grey[200]],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            );
          },
        ),
      ),
    ];
  }
}
