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

    );
  }
}

class TabControllerPage extends StatefulWidget {
  @override
  _TabControllerPageState createState() => _TabControllerPageState();
}

class _TabControllerPageState extends State<TabControllerPage> {
  @override
  Widget build(BuildContext context) {
    return EasyTabController(
      location: WebTabLocation.left,
      tabs: [
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
      ],
      body:[
        Center(
          child: Text(""),
        )
      ],
    );
  }
}
