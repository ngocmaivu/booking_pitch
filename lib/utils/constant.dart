import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';

// List Bottom Navigation Bar Items
const List<BottomNavigationBarItem> BOTTOM_NAVIGATION_BAR_ITEMS = [
  BottomNavigationBarItem(
    icon: Icon(
      Icons.home,
      color: Colors.grey,
      size: 26,
    ),
    activeIcon: Icon(
      Icons.home,
      color: Colors.green,
      size: 36,
    ),
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.sports_basketball_rounded,
      color: Colors.grey,
      size: 26,
    ),
    activeIcon: Icon(
      Icons.sports_basketball_rounded,
      color: Colors.green,
      size: 36,
    ),
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.camera_outlined,
      color: Colors.grey,
      size: 26,
    ),
    activeIcon: Icon(
      Icons.camera_outlined,
      color: Colors.green,
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
      color: Colors.green,
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
      color: Colors.green,
      size: 36,
    ),
  ),
];
