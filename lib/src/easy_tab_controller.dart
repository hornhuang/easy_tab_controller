import 'package:easy_tab_controller/easy_tab_controller.dart';
import 'package:easy_tab_controller/src/common/views/keep_alive_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/logic/main_logic.dart';
import 'common/state/main_state.dart';
import 'common/style/tab_style.dart';
import 'tab/tab_item.dart';
import 'tab/tab_item_builder.dart';
import 'tab/tab_location.dart';

class EasyTabController extends StatefulWidget {
  List<TabItemBuilder> tabs;
  List<Widget> pages;

  WebTabLocation location;
  Color color;
  TabStyle? style;
  Widget? background;
  Widget? pageBackground;
  AppBar? appBar;

  EasyTabController({
    Key? key,
    this.tabs = const <TabItemBuilder>[],
    this.pages = const <Widget>[],
    this.location = WebTabLocation.top,
    this.color = Colors.white,
    this.style,
    this.background,
    this.pageBackground,
    this.appBar,
  }) : super(key: key);

  @override
  _EasyTabControllerState createState() => _EasyTabControllerState();
}

class _EasyTabControllerState extends State<EasyTabController> {
  final MainLogic logic = Get.put(MainLogic());
  final MainState state = Get.find<MainLogic>().state;

  List<GlobalKey<TabItemState>> keys = [];
  TabItem? selectedItem;
  GlobalKey<TabItemState>? selectedKey;

  _configTabs() {
    List<TabItem> tabItems = [];
    widget.tabs
        .asMap()
        .forEach((index, element) {
      GlobalKey<TabItemState> key = GlobalKey();
      keys.add(key);
      TabItem tab = TabItem.builder(element, widget.style, tabKey: key);
      tab.index = index;
      tab.ontap = () {
        element.ontap?.call();
        setState(() {
          selectedKey?.currentState?.onStateChanged(false);
          logic.switchTap(index);
          tab.isSelected = true;
          selectedItem = tab;
          selectedKey = keys[index];
        });
      };
      tabItems.add(tab);
    });
    selectedKey = keys[0];
    selectedItem = tabItems[0];
    selectedItem?.isSelected = true;
    state.tabs = tabItems;
  }

  _configPages() {
    List<KeepAlivePage> pages = [];
    widget.pages.forEach((element) {
      pages.add(KeepAlivePage(child: element));
    });
    state.pageList = pages;
  }

  _configState() {
    if (widget.tabs.length == 0 || widget.pages.length == 0) {
      LogW("tabs and pages should > 0");
      return;
    }
    if (widget.tabs.length != widget.pages.length) {
      LogW("tabs.count need == pages.counts");
      return;
    }
    _configTabs();
    _configPages();
    state.selectedIndex = 0;
    state.isUnfold = false;
    state.isScale = false;
    state.pageController = PageController(
        initialPage: 0,
        keepPage: true,
        viewportFraction: 1.0
    );
  }

  Widget _buildTabs() {
    return Expanded(
      flex: 0,
        child: (widget.location == WebTabLocation.top
            || widget.location == WebTabLocation.bottom) ?
        Row(
          children: [
            ...state.tabs
          ],
        ) : Column(
          children: [
            ...state.tabs
          ],
        )
    );
  }

  Widget _buildContent() {
    return Expanded(
        flex: 1,
        child: PageView.builder(
          scrollBehavior: MaterialScrollBehavior(),
          restorationId: "easy_tab_controller.page_0x1",
          onPageChanged: (index) {
            logic.switchTap(index);
          },
          itemCount: state.pageList.length,
//          physics: NeverScrollableScrollPhysics(),
          controller: state.pageController,
          itemBuilder: (context, index) => state.pageList[index],
        )
    );
  }

  List<Widget> _configPage() {
    return (widget.location == WebTabLocation.top
        || widget.location == WebTabLocation.left) ?
    [_buildTabs(), _buildContent()] : [ _buildContent(), _buildTabs()];
  }

  Widget _buildPage() {
    return Stack(
      children: [
        widget.pageBackground ?? Container(),
        (widget.location == WebTabLocation.top
            || widget.location == WebTabLocation.bottom) ?
        Column(
          children: [
            ..._configPage()
          ],
        ) :
        Row(
          children: [
            ..._configPage()
          ],
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _configState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      body: Stack(
        children: [
          widget.background ?? Container(),
          _buildPage()
        ],
      )
    );
  }
}
