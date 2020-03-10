import 'package:flutter/material.dart';

import '../providers/theme.provider.dart';
import '../providers/firebase.provider.dart';
import './login.page.dart';

class TabPage extends StatefulWidget {
  TabPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TabPage createState() => _TabPage();
}

class _TabPage extends State<TabPage> {
  int _currentIndex = 0;
  // LIST ARRAY FOR TAB NAVIGATION
  final List<Widget> _children = [
    LoginPage(title: 'se text 1'),
    LoginPage(title: 'se text 2'),
    LoginPage(title: 'se text 3')
  ];

  final FirebaseProvider firebase = new FirebaseProvider();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabChanged,
        currentIndex: _currentIndex, // this will be set when a new tab is tapped
        items: [
          // TABS
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.favorite),
            title: new Text('Messages'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile')
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add)
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void onTabChanged(int index) {
    firebase.sendAnalyticsEvent('STATE_CHANGE', 'The state got changed to ' + index.toString());
    setState(() {
      _currentIndex = index;
    });
  }
}