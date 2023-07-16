import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ActivityTemplateAddingPopUpBodyActivityTypeArea extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppFunctions _appFunctions = AppFunctions();
  final CleanAllButtonOnActivityTemplateAddingPopUpCubit cleanActivityButton;
  final double screenWidth;

  ActivityTemplateAddingPopUpBodyActivityTypeArea({
    required this.cleanActivityButton,
    required this.screenWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        _createActivityTypesTitle(),
        const CustomAppSizedBox(height: 9),
        _bringActivityTypesFromDatabaseAndDisplayThem(
            cleanActivityButton, screenWidth),
        const CustomAppSizedBox(height: 9),
      ],
    );
  }

  /// TITLES ===========================================================================================================
  CustomTitle _createActivityTypesTitle() =>
      const CustomTitle(spaceFromUpperWidget: 32, textLabel: 'Activity Types');

  /// SKELTONS =========================================================================================================
  SkeltonWrap _displayActivityTypeDynamicSkelton(double screenWidth) =>
      SkeltonWrap(screenWidth: screenWidth, numberOfWidget: 8);

  /// BLOC =============================================================================================================
  BlocBuilder<ActivityTypeDynamicBloc, ActivityTypeDynamicState>
      _bringActivityTypesFromDatabaseAndDisplayThem(
    CleanAllButtonOnActivityTemplateAddingPopUpCubit cleanActivityButton,
    double screenWidth,
  ) =>
          BlocBuilder<ActivityTypeDynamicBloc, ActivityTypeDynamicState>(
              builder: (context, state) {
            switch (state.status) {
              case Status.initial:
                return _displayActivityTypeDynamicSkelton(screenWidth);
              case Status.loading:
                return _displayActivityTypeDynamicSkelton(screenWidth);
              case Status.success:
                if (state.activityTypeDynamicList.isEmpty) {
                  return const SizedBox();
                } else {
                  return _createActivityTypeArea(
                      context, state, cleanActivityButton);
                }
              case Status.failure:
                return StateError(error: state.error);
            }
          });

  /// CREATE ===========================================================================================================
  AppWrap _createActivityTypeArea(
    BuildContext context,
    ActivityTypeDynamicState state,
    CleanAllButtonOnActivityTemplateAddingPopUpCubit cleanActivityButton,
  ) =>
      AppWrap(
        children:
            _generateActivityTypeDetails(context, state, cleanActivityButton),
      );

  /// GENERATE =========================================================================================================
  List<BlocBuilder> _generateActivityTypeDetails(
    BuildContext context,
    ActivityTypeDynamicState state,
    CleanAllButtonOnActivityTemplateAddingPopUpCubit cleanActivityButton,
  ) {
    if (_checkAnyActivityTemplateIsNotPressed(context)) {
      _updateButtonWithChosenActivityTemplate(context);
    }
    return List.generate(
        state.activityTypeDynamicList.length,
        (index) =>
            _buildBlocOfActivityTypeButton(state, cleanActivityButton, index));
  }

  /// BUILD ============================================================================================================
  BlocBuilder<ActivityTypeDynamicButtonOnActivityTemplateAddingPopUpBloc,
          ActivityTypeDynamicButtonOnActivityTemplateAddingPopUpState>
      _buildBlocOfActivityTypeButton(
    ActivityTypeDynamicState state,
    CleanAllButtonOnActivityTemplateAddingPopUpCubit cleanActivityButton,
    int index,
  ) =>
          BlocBuilder<
                  ActivityTypeDynamicButtonOnActivityTemplateAddingPopUpBloc,
                  ActivityTypeDynamicButtonOnActivityTemplateAddingPopUpState>(
              builder: (context, buttonState) {
            _checkCleanButtonStatus(buttonState, cleanActivityButton);
            return _displayctivityTypeDetailArea(
                context, state, buttonState, index);
          });

  /// DISPLAY ==========================================================================================================
  ChoiceContainer _displayctivityTypeDetailArea(
    BuildContext context,
    ActivityTypeDynamicState state,
    ActivityTypeDynamicButtonOnActivityTemplateAddingPopUpState buttonState,
    int index,
  ) =>
      ChoiceContainer(
          containerText: _displayActivityType(state, index),
          buttonColor: _displayButtonColor(state, buttonState, index),
          buttonBorderColor:
              _displayButttonBorderColor(state, buttonState, index),
          labelColor: _displayLabelColor(state, buttonState, index),
          onTap: () => _pressActivityTypeButton(context, state, index));

  String _displayActivityType(
    ActivityTypeDynamicState state,
    int index,
  ) =>
      _appFunctions.setWithoutUnderscore(
          state.activityTypeDynamicList.elementAt(index).activityTypeDetail);

  Color _displayButtonColor(
    ActivityTypeDynamicState state,
    ActivityTypeDynamicButtonOnActivityTemplateAddingPopUpState buttonState,
    int index,
  ) =>
      buttonState.chosenActivityTypeDynamicList.contains(
              state.activityTypeDynamicList.elementAt(index).activityTypeDetail)
          ? _appColors.selectedButtonColor
          : Colors.transparent;

  Color _displayButttonBorderColor(
    ActivityTypeDynamicState state,
    ActivityTypeDynamicButtonOnActivityTemplateAddingPopUpState buttonState,
    int index,
  ) =>
      buttonState.chosenActivityTypeDynamicList.contains(
              state.activityTypeDynamicList.elementAt(index).activityTypeDetail)
          ? _appColors.selectedContainerColor
          : _appColors.unselectedContainerColor;

  Color _displayLabelColor(
    ActivityTypeDynamicState state,
    ActivityTypeDynamicButtonOnActivityTemplateAddingPopUpState buttonState,
    int index,
  ) =>
      buttonState.chosenActivityTypeDynamicList.contains(
              state.activityTypeDynamicList.elementAt(index).activityTypeDetail)
          ? _appColors.selectedLabelColor
          : _appColors.unselectedLabelColor;

  /// METHODS ==========================================================================================================
  void _updateButtonWithChosenActivityTemplate(
    BuildContext context,
  ) =>
      context
          .read<ActivityTypeDynamicButtonOnActivityTemplateAddingPopUpBloc>()
          .add(PressActivityTypeDynamicButtonOnActivityTemplateAddingPopUp(
              activityTypeDynamic: context
                  .read<
                      ChosenActivityTemplateAmongActivityTemplateDynamicOfUserOnAddingPopUpCubit>()
                  .state
                  .chosenActivityTemplateList
                  .first
                  .activityNameDynamic
                  .activityTypeDynamic
                  .activityTypeDetail));

  void _pressActivityTypeButton(
    BuildContext context,
    ActivityTypeDynamicState state,
    int index,
  ) =>
      context
          .read<ActivityTypeDynamicButtonOnActivityTemplateAddingPopUpBloc>()
          .add(PressActivityTypeDynamicButtonOnActivityTemplateAddingPopUp(
              activityTypeDynamic: state.activityTypeDynamicList
                  .elementAt(index)
                  .activityTypeDetail));

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkAnyActivityTemplateIsNotPressed(
    BuildContext context,
  ) =>
      context
          .watch<
              ChosenActivityTemplateAmongActivityTemplateDynamicOfUserOnAddingPopUpCubit>()
          .state
          .chosenActivityTemplateList
          .isNotEmpty;

  void _checkCleanButtonStatus(
    ActivityTypeDynamicButtonOnActivityTemplateAddingPopUpState buttonState,
    CleanAllButtonOnActivityTemplateAddingPopUpCubit cleanActivityButton,
  ) =>
      _isCleanAllButtonPressed(cleanActivityButton) &&
              buttonState.chosenActivityTypeDynamicList.isNotEmpty
          ? buttonState.chosenActivityTypeDynamicList.clear()
          : buttonState.chosenActivityTypeDynamicList;

  bool _isCleanAllButtonPressed(
    CleanAllButtonOnActivityTemplateAddingPopUpCubit cleanActivityButton,
  ) =>
      cleanActivityButton
          .isCleanAllButtonOnActivityTemplateAddingPopUpPressed ==
      true;
}
