import 'package:easy_tab_controller/src/common/state/main_state.dart';
import 'package:easy_tab_controller/src/common/views/keep_alive_page.dart';
import 'package:easy_tab_controller/src/tab/tab_item.dart';
import 'package:get/get.dart';

class MainLogic extends GetxController {
  final state = MainState();

  @override
  void onInit() {
    super.onInit();
  }

  ///是否展开侧边栏
  void addTabs(TabItem tabItem) {
    state.tabs.add(tabItem);
    update();
  }

  ///是否展开侧边栏
  void setPages(List<KeepAlivePage> pages) {
    state.pageList.addAll(pages);
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
  }
}