import 'package:flutter/cupertino.dart';
import 'package:letsquiz/ui/colors.dart';

class Category {
  //Category Id - Every category have unique id
  final int id;
  //Category Name
  final String name;
  //Category Color
  final Color color;
  Category(this.id, this.name, this.color);
}

final List<Category> categories = [
  Category(9, "General Knowledge", color1),
  Category(12, "Music", color2),
  Category(17, "Science & Nature", color3),
  Category(18, "Computer", color4),
  Category(19, "Mathematics", color5),
  Category(30, "Gadgets", color6),
];
