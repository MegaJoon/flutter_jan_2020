import 'package:flutter/material.dart';

class CardList {
  List<Color> colors;
  String balance;
  String cardName;

  CardList({this.colors, this.balance, this.cardName});
}

List<CardList> cards = [
  CardList(
    colors: [
      Color.fromRGBO(0, 0, 255, 1),
      Color.fromRGBO(55, 124, 255, 1),
      Color.fromRGBO(223, 31, 228, 1),
    ],
    balance: "\$2349.15",
    cardName: "Visa",
  ),

  CardList(
    colors: [
      Color.fromRGBO(255, 193, 117, 1),
      Color.fromRGBO(254, 68, 14, 1),
      Color.fromRGBO(255, 193, 117, 1),
    ],
    balance: "\$7777.15",
    cardName: "Master",
  ),

  CardList(
    colors: [
      Colors.grey[300],
      Colors.grey[800],
      Colors.grey[300],
    ],
    balance: "\$3333.15",
    cardName: "Visa",
  ),
];