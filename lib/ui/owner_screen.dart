import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sporttt/ui/tab_admin_noti_detail.dart';
import 'package:sporttt/ui/tab_find_competitor.dart';
import 'package:sporttt/ui/tab_owner.dart';
import 'package:sporttt/ui/tab_profile.dart';
import '../utils/constant.dart';

class OwnerScreen extends StatefulWidget {
  @override
  _OwnerScreen createState() => _OwnerScreen();
}

class _OwnerScreen extends State<OwnerScreen> {
  @override
  Widget build(BuildContext context) {
    return _buildOwnerScreen();
  }

  Widget _buildOwnerScreen() {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.grey,
              size: 26,
            ),
            activeIcon: Icon(
              Icons.home,
              color: Colors.lightGreen,
              size: 36,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
              color: Colors.grey,
              size: 26,
            ),
            activeIcon: Icon(
              Icons.notifications,
              color: Colors.lightGreen,
              size: 36,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.grey,
              size: 26,
            ),
            activeIcon: Icon(
              Icons.person,
              color: Colors.lightGreen,
              size: 36,
            ),
          ),
        ],
        activeColor: Colors.black,
        inactiveColor: Colors.grey,
      ),
      tabBuilder: (context, index) {
        CupertinoTabView returnValue;
        switch (index) {
          case 0:
            returnValue = _buildTabView(PitchManagement());
            break;
          case 1:
            returnValue = _buildTabView(TabNotificationAdmin());
            break;
          case 2:
            returnValue = _buildTabView(TabProfileScreen());
            break;
        }
        return returnValue;
      },
    );
  }

  CupertinoTabView _buildTabView(Widget tabView) {
    return CupertinoTabView(
      builder: (context) => tabView,
    );
  }
}
