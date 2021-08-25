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

  TabItem({
    this.title = "undefind",
    Key? key, this.icon,
    this.isSelected = false,
    this.ontap,
    this.flex = 1,
    this.index = 0,
    this.orientation = ItemOrientation.horizontal
  }) : super(key: key);

  static TabItem builder(TabItemBuilder itemBuilder, {Key? tabKey}) {
    TabItem item = TabItem(key: itemBuilder.key ?? tabKey ?? UniqueKey(),);
    item.title = itemBuilder.title;
    item.icon = itemBuilder.icon;
    item.isSelected = itemBuilder.isSelected;
    item.ontap = itemBuilder.ontap;
    item.flex = itemBuilder.flex;
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
      Container(
        width: iconWidth,
        height: iconWidth,
        child: widget.icon,
      ),
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
      children: [
        ..._configItems()
      ],
    );
  }

  Widget _buildVerticalItem() {
    return Column(
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
