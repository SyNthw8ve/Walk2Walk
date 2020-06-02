import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../map/map.dart';
import '../notifications/notifications.dart';
import '../options/options.dart';
import '../../models/notifications-model/notifications-model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => NotificationsModel(),
        child: Scaffold(
          body: SafeArea(
              top: false,
              child: IndexedStack(
                index: _selectedIndex,
                children: <Widget>[Map(), Notifications(), Options()],
              )),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.map), title: Text('Map')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  title: Text('Notifications')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), title: Text('Settings'))
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.cyan[600],
            unselectedItemColor: Colors.cyan[200],
            onTap: _onItemTapped,
          ),
        ));
  }
}
