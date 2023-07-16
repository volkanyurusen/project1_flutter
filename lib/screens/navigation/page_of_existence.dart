import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/zscreens.dart';
import 'package:my_project/widgets/widget.dart';

class PageOfExistence extends StatefulWidget {
  const PageOfExistence({
    Key? key,
  }) : super(key: key);

  @override
  State<PageOfExistence> createState() => _PageOfExistenceState();
}

class _PageOfExistenceState extends State<PageOfExistence>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late List<Tab> _tabBarTitles;
  late List<Widget> _tabBarPages;

  @override
  void initState() {
    super.initState();
    _tabController = _createTabControllerInstance();
    _tabBarTitles = _displayTabBarTitles();
    _tabBarPages = _displayTabBarPages();
  }

  // TAB CONTROLLER INSTANCE ===========================================================================================
  // CREATE ============================================================================================================
  TabController _createTabControllerInstance() => TabController(
        length: 3,
        vsync: this,
        initialIndex:
            context.read<IndexOfExistenceTabCubit>().state.currentIndex,
      );

  // TAB BAR TITLES ====================================================================================================
  // DISPLAY ===========================================================================================================
  List<Tab> _displayTabBarTitles() => const [
        Tab(text: 'Creation'),
        Tab(text: 'Attendance'),
        Tab(text: 'Templates'),
      ];

  // TAB BAR PAGES =====================================================================================================
  // DISPLAY ===========================================================================================================
  List<Widget> _displayTabBarPages() => [
        TabOfCreation(),
        TabOfAttendance(),
        const TabOfTemplate(),
      ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return CustomTabBody(
      children: [
        _createSpaceFromTopOfScreen(screenHeight),
        _createTabBarTitle(_tabController),
        _createTabBarBody(_tabController),
      ],
    );
  }

  /// CREATE ===========================================================================================================
  CustomAppSizedBox _createSpaceFromTopOfScreen(
    double screenHeight,
  ) =>
      CustomAppSizedBox(height: screenHeight / 10);

  TabBar _createTabBarTitle(
    TabController tabController,
  ) =>
      TabBar(
        onTap: (tabIndex) =>
            context.read<IndexOfExistenceTabCubit>().tabChanged(tabIndex),
        controller: tabController,
        tabs: _tabBarTitles,
      );

  BodyOfTabBar _createTabBarBody(
    TabController tabController,
  ) =>
      BodyOfTabBar(child: _createTabBarPages(tabController));

  TabBarView _createTabBarPages(
    TabController tabController,
  ) =>
      TabBarView(
        controller: tabController,
        children: _tabBarPages,
      );

  /// DISPLAY ==========================================================================================================
  // List<Tab> get _displayTabBarTitles => const [
  //       Tab(text: 'Creation'),
  //       Tab(text: 'Attendance'),
  //       Tab(text: 'Templates'),
  //     ];

  // List<Widget> get _displayTabBarPages => [
  //       TabOfCreation(),
  //       TabOfAttendance(),
  //       const TabOfTemplate(),
  //     ];
}
