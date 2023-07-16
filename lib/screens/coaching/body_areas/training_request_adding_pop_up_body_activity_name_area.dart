import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class TrainingRequestAddingPopUpBodyActivityNameArea extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppFunctions _appFunctions = AppFunctions();
  final double screenWidth;

  TrainingRequestAddingPopUpBodyActivityNameArea({
    required this.screenWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        _buildActivityNameByActivityTypesThatBroughtFromDatabaseAndDisplayThem(),
        const CustomAppSizedBox(),
      ],
    );
  }

  /// TITLES =========================================================================================================
  CustomTitle _createActivityNamesTitle() => const CustomTitle(
      spaceFromUpperWidget: 18, textLabel: 'Preffered Activity Names');

  /// LOADING ==========================================================================================================
  Column _createActivityNameTitleAndLoadingArea() => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _createActivityNamesTitle(),
          const CustomAppSizedBox(),
          const StateLoading(),
        ],
      );

  /// BLOC =============================================================================================================
  BlocBuilder<
          ActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUpBloc,
          ActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUpState>
      _buildActivityNameByActivityTypesThatBroughtFromDatabaseAndDisplayThem() =>
          BlocBuilder<
                  ActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUpBloc,
                  ActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUpState>(
              builder: (context, state) {
            if (context
                .watch<
                    ActivityTypeDynamicButtonOnTrainingRequestAddingPopUpBloc>()
                .state
                .chosenActivityTypeDynamicList
                .isEmpty) {
              return const SizedBox();
            }
            switch (state.status) {
              case Status.initial:
                return _createActivityNameTitleAndLoadingArea();
              case Status.loading:
                return _createActivityNameTitleAndLoadingArea();
              case Status.success:
                return _createActivityNameTitleAndArea(state);
              case Status.failure:
                return StateError(error: state.error);
            }
          });

  /// CREATE ===========================================================================================================
  CustomColumn _createActivityNameTitleAndArea(
          ActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUpState
              state) =>
      CustomColumn(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _createActivityNamesTitle(),
          const CustomAppSizedBox(height: 5),
          _createActivityNameArea(state)
        ],
      );

  AppWrap _createActivityNameArea(
    ActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUpState
        state,
  ) =>
      AppWrap(children: _generateActivityNameDetails(state));

  /// GENERATE =========================================================================================================
  List<Widget> _generateActivityNameDetails(
          ActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUpState
              state) =>
      List.generate(state.activityNameDynamicList.length,
          (index) => _buildBlocOfActivityNameButton(state, index));

  /// BUILD ============================================================================================================
  BlocBuilder<
          ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingRequestAddingPopUpCubit,
          ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingRequestAddingPopUpState>
      _buildBlocOfActivityNameButton(
    ActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUpState
        state,
    int index,
  ) =>
          BlocBuilder<
                  ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingRequestAddingPopUpCubit,
                  ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingRequestAddingPopUpState>(
              builder: (context, buttonState) {
            return _displayActivityNameDetails(
                context, state, buttonState, index);
          });

  /// DISPLAY ==========================================================================================================
  ChoiceContainer _displayActivityNameDetails(
    BuildContext context,
    ActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUpState
        state,
    ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingRequestAddingPopUpState
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
    ActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUpState
        state,
    int index,
  ) =>
      _appFunctions
          .setWithoutUnderscore(_findActivityTitle(state, index))
          .toCapitalized();

  Color _displayLabelColor(
    ActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUpState
        state,
    ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingRequestAddingPopUpState
        buttonState,
    int index,
  ) =>
      buttonState.chosenActivityTitleList
              .contains(_findActivityTitle(state, index))
          ? _appColors.selectedLabelColor
          : _appColors.unselectedLabelColor;

  Color _displayButttonBorderColor(
    ActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUpState
        state,
    ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingRequestAddingPopUpState
        buttonState,
    int index,
  ) =>
      buttonState.chosenActivityTitleList
              .contains(_findActivityTitle(state, index))
          ? _appColors.selectedLabelColor
          : _appColors.unselectedLabelColor;

  Color _displayButtonColor(
    ActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUpState
        state,
    ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingRequestAddingPopUpState
        buttonState,
    int index,
  ) =>
      buttonState.chosenActivityTitleList
              .contains(_findActivityTitle(state, index))
          ? _appColors.selectedButtonColor
          : Colors.transparent;

  /// METHODS ==========================================================================================================
  void _pressActivityNameButton(
    BuildContext context,
    ActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUpState
        state,
    int index,
  ) =>
      context
          .read<
              ActivityNameDynamicByActivityTypeDynamicButtonOnTrainingRequestAddingPopUpCubit>()
          .pressedActivityNameDynamicByActivityTypeDynamicButtonOnTrainingRequestAddingPopUp(
              _findActivityTitle(state, index));

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findActivityTitle(
          ActivityNameDynamicByActivityTypeDynamicOnTrainingRequestAddingPopUpState
              state,
          int index) =>
      state.activityNameDynamicList.elementAt(index).activityTitle;
}
