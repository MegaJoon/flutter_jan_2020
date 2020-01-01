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

  // list image
  List<String> imageList = [
    "https://cdn.pixabay.com/photo/2019/12/08/16/00/nature-4681448__340.jpg",
    "https://cdn.pixabay.com/photo/2019/12/14/12/08/night-4694750__340.jpg",
    "https://cdn.pixabay.com/photo/2019/12/05/11/10/snowman-4674856__340.jpg",
  ];

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

          // main column
          Positioned(
            top: padding *4,
            left: padding,
            right: 0,
            bottom: 0,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // top container
                  Container(
                    margin: EdgeInsets.only(bottom: padding *2),
                    height: 250.0,
                    child: Stack(
                      children: <Widget>[
                        // left column
                        Positioned(
                          top: 0,
                          left: 0,
                          bottom: padding,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              // text: distance from sun
                              Text("Distance from sun",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.w400,
                                ),
                              ),

                              // text: 148.377.282~
                              Text("148.377.282 MI KM",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Spacer(),

                              // text: Radius
                              Text("Radius",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.w400,
                                ),
                              ),

                              // text: 3,390 kilometes
                              Text("3,390 kilometes",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Spacer(),

                              // text: Year
                              Text("Year",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.w400,
                                ),
                              ),

                              // text: 678 Earth Days
                              Text("678 Earth Days",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Spacer(),

                              // text: Planet type
                              Text("Planet type",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.w400,
                                ),
                              ),

                              // text: Terrestrial
                              Text("Terrestrial",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // right image
                        Positioned(
                          top: 0,
                          right: -imageWidth /2,
                          bottom: 0,
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
                  ),

                  // text: text, description
                  Container(
                    margin: EdgeInsets.only(
                        right: padding,
                        bottom: padding *2,
                    ),
                    height: 120.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            // text: text
                            Text(items[widget.index].text,
                              style: TextStyle(
                                fontSize: 48.0,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            // spacer
                            Spacer(),

                            // 2 icons
                            Icon(
                              Icons.favorite_border,
                              size: 24.0,
                              color: Colors.grey,
                            ),

                            SizedBox(width: 8.0),

                            Icon(
                              Icons.file_download,
                              size: 24.0,
                              color: Colors.grey,
                            ),
                          ],
                        ),

                        // text: description
                        Text(items[widget.index].description,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // container: gallery
                  Container(
                    margin: EdgeInsets.only(bottom: padding),
                    height: 150.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // text: Gallery
                        Text("Gallery",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        // listView
                        Flexible(
                          fit: FlexFit.tight,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.only(top: padding /2),
                              itemBuilder: (context, index){
                                return Container(
                                  margin: EdgeInsets.only(right: padding),
                                  width: 130.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(radius /2),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        imageList[index],
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
//                                  child: Placeholder(),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),

                  // container: Size and Distance
                  Container(
                    margin: EdgeInsets.only(bottom: padding),
                    height: 150.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // text: Size and Distance
                        Text("Size and Distance",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        // listView
                        Flexible(
                          fit: FlexFit.tight,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.only(top: padding /2),
                              itemBuilder: (context, index){
                                return Container(
                                  margin: EdgeInsets.only(right: padding),
                                  width: 130.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(radius /2),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        imageList[index],
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
//                                  child: Placeholder(),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),

                  Placeholder(),
                  Placeholder(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
