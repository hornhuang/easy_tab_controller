import 'package:easy_tab_controller/easy_tab_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '黎明韭菜',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabControllerPage(),
    );
  }
}

class TabControllerPage extends StatefulWidget {
  @override
  _TabControllerPageState createState() => _TabControllerPageState();
}

class _TabControllerPageState extends State<TabControllerPage> {

  List<TabItemBuilder> _buildTabs() {
    return [
      TabItemBuilder(
        icon: Icon(Icons.directions_car),
        title: "Android",
      ),
      TabItemBuilder(
        icon: Icon(Icons.directions_bike),
        title: "iOS",
      ),
      TabItemBuilder(
        icon: Icon(Icons.directions_boat),
        title: 'Flutter',
      ),
    ];
  }

  List<Widget> _buildPages() {
    return [
      Container(
        alignment: Alignment.center,
        child: Text("Android"),
      ),
      Container(
        alignment: Alignment.center,
        child: Text("iOS"),
      ),
      Container(
        alignment: Alignment.center,
        child: Text("Flutter"),
      ),
    ];
  }

  Widget _buildPageBackground() {
    return Center(
      child: Text("Page Background"),
    );
  }

  Widget _buildBackground() {
    return ConstrainedBox(
      child: Image.network(
        "https://images.unsplash.com/photo-1568878801598-d0a5f489613e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1595&q=80",
        fit: BoxFit.fill,
      ),
      constraints: new BoxConstraints.expand(),
    );
  }

  TabStyle get miniTabStyle => TabStyle(
    selected: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    unSelected: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w800,
    )
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasyTabController(
        style: miniTabStyle,
        background: _buildBackground(),
        pageBackground: _buildPageBackground(),
        location: WebTabLocation.top,
        tabs: _buildTabs(),
        pages: _buildPages(),
      ),
    );
  }
}
