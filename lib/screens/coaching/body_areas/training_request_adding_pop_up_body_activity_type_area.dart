import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class TrainingRequestAddingPopUpBodyActivityTypeArea extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppFunctions _appFunctions = AppFunctions();
  final double screenWidth;
  // final CleanAllButtonOnTrainingRequestAddingPopUpCubit cleanActivityButton;

  TrainingRequestAddingPopUpBodyActivityTypeArea({
    required this.screenWidth,
    // required this.cleanActivityButton,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    CleanAllButtonOnTrainingRequestAddingPopUpCubit cleanActivityButton =
        BlocProvider.of<CleanAllButtonOnTrainingRequestAddingPopUpCubit>(
            context,
            listen: true);
    return SizedBox(
      child: CustomColumn(
        mainAxisSize: MainAxisSize.min,
        children: [
          _displayActivityTypesTitle(),
          const CustomAppSizedBox(height: 5),
          _bringActivityTypesFromDatabaseAndDisplayThem(
              screenWidth, cleanActivityButton),
        ],
      ),
    );
  }

  /// TITLE ===========================================================================================================
  CustomTitle _displayActivityTypesTitle() =>
      const CustomTitle(spaceFromUpperWidget: 18, textLabel: 'Activity Types');

  /// SKELTON ==========================================================================================================
  SkeltonWrap _displayActivityTypeDynamicSkelton(double screenWidth) =>
      SkeltonWrap(screenWidth: screenWidth, numberOfWidget: 8);

  /// BLOC =============================================================================================================
  BlocBuilder<ActivityTypeDynamicBloc, ActivityTypeDynamicState>
      _bringActivityTypesFromDatabaseAndDisplayThem(
    double screenWidth,
    CleanAllButtonOnTrainingRequestAddingPopUpCubit cleanActivityButton,
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
    CleanAllButtonOnTrainingRequestAddingPopUpCubit cleanActivityButton,
  ) =>
      AppWrap(
          children: _generateActivityTypeDetails(
              context, state, cleanActivityButton));

  /// GENERATE =========================================================================================================
  List<BlocBuilder> _generateActivityTypeDetails(
    BuildContext context,
    ActivityTypeDynamicState state,
    CleanAllButtonOnTrainingRequestAddingPopUpCubit cleanActivityButton,
  ) =>
      List.generate(
          state.activityTypeDynamicList.length,
          (index) => _buildBlocOfActivityTypeButton(
              state, cleanActivityButton, index));

  /// BUILD ============================================================================================================
  BlocBuilder<ActivityTypeDynamicButtonOnTrainingRequestAddingPopUpBloc,
          ActivityTypeDynamicButtonOnTrainingRequestAddingPopUpState>
      _buildBlocOfActivityTypeButton(
    ActivityTypeDynamicState state,
    CleanAllButtonOnTrainingRequestAddingPopUpCubit cleanActivityButton,
    int index,
  ) =>
          BlocBuilder<ActivityTypeDynamicButtonOnTrainingRequestAddingPopUpBloc,
                  ActivityTypeDynamicButtonOnTrainingRequestAddingPopUpState>(
              builder: (context, buttonState) {
            _checkCleanButtonStatus(context, buttonState, cleanActivityButton);
            return _buildActivityTypeDetailChoiceContainer(
                context, state, buttonState, index);
          });

  /// DISPLAY ==========================================================================================================
  ChoiceContainer _buildActivityTypeDetailChoiceContainer(
    BuildContext context,
    ActivityTypeDynamicState state,
    ActivityTypeDynamicButtonOnTrainingRequestAddingPopUpState buttonState,
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
    ActivityTypeDynamicButtonOnTrainingRequestAddingPopUpState buttonState,
    int index,
  ) =>
      buttonState.chosenActivityTypeDynamicList.contains(
              state.activityTypeDynamicList.elementAt(index).activityTypeDetail)
          ? _appColors.selectedButtonColor
          : Colors.transparent;

  Color _displayButttonBorderColor(
    ActivityTypeDynamicState state,
    ActivityTypeDynamicButtonOnTrainingRequestAddingPopUpState buttonState,
    int index,
  ) =>
      buttonState.chosenActivityTypeDynamicList.contains(
              state.activityTypeDynamicList.elementAt(index).activityTypeDetail)
          ? _appColors.selectedContainerColor
          : _appColors.unselectedContainerColor;

  Color _displayLabelColor(
    ActivityTypeDynamicState state,
    ActivityTypeDynamicButtonOnTrainingRequestAddingPopUpState buttonState,
    int index,
  ) =>
      buttonState.chosenActivityTypeDynamicList.contains(
              state.activityTypeDynamicList.elementAt(index).activityTypeDetail)
          ? _appColors.selectedLabelColor
          : _appColors.unselectedLabelColor;

  /// METHOD ===========================================================================================================
  void _pressActivityTypeButton(
    BuildContext context,
    ActivityTypeDynamicState state,
    int index,
  ) =>
      context
          .read<ActivityTypeDynamicButtonOnTrainingRequestAddingPopUpBloc>()
          .add(PressActivityTypeDynamicButtonOnTrainingRequestAddingPopUp(
              activityTypeDynamic: state.activityTypeDynamicList
                  .elementAt(index)
                  .activityTypeDetail));

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _isCleanAllButtonPressed(
          CleanAllButtonOnTrainingRequestAddingPopUpCubit
              cleanActivityButton) =>
      cleanActivityButton.isCleanAllButtonOnTrainingRequestAddingPopUpPressed ==
      true;

  void _checkCleanButtonStatus(
    BuildContext context,
    ActivityTypeDynamicButtonOnTrainingRequestAddingPopUpState buttonState,
    CleanAllButtonOnTrainingRequestAddingPopUpCubit cleanActivityButton,
  ) =>
      _isCleanAllButtonPressed(cleanActivityButton) &&
              buttonState.chosenActivityTypeDynamicList.isNotEmpty
          ? _unchoseAllChosenActivityTypeOnTrainingRequestAddingPopUp(context)
          : buttonState.chosenActivityTypeDynamicList;

  /// Other Methods ----------------------------------------------------------------------------------------------------
  void _unchoseAllChosenActivityTypeOnTrainingRequestAddingPopUp(
    BuildContext context,
  ) =>
      context
          .read<ActivityTypeDynamicButtonOnTrainingRequestAddingPopUpBloc>()
          .state
          .chosenActivityTypeDynamicList
          .clear();
}








