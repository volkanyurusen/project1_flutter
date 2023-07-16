import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/models.dart';
import 'package:my_project/widgets/widget.dart';

class CoachingTypeDetailTypeContentArea extends StatelessWidget {
  final AppFunctions _appFunctions = AppFunctions();
  final AppListConstants _appListConstants = AppListConstants();
  final TextStyle? titleLarge;

  CoachingTypeDetailTypeContentArea({this.titleLarge, super.key});

  @override
  Widget build(BuildContext context) {
    return _createCoachingTypeDetailsColumn();
  }

  // USER TYPE DETAIL COLUMN ===========================================================================================
  // CREATE ============================================================================================================
  CustomColumn _createCoachingTypeDetailsColumn() {
    return CustomColumn(
      children: [
        _buildCoachingTypeDetails(),
      ],
    );
  }

  // USER TYPE DETAIL COLUMN ===========================================================================================
  // BUILD =============================================================================================================
  BlocBuilder<CoachingTypeBloc, CoachingTypeState> _buildCoachingTypeDetails() {
    return BlocBuilder<CoachingTypeBloc, CoachingTypeState>(
        builder: (context, coachingState) {
      switch (coachingState.status) {
        case Status.initial:
          return const TypeDetailSkelton();
        case Status.loading:
          return const TypeDetailSkelton();
        case Status.success:
          return CustomColumn(
            children: _generateListOfDetail(context, coachingState),
          );
        case Status.failure:
          return StateError(error: coachingState.error);
      }
    });
  }

  // LIST OF DETAIL ====================================================================================================
  // GENERATE ==========================================================================================================
  List<Widget> _generateListOfDetail(
      BuildContext context, CoachingTypeState coachingState) {
    return List.generate(
      _appListConstants.platinumCoachingTypeValue.length,
      (index) => _createDetailLine(context, coachingState, index),
    );
  }

  // DETAIL LINE =======================================================================================================
  // CREATE ============================================================================================================
  AppHeader _createDetailLine(
    BuildContext context,
    CoachingTypeState coachingState,
    int index,
  ) =>
      AppHeader(
        spaceFromUpperWidget: index == 0 ? 0 : 10,
        firstWidget:
            _createDetailTitleIconAndContentArea(context, coachingState, index),
        thirdWidget: _displayContent(context, coachingState, index),
      );

  // DETAIL TITLE AND ICON AREA ========================================================================================
  // CREATE ============================================================================================================
  AppHeader _createDetailTitleIconAndContentArea(
    BuildContext context,
    CoachingTypeState coachingState,
    int index,
  ) =>
      AppHeader(
          firstWidget: _displayCorrectIcon(context, coachingState, index),
          secondWidget: const CustomAppSizedBox(width: 5),
          thirdWidget: _displayDetailTitle(context, coachingState, index));

  // ICONS =============================================================================================================
  // DISPLAY ===========================================================================================================
  /// [_displayCorrectIcon] method displays the including ([Icons.done_sharp]) or excluding ([Icons.clear_sharp]) icons
  /// on the screen. [_bringValueOfCoachingTypeOfUser] method finds the values of the [CoachingType] of the
  /// [User].
  ///
  /// When all the details of the [CoachingType] of the [User] getting (these details get with
  /// [_getCoachCoachingMatchingCoachingType] method)
  ///
  /// ''' dart
  /// _toJsonCoachCoachingTypeDetail(context, coachingState).entries.elementAt(index + 2).value'''
  ///
  /// method finds the values of the [CoachingType] of the [User].
  /// (The values can be only [True], [False], or [Number]).
  /// The meaning of these are;
  ///
  /// [True] means, that feature of the the membership includes in the [CoachingType] where [User] includes in.
  ///
  /// [False] means, that feature of the the membership includes in the [CoachingType] where [User] includes in.
  ///
  /// [Number] means, that feature of the the membership includes how many times in the [CoachingType] where [User]
  /// includes in.
  ///
  ///
  /// (The values can be only [True], [False], or [Number]).
  /// The meaning of these are;
  ///
  /// [True] means, that feature of the the membership includes in the [CoachingType] where [User] includes in.
  ///
  /// [False] means, that feature of the the membership includes in the [CoachingType] where [User] includes in.
  ///
  /// [Number] means, that feature of the the membership includes how many times in the [CoachingType] where [User]
  /// includes in.
  ///
  Icon _displayCorrectIcon(
      BuildContext context, CoachingTypeState coachingState, int index) {
    return _toJsonCoachCoachingTypeDetail(context, coachingState)
                .entries
                .elementAt(index + 2)
                .value ==
            true
        ? _displayIncludedIcon()
        : _toJsonCoachCoachingTypeDetail(context, coachingState)
                    .entries
                    .elementAt(index + 2)
                    .value ==
                false
            ? _displayExcludedIcon()
            : _toJsonCoachCoachingTypeDetail(context, coachingState)
                        .entries
                        .elementAt(index + 2)
                        .value ==
                    0
                ? _displayExcludedIcon()
                : _displayIncludedIcon();
  }

  //
  // _bringValueOfCoachingTypeOfUser(context, coachingState, index) == true
  //     ? _displayIncludedIcon()
  //     : _bringValueOfCoachingTypeOfUser(
  //                 context, coachingState, index) ==
  //             false
  //         ? _displayExcludedIcon()
  //         : _bringValueOfCoachingTypeOfUser(
  //                     context, coachingState, index) ==
  //                 0
  //             ? _displayExcludedIcon()
  //             : _displayIncludedIcon();

