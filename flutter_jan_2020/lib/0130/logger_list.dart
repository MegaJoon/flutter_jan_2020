class LoggerList {
  String title;
  String image;
  String image1;
  String image2;

  LoggerList({this.title, this.image, this.image1, this.image2});
}

String _image = "https://cdn.pixabay.com/photo/2020/01/26/17/01/lemur-4795249__340.jpg";
String _image1 = "https://cdn.pixabay.com/photo/2020/01/23/16/24/moonbow-4788088__340.jpg";
String _image2 = "https://cdn.pixabay.com/photo/2020/01/04/09/45/flower-4740103__340.jpg";

List<LoggerList> loggers = [
  LoggerList(
    title: "A moment",
    image: _image,
    image1: _image,
    image2: _image,
  ),

  LoggerList(
    title: "12 minutes",
    image: _image1,
    image1: _image2,
    image2: _image,
  ),

  LoggerList(
    title: "5 hours",
    image: _image,
    image1: _image1,
    image2: _image2,
  ),
];