import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// https://dribbble.com/shots/9521982-Surfboard-App-Interaction

class SurfBoardApp extends StatefulWidget {
  @override
  _SurfBoardAppState createState() => _SurfBoardAppState();
}

class _SurfBoardAppState extends State<SurfBoardApp> {
  // background color
  Color _currentPageColor = Color.fromRGBO(117, 63, 238, 1);
  Color _nextPageColor = Colors.deepPurple;

  // color: text: Purchase
  Color _appbarColor = Color.fromRGBO(151, 222, 254, 1);

  // color: like amberAccent
  Color _color = Color.fromRGBO(255, 219, 124, 1);

  // string
  String title = "Taylor Swift";
  String subTitle = "Wen, 21 Aug\n";
  String subTitle1 = "Club Devil, 5th Avenue, 287";
  String description = "With an appetite for the gliding, glassy indie-pop of artists like Aurora and Lana Del Rey and the Distorted Menace of Tyler the Creator and Earl Sweatshirt, Billie Eilish listens to music the way that...";

  // double
  double padding = 16.0;
  double radius = 16.0;

  // selectable container index
  int currentIndex = 0;

  // swipe tab icon padding
  double iconPadding = 32.0;

  // swipe tab height
  double tabHeight = 64.0;

  // swipe container margin right
  double marginRight = 0.0;

  // isNextPage
  bool isNextPage = false;

