import 'package:flutter/material.dart';

class TabItemBuilder {
  String title;
  Key? key;
  Icon? icon;
  bool isSelected;
  GestureTapCallback? ontap;
  int? flex;

  TabItemBuilder({this.title = "undefind", this.key, this.icon, this.isSelected = false, this.ontap, this.flex = 1}) {}
}