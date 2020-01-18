import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// https://www.pinterest.co.kr/pin/85849936635428853/

class FurnitureApp extends StatefulWidget {
  @override
  _FurnitureAppState createState() => _FurnitureAppState();
}

class _FurnitureAppState extends State<FurnitureApp> with SingleTickerProviderStateMixin {
  // double
  double padding = 16.0;
  double radius = 8.0;

  // tab bar view items height
  double widgetHeight = 150.0;

  // string
  String title = "Inspiration";

  @override
  Widget build(BuildContext context) {
    // screen height
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          // main
          Positioned.fill(
            child: SafeArea(
              top: true,
              left: true,
              right: true,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: <Widget>[
                    // appbar
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: padding),
                      height: 52.0,
                      decoration: BoxDecoration(
                        // add divider bottom line
                        border: Border(
                            bottom: BorderSide(
                              color: Colors.black,
                              width: 2.0,
                        )),
                      ),
                      child: Row(
                        children: <Widget>[
                          // left icon: arrow
                          Icon(
                            Icons.arrow_back,
                            size: 24.0,
                            color: Colors.black54,
                          ),

                          // spacer
                          Spacer(),

                          // right icon: favorite
                          Icon(
                            Icons.favorite_border,
                            size: 24.0,
                            color: Colors.black54,
                          ),

                          // spacer
                          SizedBox(
                            width: padding /2,
                          ),

                          // right icon2: share
                          Icon(
                            Icons.share,
                            size: 24.0,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                    ),

                    // text: title
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: padding),
                      padding: EdgeInsets.only(top: padding /2),
                      height: 72.0,
                      decoration: BoxDecoration(
                        // add divider bottom line
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black54,
                            width: 1.5,
                          ),
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(title,
                            style: GoogleFonts.gelasio(
                              fontSize: 24.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                        ),
                      ),
                    ),

                    // tab bar
                    Container(
                      padding: EdgeInsets.symmetric(vertical: padding),
                      height: 64.0,
                      child: ListView(
                        padding: EdgeInsets.only(left: padding),
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: padding),
                            width: 120.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(radius),
                              color: Colors.black87,
                              boxShadow: [BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 2.0,
                                blurRadius: 2.0,
                                offset: Offset(2.0, 2.0),
                              )],
                            ),
                            child: Center(
                              child: Text("All",
                                style: GoogleFonts.gelasio(
                                  fontSize: 12.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(right: padding),
                            width: 120.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(radius),
                              border: Border.all(
                                color: Colors.black54,
                                width: 1.0,
                              ),
                              color: Colors.white,
                              boxShadow: [BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 2.0,
                                blurRadius: 2.0,
                                offset: Offset(2.0, 2.0),
                              )],
                            ),
                            child: Center(
                              child: Text("How To Guides",
                                style: GoogleFonts.gelasio(
                                  fontSize: 12.0,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(right: padding),
                            width: 120.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(radius),
                              border: Border.all(
                                color: Colors.black54,
                                width: 1.0,
                              ),
                              color: Colors.white,
                              boxShadow: [BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 2.0,
                                blurRadius: 2.0,
                                offset: Offset(2.0, 2.0),
                              )],
                            ),
                            child: Center(
                              child: Text("Inspiration",
                                style: GoogleFonts.gelasio(
                                  fontSize: 12.0,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(right: padding),
                            width: 120.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(radius),
                              border: Border.all(
                                color: Colors.black54,
                                width: 1.0,
                              ),
                              color: Colors.white,
                              boxShadow: [BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 2.0,
                                blurRadius: 2.0,
                                offset: Offset(2.0, 2.0),
                              )],
                            ),
                            child: Center(
                              child: Text("How To Guides",
                                style: GoogleFonts.gelasio(
                                  fontSize: 12.0,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.only(right: padding),
                            width: 120.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(radius),
                              border: Border.all(
                                color: Colors.black54,
                                width: 1.0,
                              ),
                              color: Colors.white,
                              boxShadow: [BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 2.0,
                                blurRadius: 2.0,
                                offset: Offset(2.0, 2.0),
                              )],
                            ),
                            child: Center(
                              child: Text("Inspiration",
                                style: GoogleFonts.gelasio(
                                  fontSize: 12.0,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // tab bar view
                    Container(
                      height: (widgetHeight + 40.0) * allList.length,
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(top: padding),
                        itemCount: allList.length,
                        itemBuilder: (context, index){
                          return Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: padding),
                            height: widgetHeight,
                            child: Row(
                              children: <Widget>[
                                // left side: image
                                Flexible(
                                  child: Image.network(
                                    allList[index].image,
                                    fit: BoxFit.cover,
                                    height: widgetHeight,
                                  ),
                                ),

                                // spacer
                                SizedBox(width: padding),

                                // right side: text
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: padding *2),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        // text: title
                                        Text(allList[index].title,
                                          style: GoogleFonts.gelasio(
                                            fontSize: 16.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        SizedBox(
                                          height: padding /2,
                                        ),

                                        // text: subTitle
                                        Text(allList[index].subTitle,
                                          style: GoogleFonts.gelasio(
                                            fontSize: 12.0,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),

                                        Spacer(),

                                        Row(
                                          children: <Widget>[
                                            // text: Learn more
                                            Text("Learn more",
                                              style: GoogleFonts.gelasio(
                                                fontSize: 12.0,
                                                color: Colors.black87,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),

                                            Spacer(),

                                            Icon(
                                              Icons.arrow_forward,
                                              size: 20.0,
                                              color: Colors.black87,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },

                        // separator: divider
                        separatorBuilder: (context, index){
                          return Divider(height: 40.0);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // bottom opacity container
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: screenHeight * 0.10,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white.withOpacity(0.2), Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
//              child: Placeholder(),
            ),
          ),
        ],
      ),
    );
  }
}

class AllList {
  String image;
  String title;
  String subTitle;

  AllList({this.image, this.title, this.subTitle});
}

List<AllList> allList = [
  AllList(
    image: "https://cdn.pixabay.com/photo/2017/03/28/12/11/chairs-2181960__340.jpg",
    title: "How to choose\nthe right chair",
    subTitle: "Follow these easy four\nsteps to help you select\nthe perfect chair",
  ),

  AllList(
    image: "https://cdn.pixabay.com/photo/2016/11/18/15/54/apartment-1835482__340.jpg",
    title: "Guide to Sofas",
    subTitle: "Follow these easy four\nsteps to help you select\nthe perfect chair",
  ),

  AllList(
    image: "https://cdn.pixabay.com/photo/2016/11/19/17/25/furniture-1840463__340.jpg",
    title: "Bedroom\ninspirations",
    subTitle: "Follow these easy four\nsteps to help you select\nthe perfect chair",
  ),
];
























