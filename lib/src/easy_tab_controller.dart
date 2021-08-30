import 'package:easy_tab_controller/src/style/tab_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/logic/main_logic.dart';
import 'common/state/main_state.dart';
import 'tab/tab_item.dart';
import 'tab/tab_item_builder.dart';
import 'tab/tab_location.dart';

class EasyTabController extends StatefulWidget {
  List<TabItemBuilder> tabs;
  List<Widget> pages;

  PageController? pageController;
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
    this.pageController,
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
//  TabItem? selectedItem;
  GlobalKey<TabItemState>? selectedKey;
  int selectedIndex = 0;

  _configItemTabs() {
    if (widget.tabs.length < 1) {
      return;
    }
    List<TabItem> items = [];
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
              selectedIndex = index;
              tab.isSelected = true;
//              selectedItem = tab;
              selectedKey = keys[index];
            });
          };
          print("${state.itemList.length}--asdasdasdas");
          items.add(tab);
    });
    logic.initItems(items);
    selectedKey = keys[0];
//    selectedItem = tabItems[0];
//    selectedItem?.isSelected = true;
  }

  Widget _buildTabs() {
    return (widget.location == WebTabLocation.top
        || widget.location == WebTabLocation.bottom) ?
    Row(
      children: [
        ...state.itemList
      ],
    ) : Column(
      children: [
        ...state.itemList
      ],
    );
  }

  Widget _buildContent() {
    Widget page = Container();
    if (selectedIndex > state.pageList.length - 1 || state.pageList.length == 0) {
      page = Center(
        child: Text(
          "null content"
        ),
      );
    } else {
      page = state.pageList[state.selectedIndex];
    }
    return page;
  }

  List<Widget> _configPage() {
    return (widget.location == WebTabLocation.top
        || widget.location == WebTabLocation.left) ?
    [_buildTabs(), _buildContent()] : [ _buildContent(), _buildTabs()];
  }

  Widget _buildPage() {
    return Expanded(
        child: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: state.pageList.length,
          itemBuilder: (context, index) => Stack(
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
          ),
          controller: state.pageController,
        ),
    );
  }

  _updateState() {
    logic.initPages(widget.pages);
    state.selectedIndex = 0;
    state.isUnfold = false;
    state.isScale = false;
    state.pageList = widget.pages;
    state.pageController = widget.pageController ?? PageController();
  }

  @override
  void initState() {
    super.initState();
    _configItemTabs();
    _updateState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: widget.appBar,
      body: Stack (
        children: [
          widget.background ?? Container(),
          _buildPage(),
        ]
      ),
    );
  }
}
