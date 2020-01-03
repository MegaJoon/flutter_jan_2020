import 'package:flutter/material.dart';

// https://www.instagram.com/p/B1yZ_jEgc_I/?igshid=1ko34i9ovlbbr

class ChooseCharacterApp extends StatefulWidget {
  @override
  _ChooseCharacterAppState createState() => _ChooseCharacterAppState();
}

class _ChooseCharacterAppState extends State<ChooseCharacterApp> {
  // page controller
  PageController _pageController;

  int _currentIndex = 3;
  @override
  void initState() {
    _pageController = PageController(initialPage: _currentIndex, viewportFraction: 0.20);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          //
          Positioned(
            top: 200.0,
            left: 0,
            right: 0,
            bottom: -200.0,
            child: Placeholder(),
          ),
        ],
      ),
    );
  }
}
