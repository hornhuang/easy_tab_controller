import 'package:easy_tab_controller/easy_tab_controller.dart';
import 'package:easy_tab_controller/src/tab/tab_item.dart';
import 'package:flutter/material.dart';

class MainState {
  ///选择index
  int selectedIndex;

  ///控制是否展开
  bool isUnfold;

  ///是否缩放
  bool isScale;

//  ///分类按钮数据源
//  late List<BtnInfo> list;

  ///Navigation的item信息
  List<TabItem> itemList;

  ///PageView页面
  List<Widget> pageList;
  PageController pageController;

  MainState({
    this.selectedIndex = 0,
    this.isUnfold = false,
    this.isScale = false,
    this.itemList = const [],
    this.pageList = const [],
    PageController? controller
  }) : pageController = controller ?? PageController();
}