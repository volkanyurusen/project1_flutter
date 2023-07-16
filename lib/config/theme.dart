import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';

ThemeData theme() {
  final AppColors appColors = AppColors();

  /// All Theme Colors are defined in this class. This class creates the app's
  /// custom details (like colors, text details, etc.)
  return ThemeData(
    primaryColor: appColors.primaryColor,
    primaryColorDark: appColors.primaryColorDark,
    primaryColorLight: appColors.primaryColorLight,
    colorScheme: ColorScheme.fromSeed(
      primary: appColors.primary,
      onPrimary: appColors.onPrimary,
      seedColor: appColors.seedColor,
      secondary: appColors.secondary,
      onSecondary: appColors.onSecondary,
      background: appColors.scaffoldBackgroundColor,
      tertiary: appColors.tertiary,
      onTertiary: appColors.tertiary,
    ),

    /// The Scaffold Class AppBar color details.
    scaffoldBackgroundColor: appColors.scaffoldBackgroundColor,

    // backgroundColor: appColors.backgroundColor,

    /// FloadingActionButtonTheme details
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: appColors.primaryColor,
      elevation: 5.0,
    ),

    /// TextField Theme

    /// App's font family details
    fontFamily: 'Lato',

    /// App's text high details
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: appColors.textColor,
        fontWeight: FontWeight.bold,
        fontSize: 36,
        fontStyle: FontStyle.normal,
        height: 1.2,
      ),
      displayMedium: TextStyle(
        color: appColors.textColor,
        fontWeight: FontWeight.bold,
        fontSize: 24,
        fontStyle: FontStyle.normal,
        height: 1.2,
      ),
      displaySmall: TextStyle(
        color: appColors.textColor,
        fontWeight: FontWeight.bold,
        fontSize: 18,
        fontStyle: FontStyle.normal,
        height: 1.2,
      ),
      headlineMedium: TextStyle(
        color: appColors.textColor,
        fontWeight: FontWeight.bold,
        fontSize: 16,
        fontStyle: FontStyle.normal,
        height: 1.2,
      ),
      headlineSmall: TextStyle(
        color: appColors.textColor,
        fontWeight: FontWeight.bold,
        fontSize: 14,
        fontStyle: FontStyle.normal,
        height: 1.2,
      ),
      titleLarge: TextStyle(
        color: appColors.textColor,
        fontWeight: FontWeight.normal,
        fontSize: 14,
        fontStyle: FontStyle.normal,
        height: 1.2,
      ),
      bodyLarge: TextStyle(
        color: appColors.textColor,
        fontWeight: FontWeight.normal,
        fontSize: 12,
        fontStyle: FontStyle.normal,
        height: 1.2,
      ),
      bodyMedium: TextStyle(
        color: appColors.textColor,
        fontWeight: FontWeight.normal,
        fontSize: 10,
        fontStyle: FontStyle.normal,
        height: 1.2,
      ),
    ),

    /// BottomNavigationBar details
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        selectedItemColor: appColors.bottomNavigationBarSelectedItemColor,
        unselectedItemColor: appColors.bottomNavigationBarUnselectedItemColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedIconTheme: const IconThemeData(
          size: 24,
        ),
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
        ),
        unselectedIconTheme: const IconThemeData(
          size: 24,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
        )),

    /// AppBarTheme details
    appBarTheme: AppBarTheme(
        backgroundColor: appColors.appBarBackroundColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: appColors.appBarLeadingColor,
        )),

    /// DividerTheme details
    dividerTheme:
        DividerThemeData(color: appColors.dividerColor, thickness: 1.0),

    /// TabBarTheme details
    tabBarTheme: TabBarTheme(
      labelColor: appColors.textColor,
      unselectedLabelStyle: const TextStyle(fontFamily: 'Lato', fontSize: 16),
      unselectedLabelColor: appColors.textColor.withOpacity(0.5),
      indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
              color:
                  appColors.textColor)), // outdated and has no effect to Tabbar
      labelStyle: const TextStyle(
          fontFamily: 'Lato', fontSize: 16, fontWeight: FontWeight.bold),
    ),

    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      isDense: true,
    ),
  );
}
