import 'package:flutter/material.dart';
import './HomePages/homeFirst.dart';
import './HomePages/myPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<Widget> bottomPages = [
    HomeFirse(),
    MyPage()
  ];
  //底部栏数据
  List<BottomNavigationBarItem> bottomBarItem = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('首页')
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_pin),
      title: Text('我的')
    )
  ]; 
  //pageView的controller
  PageController _controller = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my_app',
      home: Scaffold(
        body: PageView(
          controller: _controller,
          children: bottomPages,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: bottomBarItem,
          currentIndex: currentIndex,
          type:BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              currentIndex = index;
              this._controller.jumpToPage(index);
              // this._controller.notifyListeners();
            });
          },
        )
      ),
    );
  }
}