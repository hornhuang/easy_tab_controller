import 'package:flutter/material.dart';

import 'tab_item_builder.dart';

class TabItem extends StatefulWidget {
  String title;
  Icon? icon;
  bool isSelected;
  GestureTapCallback? ontap;
  int? flex;
  int index;

  TabItem({this.title = "undefind", Key? key, this.icon, this.isSelected = false, this.ontap, this.flex = 1, this.index = 0}) : super(key: key);

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

  Widget _buildContent() {
    return Container(
      padding: EdgeInsets.all(8),
      child: Center(
        child: Text(
          widget.title,
          style: TextStyle(
              fontSize: widget.isSelected ? 20 : 16,
              fontWeight: widget.isSelected ? FontWeight.bold : FontWeight.normal
          ),
        ),
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
