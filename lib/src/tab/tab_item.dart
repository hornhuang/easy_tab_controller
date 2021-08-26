import 'package:easy_tab_controller/src/style/tab_style.dart';
import 'package:flutter/material.dart';

import 'tab_item_builder.dart';
import 'tab_location.dart';

class TabItem extends StatefulWidget {
  String title;
  Icon? icon;
  bool isSelected;
  GestureTapCallback? ontap;
  int? flex;
  int index;
  ItemOrientation orientation;
  TabStyle style;

  TabItem({
    this.title = "undefind",
    Key? key, this.icon,
    this.isSelected = false,
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
    item.isSelected = itemBuilder.isSelected;
    item.ontap = itemBuilder.ontap;
    item.flex = itemBuilder.flex;
    if (style != null) item.style = style;
    return item;
  }

  @override
  TabItemState createState() => TabItemState();
}

class TabItemState extends State<TabItem> {

  onStateChanged(bool isSelected) {
    setState(() {
      widget.isSelected = isSelected;
    });
  }

  List<Widget> _configItems() {
    double iconWidth = widget.isSelected ? 18 : 16;
    return [
      widget.icon == null ? Container() : Icon(widget.icon?.icon, size: iconWidth,),
      SizedBox(width: 8, height: 8,),
      Text(
        widget.title,
        style: TextStyle(
            fontSize: widget.isSelected ? 18 : 16,
            fontWeight: widget.isSelected ? FontWeight.bold : FontWeight.normal
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
