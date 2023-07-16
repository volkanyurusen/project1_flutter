import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class FindATraineeBodyActivityNameArea extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppFunctions _appFunctions = AppFunctions();
  final CleanAllButtonOnFindATraineeScreenCubit cleanActivityButton;

  FindATraineeBodyActivityNameArea({
    required this.cleanActivityButton,
    Key? key,
    required double screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CleanAllButtonOnFindATraineeScreenCubit cleanActivityButton =
        BlocProvider.of<CleanAllButtonOnFindATraineeScreenCubit>(context,
            listen: true);
    return CustomColumn(
      children: [
        const CustomAppSizedBox(),
        _bringActivityNamesFromDatabaseAndDisplayThem(cleanActivityButton),
      ],
    );
  }

  /// LOADING ==========================================================================================================
  Column _createActivityNameTitleAndLoadingArea(
    BuildContext context,
  ) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _displayActivityNameTitle(),
          const CustomAppSizedBox(),
          const StateLoading(),
        ],
      );

  /// TITLE ===========================================================================================================
  CustomTitle _displayActivityNameTitle() =>
      const CustomTitle(spaceFromUpperWidget: 18, textLabel: 'Activity Names');

  /// BLOC =============================================================================================================
  BlocBuilder<ActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenBloc,
          ActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenState>
      _bringActivityNamesFromDatabaseAndDisplayThem(
    CleanAllButtonOnFindATraineeScreenCubit cleanActivityButton,
  ) =>
          BlocBuilder<
                  ActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenBloc,
                  ActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenState>(
              builder: (context, state) {
            if (_isCleanAllButtonPressed(cleanActivityButton) &&
                context
                    .read<
                        ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit>()
                    .state
                    .chosenActivityTitleList
                    .isNotEmpty) {
              _unchoseAllChosenActivityNameOnFindATraineeScreen(context);
            }
            if (context
                .watch<ActivityTypeDynamicButtonOnFindATraineeScreenBloc>()
                .state
                .chosenActivityTypeDynamicList
                .isEmpty) {
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
    ActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenState state,
    CleanAllButtonOnFindATraineeScreenCubit cleanActivityButton,
  ) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _displayActivityNameTitle(),
          const CustomAppSizedBox(),
          _createActivityNameArea(context, state, cleanActivityButton),
          const CustomAppSizedBox(),
        ],
      );

  AppWrap _createActivityNameArea(
    BuildContext context,
    ActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenState state,
    CleanAllButtonOnFindATraineeScreenCubit cleanActivityButton,
  ) =>
      AppWrap(
          children: _generateActivityNameDetails(
              context, state, cleanActivityButton));

  /// GENERATE =========================================================================================================
  List<Widget> _generateActivityNameDetails(
    BuildContext context,
    ActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenState state,
    CleanAllButtonOnFindATraineeScreenCubit cleanActivityButton,
  ) {
    // if (_checkAnyActivityTemplateIsNotPressed(context)) {
    //   _updateButtonWithChosenActivityTemplate(context);
    // }
    return List.generate(
        state.activityNameDynamicList.length,
        (index) =>
            _buildBlocOfActivityNameButton(state, cleanActivityButton, index));
  }

  /// BUILD ============================================================================================================
  BlocBuilder<
          ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit,
          ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenState>
      _buildBlocOfActivityNameButton(
    ActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenState state,
    CleanAllButtonOnFindATraineeScreenCubit cleanActivityButton,
    int index,
  ) =>
          BlocBuilder<
                  ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit,
                  ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenState>(
              builder: (context, buttonState) {
            _checkCleanButtonStatus(context, buttonState, cleanActivityButton);
            return _displayActivityNameDetails(
                context, state, buttonState, index);
          });

  /// DISPLAY ==========================================================================================================
  ChoiceContainer _displayActivityNameDetails(
    BuildContext context,
    ActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenState state,
    ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenState
        buttonState,
    int index,
  ) =>
      ChoiceContainer(
          containerText: _displayActivityName(state, index),
          buttonColor: _displayButtonColor(state, buttonState, index),
          buttonBorderColor:
              _displayButttonBorderColor(state, buttonState, index),
          labelColor: _displayLabelColor(state, buttonState, index),
          onTap: () => _pressActivityButton(context, state, index));

  String _displayActivityName(
    ActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenState state,
    int index,
  ) =>
      _appFunctions
          .setWithoutUnderscore(_findActivityTitle(state, index))
          .toCapitalized();

  Color _displayButtonColor(
    ActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenState state,
    ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenState
        buttonState,
    int index,
  ) =>
      buttonState.chosenActivityTitleList
              .contains(_findActivityTitle(state, index))
          ? _appColors.selectedButtonColor
          : Colors.transparent;

  Color _displayButttonBorderColor(
    ActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenState state,
    ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenState
        buttonState,
    int index,
  ) =>
      buttonState.chosenActivityTitleList
              .contains(_findActivityTitle(state, index))
          ? _appColors.selectedLabelColor
          : _appColors.unselectedLabelColor;

  Color _displayLabelColor(
    ActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenState state,
    ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenState
        buttonState,
    int index,
  ) =>
      buttonState.chosenActivityTitleList
              .contains(_findActivityTitle(state, index))
          ? _appColors.selectedLabelColor
          : _appColors.unselectedLabelColor;

  /// METHOD ===========================================================================================================
  // void _updateButtonWithChosenActivityTemplate(
  //   BuildContext context,
  // ) =>
  //     context
  //         .read<
  //             ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit>()
  //         .pressedActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreen(
  //             context
  //                 .read<CreateActivityByChosenActivityTemplateDynamicCubit>()
  //                 .state
  //                 .chosenActivityTemplateDynamicList
  //                 .first
  //                 .activityDetailDynamic
  //                 .activityNameDynamic
  //                 .activityTitle);

  void _pressActivityButton(
    BuildContext context,
    ActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenState state,
    int index,
  ) =>
      context
          .read<
              ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit>()
          .pressedActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreen(
              _findActivityTitle(state, index));

  /// Check Methods ----------------------------------------------------------------------------------------------------
  bool _isCleanAllButtonPressed(
    CleanAllButtonOnFindATraineeScreenCubit cleanActivityButton,
  ) =>
      cleanActivityButton.isCleanAllButtonOnFindATraineeScreenPressed == true;

  // bool _checkAnyActivityTemplateIsNotPressed(
  //   BuildContext context,
  // ) =>
  //     context
  //         .watch<CreateActivityByChosenActivityTemplateDynamicCubit>()
  //         .state
  //         .chosenActivityTemplateDynamicList
  //         .isNotEmpty;

  void _checkCleanButtonStatus(
    BuildContext context,
    ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenState
        buttonState,
    CleanAllButtonOnFindATraineeScreenCubit cleanActivityButton,
  ) =>
      _isCleanAllButtonPressed(cleanActivityButton) &&
              buttonState.chosenActivityTitleList.isNotEmpty
          ? _unchoseAllChosenActivityNameOnFindATraineeScreen(context)
          : buttonState.chosenActivityTitleList;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findActivityTitle(
          ActivityNameDynamicByActivityTypeDynamicOnFindATraineeScreenState
              state,
          int index) =>
      state.activityNameDynamicList.elementAt(index).activityTitle;

  /// Other Methods ----------------------------------------------------------------------------------------------------
  void _unchoseAllChosenActivityNameOnFindATraineeScreen(
          BuildContext context) =>
      context
          .read<
              ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeScreenCubit>()
          .state
          .chosenActivityTitleList
          .clear();
}










