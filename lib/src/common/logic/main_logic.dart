import 'package:easy_tab_controller/src/common/state/main_state.dart';
import 'package:easy_tab_controller/src/tab/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainLogic extends GetxController {
  final state = MainState();

  @override
  void onInit() {
    ///初始化应用信息
//    InitConfig.initApp(Get.context);
    super.onInit();
  }

  void initItems(List<TabItem> itemList) {
    state.itemList = itemList;
    update();
  }

  void initPages(List<Widget> pageList) {
    state.pageList = pageList;
    update();
  }

  ///切换tab
  void switchTap(int index) {
    state.selectedIndex = index;
    state.pageController.jumpToPage(index);
    update();
  }

  ///是否展开侧边栏
  void onUnfold(bool isUnfold) {
    state.isUnfold = !state.isUnfold;
    update();
  }

  ///是否缩放
  void onScale(bool isScale) {
    state.isScale = !state.isScale;
    update();

//    initWindow(scale: isScale ? 1.25 : 1.0);
  }
}