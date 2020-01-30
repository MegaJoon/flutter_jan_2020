import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_jan_2020/0130/items_list.dart';
import 'package:flutter_jan_2020/0130/logger_list.dart';
import 'package:flutter_jan_2020/0130/menu_items.dart';
import 'package:google_fonts/google_fonts.dart';

// https://dribbble.com/shots/9803666-File-Explorer-App-Interaction

class FileExplorerApp extends StatefulWidget {
  @override
  _FileExplorerAppState createState() => _FileExplorerAppState();
}

class _FileExplorerAppState extends State<FileExplorerApp> with SingleTickerProviderStateMixin {
  // color
  Color _backgroundColor = Color.fromRGBO(253, 210, 44, 1);

  // double
  double padding = 24.0;
  double radius = 16.0;

  double summaryBoxWidth = 52.0;

  // storage size
  double currentSize = 24.2;
  double limitSize = 28.5;

  // storage now percentage
  int percentage = 0;

  // gridViewPadding
  double gridViewPadding = 16.0;

  // onPressed Function
  _onPressed(int index){
    setState(() {
      items[index].isSelected = !items[index].isSelected;
    });
  }

  // bottom sheet positionY
  double positionY = 0.0;

  // isFullScrollState
  bool isFullScroll = false;

  @override
  Widget build(BuildContext context) {
    // screen size
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // double percentage
    percentage = (currentSize / limitSize * 100.0).round().toInt();

    return Scaffold(
      // set background color
      backgroundColor: _backgroundColor,

      body: Stack(
        children: <Widget>[
          // background Main Box
          SingleChildScrollView(
            // scroll direction
            scrollDirection: Axis.vertical,
            child: SafeArea(
              top: true,
              left: true,
              right: true,
              child: Column(
                children: <Widget>[
                  // Appbar
                  Container(
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.40, right: padding),
                    height: 64.0,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // icon: search
                        IconButton(
                          onPressed: () {
                            print("on clicked: Icon, Search");
                          },
                          icon: Icon(
                            Icons.search,
                            size: 24.0,
                            color: isFullScroll? Colors.black54 : Colors.black,
                          ),
                        ),

                        // icon: tune
                        IconButton(
                          onPressed: () {
                            print("on clicked: Icon, Tune");
                          },
                          icon: Icon(
                            Icons.tune,
                            size: 24.0,
                            color: isFullScroll? Colors.black54 : Colors.black,
                          ),
                        ),

                        // icon: more
                        IconButton(
                          onPressed: () {
                            print("on clicked: Icon, More");
                          },
                          icon: Icon(
                            Icons.more_vert,
                            size: 24.0,
                            color: isFullScroll? Colors.black54 : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Internal Storage Container
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    margin: EdgeInsets.symmetric(vertical: padding),
                    height: 130.0,
                    child: Stack(
                      children: <Widget>[
                        // black container Analyze
                        Positioned(
                          top: padding * 1.5,
                          right: 0,
                          bottom: 0,
                          width: summaryBoxWidth,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(radius),
                                bottomRight: Radius.circular(radius),
                              ),
                              color: Colors.black,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 1.0,
                                  blurRadius: 1.0,
                                  offset: Offset(1.0, 1.0),
                                )
                              ],
                            ),
                            child: Center(
                              child: Transform.rotate(
                                angle: pi / 2,
                                child: Text(
                                  "Analyze",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    shadows: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        spreadRadius: 6.0,
                                        blurRadius: 6.0,
                                        offset: Offset(6.0, 6.0),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        // white container summary
                        Positioned(
                          top: 0,
                          left: 0,
                          right: summaryBoxWidth,
                          bottom: 0,
                          child: Container(
                            padding: EdgeInsets.all(padding),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(radius),
                                topRight: Radius.circular(radius),
                                bottomLeft: Radius.circular(radius),
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 1.0,
                                  blurRadius: 1.0,
                                  offset: Offset(1.0, 1.0),
                                )
                              ],
                            ),
                            child: Row(
                              children: <Widget>[
                                // left circular chart
                                Container(
                                  margin: EdgeInsets.only(right: padding),
                                  width: 100.0,
                                  child: Stack(
                                    children: <Widget>[
                                      // draw chart
                                      Positioned.fill(
                                        child: CustomPaint(
                                          foregroundPainter:
                                              DrawCircularChart(percentage),
                                        ),
                                      ),

                                      // center text
                                      Positioned.fill(
                                        child: Center(
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                // text: percentage
                                                TextSpan(
                                                  text: percentage.toString(),
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 16.0,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    shadows: [
                                                      BoxShadow(
                                                        color: Colors.black12,
                                                        spreadRadius: 6.0,
                                                        blurRadius: 6.0,
                                                        offset:
                                                            Offset(6.0, 6.0),
                                                      )
                                                    ],
                                                  ),
                                                ),

                                                // text: %
                                                TextSpan(
                                                  text: " %",
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 10.0,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w400,
                                                    shadows: [
                                                      BoxShadow(
                                                        color: Colors.black12,
                                                        spreadRadius: 6.0,
                                                        blurRadius: 6.0,
                                                        offset:
                                                            Offset(6.0, 6.0),
                                                      )
                                                    ],
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

                                // right column
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      // text: Internal
                                      Text(
                                        "Internal",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          shadows: [
                                            BoxShadow(
                                              color: Colors.black12,
                                              spreadRadius: 6.0,
                                              blurRadius: 6.0,
                                              offset: Offset(6.0, 6.0),
                                            )
                                          ],
                                        ),
                                      ),

                                      // text: Storage
                                      Text(
                                        "Storage",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          shadows: [
                                            BoxShadow(
                                              color: Colors.black12,
                                              spreadRadius: 6.0,
                                              blurRadius: 6.0,
                                              offset: Offset(6.0, 6.0),
                                            )
                                          ],
                                        ),
                                      ),

                                      // text: currentSize / limitSize
                                      Text(
                                        "$currentSize GB / $limitSize GB",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12.0,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w400,
                                          height: 2.5,
                                          shadows: [
                                            BoxShadow(
                                              color: Colors.black12,
                                              spreadRadius: 6.0,
                                              blurRadius: 6.0,
                                              offset: Offset(6.0, 6.0),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // grid view
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    height: 500.0,
                    child: GridView.builder(
                        padding: EdgeInsets.only(top: padding),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: items.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: gridViewPadding * 2,
                          crossAxisSpacing: gridViewPadding,
                          childAspectRatio: 0.90,
                        ),
                        itemBuilder: (context, index) {
                          return MenuItems(
                            index: index,
                            onPressed: (){
                              _onPressed(index);
                            },
                          );
                        }),
                  ),

                  // ex
                  Placeholder(),
                  Placeholder(),
                ],
              ),
            ),
          ),

          // bottom sheet
          Positioned(
            top: positionY + screenHeight * 0.70,
            left: 0,
            right: 0,
            height: screenHeight,
            child: GestureDetector(
              onVerticalDragStart: (DragStartDetails dragDetails){},
              onVerticalDragUpdate: (DragUpdateDetails dragDetails){
                setState(() {
                  isFullScroll = false;
                  positionY += dragDetails.delta.dy;

                  // initial height == 0
                  // half height == -318.0
                  // full height == -475.0

                  // limit height
                  if(positionY > 0) positionY = 0;
                  if(positionY < - 475.0) {
                    positionY = -475.0;
                    isFullScroll = true;
                  }
                });
              },
              onVerticalDragEnd: (DragEndDetails dragDetails){
                setState(() {
                  // initial
                  if((positionY < 0) && (positionY > -318.0 / 2)) positionY = 0;

                  // half
                  if((positionY < -318.0 / 2) && (positionY > (-318.0 + (-475.0 + 318.0) / 2)))
                    positionY = -318.0;

                  // full
                  if((positionY < (-318.0 + (-475.0 + 318.0) / 2)) && (positionY > -475.0))
                    positionY = -475.0;
                });
              },

              child: Container(
                margin: EdgeInsets.only(top: 100.0),
                padding: EdgeInsets.only(top: 6.0),
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    // punch
                    Container(
                      height: 4.0,
                      width: 40.0,
                      decoration: ShapeDecoration(
                        shape: StadiumBorder(),
                        color: Colors.grey[300],
                      ),
                    ),

                    // text: Logger
                    Container(
                      padding: EdgeInsets.only(left: 100.0),
                      alignment: Alignment.centerLeft,
                      height: 100.0,
                      child: Text("Logger",
                        style: GoogleFonts.poppins(
                          fontSize: 40.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          shadows: [BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 6.0,
                            blurRadius: 6.0,
                            offset: Offset(6.0, 6.0),
                          )],
                        ),
                      ),
                    ),

                    Flexible(
                      fit: FlexFit.tight,
                      child: Stack(
                        children: <Widget>[
                          // left background line
                          Positioned(
                            top: 40.0,
                            left: 49.5,
                            bottom: 0,
                            width: 2.0,
                            child: Container(
                              color: Colors.grey[100],
                            ),
                          ),

                          // list view
                          Positioned.fill(
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                  itemCount: loggers.length,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index){
                                    return Container(
                                      height: 150.0,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          // left indicator
                                          Container(
                                            padding: EdgeInsets.only(top: 10.0),
                                            width: 100.0,
                                            child: Container(
                                              padding: EdgeInsets.all(8.0),
                                              height: 24.0,
                                              width: 24.0,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: index == 0? Colors.black : Colors.grey[200],
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: index == 0? Colors.white : Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),

                                          // right
                                          Flexible(
                                            fit: FlexFit.tight,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                // text: A moment ago
                                                RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      // text: A moment
                                                      TextSpan(
                                                        text: loggers[index].title,
                                                        style: GoogleFonts.poppins(
                                                          fontSize: 12.0,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.bold,
                                                          shadows: [BoxShadow(
                                                            color: Colors.black12,
                                                            spreadRadius: 6.0,
                                                            blurRadius: 6.0,
                                                            offset: Offset(6.0, 6.0),
                                                          )],
                                                        ),
                                                      ),

                                                      // text: ago
                                                      TextSpan(
                                                        text: " ago",
                                                        style: GoogleFonts.poppins(
                                                          fontSize: 12.0,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.w400,
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

                                                // profile images
                                                Container(
                                                  padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                                                  margin: EdgeInsets.only(
                                                      left: padding /2,
                                                      right: padding,
                                                      bottom: padding,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(radius),
                                                    color: Colors.grey[200],
                                                  ),
                                                  height: 72.0,
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: <Widget>[
                                                      Container(
                                                        width: 56.0,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(radius),
                                                          image: DecorationImage(
                                                            image: NetworkImage(loggers[index].image),
                                                            fit: BoxFit.cover,
                                                          ),
                                                          boxShadow: [BoxShadow(
                                                            color: Colors.black12,
                                                            spreadRadius: 1.0,
                                                            blurRadius: 1.0,
                                                            offset: Offset(1.0, 1.0),
                                                          )],
                                                        ),
                                                      ),

                                                      Container(
                                                        width: 56.0,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(radius),
                                                          image: DecorationImage(
                                                            image: NetworkImage(loggers[index].image1),
                                                            fit: BoxFit.cover,
                                                          ),
                                                          boxShadow: [BoxShadow(
                                                            color: Colors.black12,
                                                            spreadRadius: 1.0,
                                                            blurRadius: 1.0,
                                                            offset: Offset(1.0, 1.0),
                                                          )],
                                                        ),
                                                      ),

                                                      Container(
                                                        width: 56.0,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(radius),
                                                          image: DecorationImage(
                                                            image: NetworkImage(loggers[index].image2),
                                                            fit: BoxFit.cover,
                                                          ),
                                                          boxShadow: [BoxShadow(
                                                            color: Colors.black12,
                                                            spreadRadius: 1.0,
                                                            blurRadius: 1.0,
                                                            offset: Offset(1.0, 1.0),
                                                          )],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// draw circular chart
class DrawCircularChart extends CustomPainter {
  final int percentage;

  DrawCircularChart(this.percentage);

  // offset
  Offset _offset = Offset(50.0, 40.0);

  // radius
  double radius = 40.0;

  // chart line width
  double lineWidth = 3.0;

  // color
  Color baseLineColor = Colors.grey[300];
  Color colorLineColor = Color.fromRGBO(253, 210, 44, 1);

  // start angle
  double startAngle = -pi / 2;

  @override
  void paint(Canvas canvas, Size size) {
    // sweep angle
    double sweepAngle = pi * 2 * percentage.toDouble() / 100.0;

    // rect
    Rect rect = Rect.fromCenter(
      width: 80.0,
      height: 80.0,
      center: _offset,
    );

    // base line chart
    canvas.drawCircle(
        _offset,
        40.0,
        Paint()
          ..strokeWidth = lineWidth
          ..strokeCap = StrokeCap.round
          ..color = baseLineColor
          ..style = PaintingStyle.stroke);

    // color line chart
    canvas.drawArc(
        rect,
        startAngle,
        sweepAngle,
        false,
        Paint()
          ..strokeWidth = lineWidth
          ..strokeCap = StrokeCap.round
          ..color = colorLineColor
          ..style = PaintingStyle.stroke);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

