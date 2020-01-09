class Plates {
  String image;
  String title;
  String price;

  Plates({this.image, this.title, this.price});
}

List<Plates> plates = [
  Plates(
    image: "assets/0109/image.png",
    title: "A Plate Of Fruit",
    price: "\$35.50",
  ),

  Plates(
    image: "assets/0109/image1.png",
    title: "Pasta With Egg",
    price: "\$30.00",
  ),

  Plates(
    image: "assets/0109/image2.png",
    title: "Pancakes",
    price: "\$23.66",
  ),
];