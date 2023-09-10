import 'package:flutter/material.dart';

class BottomTabItem extends BottomNavigationBarItem {
  final String initialLocation;

  const BottomTabItem(
      {required this.initialLocation,
        required Widget icon,
        String? label,
        Widget? activeIcon})
      : super(icon: icon, label: label, activeIcon: activeIcon ?? icon);
}