  // image list
  List<String> images = [
    "https://cdn.pixabay.com/photo/2020/01/10/19/21/mont-saint-michel-4756046__340.jpg",
    "https://cdn.pixabay.com/photo/2019/08/09/23/13/forest-4395993__340.jpg",
    "https://cdn.pixabay.com/photo/2020/01/12/22/26/orange-4761236__340.jpg",
    "https://cdn.pixabay.com/photo/2020/01/11/07/39/north-4756774__340.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    // screen width
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: _currentPageColor,
      body: Stack(
        children: <Widget>[
          // first page
          Positioned.fill(
              child: SafeArea(
                top: true,
                left: true,
                right: true,
                child: isNextPage?
                // second page
                Container(
                  child: Column(
                    children: <Widget>[
                      // appbar
                      Container(
                        height: 40.0,
                        child: Row(
                          children: <Widget>[
                            // icon
                            IconButton(
                              onPressed: (){
                                setState(() {
                                  // move back page
                                  isNextPage = false;
                                  marginRight = 0.0;
                                });
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: 24.0,
                                color: Colors.white,
                              ),
                            ),

                            // spacer
                            Spacer(),

                            // text
                            Text(title,
                              style: GoogleFonts.poppins(
                                fontSize: 16.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                shadows: [BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 6.0,
                                  blurRadius: 6.0,
                                  offset: Offset(6.0, 6.0),
                                )],
                              ),
                            ),

                            // spacer
                            Spacer(),
                            SizedBox(
                              width: 40.0,
                            ),
                          ],
                        ),
                      ),

                      // grid view
                      Flexible(
                        fit: FlexFit.tight,
                        child: Container(
                          margin: EdgeInsets.only(top: padding, left: padding, right: padding),
                          child: GridView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.80,
                              crossAxisSpacing: padding,
                              mainAxisSpacing: padding,
                            ),
                            itemBuilder: (context, index){
                              return Transform.translate(
                                offset: Offset(0.0, index.isEven? 0.0 : -padding *2),
                                child: Container(
                                  margin: EdgeInsets.only(top: index == 1? padding *2 : 0.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(radius),
                                    image: DecorationImage(
                                      image: NetworkImage(images[index %4]),
                                      fit: BoxFit.cover,
                                    ),
                                    boxShadow: [BoxShadow(
                                      color: Colors.black12,
                                      spreadRadius: 1.0,
                                      blurRadius: 1.0,
                                      offset: Offset(1.0, 1.0),
                                    )],
                                  ),
//                                  child: Placeholder(),
                                ),
                              );
                              },
                          ),
                        ),
                      ),
                    ],
                  ),
                ) :
                // first page
                Column(
                  children: <Widget>[
                    // appbar
                    Container(
                      height: 40.0,
                      child: Row(
                        children: <Widget>[
                          // icon
                          IconButton(
                            onPressed: (){},
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: 24.0,
                              color: Colors.white,
                            ),
                          ),

                          // spacer
                          Spacer(),

                          // container
                          Container(
                            margin: EdgeInsets.only(right: padding),
                            height: 32.0,
                            width: 100.0,
                            decoration: ShapeDecoration(
                              shape: StadiumBorder(),
                              color: _appbarColor,
                              shadows: [BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 1.0,
                                blurRadius: 1.0,
                                offset: Offset(1.0, 1.0),
                              )],
                            ),
                            child: Center(
                              child: Text("Purchase",
                                style: GoogleFonts.poppins(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // text: title
                    Text(title,
                      style: GoogleFonts.poppins(
                        fontSize: 40.0,
                        color: _color,
                        fontWeight: FontWeight.bold,
                        height: 2.0,
                        shadows: [BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 6.0,
                          blurRadius: 6.0,
                          offset: Offset(6.0, 6.0),
                        )],
                      ),
                    ),

                    // text: subTitle
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          // text: subTitle
                          TextSpan(text: subTitle,
                            style: GoogleFonts.poppins(
                              fontSize: 14.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              height: 2.0,
                              shadows: [BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 6.0,
                                blurRadius: 6.0,
                                offset: Offset(6.0, 6.0),
                              )],
                            ),
                          ),

                          // text: subTitle1
                          TextSpan(text: subTitle1,
                            style: GoogleFonts.poppins(
                              fontSize: 12.0,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w600,
                              height: 1.5,
                              shadows: [BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 6.0,
                                blurRadius: 6.0,
                                offset: Offset(6.0, 6.0),
                              )],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // selectable container
                    Container(
                      margin: EdgeInsets.symmetric(vertical: padding * 2, horizontal: padding),
                      height: 150.0,
                      child: Row(
                        children: <Widget>[
                          // left container
                          Flexible(
                            flex: currentIndex == 1? 2 : 1,
                            child: InkWell(
                              onTap: (){
                                setState(() {
                                  currentIndex = 1;
                                });
                              },
                              child: AnimatedContainer(
                                duration: Duration(seconds: 1),
                                curve: Curves.fastLinearToSlowEaseIn,
                                padding: EdgeInsets.all(padding),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(radius),
                                  color: currentIndex == 1? _color : Colors.black12,
                                ),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      // icon
                                      Container(
                                        margin: EdgeInsets.only(bottom: padding * 0.50),
                                        height: 40.0,
                                        width: 40.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: currentIndex == 1? Colors.orange : Colors.black12,
                                          border: Border.all(
                                            color: currentIndex == 1? Colors.orange : _color,
                                            width: 1.5,
                                          ),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.check,
                                            size: 24.0,
                                            color: currentIndex == 1? Colors.black : _color,
                                          ),
                                        ),
                                      ),

                                      // text: 123k
                                      Text("123K",
                                        style: GoogleFonts.poppins(
                                          fontSize: 16.0,
                                          color: currentIndex == 1? Colors.black : Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      // text: Going
                                      Text("Going",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14.0,
                                          color: Colors.grey[500],
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // spacer
                          SizedBox(width: padding),

                          // right container
                          Flexible(
                            flex: currentIndex == 2? 2 : 1,
                            child: InkWell(
                              onTap: (){
                                setState(() {
                                  currentIndex = 2;
                                });
                              },
                              child: AnimatedContainer(
                                duration: Duration(seconds: 1),
                                curve: Curves.fastLinearToSlowEaseIn,
                                padding: EdgeInsets.all(padding),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(radius),
                                  color: currentIndex == 2? _color : Colors.black12,
                                ),
                                child: Center(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      // icon
                                      SizedBox(
                                        height: 40.0,
                                        child: Icon(
                                          currentIndex == 2? Icons.favorite : Icons.favorite_border,
                                          size: 32.0,
                                          color: Colors.pinkAccent,
                                        ),
                                      ),

                                      // text: 152K
                                      Text("152K",
                                        style: GoogleFonts.poppins(
                                          fontSize: 16.0,
                                          color: currentIndex == 2? Colors.black : Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      // text: Interested
                                      Text("Interested",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14.0,
                                          color: Colors.grey[500],
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // text: about, description
                    Flexible(
                      fit: FlexFit.tight,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: padding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // text: about
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("About",
                                style: GoogleFonts.poppins(
                                  fontSize: 16.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  height: 2.0,
                                ),
                              ),
                            ),

                            // text: about, description
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(description,
                                style: GoogleFonts.poppins(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  height: 1.5,
                                ),
                              ),
                            ),

                            // Dont use
                            Flexible(
                              fit: FlexFit.tight,
                              child: Container(
                                margin: EdgeInsets.only(top: padding),
                                child: Placeholder(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ),

          // swipe tab
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.fastLinearToSlowEaseIn,
            top: 0,
            left: screenWidth - tabHeight + marginRight,
            bottom: 0,
            child: GestureDetector(
              onHorizontalDragStart: (DragStartDetails dragDetails){},
              onHorizontalDragUpdate: (DragUpdateDetails dragDetails){
                setState(() {
                  marginRight += dragDetails.delta.dx;

                  // 0.0 ~ -400.0
                  print("marginRight = $marginRight");

                  if(marginRight > 0.0) marginRight = 0.0;
                  if(marginRight < -400.0) marginRight = -400.0;

                  //
                });
              },
              onHorizontalDragEnd: (DragEndDetails dragDetails){
                setState(() {
                  if(marginRight > -200.0) marginRight = 0.0;
                  if(marginRight <= -200.0) {
                    marginRight = -820.0;

                    // delay 1s -> show next page
                    Future.delayed(Duration(milliseconds: 500), (){
                      setState(() {
                        isNextPage = true;
                      });
                    });
                  }
                });
              },
              child: ClipPath(
                clipper: TabClipper(screenWidth),
                child: Container(
                  padding: EdgeInsets.only(left: iconPadding),
                  alignment: Alignment.centerLeft,
                  width: isNextPage? 1.0 : tabHeight + screenWidth * 2,
                  color: _nextPageColor,
                  child: Icon(
                    Icons.view_column,
                    size: 32.0,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TabClipper extends CustomClipper<Path> {
  final double padding;

  TabClipper(this.padding);

  double tabHeight = 52.0;

  @override
  Path getClip(Size size) {
    var path = Path()
    ..moveTo(size.width, 0.0)
    ..lineTo(size.width - padding, 0.0)
    ..quadraticBezierTo((size.width - tabHeight - padding) * 0.50, (size.height - tabHeight) * 0.45,
        tabHeight, (size.height - tabHeight) * 0.50)
    ..quadraticBezierTo(0.0, size.height * 0.50,
        tabHeight, (size.height + tabHeight) * 0.50)
    ..quadraticBezierTo((size.width - tabHeight - padding) * 0.50, (size.height + tabHeight) * 0.55,
        size.width - padding, size.height)
    ..lineTo(size.width, size.height)
    ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
