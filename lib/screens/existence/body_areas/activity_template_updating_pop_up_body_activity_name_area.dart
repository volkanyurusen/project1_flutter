import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ActivityTemplateUpdatingPopUpBodyActivityNameArea
    extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final CleanAllButtonOnActivityTemplateUpdatingPopUpCubit cleanActivityButton;

  ActivityTemplateUpdatingPopUpBodyActivityNameArea({
    required this.cleanActivityButton,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        _bringActivityNamesFromDatabaseAndDisplayThem(cleanActivityButton),
      ],
    );
  }

  /// TITLES ===========================================================================================================
  CustomTitle _createActivityNamesTitle() =>
      const CustomTitle(spaceFromUpperWidget: 18, textLabel: 'Activity Names');

  /// LOADING ==========================================================================================================
  Column _createActivityNameTitleAndLoadingArea(
    BuildContext context,
  ) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _createActivityNamesTitle(),
          const CustomAppSizedBox(height: 9),
          const StateLoading(),
        ],
      );

  /// BLOC =============================================================================================================
  BlocBuilder<
          ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUpBloc,
          ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUpState>
      _bringActivityNamesFromDatabaseAndDisplayThem(
    CleanAllButtonOnActivityTemplateUpdatingPopUpCubit cleanActivityButton,
  ) =>
          BlocBuilder<
                  ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUpBloc,
                  ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUpState>(
              builder: (context, state) {
            if (context
                .watch<
                    ActivityTypeDynamicButtonOnActivityTemplateUpdatingPopUpBloc>()
                .state
                .chosenActivityTypeDynamicList
                .isEmpty) {
              if (_isCleanAllButtonPressed(cleanActivityButton)) {
                _unchoseAllChosenActivityNameOnActivityTemplatePopUp(context);
              }
              return const SizedBox();
            }
            switch (state.status) {
              case Status.initial:
                return _createActivityNameTitleAndLoadingArea(context);
              case Status.loading:
                return _createActivityNameTitleAndLoadingArea(context);
              case Status.success:
                return _createActivityNameTitleAndArea(
                    context, state, cleanActivityButton);
              case Status.failure:
                return StateError(error: state.error);
            }
          });

  /// CREATE ===========================================================================================================
  Column _createActivityNameTitleAndArea(
    BuildContext context,
    ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUpState
        state,
    CleanAllButtonOnActivityTemplateUpdatingPopUpCubit cleanActivityButton,
  ) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _createActivityNamesTitle(),
          const CustomAppSizedBox(height: 9),
          _createActivityNameArea(context, state, cleanActivityButton),
          const CustomAppSizedBox(height: 9),
        ],
      );

  AppWrap _createActivityNameArea(
    BuildContext context,
    ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUpState
        state,
    CleanAllButtonOnActivityTemplateUpdatingPopUpCubit cleanActivityButton,
  ) =>
      AppWrap(
          children: _generateActivityNameDetails(
              context, state, cleanActivityButton));

  /// GENERATE =========================================================================================================
  List<Widget> _generateActivityNameDetails(
    BuildContext context,
    ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUpState
        state,
    CleanAllButtonOnActivityTemplateUpdatingPopUpCubit cleanActivityButton,
  ) {
    if (_checkAnyActivityTemplateIsNotPressed(context)) {
      _updateButtonWithChosenActivityTemplate(context);
    }
    return List.generate(
        state.activityNameDynamicList.length,
        (index) =>
            _buildBlocOfActivityNameButton(state, cleanActivityButton, index));
  }

  BlocBuilder<
          ActivityNameByActivityTypeButtonOnActivityTemplateUpdatingPopUpCubit,
          ActivityNameByActivityTypeButtonOnActivityTemplateUpdatingPopUpState>
      _buildBlocOfActivityNameButton(
    ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUpState
        state,
    CleanAllButtonOnActivityTemplateUpdatingPopUpCubit cleanActivityButton,
    int index,
  ) =>
          BlocBuilder<
                  ActivityNameByActivityTypeButtonOnActivityTemplateUpdatingPopUpCubit,
                  ActivityNameByActivityTypeButtonOnActivityTemplateUpdatingPopUpState>(
              builder: (context, buttonState) {
            _checkCleanButtonStatus(cleanActivityButton, buttonState);
            return _buildActivityTitleChoiceContainer(
                context, state, buttonState, index);
          });

  /// DISPLAY ==========================================================================================================
  ChoiceContainer _buildActivityTitleChoiceContainer(
    BuildContext context,
    ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUpState
        state,
    ActivityNameByActivityTypeButtonOnActivityTemplateUpdatingPopUpState
        buttonState,
    int index,
  ) =>
      ChoiceContainer(
        containerText: _displayActivityName(state, index),
        buttonColor: _displayButtonColor(state, buttonState, index),
        buttonBorderColor:
            _displayButttonBorderColor(state, buttonState, index),
        labelColor: _displayLabelColor(state, buttonState, index),
        onTap: () => _pressActivityButton(context, state, index),
      );

  String _displayActivityName(
    ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUpState
        state,
    int index,
  ) =>
      AppFunctions()
          .setWithoutUnderscore(_findActivityTitle(state, index))
          .toCapitalized();

  Color _displayButtonColor(
    ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUpState
        state,
    ActivityNameByActivityTypeButtonOnActivityTemplateUpdatingPopUpState
        buttonState,
    int index,
  ) =>
      buttonState.chosenActivityTitleList.contains(
              state.activityNameDynamicList.elementAt(index).activityTitle)
          ? _appColors.selectedButtonColor
          : Colors.transparent;

  Color _displayButttonBorderColor(
    ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUpState
        state,
    ActivityNameByActivityTypeButtonOnActivityTemplateUpdatingPopUpState
        buttonState,
    int index,
  ) =>
      buttonState.chosenActivityTitleList.contains(
              state.activityNameDynamicList.elementAt(index).activityTitle)
          ? _appColors.selectedLabelColor
          : _appColors.unselectedLabelColor;

  Color _displayLabelColor(
    ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUpState
        state,
    ActivityNameByActivityTypeButtonOnActivityTemplateUpdatingPopUpState
        buttonState,
    int index,
  ) =>
      buttonState.chosenActivityTitleList.contains(
              state.activityNameDynamicList.elementAt(index).activityTitle)
          ? _appColors.selectedLabelColor
          : _appColors.unselectedLabelColor;

  /// METHOD ===========================================================================================================
  void _updateButtonWithChosenActivityTemplate(
    BuildContext context,
  ) =>
      context
          .read<
              ActivityNameByActivityTypeButtonOnActivityTemplateUpdatingPopUpCubit>()
          .pressedActivityNameByActivityTypeButtonOnActivityTemplateUpdatingPopUp(
              context
                  .read<
                      ChosenActivityTemplateAmongActivityTemplateDynamicOfUserOnUpdatingPopUpCubit>()
                  .state
                  .chosenActivityTemplateList
                  .first
                  .activityNameDynamic
                  .activityTitle);

  void _pressActivityButton(
    BuildContext context,
    ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUpState
        state,
    int index,
  ) =>
      context
          .read<
              ActivityNameByActivityTypeButtonOnActivityTemplateUpdatingPopUpCubit>()
          .pressedActivityNameByActivityTypeButtonOnActivityTemplateUpdatingPopUp(
              state.activityNameDynamicList.elementAt(index).activityTitle);

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _isCleanAllButtonPressed(
          CleanAllButtonOnActivityTemplateUpdatingPopUpCubit
              cleanActivityButton) =>
      cleanActivityButton
          .isCleanAllButtonOnActivityTemplateUpdatingPopUpPressed ==
      true;

  bool _checkAnyActivityTemplateIsNotPressed(
    BuildContext context,
  ) =>
      context
          .watch<
              ChosenActivityTemplateAmongActivityTemplateDynamicOfUserOnUpdatingPopUpCubit>()
          .state
          .chosenActivityTemplateList
          .isNotEmpty;

  void _checkCleanButtonStatus(
    CleanAllButtonOnActivityTemplateUpdatingPopUpCubit cleanActivityButton,
    ActivityNameByActivityTypeButtonOnActivityTemplateUpdatingPopUpState
        buttonState,
  ) =>
      _isCleanAllButtonPressed(cleanActivityButton) &&
              buttonState.chosenActivityTitleList.isNotEmpty
          ? buttonState.chosenActivityTitleList.clear()
          : buttonState.chosenActivityTitleList;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findActivityTitle(
          ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateUpdatingPopUpState
              state,
          int index) =>
      state.activityNameDynamicList.elementAt(index).activityTitle;

  /// Other Methods ----------------------------------------------------------------------------------------------------
  void _unchoseAllChosenActivityNameOnActivityTemplatePopUp(
    BuildContext context,
  ) =>
      context
          .read<
              ActivityNameByActivityTypeButtonOnActivityTemplateUpdatingPopUpCubit>()
          .state
          .chosenActivityTitleList
          .clear();
}
