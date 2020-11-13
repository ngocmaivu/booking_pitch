import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sporttt/ui/tab_booking_pitch.dart';
import 'package:sporttt/ui/tab_find_competitor.dart';
import 'package:sporttt/ui/tab_create_clb.dart';
import 'package:sporttt/ui/tab_notification.dart';
import 'package:sporttt/ui/tab_owner.dart';
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
  CupertinoTabController _tabController;
  @override
  void initState() {
    _tabController = CupertinoTabController(initialIndex: 0);
    super.initState();
  }

  // Used to handle Android back button navigation with tab specific navigator.
  final GlobalKey<NavigatorState> firstTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> secondTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> thirdTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> fourthTabNavKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> fifthTabNavKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> _currentNavigatorKey() {
    switch (_tabController.index) {
      case 0:
        return firstTabNavKey;
      case 1:
        return secondTabNavKey;
      case 2:
        return thirdTabNavKey;
      case 3:
        return fourthTabNavKey;
      case 4:
        return fifthTabNavKey;
    }
    return firstTabNavKey;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _currentNavigatorKey().currentState.maybePop();
        return isFirstRouteInCurrentTab;
      },
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: BOTTOM_NAVIGATION_BAR_ITEMS,
          activeColor: Colors.black,
          inactiveColor: Colors.grey,
        ),
        tabBuilder: (context, index) {
          CupertinoTabView returnValue;
          switch (index) {
            case 0:
              returnValue = _buildTabView(
                TabHomeScreen(),
                firstTabNavKey,
              );
              break;
            case 1:
              returnValue = _buildTabView(
                TabFindCompetitor(),
                secondTabNavKey,
              );
              break;
            case 2:
              returnValue = _buildTabView(
                TabCreateCLB(),
                thirdTabNavKey,
              );
              break;
            case 3:
              returnValue = _buildTabView(
                TabNotificationScreen(),
                fourthTabNavKey,
              );
              break;
            case 4:
              returnValue = _buildTabView(
                TabProfileScreen(
                  homeContext: context,
                ),
                fifthTabNavKey,
              );
              break;
          }
          return returnValue;
        },
      ),
    );
  }

  CupertinoTabView _buildTabView(
    Widget tabView,
    GlobalKey<NavigatorState> navKey,
  ) {
    return CupertinoTabView(
      navigatorKey: navKey,
      builder: (context) => tabView,
    );
  }
}