// import 'package:flutter/material.dart';
// import 'package:my_project/constants/constants.dart';
// import 'package:my_project/logic/blocs/blocs.dart';
// import 'package:my_project/logic/cubits/cubits.dart';
// import 'package:my_project/widgets/widget.dart';

// class TrainingRequestAddingPopUpBodyActivityLevelArea extends StatelessWidget {
//   final AppColors _appColors = AppColors();
//   final AppIconConstants _appIconConstants = AppIconConstants();
//   final AppListConstants _appListConstants = AppListConstants();
//   final double screenWidth;

//   TrainingRequestAddingPopUpBodyActivityLevelArea({
//     required this.screenWidth,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Color iconColor = Theme.of(context).colorScheme.primary;

//     return Column(
//       children: [
//         _createActivityLevelsTitle(),
//         _bringActivityLevelsFromDatabaseAndDisplayThem(iconColor),
//         const CustomAppSizedBox(),
//       ],
//     );
//   }

//   /// TITLES ===========================================================================================================
//   CustomTitle _createActivityLevelsTitle() => const CustomTitle(
//       spaceFromUpperWidget: 18, textLabel: 'Preffered Activity Level');

//   /// SKELTONS =========================================================================================================
//   AppListViewBuilder _displayActivityLevelDynamicSkelton() =>
//       AppListViewBuilder(
//           itemCount: 3,
//           itemBuilder: (context, index) =>
//               SkeltonChoiceColumn(screenWidth: screenWidth));

