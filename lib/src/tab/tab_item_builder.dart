import 'package:flutter/material.dart';

class TabItemBuilder {
  String title;
  Key? key;
  Icon? icon;
  GestureTapCallback? ontap;
  int? flex;

  TabItemBuilder({this.title = "undefind", this.key, this.icon, this.ontap, this.flex = 1}) {}
}