// import 'package:flutter/material.dart';
// import 'package:my_project/constants/constants.dart';
// import 'package:my_project/logic/blocs/blocs.dart';
// import 'package:my_project/logic/cubits/cubits.dart';
// import 'package:my_project/widgets/widget.dart';

// class FindATraineeBodyActivityNameArea extends StatelessWidget {
//   final AppColors _appColors = AppColors();
//   final AppFunctions _appFunctions = AppFunctions();
//   final double screenWidth;

//   FindATraineeBodyActivityNameArea({
//     required this.screenWidth,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CustomColumn(
//       children: [
//         _buildActivityNameByActivityTypesThatBroughtFromDatabaseAndDisplayThem(),
//         const CustomAppSizedBox(),
//       ],
//     );
//   }

//   /// TITLES =========================================================================================================
//   CustomTitle _createActivityNamesTitle() => const CustomTitle(
//       spaceFromUpperWidget: 18, textLabel: 'Preffered Activity Names');

//   /// LOADING ==========================================================================================================
//   Column _createActivityNameTitleAndLoadingArea() =>
//       Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
//         _createActivityNamesTitle(),
//         const CustomAppSizedBox(),
//         const StateLoading(),
//       ]);

//   /// BLOC =============================================================================================================
//   BlocBuilder<
//           ActivityNameDynamicByActivityTypeDynamicOnFindATraineeBloc,
//           ActivityNameDynamicByActivityTypeDynamicOnFindATraineeState>
//       _buildActivityNameByActivityTypesThatBroughtFromDatabaseAndDisplayThem() =>
//           BlocBuilder<
//                   ActivityNameDynamicByActivityTypeDynamicOnFindATraineeBloc,
//                   ActivityNameDynamicByActivityTypeDynamicOnFindATraineeState>(
//               builder: (context, state) {
//             if (context
//                 .watch<
//                     ActivityTypeDynamicButtonOnFindATraineeBloc>()
//                 .state
//                 .chosenActivityTypeDynamicList
//                 .isEmpty) {
//               return const SizedBox();
//             }
//             switch (state.status) {
//               case Status.initial:
//                 return _createActivityNameTitleAndLoadingArea();
//               case Status.loading:
//                 return _createActivityNameTitleAndLoadingArea();
//               case Status.success:
//                 return _createActivityNameTitleAndArea(state);
//               case Status.failure:
//                 return StateError(error: state.error);
//             }
//           });

