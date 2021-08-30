import 'package:easy_tab_controller/src/common/views/keep_alive_page.dart';
import 'package:easy_tab_controller/src/tab/tab_item.dart';
import 'package:flutter/material.dart';

class MainState {
  ///选择index
  int selectedIndex;

  ///控制是否展开
  bool isUnfold;

  ///是否缩放
  bool isScale;

  ///分类按钮数据源
  List<TabItem> tabs;

//  ///Navigation的item信息
//  late List<BtnInfo> itemList;

  ///PageView页面
  List<KeepAlivePage> pageList;
  late PageController pageController;

  MainState({
    this.selectedIndex = 0,
    this.isUnfold = false,
    this.isScale = false,
    this.pageList = const [],
    this.tabs = const [],
    PageController? controller
  }) {
    //页面控制器
    pageController = controller != null ? controller : PageController();
  }
}