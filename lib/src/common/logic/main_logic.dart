class MainLogic extends GetxController {
  final state = MainState();

  @override
  void onInit() {
    ///初始化应用信息
    InitConfig.initApp(Get.context);
    super.onInit();
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

    initWindow(scale: isScale ? 1.25 : 1.0);
  }
}