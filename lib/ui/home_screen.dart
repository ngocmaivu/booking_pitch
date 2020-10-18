import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sporttt/ui/tab_find_competitor.dart';
import 'package:sporttt/ui/tab_create_clb.dart';
import 'package:sporttt/ui/tab_notification.dart';
import 'package:sporttt/ui/tab_pitch_detail.dart';
import 'package:sporttt/ui/tab_profile.dart';
import 'package:sporttt/utils/date_time_picker.dart';
import './tab_home_screen.dart';
import '../utils/constant.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return _buildHomeScreen();
  }

  Widget _buildHomeScreen() {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: BOTTOM_NAVIGATION_BAR_ITEMS,
        activeColor: Colors.black,
        inactiveColor: Colors.grey,
      ),
      tabBuilder: (context, index) {
        CupertinoTabView returnValue;
        switch (index) {
          case 0:
            returnValue = _buildTabView(PitchDetail());
            break;
          case 1:
            returnValue = _buildTabView(TabFindCompetitor());
            break;
          case 2:
            returnValue = _buildTabView(TabCreateCLB());
            break;
          case 3:
            returnValue = _buildTabView(TabNotificationScreen());
            break;
          case 4:
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
