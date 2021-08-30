import 'package:easy_tab_controller/src/common/logic/main_logic.dart';
import 'package:easy_tab_controller/src/common/state/main_state.dart';
import 'package:easy_tab_controller/src/common/style/tab_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'tab_item_builder.dart';
import 'tab_location.dart';

class TabItem extends StatefulWidget {
  String title;
  Icon? icon;
  GestureTapCallback? ontap;
  int? flex;
  int index;
  ItemOrientation orientation;
  TabStyle style;

  TabItem({
    this.title = "undefind",
    Key? key, this.icon,
    this.ontap,
    this.flex = 1,
    this.index = 0,
    this.orientation = ItemOrientation.horizontal,
    this.style = const TabStyle()
  }) : super(key: key);

  static TabItem builder(TabItemBuilder itemBuilder, TabStyle? style, {Key? tabKey,}) {
    TabItem item = TabItem(key: itemBuilder.key ?? tabKey ?? UniqueKey(),);
    item.title = itemBuilder.title;
    item.icon = itemBuilder.icon;
    item.ontap = itemBuilder.ontap;
    item.flex = itemBuilder.flex;
    if (style != null) item.style = style;
    return item;
  }

  @override
  TabItemState createState() => TabItemState();
}

class TabItemState extends State<TabItem> {

  List<Widget> _configItems() {
    return [
      GetBuilder<MainLogic>(builder: (logic) =>
      widget.icon == null ?
      Container() :
      Icon(widget.icon?.icon,
        size: logic.state.selectedIndex == widget.index ? 18 : 16,),
      ),
      SizedBox(width: 8, height: 8,),
      GetBuilder<MainLogic>(builder: (logic) =>
          Text(
            widget.title,
            style: TextStyle(
                fontSize: logic.state.selectedIndex == widget.index ? 18 : 16,
                fontWeight: logic.state.selectedIndex == widget.index ? FontWeight
                    .bold : FontWeight.normal
            ),
          ),
      ),
    ];
  }

  Widget _buildHorizontalItem() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ..._configItems()
      ],
    );
  }

  Widget _buildVerticalItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ..._configItems()
      ],
    );
  }

  Widget _buildContent() {
    return Container(
      padding: EdgeInsets.all(8),
      child: Center(
        child: widget.orientation == ItemOrientation.horizontal ? _buildHorizontalItem() : _buildVerticalItem(),
      ),
    );
  }

  GestureTapCallback? _onTapItem() {
    return (){
      widget.ontap?.call();
      setState(() { });
    };
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
          child: _buildContent(),
          onTap: _onTapItem(),
        )
    );
  }
}
