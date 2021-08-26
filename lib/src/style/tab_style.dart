import 'package:flutter/cupertino.dart';

class TabStyle {
  final TextStyle selected;
  final TextStyle unSelected;

  const TabStyle({
    this.selected = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    this.unSelected = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
  });
}