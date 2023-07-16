import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/models/location_detail_dynamic.dart';
import 'package:my_project/screens/coaching/local_widgets/zlocal_widgets.dart';
import 'package:my_project/screens/discover/body_areas/discover_body_tab_bar_content_detail_area.dart';
import 'package:my_project/screens/navigation/local_widgets/local_widgets.dart';
import 'package:my_project/screens/profile/zscreens.dart';
import 'package:my_project/widgets/widget.dart';

class DiscoverBody extends StatefulWidget {
  const DiscoverBody({Key? key}) : super(key: key);

  @override
  State<DiscoverBody> createState() => _DiscoverBodyState();
}

class _DiscoverBodyState extends State<DiscoverBody>
    with TickerProviderStateMixin {
  final AppColors _appColors = AppColors();
  final AppVisualConstants _appVisualConstants = AppVisualConstants();
  final AppTextStyleConstants _appTextStyleConstants = AppTextStyleConstants();
  final AppFunctions _appFunctions = AppFunctions();
  final AppIconMapConstants _appIconMapConstants = AppIconMapConstants();
  final AppNumberConstants _appNumberConstants = AppNumberConstants();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = _createTabControllerInstance();

    if (_checkWhetherAnyLocationHasBeenChosen()) {
      _assignLastLocationDetailAsChosenOne();
    }
  }

  // TAB CONTROLLER INSTANCE ===========================================================================================
  // CREATE ============================================================================================================
  TabController _createTabControllerInstance() => TabController(
        length: _getTabLength(),
        vsync: this,
        initialIndex:
            context.read<IndexOfDiscoverTabCubit>().state.currentIndex,
      );

  // METHODS ===========================================================================================================
  // Get Methods -------------------------------------------------------------------------------------------------------
  int _getTabLength() =>
      _checkWhetherAnyActivityExists() ? 1 : _findAcitivtyListLength();
  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkWhetherAnyActivityExists() => context
      .read<CreatedActivityDynamicByHostBloc>()
      .state
      .createdActivityDynamicList
      .isEmpty;

  // Find Methods ------------------------------------------------------------------------------------------------------
  int _findAcitivtyListLength() => context
      .read<CreatedActivityDynamicByHostBloc>()
      .state
      .createdActivityDynamicList
      .length;

  // CHOSEN LOCATION ===================================================================================================
  // METHODS ===========================================================================================================
  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkWhetherAnyLocationHasBeenChosen() => context
      .read<ChosenLocationDetailDynamicButtonOnCreateActivityScreenCubit>()
      .state
      .chosenLocationDetailDynamicList
      .isEmpty;

  // Find Methods ------------------------------------------------------------------------------------------------------
  LocationDetailDynamic _findLastLocationDetail() => context
      .read<LocationDetailDynamicByChosenAttributesBloc>()
      .state
      .locationDetailDynamicList
      .last;

  // Assign Methods ----------------------------------------------------------------------------------------------------
  void _assignLastLocationDetailAsChosenOne() {
    if (context
        .read<LocationDetailDynamicByChosenAttributesBloc>()
        .state
        .locationDetailDynamicList
        .isNotEmpty) {
      context
          .read<ChosenLocationDetailDynamicButtonOnCreateActivityScreenCubit>()
          .pressedChosenLocationDetailDynamicButtonOnCreateActivityScreen(
              _findLastLocationDetail());
      print('chosen attrubutes: ${_findLastLocationDetail()}');
      print(
          'chosen location: ${context.read<ChosenLocationDetailDynamicButtonOnCreateActivityScreenCubit>().state.chosenLocationDetailDynamicList}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = context.height;
    final double screenWidth = context.width;
    final TextStyle buttonLabelTextStyle =
        TextStyle(color: _appColors.secondary, fontWeight: FontWeight.bold);
    final Color tabColor = _appColors.scaffoldBackgroundColor;
    final Color selectedLabelColor = _appColors.textColor;
    final Color unselectedLabelColor = _appColors.textColor.withOpacity(0.5);
    final Color buttonColor =
        _appColors.scaffoldBackgroundColor.withOpacity(0.75);

    return AppBody(
      child: CustomColumn(
        children: [
          _createContainerOnTop(screenHeight, tabColor),
          _createTabBarArea(_tabController, screenWidth, tabColor,
              selectedLabelColor, unselectedLabelColor),
          _createTabBarBody(_tabController, screenHeight, screenWidth,
              buttonLabelTextStyle, buttonColor),
        ],
      ),
    );
    // );
  }

  // CONTAINER TOP ON ==================================================================================================
  // CREATE ==========================================================================================================
  Container _createContainerOnTop(
    double screenHeight,
    Color tabColor,
  ) =>
      Container(height: screenHeight / 10, color: tabColor);

  // TAB BAR AREA ======================================================================================================
  // CREATE ============================================================================================================
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
        child: _buildTabBarTitleArea(tabController, screenWidth, tabColor,
            selectedLabelColor, unselectedLabelColor),
      );

  // BUILD =============================================================================================================
  BlocBuilder<CreatedActivityDynamicByHostBloc,
      CreatedActivityDynamicByHostState> _buildTabBarTitleArea(
    TabController tabController,
    double screenWidth,
    Color tabColor,
    Color selectedLabelColor,
    Color unselectedLabelColor,
  ) =>
      BlocBuilder<CreatedActivityDynamicByHostBloc,
          CreatedActivityDynamicByHostState>(
        builder: (context, byHoststate) {
          switch (byHoststate.status) {
            case StatusWithoutLoading.initial:
              return _createSkeltonForTabBarTitle(byHoststate, tabColor);
            case StatusWithoutLoading.success:
              return _createTabTitle(tabController, byHoststate, screenWidth,
                  tabColor, selectedLabelColor, unselectedLabelColor);
            case StatusWithoutLoading.failure:
              return StateError(error: byHoststate.error);
          }
        },
      );

  // SKELTON ===========================================================================================================
  // DEFAULT TAB CONTROLLER ============================================================================================
  // CREATE ============================================================================================================
  CustomDefaultTabBarController _createSkeltonForTabBarTitle(
    CreatedActivityDynamicByHostState byHoststate,
    Color tabColor,
  ) =>
      CustomDefaultTabBarController(
          screenWidth: context.width,
          tabLength: byHoststate.createdActivityDynamicList.isEmpty ? 1 : 3,
          tabColor: tabColor,
          tabs: _generateSkeltonTab(byHoststate));

  // GENERATE ==========================================================================================================
  List<Widget> _generateSkeltonTab(
    CreatedActivityDynamicByHostState byHoststate,
  ) =>
      List.generate(
          byHoststate.createdActivityDynamicList.isEmpty ? 1 : 3,
          (index) => Tab(
                child: _displaySkeltonContainer(),
              ));

  // DISPLAY ==========================================================================================================
  SkeltonContainer _displaySkeltonContainer() =>
      SkeltonContainer(height: 30, width: 100);

  // DEFAULT TAB CONTROLLER ============================================================================================
  // CREATE ============================================================================================================
  CustomDefaultTabBarController _createTabTitle(
    TabController tabController,
    CreatedActivityDynamicByHostState byHoststate,
    double screenWidth,
    Color tabColor,
    Color selectedLabelColor,
    Color unselectedLabelColor,
  ) =>
      CustomDefaultTabBarController(
          onTap: (tabIndex) {
            context.read<IndexOfDiscoverTabCubit>().tabChanged(tabIndex);
            return _initiateProcessOfBringingNewResult(tabIndex);
          },
          tabController: tabController,
          tabLength: _findActivityListLength(byHoststate),
          screenWidth: screenWidth,
          tabColor: tabColor,
          selectedLabelColor: selectedLabelColor,
          unselectedLabelColor: unselectedLabelColor,
          tabs: _generateTab(byHoststate));

  void _initiateProcessOfBringingNewResult(int tabIndex) {
    _cleanResultOfPrefferdActivityList();
    return context
        .read<ResultOfPreferredActivityDynamicBloc>()
        .add(LoadResultOfPreferredActivityDynamic(
          uId: _findAppUserId,
          activityTitle: _findChosenActivityTitleByClickedTab(tabIndex),
          locationCircularDiamter: _findUserLocationCircularDiameter(),
          lat: _findLat(),
          lon: _findLon(),
        ));
  }

  // METHODS ===========================================================================================================
  // Find Methods ------------------------------------------------------------------------------------------------------
  int get _findAppUserId => _appNumberConstants.appUserId;

  String _findChosenActivityTitleByClickedTab(int tabIndex) => context
      .read<CreatedActivityDynamicByHostBloc>()
      .state
      .createdActivityDynamicList[tabIndex]
      .activityNameDynamic
      .activityTitle;

  double _findUserLocationCircularDiameter() => context
      .read<UserDynamicBloc>()
      .state
      .userDynamicList
      .last
      .membershipTypeDynamic
      .locationCircularDiameter;

  double _findLat() => context
      .read<ChosenLocationDetailDynamicButtonOnCreateActivityScreenCubit>()
      .state
      .chosenLocationDetailDynamicList
      .last
      .lat;

  double _findLon() => context
      .read<ChosenLocationDetailDynamicButtonOnCreateActivityScreenCubit>()
      .state
      .chosenLocationDetailDynamicList
      .last
      .lon;

  // TAB ===============================================================================================================
  // GENERATE ==========================================================================================================
  List<Widget> _generateTab(CreatedActivityDynamicByHostState byHoststate) =>
      List.generate(
        byHoststate.createdActivityDynamicList.isEmpty
            ? 1
            : _findActivityListLength(byHoststate),
        (index) => byHoststate.createdActivityDynamicList.isEmpty
            ? _displayEmptyTabArea()
            : _createTabArea(index, byHoststate),
      );

  // TAB TITLE AREA ====================================================================================================
  // CREATE ============================================================================================================
  Column _displayEmptyTabArea() => Column(
        children: [
          _displayIconForEmptyTab(),
          _displayTextForEmptyTab(),
        ],
      );

  // ICON FOR EMPTY TAB ================================================================================================
  // DISPLAY ===========================================================================================================
  Icon _displayIconForEmptyTab() => const Icon(Icons.warning_amber);

  // TEXT FOR EMPTY TAB ================================================================================================
  // DISPLAY ===========================================================================================================
  Text _displayTextForEmptyTab() =>
      Text('Empty', style: _appTextStyleConstants.tabTextStyle);

  // TAB AREA ==========================================================================================================
  // CREATE ============================================================================================================
  Tab _createTabArea(
          int index, CreatedActivityDynamicByHostState byHoststate) =>
      Tab(child: _createTabTitleArea(byHoststate, index));

  // TAB TITLE AREA ====================================================================================================
  // CREATE ============================================================================================================
  Column _createTabTitleArea(
    CreatedActivityDynamicByHostState byHoststate,
    int index,
  ) =>
      Column(
        children: [
          _displayIcon(index),
          _displayText(byHoststate, index),
        ],
      );

  // ICON ==============================================================================================================
  // DISPLAY ===========================================================================================================
  Icon _displayIcon(int index) =>
      _appIconMapConstants.activityIcon.entries.elementAt(index).value;

  // TEXT ==============================================================================================================
  // DISPLAY ===========================================================================================================
  Text _displayText(
    CreatedActivityDynamicByHostState byHoststate,
    int index,
  ) =>
      Text(
        _correctActivityTitleText(byHoststate, index),
        style: _appTextStyleConstants.tabTextStyle,
      );

  // METHODS ===========================================================================================================
  // Correct Methods ---------------------------------------------------------------------------------------------------
  String _correctActivityTitleText(
    CreatedActivityDynamicByHostState byHoststate,
    int index,
  ) =>
      _appFunctions
          .setWithoutUnderscore(_findActivityTitle(byHoststate, index))
          .toCapitalized();

  // Find Methods ------------------------------------------------------------------------------------------------------
  String _findActivityTitle(
    CreatedActivityDynamicByHostState byHoststate,
    int index,
  ) =>
      byHoststate.createdActivityDynamicList
          .elementAt(index)
          .activityNameDynamic
          .activityTitle;

  // TABBAR BODY =======================================================================================================
  // CREATE ===========================================================================================================
  BodyOfTabBar _createTabBarBody(
    TabController tabController,
    double screenHeight,
    double screenWidth,
    TextStyle buttonLabelTextStyle,
    Color buttonColor,
  ) =>
      BodyOfTabBar(
          child: _buildTabBarBody(tabController, screenHeight, screenWidth,
              buttonLabelTextStyle, buttonColor));

  // BUILD =============================================================================================================
  BlocBuilder<CreatedActivityDynamicByHostBloc,
      CreatedActivityDynamicByHostState> _buildTabBarBody(
    TabController tabController,
    double screenHeight,
    double screenWidth,
    TextStyle buttonLabelTextStyle,
    Color buttonColor,
  ) =>
      BlocBuilder<CreatedActivityDynamicByHostBloc,
          CreatedActivityDynamicByHostState>(
        builder: (context, byHostState) {
          switch (byHostState.status) {
            case StatusWithoutLoading.initial:
              return _createSkeltonForTabBarBody(tabController, byHostState);
            case StatusWithoutLoading.success:
              return _createTabBarViewBody(context, tabController, byHostState,
                  screenHeight, screenWidth, buttonLabelTextStyle, buttonColor);
            case StatusWithoutLoading.failure:
              return StateError(error: byHostState.error);
          }
        },
      );

  // SKELTON ===========================================================================================================
  // TAB BAR VIEW ======================================================================================================
  // CREATE ============================================================================================================
  TabBarView _createSkeltonForTabBarBody(TabController tabController,
          CreatedActivityDynamicByHostState byHostState) =>
      TabBarView(
        controller: tabController,
        children: _generateTabBarView(byHostState),
      );

  // GENERATE ==========================================================================================================
  /// The below first List.generate widget generates for how many "TAB" will be generated. And the second List.generate
  /// widget generates how many for how many "SKELTON" will be generated on the screen.
  List<Widget> _generateTabBarView(
    CreatedActivityDynamicByHostState byHostState,
  ) =>
      List.generate(
          _checkWhetherHostChoosesAnyActivityBefore(byHostState)
              ? 1
              : byHostState.createdActivityDynamicList.length,
          (index) => BasicScrollView(
              children: List.generate(5, (index) => _displaySkeltonBox())));

  // SKELTON ===========================================================================================================
  // DISPLAY ==========================================================================================================
  SkeltonOfTraining _displaySkeltonBox() => const SkeltonOfTraining();

  // TABBAR VIEW BODY ==================================================================================================
  // BUILD =============================================================================================================
  Widget _createTabBarViewBody(
    BuildContext context,
    TabController tabController,
    CreatedActivityDynamicByHostState byHostState,
    double screenHeight,
    double screenWidth,
    TextStyle buttonLabelTextStyle,
    Color buttonColor,
  ) =>
      _checkWhetherHostChoosesAnyActivityBefore(byHostState)
          ? _createBreakScreen(
              context, screenHeight, buttonLabelTextStyle, buttonColor)
          : _createTabViewForTabBarBody(
              tabController, byHostState, screenWidth);

  // BREAK SCREEN ======================================================================================================
  // CREATE ============================================================================================================
  BreakScreen _createBreakScreen(
    BuildContext context,
    double screenHeight,
    TextStyle buttonLabelTextStyle,
    Color buttonColor,
  ) =>
      BreakScreen(
          detailLabel: 'preferred activity',
          screenHeight: screenHeight,
          button: _createChooseAnActivityButton(
              context, buttonLabelTextStyle, buttonColor));

  // CHOOSE AN ACTIVITY BUTTON =========================================================================================
  // CREATE ============================================================================================================
  CustomElevatedButton _createChooseAnActivityButton(
    BuildContext context,
    TextStyle buttonLabelTextStyle,
    Color buttonColor,
  ) =>
      CustomElevatedButton(
          elevatedButtonWidth: context.width / 2,
          textlabel: 'Choose an activity',
          buttonColor: buttonColor,
          textStyle: buttonLabelTextStyle,
          onPressed: () {
            _goToActivityPreferencesScreen(context);
          });

  // TAB BAR VIEW ======================================================================================================
  // CREATE ============================================================================================================
  TabBarView _createTabViewForTabBarBody(
    TabController tabController,
    CreatedActivityDynamicByHostState byHostState,
    double screenWidth,
  ) =>
      TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: _generateTabViewForTabBarBody(
            tabController, byHostState, screenWidth),
      );

  // GENERATE ==========================================================================================================
  List<Widget> _generateTabViewForTabBarBody(
    TabController tabController,
    CreatedActivityDynamicByHostState byHostState,
    double screenWidth,
  ) =>
      List.generate(
        _findActivityListLength(byHostState),
        (index) =>
            _buildResultOfPreferedActivityInAppBody(tabController, screenWidth),
      );

  // RESULT OF PREFERED ACTIVITY IN APP BODY ===========================================================================
  // CREATE ============================================================================================================
  BlocBuilder<ResultOfPreferredActivityDynamicBloc,
          ResultOfPreferredActivityDynamicState>
      _buildResultOfPreferedActivityInAppBody(
    TabController tabController,
    double screenWidth,
  ) =>
          BlocBuilder<ResultOfPreferredActivityDynamicBloc,
              ResultOfPreferredActivityDynamicState>(
            builder: (context, resultState) {
              switch (resultState.status) {
                case StatusWithoutLoading.initial:
                  return _createBasicScrollViewForSkelton();
                case StatusWithoutLoading.success:
                  return DiscoverBodyTabBarContentDetailArea(
                      tabController: tabController,
                      resultState: resultState,
                      screenWidth: screenWidth);
                case StatusWithoutLoading.failure:
                  return StateError(error: resultState.error);
              }
            },
          );

  // SKELTON ===========================================================================================================
  // BASIC SCROLLVIEW ==================================================================================================
  // CREATE ============================================================================================================
  BasicScrollView _createBasicScrollViewForSkelton() =>
      BasicScrollView(children: _generateSkelton());

  // GENERATE ==========================================================================================================
  List<Widget> _generateSkelton() =>
      List.generate(3, (index) => _displaySkelton());

  // DISPLAY ======================================================================================================================
  SkeltonOfTraining _displaySkelton() => const SkeltonOfTraining();

  // GENERAL METHODS ===================================================================================================
  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkWhetherHostChoosesAnyActivityBefore(
          CreatedActivityDynamicByHostState byHostState) =>
      byHostState.createdActivityDynamicList.isEmpty;

  // Find Methods ------------------------------------------------------------------------------------------------------
  int _findActivityListLength(CreatedActivityDynamicByHostState byHoststate) =>
      byHoststate.createdActivityDynamicList.length;

  // Database Methods --------------------------------------------------------------------------------------------------
  void _cleanResultOfPrefferdActivityList() {
    context
        .read<ResultOfPreferredActivityDynamicBloc>()
        .add(CleanResultOfPreferredActivityDynamic());
  }

  // Screen Methods ----------------------------------------------------------------------------------------------------
  void _goToActivityPreferencesScreen(BuildContext context) {
    Navigator.of(context).pushNamed(ScreenOfActivityPreferences.routeName);
  }
}
