import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenResponseWhoRespondedTrainingOfferBodyRecentActivityArea
    extends StatelessWidget {
  final AppDateFormat _appDateFormat = AppDateFormat();
  final AppFunctions _appFunctions = AppFunctions();
  final double screenWidth;

  ChosenResponseWhoRespondedTrainingOfferBodyRecentActivityArea({
    required this.screenWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? titleLarge = Theme.of(context).textTheme.titleLarge!;

    return Column(
      children: [
        _displayRecentActivityTitle(),
        _bringRecentActivitiesDetailsFromDatabaseAndDisplayThem(
            screenWidth, titleLarge),
        const CustomAppSizedBox(height: 32),
      ],
    );
  }

  /// TITLE ============================================================================================================
  TitleOfActivityOnUserCardScreen _displayRecentActivityTitle() =>
      TitleOfActivityOnUserCardScreen(title: 'RecentActivities');

  /// SKELTON ==========================================================================================================
  AppListViewBuilder _displayRecentActivitySkelton(double screenWidth) =>
      AppListViewBuilder(
          itemCount: 3,
          itemBuilder: (context, index) => SkeltonColumn(
                screenWidth: screenWidth,
              ));

  /// BLOCS ============================================================================================================
  BlocBuilder<ConsistedActivityDynamicWithDistanceByUserBloc,
          ConsistedActivityDynamicWithDistanceByUserState>
      _bringRecentActivitiesDetailsFromDatabaseAndDisplayThem(
    double screenWidth,
    TextStyle titleLarge,
  ) =>
          BlocBuilder<ConsistedActivityDynamicWithDistanceByUserBloc,
                  ConsistedActivityDynamicWithDistanceByUserState>(
              builder: (context, state) {
            switch (state.status) {
              case Status.initial:
                return _displayRecentActivitySkelton(screenWidth);
              case Status.loading:
                return _displayRecentActivitySkelton(screenWidth);
              case Status.success:
                return _createRecentActivityArea(state, titleLarge);
              case Status.failure:
                return StateError(error: state.error);
            }
          });

  /// CREATE ===========================================================================================================
  AppListViewBuilder _createRecentActivityArea(
    ConsistedActivityDynamicWithDistanceByUserState state,
    TextStyle titleLarge,
  ) =>
      AppListViewBuilder(
          itemCount: _calculateNumberOfRecentActivities(state),
          itemBuilder: (context, index) {
            if (_hasNoRecentActivity(state)) {
              return _displayInformationAboutNoData();
            } else {
              return _displayRecentActivityDetails(state, index, titleLarge);
            }
          });

  /// DISPLAY ==========================================================================================================
  InformationAboutNoData _displayInformationAboutNoData() =>
      const InformationAboutNoData(
          informationText: 'No activity has been completed yet');

  AppHeader _displayRecentActivityDetails(
    ConsistedActivityDynamicWithDistanceByUserState state,
    int index,
    TextStyle titleLarge,
  ) =>
      AppHeader(
        spaceFromUpperWidget: 18,
        firstWidget: _displayRecentActivityName(state, index, titleLarge),
        thirdWidget:
            _displayRecentActivityDateAndTimePeriod(state, index, titleLarge),
      );

  AppHeaderText _displayRecentActivityName(
    ConsistedActivityDynamicWithDistanceByUserState state,
    int index,
    TextStyle titleLarge,
  ) =>
      AppHeaderText(
          textLabel: _findRecentActivityNames(state, index),
          textStyle: titleLarge);

  AppHeaderText _displayRecentActivityDateAndTimePeriod(
    ConsistedActivityDynamicWithDistanceByUserState state,
    int index,
    TextStyle titleLarge,
  ) =>
      AppHeaderText(
          textLabel: _findRecentActivityDates(state, index),
          textStyle: titleLarge);

  /// METHODS ==========================================================================================================
  String _findRecentActivityNames(
    ConsistedActivityDynamicWithDistanceByUserState state,
    int index,
  ) =>
      _correctTheRecentActivityList(state)
          .elementAt(index)
          .createdActivityDynamic
          .activityNameDynamic
          .activityTitle;

  String _findRecentActivityDates(
    ConsistedActivityDynamicWithDistanceByUserState state,
    int index,
  ) =>
      _appDateFormat.monthAndDayOnly.format(
          _correctTheRecentActivityList(state)
              .elementAt(index)
              .createdActivityDynamic
              .createdAt);

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _hasNoRecentActivity(
    ConsistedActivityDynamicWithDistanceByUserState state,
  ) =>
      state.consistedActivityDynamicWithDistanceList.isEmpty;

  /// Other Methods ----------------------------------------------------------------------------------------------------
  int _calculateNumberOfRecentActivities(
    ConsistedActivityDynamicWithDistanceByUserState state,
  ) =>
      _appFunctions.defineElementNumberWillBeDisplayed(
          state.consistedActivityDynamicWithDistanceList, 3);

  List<ConsistedActivityDynamicWithDistance> _correctTheRecentActivityList(
    ConsistedActivityDynamicWithDistanceByUserState state,
  ) =>
      _appFunctions.reversedListAndReturnItsSublist(
          state.consistedActivityDynamicWithDistanceList,
          0,
          _calculateNumberOfRecentActivities(state));
}