//   /// CREATE ===========================================================================================================
//   Column _createActivityNameTitleAndArea(
//           ActivityNameDynamicByActivityTypeDynamicOnFindATraineeState
//               state) =>
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           _createActivityNamesTitle(),
//           const CustomAppSizedBox(height: 9),
//           _createActivityNameArea(state)
//         ],
//       );

//   AppWrap _createActivityNameArea(
//     ActivityNameDynamicByActivityTypeDynamicOnFindATraineeState
//         state,
//   ) =>
//       AppWrap(children: _generateActivityNameDetails(state));

//   /// GENERATE =========================================================================================================
//   List<Widget> _generateActivityNameDetails(
//           ActivityNameDynamicByActivityTypeDynamicOnFindATraineeState
//               state) =>
//       List.generate(state.activityNameDynamicList.length,
//           (index) => _buildBlocOfActivityNameButton(state, index));

//   /// BUILD ============================================================================================================
//   BlocBuilder<
//           ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeCubit,
//           ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeState>
//       _buildBlocOfActivityNameButton(
//     ActivityNameDynamicByActivityTypeDynamicOnFindATraineeState
//         state,
//     int index,
//   ) =>
//           BlocBuilder<
//                   ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeCubit,
//                   ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeState>(
//               builder: (context, buttonState) {
//             return _displayActivityNameDetails(
//                 context, state, buttonState, index);
//           });

//   /// DISPLAY ==========================================================================================================
//   ChoiceContainer _displayActivityNameDetails(
//     BuildContext context,
//     ActivityNameDynamicByActivityTypeDynamicOnFindATraineeState
//         state,
//     ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeState
//         buttonState,
//     int index,
//   ) =>
//       ChoiceContainer(
//           containerText: _displayActivityName(state, index),
//           buttonColor: _displayButtonColor(state, buttonState, index),
//           buttonBorderColor:
//               _displayButttonBorderColor(state, buttonState, index),
//           labelColor: _displayLabelColor(state, buttonState, index),
//           onTap: () => _pressActivityNameButton(context, state, index));

//   String _displayActivityName(
//     ActivityNameDynamicByActivityTypeDynamicOnFindATraineeState
//         state,
//     int index,
//   ) =>
//       _appFunctions.setWithoutUnderscore(state
//           .activityNameDynamicList
//           .elementAt(index)
//           .activityTitle);

//   Color _displayLabelColor(
//     ActivityNameDynamicByActivityTypeDynamicOnFindATraineeState
//         state,
//     ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeState
//         buttonState,
//     int index,
//   ) =>
//       buttonState.chosenActivityTitleList.contains(
//               state.activityNameDynamicList
//                   .elementAt(index)
//                   .activityTitle)
//           ? _appColors.selectedLabelColor
//           : _appColors.unselectedLabelColor;

//   Color _displayButttonBorderColor(
//     ActivityNameDynamicByActivityTypeDynamicOnFindATraineeState
//         state,
//     ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeState
//         buttonState,
//     int index,
//   ) =>
//       buttonState.chosenActivityTitleList.contains(
//               state.activityNameDynamicList
//                   .elementAt(index)
//                   .activityTitle)
//           ? _appColors.selectedLabelColor
//           : _appColors.unselectedLabelColor;

//   Color _displayButtonColor(
//     ActivityNameDynamicByActivityTypeDynamicOnFindATraineeState
//         state,
//     ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeState
//         buttonState,
//     int index,
//   ) =>
//       buttonState.chosenActivityTitleList.contains(
//               state.activityNameDynamicList
//                   .elementAt(index)
//                   .activityTitle)
//           ? _appColors.selectedButtonColor
//           : Colors.transparent;

//   /// METHODS ==========================================================================================================
//   void _pressActivityNameButton(
//     BuildContext context,
//     ActivityNameDynamicByActivityTypeDynamicOnFindATraineeState
//         state,
//     int index,
//   ) =>
//       context
//           .read<
//               ActivityNameDynamicByActivityTypeDynamicButtonOnFindATraineeCubit>()
//           .pressedActivityNameDynamicByActivityTypeDynamicButtonOnFindATrainee(
//               state.activityNameDynamicList
//                   .elementAt(index)
//                   .activityTitle);
// }
