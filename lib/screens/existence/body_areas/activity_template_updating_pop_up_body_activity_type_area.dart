import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ActivityTemplateUpdatingPopUpBodyActivityTypeArea
    extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppFunctions _appFunctions = AppFunctions();
  final CleanAllButtonOnActivityTemplateUpdatingPopUpCubit cleanActivityButton;
  final double screenWidth;

  ActivityTemplateUpdatingPopUpBodyActivityTypeArea({
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
    CleanAllButtonOnActivityTemplateUpdatingPopUpCubit cleanActivityButton,
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
                return _createActivityTypeArea(
                    context, state, cleanActivityButton);
              case Status.failure:
                return StateError(error: state.error);
            }
          });

  /// CREATE ===========================================================================================================
  AppWrap _createActivityTypeArea(
    BuildContext context,
    ActivityTypeDynamicState state,
    CleanAllButtonOnActivityTemplateUpdatingPopUpCubit cleanActivityButton,
  ) =>
      AppWrap(
        children:
            _generateActivityTypeDetails(context, state, cleanActivityButton),
      );

  /// GENERATE =========================================================================================================
  List<BlocBuilder> _generateActivityTypeDetails(
    BuildContext context,
    ActivityTypeDynamicState state,
    CleanAllButtonOnActivityTemplateUpdatingPopUpCubit cleanActivityButton,
  ) {
    if (_checkAnyActivityTemplateIsNotPressed(context)) {
      _updateButtonWithChosenActivityTemplate(context);
    }
    return List.generate(
        state.activityTypeDynamicList.length,
        (index) =>
            _buildBlocOfActivityTypeButton(state, cleanActivityButton, index));
  }

  BlocBuilder<ActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUpBloc,
          ActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUpState>
      _buildBlocOfActivityTypeButton(
    ActivityTypeDynamicState state,
    CleanAllButtonOnActivityTemplateUpdatingPopUpCubit cleanActivityButton,
    int index,
  ) =>
          BlocBuilder<
                  ActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUpBloc,
                  ActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUpState>(
              builder: (context, buttonState) {
            _checkCleanButtonStatus(buttonState, cleanActivityButton);
            return _displayActivityTypeDetail(
                context, state, buttonState, index);
          });

  /// DISPLAY ==========================================================================================================
  ChoiceContainer _displayActivityTypeDetail(
    BuildContext context,
    ActivityTypeDynamicState state,
    ActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUpState buttonState,
    int index,
  ) =>
      ChoiceContainer(
          containerText: _displayActivityType(state, index),
          buttonColor: _displayButtonColor(state, buttonState, index),
          buttonBorderColor:
              _displayButttonBorderColor(state, buttonState, index),
          labelColor: _displayLabelColor(state, buttonState, index),
          onTap: () {
            context
                .read<
                    ActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUpBloc>()
                .add(
                    PressActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUp(
                        activityTypeDynamic: state.activityTypeDynamicList
                            .elementAt(index)
                            .activityTypeDetail));
          });

  String _displayActivityType(
    ActivityTypeDynamicState state,
    int index,
  ) =>
      _appFunctions.setWithoutUnderscore(
          state.activityTypeDynamicList.elementAt(index).activityTypeDetail);

  Color _displayButtonColor(
    ActivityTypeDynamicState state,
    ActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUpState buttonState,
    int index,
  ) =>
      buttonState.chosenActivityTypeDynamicList.contains(
              state.activityTypeDynamicList.elementAt(index).activityTypeDetail)
          ? _appColors.selectedButtonColor
          : Colors.transparent;

  Color _displayButttonBorderColor(
    ActivityTypeDynamicState state,
    ActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUpState buttonState,
    int index,
  ) =>
      buttonState.chosenActivityTypeDynamicList.contains(
              state.activityTypeDynamicList.elementAt(index).activityTypeDetail)
          ? _appColors.selectedContainerColor
          : _appColors.unselectedContainerColor;

  Color _displayLabelColor(
    ActivityTypeDynamicState state,
    ActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUpState buttonState,
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
          .read<ActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUpBloc>()
          .add(PressActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUp(
              activityTypeDynamic: context
                  .read<
                      ChosenActivityTemplateAmongActivityTemplateDynamicOfUserOnUpdatingPopUpCubit>()
                  .state
                  .chosenActivityTemplateList
                  .first
                  .activityNameDynamic
                  .activityTypeDynamic
                  .activityTypeDetail));

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _checkAnyActivityTemplateIsNotPressed(BuildContext context) => context
      .watch<
          ChosenActivityTemplateAmongActivityTemplateDynamicOfUserOnUpdatingPopUpCubit>()
      .state
      .chosenActivityTemplateList
      .isNotEmpty;

  void _checkCleanButtonStatus(
    ActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUpState buttonState,
    CleanAllButtonOnActivityTemplateUpdatingPopUpCubit cleanActivityButton,
  ) =>
      _isCleanAllButtonPressed(cleanActivityButton) &&
              buttonState.chosenActivityTypeDynamicList.isNotEmpty
          ? buttonState.chosenActivityTypeDynamicList.clear()
          : buttonState.chosenActivityTypeDynamicList;

  bool _isCleanAllButtonPressed(
    CleanAllButtonOnActivityTemplateUpdatingPopUpCubit cleanActivityButton,
  ) =>
      cleanActivityButton
          .isCleanAllButtonOnActivityTemplateUpdatingPopUpPressed ==
      true;
}
