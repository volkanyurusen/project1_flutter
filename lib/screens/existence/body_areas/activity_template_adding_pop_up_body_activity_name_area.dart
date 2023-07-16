import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ActivityTemplateAddingPopUpBodyActivityNameArea extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppFunctions _appFunctions = AppFunctions();
  final CleanAllButtonOnActivityTemplateAddingPopUpCubit cleanActivityButton;

  ActivityTemplateAddingPopUpBodyActivityNameArea({
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
          ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUpBloc,
          ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUpState>
      _bringActivityNamesFromDatabaseAndDisplayThem(
    CleanAllButtonOnActivityTemplateAddingPopUpCubit cleanActivityButton,
  ) =>
          BlocBuilder<
                  ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUpBloc,
                  ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUpState>(
              builder: (context, state) {
            if (context
                .watch<
                    ActivityTypeDynamicButtonOnActivityTemplateAddingPopUpBloc>()
                .state
                .chosenActivityTypeDynamicList
                .isEmpty) {
              /// If there is any problem while working these codes, the below if can be removed "between 61-63"
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
    ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUpState
        state,
    CleanAllButtonOnActivityTemplateAddingPopUpCubit cleanActivityButton,
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
    ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUpState
        state,
    CleanAllButtonOnActivityTemplateAddingPopUpCubit cleanActivityButton,
  ) =>
      AppWrap(
          children: _generateActivityNameDetails(
              context, state, cleanActivityButton));

  /// GENERATE =========================================================================================================
  List<Widget> _generateActivityNameDetails(
    BuildContext context,
    ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUpState
        state,
    CleanAllButtonOnActivityTemplateAddingPopUpCubit cleanActivityButton,
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
          ActivityNameByActivityTypeButtonOnActivityTemplateAddingPopUpCubit,
          ActivityNameByActivityTypeButtonOnActivityTemplateAddingPopUpState>
      _buildBlocOfActivityNameButton(
    ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUpState
        state,
    CleanAllButtonOnActivityTemplateAddingPopUpCubit cleanActivityButton,
    int index,
  ) =>
          BlocBuilder<
                  ActivityNameByActivityTypeButtonOnActivityTemplateAddingPopUpCubit,
                  ActivityNameByActivityTypeButtonOnActivityTemplateAddingPopUpState>(
              builder: (context, buttonState) {
            _checkCleanButtonStatus(buttonState, cleanActivityButton);
            return _displayActivityNameDetails(
                context, state, buttonState, index);
          });

  ChoiceContainer _displayActivityNameDetails(
    BuildContext context,
    ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUpState
        state,
    ActivityNameByActivityTypeButtonOnActivityTemplateAddingPopUpState
        buttonState,
    int index,
  ) =>
      ChoiceContainer(
          containerText: _displayActivityName(state, index),
          buttonColor: _displayButtonColor(state, buttonState, index),
          buttonBorderColor:
              _displayButttonBorderColor(state, buttonState, index),
          labelColor: _displayLabelColor(state, buttonState, index),
          onTap: () => _pressActivityNameButton(context, state, index));

  String _displayActivityName(
    ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUpState
        state,
    int index,
  ) =>
      _appFunctions
          .setWithoutUnderscore(_findActivityTitle(state, index))
          .toCapitalized();

  Color _displayButtonColor(
    ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUpState
        state,
    ActivityNameByActivityTypeButtonOnActivityTemplateAddingPopUpState
        buttonState,
    int index,
  ) =>
      buttonState.chosenActivityTitleList.contains(
              state.activityNameDynamicList.elementAt(index).activityTitle)
          ? _appColors.selectedButtonColor
          : Colors.transparent;

  Color _displayButttonBorderColor(
    ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUpState
        state,
    ActivityNameByActivityTypeButtonOnActivityTemplateAddingPopUpState
        buttonState,
    int index,
  ) =>
      buttonState.chosenActivityTitleList.contains(
              state.activityNameDynamicList.elementAt(index).activityTitle)
          ? _appColors.selectedLabelColor
          : _appColors.unselectedLabelColor;

  Color _displayLabelColor(
    ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUpState
        state,
    ActivityNameByActivityTypeButtonOnActivityTemplateAddingPopUpState
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
              ActivityNameByActivityTypeButtonOnActivityTemplateAddingPopUpCubit>()
          .pressedActivityNameByActivityTypeButtonOnActivityTemplateAddingPopUp(
              context
                  .read<
                      ChosenActivityTemplateAmongActivityTemplateDynamicOfUserOnAddingPopUpCubit>()
                  .state
                  .chosenActivityTemplateList
                  .first
                  .activityNameDynamic
                  .activityTitle);

  void _pressActivityNameButton(
    BuildContext context,
    ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUpState
        state,
    int index,
  ) =>
      context
          .read<
              ActivityNameByActivityTypeButtonOnActivityTemplateAddingPopUpCubit>()
          .pressedActivityNameByActivityTypeButtonOnActivityTemplateAddingPopUp(
              state.activityNameDynamicList.elementAt(index).activityTitle);

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _isCleanAllButtonPressed(
    CleanAllButtonOnActivityTemplateAddingPopUpCubit cleanActivityButton,
  ) =>
      cleanActivityButton
          .isCleanAllButtonOnActivityTemplateAddingPopUpPressed ==
      true;

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
    ActivityNameByActivityTypeButtonOnActivityTemplateAddingPopUpState
        buttonState,
    CleanAllButtonOnActivityTemplateAddingPopUpCubit cleanActivityButton,
  ) =>
      _isCleanAllButtonPressed(cleanActivityButton) &&
              buttonState.chosenActivityTitleList.isNotEmpty
          ? buttonState.chosenActivityTitleList.clear()
          : buttonState.chosenActivityTitleList;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findActivityTitle(
          ActivityNameDynamicByActivityTypeDynamicOnActivityTemplateAddingPopUpState
              state,
          int index) =>
      state.activityNameDynamicList.elementAt(index).activityTitle;

  /// Other Methods ----------------------------------------------------------------------------------------------------
  void _unchoseAllChosenActivityNameOnActivityTemplatePopUp(
    BuildContext context,
  ) =>
      context
          .read<
              ActivityNameByActivityTypeButtonOnActivityTemplateAddingPopUpCubit>()
          .state
          .chosenActivityTitleList
          .clear();
}
