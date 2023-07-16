import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';

class CustomDefaultTabBarController extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final TabController? tabController;
  final List<Widget> tabs;
  final void Function(int)? onTap;
  final double screenWidth;
  final int? tabLength;
  final Color? tabColor;
  final Color? selectedLabelColor;
  final Color? unselectedLabelColor;

  CustomDefaultTabBarController({
    this.tabController,
    required this.tabs,
    this.onTap,
    required this.screenWidth,
    required this.tabLength,
    required this.tabColor,
    this.selectedLabelColor,
    this.unselectedLabelColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _createTabBarTitleArea();
  }

  // DEFAULT TAB CONTROLLER ============================================================================================
  // CREATE ============================================================================================================
  DefaultTabController _createTabBarTitleArea() => DefaultTabController(
      length: tabLength ?? 3, child: _createTabBarContainer());

  // TAB BAR CONTAINER =================================================================================================
  // CREATE ============================================================================================================
  Container _createTabBarContainer() => Container(
        width: screenWidth,
        decoration: BoxDecoration(color: tabColor),
        child: _createTabBar(),
      );

  // TAB BAR ===========================================================================================================
  // CREATE ============================================================================================================
  TabBar _createTabBar() => TabBar(
        onTap: onTap,
        isScrollable: true,
        controller: tabController,
        labelColor: selectedLabelColor,
        unselectedLabelColor: unselectedLabelColor,
        indicator: _createUnderlineTabIndicator(),
        tabs: tabs,
      );

  // METHODS ===========================================================================================================
  UnderlineTabIndicator _createUnderlineTabIndicator() => UnderlineTabIndicator(
      borderSide:
          BorderSide(color: selectedLabelColor ?? _appColors.textColor));
}