//   /// BLOC =============================================================================================================
//   BlocBuilder<ActivityLevelDynamicBloc, ActivityLevelDynamicState>
//       _bringActivityLevelsFromDatabaseAndDisplayThem(
//     Color iconColor,
//   ) =>
//           BlocBuilder<ActivityLevelDynamicBloc, ActivityLevelDynamicState>(
//               builder: (context, state) {
//             switch (state.status) {
//               case Status.initial:
//                 return _displayActivityLevelDynamicSkelton();
//               case Status.loading:
//                 return _displayActivityLevelDynamicSkelton();
//               case Status.success:
//                 if (state.activityLevelDynamicList.isEmpty) {
//                   return const SizedBox();
//                 } else {
//                   return _createActivityLevelArea(state, iconColor);
//                 }
//               case Status.failure:
//                 return StateError(error: state.error);
//             }
//           });

//   /// CREATE ===========================================================================================================
//   AppListViewBuilder _createActivityLevelArea(
//     ActivityLevelDynamicState state,
//     Color iconColor,
//   ) =>
//       AppListViewBuilder(
//           itemCount: state.activityLevelDynamicList.length,
//           itemBuilder: (BuildContext context, int index) =>
//               _buildBlocOfActivityLevelButton(state, index, iconColor));

//   /// BUILD ============================================================================================================
//   BlocBuilder<ActivityLevelDynamicButtonOnTrainingRequestAddingPopUpCubit,
//           ActivityLevelDynamicButtonOnTrainingRequestAddingPopUpState>
//       _buildBlocOfActivityLevelButton(
//     ActivityLevelDynamicState state,
//     int index,
//     Color iconColor,
//   ) =>
//           BlocBuilder<
//                   ActivityLevelDynamicButtonOnTrainingRequestAddingPopUpCubit,
//                   ActivityLevelDynamicButtonOnTrainingRequestAddingPopUpState>(
//               builder: (context, buttonState) {
//             return _generateActivityLevelDetails(
//                 context, state, buttonState, index, iconColor);
//           });

//   /// GENERATE =========================================================================================================
//   GestureDetector _generateActivityLevelDetails(
//     BuildContext context,
//     ActivityLevelDynamicState state,
//     ActivityLevelDynamicButtonOnTrainingRequestAddingPopUpState buttonState,
//     int index,
//     Color iconColor,
//   ) =>
//       GestureDetector(
//           onTap: () => _pressActivityLevelButton(context, state, index),
//           child: _displayActivityLevelDetails(
//               context, state, buttonState, index, iconColor));

//   /// DISPLAY ==========================================================================================================
//   ChoiceColumn _displayActivityLevelDetails(
//     BuildContext context,
//     ActivityLevelDynamicState state,
//     ActivityLevelDynamicButtonOnTrainingRequestAddingPopUpState buttonState,
//     int index,
//     Color iconColor,
//   ) =>
//       ChoiceColumn(
//         containerColor: _displayContainerColor(state, buttonState, index),
//         icon: _displayActivityLevelIcon(context, index, iconColor),
//         headerLabel: _displayActivityLevelName(state, index),
//         detailLabel: _displayDetailExplanation(index),
//       );

//   Color _displayContainerColor(
//     ActivityLevelDynamicState state,
//     ActivityLevelDynamicButtonOnTrainingRequestAddingPopUpState buttonState,
//     int index,
//   ) =>
//       buttonState.chosenActivityLevelDynamicList.contains(
//               state.activityLevelDynamicList.elementAt(index).activityLevelName)
//           ? _appColors.selectedLineColor.withOpacity(0.3)
//           : Colors.transparent;

//   Icon _displayActivityLevelIcon(
//     BuildContext context,
//     int index,
//     Color iconColor,
//   ) =>
//       Icon(_appIconConstants.activityLevelIcons.elementAt(index).icon,
//           color: iconColor);

//   String _displayActivityLevelName(
//           ActivityLevelDynamicState state, int index) =>
//       state.activityLevelDynamicList.elementAt(index).activityLevelName;

//   String _displayDetailExplanation(int index) =>
//       _appListConstants.activityLevelExplanation.elementAt(index);

//   /// METHODS ==========================================================================================================
//   void _pressActivityLevelButton(
//     BuildContext context,
//     ActivityLevelDynamicState state,
//     int index,
//   ) =>
//       context
//           .read<ActivityLevelDynamicButtonOnTrainingRequestAddingPopUpCubit>()
//           .pressedActivityLevelDynamicButtonOnTrainingRequestAddingPopUp(state
//               .activityLevelDynamicList
//               .elementAt(index)
//               .activityLevelName);
// }
