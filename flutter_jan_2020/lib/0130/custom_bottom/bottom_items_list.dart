import 'package:flutter/material.dart';

class ItemsList {
  Color color;
  IconData icon;
  String title;

  ItemsList({this.color, this.icon, this.title});
}

List<ItemsList> items = [
  ItemsList(
    color: Color.fromRGBO(128, 196, 246, 1),
    icon: Icons.home,
    title: "Home",
  ),

  ItemsList(
    color: Color.fromRGBO(247, 210, 129, 1),
    icon: Icons.search,
    title: "Search",
  ),

  ItemsList(
    color: Color.fromRGBO(247, 159, 129, 1),
    icon: Icons.layers,
    title: "Reports",
  ),

  ItemsList(
    color: Color.fromRGBO(88, 204, 221, 1),
    icon: Icons.notifications,
    title: "Notifi",
  ),
];