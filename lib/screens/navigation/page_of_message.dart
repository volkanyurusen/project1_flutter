import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/zscreens.dart';
import 'package:my_project/widgets/widget.dart';

class PageOfMessage extends StatefulWidget {
  const PageOfMessage({Key? key}) : super(key: key);

  @override
  State<PageOfMessage> createState() => _PageOfMessageState();
}

class _PageOfMessageState extends State<PageOfMessage>
    with TickerProviderStateMixin {
  final AppColors _appColors = AppColors();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  final AppVisualConstants _appVisualConstants = AppVisualConstants();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = _createTabControllerInstance();
  }

  // TAB CONTROLLER INSTANCE ===========================================================================================
  // CREATE ============================================================================================================
  TabController _createTabControllerInstance() => TabController(
        length: _appNumberConstants.appCoachId == 0 ? 3 : 4,
        vsync: this,
        initialIndex: context.read<IndexOfMessageTabCubit>().state.currentIndex,
      );

  @override
  Widget build(BuildContext context) {
    final double screenHeight = context.height;
    final double screenWidth = context.width;
    final Color tabColor = _appColors.primary;
    final Color selectedLabelColor = _appColors.scaffoldBackgroundColor;
    final Color unselectedLabelColor =
        _appColors.scaffoldBackgroundColor.withOpacity(0.5);

    return
        // SingleChildScrollView(child:
        CustomColumn(
      children: [
        _createContainerOnTop(screenHeight, tabColor),
        _createTabBarArea(_tabController, screenWidth, tabColor,
            selectedLabelColor, unselectedLabelColor),
        _createTabBarBody(_tabController),
      ],
    );
    // );
  }

  /// CREATE ==========================================================================================================
  Container _createContainerOnTop(
    double screenHeight,
    Color tabColor,
  ) =>
      Container(height: screenHeight / 10, color: tabColor);

  Container _createTabBarArea(
    TabController tabController,
    double screenWidth,
    Color tabColor,
    Color selectedLabelColor,
    Color unselectedLabelColor,
  ) =>
      Container(
        padding: _appVisualConstants.horizontalAppMargin,
        color: tabColor,
        child: _displayTabBarTitle(tabController, screenWidth, tabColor,
            selectedLabelColor, unselectedLabelColor),
      );

  BodyOfTabBar _createTabBarBody(
    TabController tabController,
  ) =>
      BodyOfTabBar(child: _displayTabBarPages(tabController));

  /// DISPLAY =========================================================================================================
  DefaultTabController _displayTabBarTitle(
    TabController tabController,
    double screenWidth,
    Color tabColor,
    Color selectedLabelColor,
    Color unselectedLabelColor,
  ) =>
      DefaultTabController(
          length: _appNumberConstants.appCoachId == 0 ? 3 : 4,
          child: Container(
              width: screenWidth,
              decoration: BoxDecoration(color: tabColor),
              child: TabBar(
                onTap: (tabIndex) {
                  context.read<IndexOfMessageTabCubit>().tabChanged(tabIndex);
                },
                isScrollable: true,
                // _appNumberConstants.appCoachId == 0 ? false : true,
                controller: tabController,
                labelColor: selectedLabelColor,
                unselectedLabelColor: unselectedLabelColor,
                indicator: _createUnderlineTabIndicator(selectedLabelColor),
                tabs: _appNumberConstants.appCoachId == 0
                    ? const [
                        Tab(text: 'Activity'),
                        Tab(text: 'Training Request'),
                        Tab(text: 'Find A Coach'),
                        // Tab(text: 'Notification'),
                      ]
                    : const [
                        Tab(text: 'Activity'),
                        Tab(text: 'Training Request'),
                        Tab(text: 'Find A Coach'),
                        Tab(text: 'Training Offer'),
                        // Tab(text: 'Notification'),
                      ],
              )));

  // TabBar(
  // isScrollable: false,
  // // labelPadding: EdgeInsets.symmetric(horizontal: 0),
  // controller: tabController,
  // labelColor: selectedLabelColor,
  // unselectedLabelColor: unselectedLabelColor,
  // indicator: _createUnderlineTabIndicator(selectedLabelColor),
  // tabs: _appNumberConstants.appCoachId == 0
  //     ? const [
  //         Tab(text: 'Activity'),
  //         Tab(text: 'Training Request'),
  //         Tab(text: 'Notification'),
  //       ]
  //     : const [
  //         Tab(text: 'Activity'),
  //         Tab(text: 'Traimning Request'),
  //         Tab(text: 'Training Offer'),
  //         Tab(text: 'Notification'),
  //       ]);

  TabBarView _displayTabBarPages(
    TabController tabController,
  ) =>
      TabBarView(
          controller: tabController,
          children: _appNumberConstants.appCoachId == 0
              ? const [
                  TabOfConversationOfActivity(),
                  TabOfConversationOfGroupedTrainingRequest(),
                  TabOfConversationOfGroupedFindACoach(),
                  // TabOfNotification(),
                ]
              : const [
                  TabOfConversationOfActivity(),
                  TabOfConversationOfGroupedTrainingRequest(),
                  TabOfConversationOfGroupedFindACoach(),
                  TabOfConversationOfGroupedTrainingOffer(),
                  // TabOfNotification(),
                ]);

  /// METHOD ===========================================================================================================
  UnderlineTabIndicator _createUnderlineTabIndicator(
    Color selectedLabelColor,
  ) =>
      UnderlineTabIndicator(borderSide: BorderSide(color: selectedLabelColor));
}
