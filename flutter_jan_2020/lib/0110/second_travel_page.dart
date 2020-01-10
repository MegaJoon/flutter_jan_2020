import 'dart:math';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jan_2020/0110/travel_items_list.dart';

// second travel page

class SecondTravelPage extends StatefulWidget {
  // index in page view
  final int index;

  SecondTravelPage(this.index);

  @override
  _SecondTravelPageState createState() => _SecondTravelPageState();
}

class _SecondTravelPageState extends State<SecondTravelPage> {
  // double
  double padding = 16.0;
  double radius = 8.0;

  // string
  String _profileImage = "https://cdn.pixabay.com/photo/2019/12/23/19/56/scotland-4715309_960_720.jpg";

  // page view controller
  PageController _pageController;

  // page view index
  int selectedIndex = 0;

  @override
  void initState() {
    _pageController = PageController(
        initialPage: selectedIndex,
        viewportFraction: 0.70,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // background image
          Positioned(
            top: -150.0,
            left: -150.0,
            right: -150.0,
            bottom: -150.0,
            child: Hero(
              tag: "travel ${widget.index}",
              child: Image.asset(
                travels[widget.index].image,
                fit: BoxFit.fill,
              ),
            ),
          ),

          // main column
          Positioned.fill(
              child: SafeArea(
                top: true,
                left: true,
                right: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // appbar
                    Container(
                      margin: EdgeInsets.only(right: padding),
                      height: 64.0,
                      child: Row(
                        children: <Widget>[
                          // left icon
                          IconButton(
                            onPressed: (){
                              print("on clicked left icon in appbar");
                              print("move back page");
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              size: 28.0,
                              color: Colors.white,
                            ),
                          ),

                          // spacer
                          Spacer(),

                          // right image
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
                          ),
                        ],
                      ),
                    ),

                    // spacer
                    Spacer(),

                    // title & score
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: padding),
                      height: 150.0,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // left side
                          RichText(
                            text: TextSpan(
                              children: [
                                // line 1
                                TextSpan(
                                  text: "The Best\n",
                                  style: TextStyle(
                                    fontSize: 40.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                // line 2
                                TextSpan(
                                  text: "Cities of\n",
                                  style: TextStyle(
                                    fontSize: 40.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),

                                // line 3
                                TextSpan(
                                  text: travels[widget.index].title,
                                  style: TextStyle(
                                    fontSize: 40.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // spacer
                          Spacer(),

                          // right side : score
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              // score
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
                                    Text(travels[widget.index].score,
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

                              // icon
                              Transform.rotate(
                                angle: pi /2,
                                child: Icon(
                                  Icons.tune,
                                  size: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // spacer
                    Spacer(),

                    // page view
                    Container(
                      height: 350.0,
                      child: PageView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: japan.length,
                          controller: _pageController,
                          onPageChanged: (int _selectedIndex){
                            setState(() {
                              selectedIndex = _selectedIndex;
                            });
                          },
                          itemBuilder: (context, index){
                            return Container(
                              padding: EdgeInsets.all(padding),
                              margin: EdgeInsets.only(
                                right: padding,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(radius),
                                color: Colors.white,
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
                                  // top image
                                  Container(
                                    height: 150.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(radius),
                                      image: DecorationImage(
                                        image: AssetImage(japan[index].image),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
//                                    child: Placeholder(),
                                  ),

                                  Spacer(),

                                  // text: title
                                  Text(japan[index].title,
                                    style: TextStyle(
                                      fontSize: 24.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      height: 1.5,
                                    ),
                                  ),

                                  // text: description
                                  Text(japan[index].description,
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5,
                                    ),
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                  ),

                                  Spacer(),

                                  // text: read more & icon
                                  Container(
                                    height: 32.0,
                                    child: Row(
                                      children: <Widget>[
                                        // text: Read More
                                        Text("Read More",
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),

                                        Spacer(),

                                        Icon(
                                          Icons.favorite,
                                          size: 12.0,
                                          color: Colors.grey,
                                        ),

                                        SizedBox(
                                          width: 2.0,
                                        ),

                                        Text("999",
                                          style: TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                            },
                      ),
                    ),

                    // dot indicator
                    Container(
                      height: 40.0,
                      child: Center(
                        child: DotsIndicator(
                          dotsCount: japan.length,
                          position: selectedIndex.toDouble(),
                          axis: Axis.horizontal,
                          decorator: DotsDecorator(
                            spacing: EdgeInsets.all(4.0),

                            // color
                            color: Colors.grey,
                            activeColor: Colors.white,

                            // size
                            size: Size(8.0, 8.0),
                            activeSize: Size(8.0, 8.0),
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
