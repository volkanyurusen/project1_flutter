import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/models/models_dynamics.dart';
import 'package:my_project/screens/profile/local_widgets/zlocal_widget.dart';
import 'package:my_project/widgets/widget.dart';

class ActivityPreferencesEditingPopUpActivityAreas extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppFunctions _appFunctions = AppFunctions();
  final double screenWidth;

  ActivityPreferencesEditingPopUpActivityAreas(
      {super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return _buildActivityPreferncesArea(screenWidth);
  }

  // BUILD =============================================================================================================
  BlocBuilder<ActivityTypeDynamicBloc, ActivityTypeDynamicState>
      _buildActivityPreferncesArea(double screenWidth) {
    return BlocBuilder<ActivityTypeDynamicBloc, ActivityTypeDynamicState>(
      builder: (context, typeState) {
        switch (typeState.status) {
          case Status.initial:
            return _createSectionSkelton(typeState, screenWidth);
          case Status.loading:
            return _createSectionSkelton(typeState, screenWidth);
          case Status.success:
            return _createSectionArea(typeState, screenWidth);
          case Status.failure:
            return StateError(error: typeState.error);
        }
      },
    );
  }

  // SKELTON ===========================================================================================================
  // CREATE ============================================================================================================
  CustomAppBody _createSectionSkelton(
    ActivityTypeDynamicState typeState,
    double screenWidth,
  ) =>
      CustomAppBody(
        children: _generateSectionSkelton(typeState, screenWidth),
      );

  // GENERATE ==========================================================================================================
  List<Widget> _generateSectionSkelton(
    ActivityTypeDynamicState typeState,
    double screenWidth,
  ) =>
      List.generate(
        _findActivityTypeLength(typeState),
        (index) => _displaySectionSkelton(typeState, screenWidth, index),
      );

  // DISPLAY ===========================================================================================================
  SectionSkelton _displaySectionSkelton(
    ActivityTypeDynamicState typeState,
    double screenWidth,
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
  Column _createSectionArea(
    ActivityTypeDynamicState typeState,
    double screenWidth,
  ) =>
      Column(
        children: _generateSectionArea(typeState, screenWidth),
      );

  // GENERATE ==========================================================================================================
  List<Widget> _generateSectionArea(
    ActivityTypeDynamicState typeState,
    double screenWidth,
  ) =>
      List.generate(
          typeState.activityTypeDynamicList.length,
          (typeIndex) => _createSectionTitleAndBodyArea(
              typeState, screenWidth, typeIndex));

  CustomColumn _createSectionTitleAndBodyArea(
    ActivityTypeDynamicState typeState,
    double screenWidth,
    int typeIndex,
  ) =>
      CustomColumn(
        children: [
          _createSectionTitle(typeState, typeIndex),
          const CustomAppSizedBox(height: 10),
          _buildSectionBodyArea(typeState, screenWidth, typeIndex),
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

// Find Methods ---------------------------------------------------------------------------------------------------------
  String _findTitleName(ActivityTypeDynamicState typeState, int typeIndex) =>
      typeState.activityTypeDynamicList.elementAt(typeIndex).activityTypeDetail;

  // SECTION BODY AREA =================================================================================================
  // BUILD =============================================================================================================
  BlocBuilder<ActivityNameDynamicBloc, ActivityNameDynamicState>
      _buildSectionBodyArea(
    ActivityTypeDynamicState typeState,
    double screenWidth,
    int typeIndex,
  ) =>
          BlocBuilder<ActivityNameDynamicBloc, ActivityNameDynamicState>(
            builder: (context, nameState) {
              switch (nameState.status) {
                case Status.initial:
                  return _displayBodySkelton(screenWidth);
                case Status.loading:
                  return _displayBodySkelton(screenWidth);
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
  SkeltonWrap _displayBodySkelton(double screenWidth) =>
      SkeltonWrap(screenWidth: screenWidth, numberOfWidget: 8);

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

  BlocBuilder<ActivityNameButtonCubit, ActivityNameButtonState>
      _buildActivityNameDetails(
    ActivityTypeDynamicState typeState,
    ActivityNameDynamicState nameState,
    int typeIndex,
    int nameIndex,
  ) =>
          BlocBuilder<ActivityNameButtonCubit, ActivityNameButtonState>(
              builder: (context, buttonState) {
            return _createChoiceContainer(context, typeState, nameState,
                buttonState, typeIndex, nameIndex);
          });

  // CHOICE CONTAINER ==================================================================================================
  // CREATE ===========================================================================================================
  ChoiceContainer _createChoiceContainer(
    BuildContext context,
    ActivityTypeDynamicState typeState,
    ActivityNameDynamicState nameState,
    ActivityNameButtonState buttonState,
    int typeIndex,
    int nameIndex,
  ) =>
      ChoiceContainer(
        containerText:
            _displayActivityTitle(typeState, nameState, typeIndex, nameIndex),
        buttonColor: _displayButtonColor(
            typeState, nameState, buttonState, typeIndex, nameIndex),
        buttonBorderColor: _displayButtonBorderColor(
            typeState, nameState, buttonState, typeIndex, nameIndex),
        labelColor: _displayLabelColor(
            typeState, nameState, buttonState, typeIndex, nameIndex),
        onTap: () {
          if (_checkWhetherNewActivityChosenToBeAdded(
                context,
                buttonState,
              ) &&
              _checkWhetherClickedActivityForAddingIsNotTheSameActivityPreviouslyClicked(
                  context,
                  buttonState,
                  typeState,
                  nameState,
                  typeIndex,
                  nameIndex)) {
            showDialog(
                context: context,
                builder: (context) => CustomAlertDialog(
                    contextText: 'Please first update your choice',
                    onPressed: () {
                      _closeTheScreen(context);
                    }));
          } else if (_checkWhetherCurrentActivityChosenToBeRemoved(
                  context, buttonState) &&
              _checkWhetherClickedActivityForRemovingIsNotTheSameActivityPreviouslyClicked(
                  context,
                  buttonState,
                  typeState,
                  nameState,
                  typeIndex,
                  nameIndex)) {
            showDialog(
                context: context,
                builder: (context) => CustomAlertDialog(
                    contextText: 'Please first update your choice',
                    onPressed: () {
                      _closeTheScreen(context);
                    }));
          } else {
            context
                .read<ChosenActivityNameInActivityPreferencesCubit>()
                .pressedChosenActivityNameInActivityPreferences(
                    _getClickedActivityTitle(
                        typeState, nameState, typeIndex, nameIndex));
            print(
                'pressed: ${_getClickedActivityTitle(typeState, nameState, typeIndex, nameIndex)}');
            print(
                'chosenState ${context.read<ChosenActivityNameInActivityPreferencesCubit>().state.chosenActivityTitleInActivityPreferences}');
            _pressActivityNameButton(
                context, typeState, nameState, typeIndex, nameIndex);
          }
          // 
          // (_checkWhetherNewActivityChosenToBeAdded(
          //               context,
          //               buttonState,
          //             ) &&
          //             _checkWhetherClickedActivityForAddingIsNotTheSameActivityPreviouslyClicked(
          //                 context,
          //                 buttonState,
          //                 typeState,
          //                 nameState,
          //                 typeIndex,
          //                 nameIndex)) ||
          //         (_checkWhetherCurrentActivityChosenToBeRemoved(
          //                 context, buttonState) &&
          //             _checkWhetherClickedActivityForRemovingIsNotTheSameActivityPreviouslyClicked(
          //                 context,
          //                 buttonState,
          //                 typeState,
          //                 nameState,
          //                 typeIndex,
          //                 nameIndex))
          //     ? showDialog(
          //         context: context,
          //         builder: (context) => CustomAlertDialog(
          //             contextText: 'Please first update your choice',
          //             onPressed: () {
          //               _closeTheScreen(context);
          //             }))
          //     : _pressActivityNameButton(
          //         context, typeState, nameState, typeIndex, nameIndex);
          // print(_getClickedActivityTitle(
          //     typeState, nameState, typeIndex, nameIndex));
        },
      );

  // METHODS ===========================================================================================================
  // For Adding --------------------------------------------------------------------------------------------------------
  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkWhetherNewActivityChosenToBeAdded(
    BuildContext context,
    ActivityNameButtonState buttonState,
  ) =>
      _findNumberOfCurrentClickedButton(buttonState) >
      _findNumberOfExistingPreferredActivityChosenByUser(context);

  bool
      _checkWhetherClickedActivityForAddingIsNotTheSameActivityPreviouslyClicked(
    BuildContext context,
    ActivityNameButtonState buttonState,
    ActivityTypeDynamicState typeState,
    ActivityNameDynamicState nameState,
    int typeIndex,
    int nameIndex,
  ) =>
          _getTheActivityTitleWhichChosenToBeAdded(context, buttonState) !=
          _getClickedActivityTitle(typeState, nameState, typeIndex, nameIndex);

  // Get Methods -------------------------------------------------------------------------------------------------------
  String? _getTheActivityTitleWhichChosenToBeAdded(
    BuildContext context,
    ActivityNameButtonState buttonState,
  ) =>
      _appFunctions
          .findDifferenceItemBetweenTwoList(buttonState.chosenActivityTitleList,
              _getExistingPreferredActivityTitleChosenByUser(context))
          .first;

  // For Removing ------------------------------------------------------------------------------------------------------
  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkWhetherCurrentActivityChosenToBeRemoved(
    BuildContext context,
    ActivityNameButtonState buttonState,
  ) =>
      _findNumberOfCurrentClickedButton(buttonState) <
      _findNumberOfExistingPreferredActivityChosenByUser(context);

  bool
      _checkWhetherClickedActivityForRemovingIsNotTheSameActivityPreviouslyClicked(
    BuildContext context,
    ActivityNameButtonState buttonState,
    ActivityTypeDynamicState typeState,
    ActivityNameDynamicState nameState,
    int typeIndex,
    int nameIndex,
  ) =>
          _getTheActivityTitleWhichChosenToBeRemoved(context, buttonState) !=
          _getClickedActivityTitle(typeState, nameState, typeIndex, nameIndex);

  // Get Methods -------------------------------------------------------------------------------------------------------
  String? _getTheActivityTitleWhichChosenToBeRemoved(
    BuildContext context,
    ActivityNameButtonState buttonState,
  ) =>
      _appFunctions
          .findDifferenceItemBetweenTwoList(
              _getExistingPreferredActivityTitleChosenByUser(context),
              buttonState.chosenActivityTitleList)
          .first;

  // For Adding & Removing ---------------------------------------------------------------------------------------------
  // Get Methods -------------------------------------------------------------------------------------------------------
  String _getClickedActivityTitle(
    ActivityTypeDynamicState typeState,
    ActivityNameDynamicState nameState,
    int typeIndex,
    int nameIndex,
  ) =>
      _getActivityNamesByActivityType(typeState, nameState, typeIndex)
          .toList()
          .elementAt(nameIndex)
          .activityTitle;

  List<String> _getExistingPreferredActivityTitleChosenByUser(
    BuildContext context,
  ) =>
      context
          .read<CreatedActivityDynamicByHostBloc>()
          .state
          .createdActivityDynamicList
          .map((e) => e.activityNameDynamic.activityTitle)
          .toList();

  // Find Methods ------------------------------------------------------------------------------------------------------
  int _findNumberOfCurrentClickedButton(ActivityNameButtonState buttonState) =>
      buttonState.chosenActivityTitleList.length;

  int _findNumberOfExistingPreferredActivityChosenByUser(
          BuildContext context) =>
      context
          .read<CreatedActivityDynamicByHostBloc>()
          .state
          .createdActivityDynamicList
          .length;

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
    ActivityTypeDynamicState typeState,
    ActivityNameDynamicState nameState,
    ActivityNameButtonState buttonState,
    int typeIndex,
    int nameIndex,
  ) =>
      _checkWhetherAnyActivityChosenBefore(
              buttonState, typeState, nameState, typeIndex, nameIndex)
          ? _appColors.selectedButtonColor
          : Colors.transparent;

  Color _displayButtonBorderColor(
    ActivityTypeDynamicState typeState,
    ActivityNameDynamicState nameState,
    ActivityNameButtonState buttonState,
    int typeIndex,
    int nameIndex,
  ) =>
      _checkWhetherAnyActivityChosenBefore(
              buttonState, typeState, nameState, typeIndex, nameIndex)
          ? _appColors.selectedContainerColor
          : _appColors.unselectedContainerColor;

  Color _displayLabelColor(
    ActivityTypeDynamicState typeState,
    ActivityNameDynamicState nameState,
    ActivityNameButtonState buttonState,
    int typeIndex,
    int nameIndex,
  ) =>
      _checkWhetherAnyActivityChosenBefore(
              buttonState, typeState, nameState, typeIndex, nameIndex)
          ? _appColors.selectedLabelColor
          : _appColors.unselectedLabelColor;

  // METHODS ===========================================================================================================
  void _pressActivityNameButton(
    BuildContext context,
    ActivityTypeDynamicState typeState,
    ActivityNameDynamicState nameState,
    int typeIndex,
    int nameIndex,
  ) {
    context.read<ActivityNameButtonCubit>().pressedActivityNameButton(
        _getActivityNamesByActivityType(typeState, nameState, typeIndex)
            .toList()
            .elementAt(nameIndex)
            .activityTitle);
  }

  // Check Methods -----------------------------------------------------------------------------------------------------
  bool _checkWhetherAnyActivityChosenBefore(
    ActivityNameButtonState buttonState,
    ActivityTypeDynamicState typeState,
    ActivityNameDynamicState nameState,
    int typeIndex,
    int nameIndex,
  ) =>
      buttonState.chosenActivityTitleList.contains(
          _getActivityNamesByActivityType(typeState, nameState, typeIndex)
              .toList()
              .elementAt(nameIndex)
              .activityTitle);

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

  // Screen Methods ----------------------------------------------------------------------------------------------------
  void _closeTheScreen(BuildContext context) {
    Navigator.of(context).pop();
  }
}