  Icon _displayIncludedIcon() => const Icon(Icons.done_sharp, size: 18);

  Icon _displayExcludedIcon() => const Icon(Icons.clear_sharp, size: 18);

  // METHODS ===========================================================================================================
  // Bring Methods -----------------------------------------------------------------------------------------------------

  // _bringValueOfCoachingTypeOfUser(
  //     BuildContext context, CoachingTypeState coachingState, int index) {
  //   _toJsonCoachCoachingTypeDetail(context, coachingState)
  //       .entries
  //       .elementAt(index + 2)
  //       .value;
  // }

  // GENERAL METHODS ===================================================================================================
  // ToJson Methods ----------------------------------------------------------------------------------------------------
  /// After [_getCoachCoachingMatchingCoachingType] complates it own task (which means when the method finds the
  /// [CoachingType] of the [User], [_toJsonCoachCoachingTypeDetail] method convert it to map type (with [toJson]
  /// method).
  ///
  /// The reason of using this method is to get the keys and valuesof the [CoachingType]'s model. Because the keys
  /// and values will display on the screen to show the users in order to inform them with the [CoachingType]'s
  /// contents which they are included in.
  Map<String, dynamic> _toJsonCoachCoachingTypeDetail(
          BuildContext context, CoachingTypeState coachingState) =>
      _getCoachCoachingMatchingCoachingType(context, coachingState)
          .first
          .toJson();

  // Get Methods -------------------------------------------------------------------------------------------------------
  /// These code block check all [CoachingTypes] with [coachingTypeName] one by one (with where condition). And
  /// compares each of them with user's [coachingTypeName] ([_findCoachingTypeName] method finds user's
  /// [coachingTypeName]).

  Iterable<CoachingType> _getCoachCoachingMatchingCoachingType(
    BuildContext context,
    CoachingTypeState coachingState,
  ) =>
      coachingState.coachingTypeList.where((element) =>
          element.coachingTypeName == _findCoachingTypeName(context));

  // DETAIL TITLE ======================================================================================================
  // DISPLAY ===========================================================================================================
  /// [_displayCorrectIcon] method displays the including ([Icons.done_sharp]) or excluding ([Icons.clear_sharp]) icons
  /// on the screen. [_bringValueOfCoachingTypeOfUser] method finds the values of the [CoachingType] of the
  /// [User].

  AppHeaderText _displayDetailTitle(
    BuildContext context,
    CoachingTypeState coachingState,
    int index,
  ) =>
      AppHeaderText(
          textLabel: _findDetailTitleText(context, coachingState, index)
              .toCapitalized(),
          textStyle: titleLarge);

  // METHODS ===========================================================================================================
  // Bring Methods -----------------------------------------------------------------------------------------------------
  /// When all the details of the [CoachingType] of the [User] getting (these details get with
  /// [_getCoachCoachingMatchingCoachingType] method) [_bringKeyOfCoachingTypeOfUser]
  /// method finds the key of the [CoachingType] of the [User].

  String _bringKeyOfCoachingTypeOfUser(
          BuildContext context, CoachingTypeState coachingState, int index) =>
      _toJsonCoachCoachingTypeDetail(context, coachingState)
          .entries
          .elementAt(index + 2)
          .key;

  // Find Methods ------------------------------------------------------------------------------------------------------
  String _findCoachingTypeName(BuildContext context) => context
      .read<CoachDynamicBloc>()
      .state
      .coachDynamicList
      .last
      .coachingTypeDynamic
      .coachingTypeName;

  String _findDetailTitleText(
    BuildContext context,
    CoachingTypeState coachingState,
    int index,
  ) =>
      _appFunctions.setWithoutUnderscore(
          _bringKeyOfCoachingTypeOfUser(context, coachingState, index));

  // DETAIL TITLE CONTENT AREA =========================================================================================
  // DISPLAY ===========================================================================================================
  AppHeaderText _displayContent(
    BuildContext context,
    CoachingTypeState coachingState,
    int index,
  ) =>
      AppHeaderText(
          textLabel: _findContentText(context, coachingState, index),
          textStyle: titleLarge);

  // METHODS ===========================================================================================================
  // Find Methods ------------------------------------------------------------------------------------------------------
  String _findContentText(
          BuildContext context, CoachingTypeState coachingState, int index) =>
      _toJsonCoachCoachingTypeDetail(context, coachingState)
                  .entries
                  .elementAt(index + 2)
                  .value ==
              true
          ? 'Included'
          : _toJsonCoachCoachingTypeDetail(context, coachingState)
                      .entries
                      .elementAt(index + 2)
                      .value ==
                  false
              ? 'Excluded'
              : _toJsonCoachCoachingTypeDetail(context, coachingState)
                          .entries
                          .elementAt(index + 2)
                          .value ==
                      0
                  ? 'None'
                  : _findCoachingTypeName(context) == 'Basic Coach'
                      ? _toJsonCoachCoachingTypeDetail(context, coachingState)
                              .entries
                              .elementAt(index + 2)
                              .value
                              .toString() +
                          _appListConstants.basicCoachingTypeValue
                              .elementAt(index)
                      : _toJsonCoachCoachingTypeDetail(context, coachingState)
                              .entries
                              .elementAt(index + 2)
                              .value
                              .toString() +
                          _appListConstants.platinumCoachingTypeValue
                              .elementAt(index);
}
