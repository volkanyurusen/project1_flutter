import 'package:flutter/material.dart';

class AppColors {
  AppColors._privateConstructor();

  static final AppColors _instance = AppColors._privateConstructor();

  factory AppColors() => _instance;

  static const Color _primaryColor = Color(0xFF014760);

  final Color primaryColorDark = const Color(0xFF001B25);
  final Color primaryColorLight = const Color(0xFF04688E);
  final Color primary = const Color(0xFF014760);
  final Color onPrimary = const Color(0xFFFFFFFF);
  final Color seedColor = const Color(0xFFA51F06);
  final Color secondary = const Color(0xFFED553B);
  final Color onSecondary = const Color(0xFFFF9E8C);

  final Color scaffoldBackgroundColor = const Color(0xFFFFFFFF);
  final Color backgroundColor = const Color(0xFFE5E5E5);

  final Color textColor = const Color(0xFF484848);

  final Color appBarBackroundColor = Colors.transparent;
  final Color appBarLeadingColor = const Color(0xFF484848);

  final bottomNavigationBarSelectedItemColor = const Color(0xFFED553B);
  final bottomNavigationBarUnselectedItemColor = const Color(0xFF484848);
  final Color iconUnselectedColor = const Color(0xFF484848);
  final Color iconSelectedColor = const Color(0xFFED553B);

  final Color dividerColor = const Color(0xFF484848);

  final Color unselectedContainerColor = const Color(0xFFACABAB);
  final Color selectedContainerColor = const Color(0xFF014760);
  final Color unselectedLabelColor = const Color(0xFFACABAB);
  final Color selectedLabelColor = const Color(0xFFFFFFFF);
  final Color unselectedButtonColor = const Color(0xFF484848);
  final Color selectedButtonColor = const Color(0xFF014760);

  final Color selectedLineColor = const Color(0xFF04688E);
  final Color buttonDarkColor = const Color(0xFF484848);

  final Color tertiary = const Color(0xFFFED049);
  final Color onTertiary = const Color(0xFFFFE497);

  final Color primaryLight = const Color(0xFF7AC1DC);

  Color get primaryColor => _primaryColor;
}
