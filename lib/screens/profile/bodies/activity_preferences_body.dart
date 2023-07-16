import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/models/activity_name_dynamic.dart';
import 'package:my_project/models/created_activity_dynamic.dart';
import 'package:my_project/screens/profile/local_widgets/zlocal_widget.dart';
import 'package:my_project/widgets/widget.dart';

class ActivityPreferencesBody extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppFunctions _appFunctions = AppFunctions();
  final double screenWidth;

  ActivityPreferencesBody({required this.screenWidth, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildActivityPreferncesArea();
  }

  // BUILD =============================================================================================================
  BlocBuilder<ActivityTypeDynamicBloc, ActivityTypeDynamicState>
      _buildActivityPreferncesArea() {
    return BlocBuilder<ActivityTypeDynamicBloc, ActivityTypeDynamicState>(
      builder: (context, typeState) {
        switch (typeState.status) {
          case Status.initial:
            return _createSectionSkelton(typeState);
          case Status.loading:
            return _createSectionSkelton(typeState);
          case Status.success:
            return _createSectionArea(typeState);
          case Status.failure:
            return StateError(error: typeState.error);
        }
      },
    );
  }

  // SKELTON ===========================================================================================================
  // CREATE ============================================================================================================
  CustomAppBody _createSectionSkelton(ActivityTypeDynamicState typeState) =>
      CustomAppBody(
        children: _generateSectionSkelton(typeState),
      );

  // GENERATE ==========================================================================================================
  List<Widget> _generateSectionSkelton(ActivityTypeDynamicState typeState) =>
      List.generate(
        _findActivityTypeLength(typeState),
        (index) => _displaySectionSkelton(typeState, index),
      );

  // DISPLAY ===========================================================================================================
  SectionSkelton _displaySectionSkelton(
    ActivityTypeDynamicState typeState,
    int index,
  ) =>
      SectionSkelton(
          screenWidth: screenWidth,
          isLastSection: _checkWhetherTheLastActivityIs(typeState, index));

  // METHODS ===========================================================================================================
  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkWhetherTheLastActivityIs(
    ActivityTypeDynamicState typeState,
    int index,
  ) =>
      index == typeState.activityTypeDynamicList.length - 1;

  // Find Methods ------------------------------------------------------------------------------------------------------
  int _findActivityTypeLength(ActivityTypeDynamicState typeState) =>
      typeState.activityTypeDynamicList.length;

  // SECTION AREA ======================================================================================================
  // CREATE ============================================================================================================
  CustomAppBody _createSectionArea(
    ActivityTypeDynamicState typeState,
  ) =>
      CustomAppBody(
        children: _generateSectionArea(typeState),
      );

  // GENERATE ==========================================================================================================
  _generateSectionArea(ActivityTypeDynamicState typeState) => List.generate(
      typeState.activityTypeDynamicList.length,
      (typeIndex) => _createSectionTitleAndBodyArea(typeState, typeIndex));

  CustomColumn _createSectionTitleAndBodyArea(
          ActivityTypeDynamicState typeState, int typeIndex) =>
      CustomColumn(
        children: [
          _createSectionTitle(typeState, typeIndex),
          const CustomAppSizedBox(height: 10),
          _buildSectionBodyArea(typeState, typeIndex),
          CustomAppSizedBox(
              height: _getLastIndexDistanceBetweenBottom(typeIndex, typeState)),
        ],
      );

  // TITLE ============================================================================================================
  // CREATE ============================================================================================================
  CustomTitle _createSectionTitle(
          ActivityTypeDynamicState typeState, int typeIndex) =>
      CustomTitle(
          spaceFromUpperWidget: 32,
          textLabel: _correctTitleName(typeState, typeIndex));

// METHODS =============================================================================================================
  // Correct Methods ---------------------------------------------------------------------------------------------------
  String _correctTitleName(ActivityTypeDynamicState typeState, int typeIndex) =>
      _appFunctions.setWithoutUnderscore(_findTitleName(typeState, typeIndex));

// Check Methods -------------------------------------------------------------------------------------------------------
  bool _checkWhetherTheLastIndexIsReached(
          int typeIndex, ActivityTypeDynamicState typeState) =>
      typeIndex == typeState.activityTypeDynamicList.length - 1;

// Get Methods ---------------------------------------------------------------------------------------------------------
  double _getLastIndexDistanceBetweenBottom(
          int typeIndex, ActivityTypeDynamicState typeState) =>
      _checkWhetherTheLastIndexIsReached(typeIndex, typeState) ? 32 : 0;

  // SECTION BODY AREA =================================================================================================
  // BUILD =============================================================================================================
  BlocBuilder<ActivityNameDynamicBloc, ActivityNameDynamicState>
      _buildSectionBodyArea(
    ActivityTypeDynamicState typeState,
    int typeIndex,
  ) =>
          BlocBuilder<ActivityNameDynamicBloc, ActivityNameDynamicState>(
            builder: (context, nameState) {
              switch (nameState.status) {
                case Status.initial:
                  return _displayBodySkelton();
                case Status.loading:
                  return _displayBodySkelton();
                case Status.success:
                  return AppWrap(
                      children: _generateSectionBody(
                          typeState, nameState, typeIndex));
                case Status.failure:
                  return StateError(error: typeState.error);
              }
            },
          );

  // SKELTON ===========================================================================================================
  // DISPLAY ===========================================================================================================
  SkeltonWrap _displayBodySkelton() =>
      SkeltonWrap(screenWidth: screenWidth, numberOfWidget: 8);

  // METHODS ===========================================================================================================

  // Find Methods ------------------------------------------------------------------------------------------------------
  String _findTitleName(ActivityTypeDynamicState typeState, int typeIndex) =>
      typeState.activityTypeDynamicList.elementAt(typeIndex).activityTypeDetail;

  // SECTION BODY ======================================================================================================
  // GENERATE ==========================================================================================================
  List<Widget> _generateSectionBody(
    ActivityTypeDynamicState typeState,
    ActivityNameDynamicState nameState,
    int typeIndex,
  ) =>
      List.generate(
          nameState.activityNameDynamicList
              .where((element) =>
                  element.activityTypeDynamic.activityTypeId ==
                  _findActivityTypeId(typeState, typeIndex))
              .toList()
              .length,
          (nameIndex) => _buildActivityNameDetails(
              typeState, nameState, typeIndex, nameIndex));

  // METHODS ===========================================================================================================
  int? _findActivityTypeId(ActivityTypeDynamicState typeState, int typeIndex) =>
      typeState.activityTypeDynamicList.elementAt(typeIndex).activityTypeId;

  BlocBuilder<CreatedActivityDynamicByHostBloc,
      CreatedActivityDynamicByHostState> _buildActivityNameDetails(
    ActivityTypeDynamicState typeState,
    ActivityNameDynamicState nameState,
    int typeIndex,
    int nameIndex,
  ) =>
      BlocBuilder<CreatedActivityDynamicByHostBloc,
          CreatedActivityDynamicByHostState>(
        builder: (context, byHostState) {
          switch (byHostState.status) {
            case StatusWithoutLoading.initial:
              return _createChoiceContainer(
                  typeState, nameState, byHostState, typeIndex, nameIndex);
            case StatusWithoutLoading.success:
              return _createChoiceContainer(
                  typeState, nameState, byHostState, typeIndex, nameIndex);
            case StatusWithoutLoading.failure:
              return StateError(error: typeState.error);
          }
        },
      );

  // CHOICE CONTAINER ==================================================================================================
  // CREATE ===========================================================================================================
  ChoiceContainer _createChoiceContainer(
    ActivityTypeDynamicState typeState,
    ActivityNameDynamicState nameState,
    CreatedActivityDynamicByHostState byHostState,
    int typeIndex,
    int nameIndex,
  ) =>
      ChoiceContainer(
        containerText:
            _displayActivityTitle(typeState, nameState, typeIndex, nameIndex),
        buttonColor: _displayButtonColor(
            byHostState, typeState, nameState, typeIndex, nameIndex),
        buttonBorderColor: _displayButtonBorderColor(
            byHostState, typeState, nameState, typeIndex, nameIndex),
        labelColor: _displayLabelColor(
            byHostState, typeState, nameState, typeIndex, nameIndex),
        onTap: () {},
      );

  // DISPLAY ===========================================================================================================
  String _displayActivityTitle(ActivityTypeDynamicState typeState,
          ActivityNameDynamicState nameState, int typeIndex, int nameIndex) =>
      _appFunctions
          .setWithoutUnderscore(
              _getActivityNamesByActivityType(typeState, nameState, typeIndex)
                  .toList()
                  .elementAt(nameIndex)
                  .activityTitle)
          .toCapitalized();

  Color _displayButtonColor(
    CreatedActivityDynamicByHostState byHostState,
    ActivityTypeDynamicState typeState,
    ActivityNameDynamicState nameState,
    int typeIndex,
    int nameIndex,
  ) =>
      _checkWhetherAnyActivityChosenBefore(
              byHostState, typeState, nameState, typeIndex, nameIndex)
          ? _appColors.selectedButtonColor
          : Colors.transparent;

  Color _displayButtonBorderColor(
    CreatedActivityDynamicByHostState byHostState,
    ActivityTypeDynamicState typeState,
    ActivityNameDynamicState nameState,
    int typeIndex,
    int nameIndex,
  ) =>
      _checkWhetherAnyActivityChosenBefore(
              byHostState, typeState, nameState, typeIndex, nameIndex)
          ? _appColors.selectedContainerColor
          : _appColors.unselectedContainerColor;

  Color _displayLabelColor(
    CreatedActivityDynamicByHostState byHostState,
    ActivityTypeDynamicState typeState,
    ActivityNameDynamicState nameState,
    int typeIndex,
    int nameIndex,
  ) =>
      _checkWhetherAnyActivityChosenBefore(
              byHostState, typeState, nameState, typeIndex, nameIndex)
          ? _appColors.selectedLabelColor
          : _appColors.unselectedLabelColor;

  // METHODS ===========================================================================================================
  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkWhetherAnyActivityChosenBefore(
    CreatedActivityDynamicByHostState byHostState,
    ActivityTypeDynamicState typeState,
    ActivityNameDynamicState nameState,
    int typeIndex,
    int nameIndex,
  ) =>
      _pairHostActivityWithActivityPreference(
              byHostState, typeState, nameState, typeIndex, nameIndex)
          .toList()
          .isNotEmpty;

  // Pair Methods -----------------------------------------------------------------------------------------------------
  Iterable<CreatedActivityDynamic> _pairHostActivityWithActivityPreference(
    CreatedActivityDynamicByHostState byHostState,
    ActivityTypeDynamicState typeState,
    ActivityNameDynamicState nameState,
    int typeIndex,
    int nameIndex,
  ) =>
      byHostState.createdActivityDynamicList.where((element) =>
          element.activityNameDynamic.activityNameId ==
          _getActivityNamesByActivityType(typeState, nameState, typeIndex)
              .toList()
              .elementAt(nameIndex)
              .activityNameId);

  // Get Methods -------------------------------------------------------------------------------------------------------
  Iterable<ActivityNameDynamic> _getActivityNamesByActivityType(
    ActivityTypeDynamicState typeState,
    ActivityNameDynamicState nameState,
    int typeIndex,
  ) =>
      nameState.activityNameDynamicList.where((element) =>
          element.activityTypeDynamic.activityTypeId ==
          _findChosenActivityTypeId(typeState, typeIndex));

  // Find Methods ------------------------------------------------------------------------------------------------------
  int? _findChosenActivityTypeId(
    ActivityTypeDynamicState typeState,
    int typeIndex,
  ) =>
      typeState.activityTypeDynamicList.elementAt(typeIndex).activityTypeId;
}
