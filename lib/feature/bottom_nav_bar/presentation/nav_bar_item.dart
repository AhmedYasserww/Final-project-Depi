import 'package:flutter/material.dart';

class NavBarItem {
  final String title;
  final String outlinedIcon;
  final String filledIcon;
  final Widget screen;

  const NavBarItem({
    required this.title,
    required this.outlinedIcon,
    required this.filledIcon,
    required this.screen,
  });
}