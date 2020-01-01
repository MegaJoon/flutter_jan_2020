import 'package:flutter/material.dart';
import 'package:flutter_jan_2020/0101/item_list.dart';

// second page

class SecondSolarPage extends StatefulWidget {
  final int index;

  SecondSolarPage(this.index);

  @override
  _SecondSolarPageState createState() => _SecondSolarPageState();
}

class _SecondSolarPageState extends State<SecondSolarPage> {
  // double
  double padding = 16.0;
  double radius = 24.0;
  double imageWidth = 250.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          // appbar
          Positioned(
            top: 0,
            left: padding,
            child: SafeArea(
              top: true,
              left: true,
              right: true,
              child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  height: 28.0,
                  width: 28.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.close,
                      size: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),

          
          // topRight image
          Positioned(
            top: 32.0,
            right: -imageWidth /2,
            child: Transform.rotate(
              angle: -0.35,
              child: Container(
                height: imageWidth,
                width: imageWidth,
                child: Image.network(
                  items[widget.index].animatedImage,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
