import 'package:flutter/material.dart';

import 'common/style/tab_style.dart';
import 'tab/tab_item.dart';
import 'tab/tab_item_builder.dart';
import 'tab/tab_location.dart';

class EasyTabController extends StatefulWidget {
  List<TabItemBuilder> tabs;
  List<Widget> page;

  WebTabLocation location;
  Color color;
  TabStyle? style;
  Widget? background;
  Widget? pageBackground;
  AppBar? appBar;

  EasyTabController({
    Key? key,
    this.tabs = const <TabItemBuilder>[],
    this.page = const <Widget>[],
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
  List<TabItem> tabItems = [];
  List<GlobalKey<TabItemState>> keys = [];
  TabItem? selectedItem;
  GlobalKey<TabItemState>? selectedKey;
  int selectedIndex = 0;

  _configItemTabs() {
    if (widget.tabs.length < 1) {
      return;
    }
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
              selectedItem = tab;
              selectedKey = keys[index];
            });
          };
          tabItems.add(tab);
    });
    selectedKey = keys[0];
    selectedItem = tabItems[0];
    selectedItem?.isSelected = true;
  }

  Widget _buildTabs() {
    return (widget.location == WebTabLocation.top
        || widget.location == WebTabLocation.bottom) ?
    Row(
      children: [
        ...tabItems
      ],
    ) : Column(
      children: [
        ...tabItems
      ],
    );
  }

  Widget _buildContent() {
    Widget page = Container();
    if (selectedIndex > widget.page.length - 1 || widget.page.length == 0) {
      page = Center(
        child: Text(
          "null content"
        ),
      );
    } else {
      page = widget.page[selectedIndex];
    }
    return page;
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
    _configItemTabs();
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
