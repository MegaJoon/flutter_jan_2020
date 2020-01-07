import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jan_2020/0107/card_details_page.dart';
import 'package:flutter_jan_2020/0107/card_list.dart';

class BankCardsApp extends StatefulWidget {
  @override
  _BankCardsAppState createState() => _BankCardsAppState();
}

class _BankCardsAppState extends State<BankCardsApp> {
  // double
  double padding = 16.0;
  double radius = 16.0;

  // string
  String title = "Bank Cards";
  String _image = "assets/0107/image.png";

  // color
  Color _profileColor = Color.fromRGBO(241, 170, 255, 1);
  Color _profileColor1 = Color.fromRGBO(209, 195, 255, 1);

  // pageview index
  int _currentIndex = 0;

  // page view
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
        initialPage: _currentIndex,
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
      // set background color
      backgroundColor: Colors.black,

      // main: body
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // appbar
          SafeArea(
            top: true,
            left: true,
            right: true,
            child: IconButton(
              onPressed: (){
                print("on clicked: icon arrow");
              },
              icon: Icon(
                Icons.arrow_back,
                size: 28.0,
                color: Colors.white,
              ),
            ),
          ),

          // title
          Container(
            margin: EdgeInsets.only(bottom: padding),
            padding: EdgeInsets.symmetric(horizontal: padding),
            height: 64.0,
            child: Row(
              children: <Widget>[
                // text: title
                Text(title,
                  style: TextStyle(
                    fontSize: 28.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // spacer
                Spacer(),

                // profile image
                Container(
                  height: 32.0,
                  width: 32.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [_profileColor, _profileColor1],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      // icon
                      Positioned(
                        left: -2.0,
                        right: 0,
                        bottom: -6.0,
                        child: Icon(
                          Icons.person,
                          size: 36.0,
                        color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // text: balance
          Padding(
            padding: EdgeInsets.only(left: padding),
            child: RichText(text: TextSpan(children: [
                // text: balance
                TextSpan(text: "Balance\n",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                // text: $2349
                TextSpan(text: cards[_currentIndex].balance,
                  style: TextStyle(
                    fontSize: 24.0,
                    height: 1.5,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
            ),
          ),

          // cards page view
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: padding),
              child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cards.length,
                  controller: _pageController,
                  onPageChanged: (int currentIndex){
                    setState(() {
                      _currentIndex = currentIndex;
                    });
                  },
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){
                        print("on clicked: move next page");

                        //
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CardDetailsPage(_currentIndex),
                            ),
                        );
                      },
                      child: Hero(
                        tag: "card $index",
                        child: Transform.translate(
                          offset: Offset(-padding * 3.0, 0.0),
                          child: Container(
                            padding: EdgeInsets.all(padding),
                            margin: EdgeInsets.only(right: padding *2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(radius),
                              gradient: LinearGradient(
                                colors: [
                                  cards[index].colors[0],
                                  cards[index].colors[1],
                                  cards[index].colors[2],
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [0.2, 0.5, 1.0],
                                tileMode: TileMode.clamp,
                              ),
                            ),
                            child: Stack(
                              children: <Widget>[
                                // topLeft wifi icon
                                Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Icon(
                                    Icons.wifi,
                                    size: 40.0,
                                    color: Colors.white,
                                  ),
                                ),

                                // topRight VISA text
                                cards[index].cardName == "Visa"?
                                Positioned(
                                    top: 20.0,
                                    right: -25.0,
                                    child: Transform.rotate(
                                    angle: -1.56,
                                    child: Text("Visa".toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 36.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  )) :
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Container(
                                    height: 64.0,
                                    width: 40.0,
                                    child: CustomPaint(
                                      painter: MasterLogo(),
                                    ),
                                  ),
                                ),

                                // bottomLeft text: Credit card
                                Positioned(
                                  left: -20.0,
                                  bottom: 40.0,
                                  child: Transform.rotate(
                                    angle: -1.56,
                                    child: Text("Credit Card",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),

                                // bottomCenter image : sim card
                                Positioned(
                                  left: 80.0,
                                  bottom: 0,
                                  height: 100.0,
                                  width: 100.0,
                                  child: Transform.rotate(
                                      angle: -1.56,
                                      child: Image.asset(
                                          _image),
                                  ),
                                ),

                                // bottomRight text: account
                                Positioned(
                                  right: -80.0,
                                  bottom: 80.0,
                                  child: Transform.rotate(
                                    angle: -1.56,
                                    child: Text("**** **** **** ****",
                                      style: TextStyle(
                                        fontSize: 24.0,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),

          // dots indicator
          Container(
            padding: EdgeInsets.symmetric(horizontal: padding),
            height: 40.0,
            child: DotsIndicator(
              dotsCount: cards.length,
              position: _currentIndex.toDouble(),
              decorator: DotsDecorator(
                color: Colors.grey[800],
                activeColor: Colors.white,

                size: Size(6.0, 6.0),
                activeSize: Size(6.0, 6.0),

                spacing: EdgeInsets.all(4.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MasterLogo extends CustomPainter{
  Color _masterColor = Color.fromRGBO(255, 182, 74, 1);
  Color _masterColor1 = Color.fromRGBO(254, 68, 14, 1);

  double padding = 8.0;
  double round = 20.0;
  double width = 40.0;  // r*2

  @override
  void paint(Canvas canvas, Size size) {
    // top circle
    var path1 = Path()
    ..lineTo(padding, padding)
    ..quadraticBezierTo(0.0, round, padding, width - padding)
    ..quadraticBezierTo(round, width - padding *2, width - padding, width - padding)
    ..quadraticBezierTo(width, round, width - padding, padding)
    ..quadraticBezierTo(round, 0.0, padding, padding)
    ..close();

    canvas.drawPath(
        path1,
        Paint()
          ..color = _masterColor,
    );

    // bottom circle
    var path2 = Path()
      ..lineTo(padding, width - padding)
      ..quadraticBezierTo(0.0, size.height - round, padding, size.height - padding)
      ..quadraticBezierTo(round, size.height, width - padding, size.height - padding)
      ..quadraticBezierTo(width, size.height - round, width - padding, width - padding)
      ..quadraticBezierTo(round, width, padding, width - padding)
      ..close();

    canvas.drawPath(
      path2,
      Paint()
        ..color = _masterColor1,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}













