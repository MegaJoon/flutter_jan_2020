import 'package:flutter/material.dart';

class ItemsList {
  IconData icon;
  String title;
  bool isSelected;

  ItemsList({this.icon, this.title, this.isSelected});
}

List<ItemsList> items = [
  ItemsList(
    icon: Icons.arrow_downward,
    title: "Downloads",
    isSelected: true,
  ),

  ItemsList(
    icon: Icons.timeline,
    title: "Images",
    isSelected: false,
  ),

  ItemsList(
    icon: Icons.music_note,
    title: "Music",
    isSelected: false,
  ),

  ItemsList(
    icon: Icons.cloud_queue,
    title: "Cloud",
    isSelected: false,
  ),

  ItemsList(
    icon: Icons.filter,
    title: "Documents",
    isSelected: true,
  ),

  ItemsList(
    icon: Icons.play_arrow,
    title: "Movies",
    isSelected: false,
  ),

  ItemsList(
    icon: Icons.cloud_queue,
    title: "Cloud",
    isSelected: false,
  ),

  ItemsList(
    icon: Icons.filter,
    title: "Documents",
    isSelected: false,
  ),

  ItemsList(
    icon: Icons.play_arrow,
    title: "Movies",
    isSelected: false,
  ),
];
