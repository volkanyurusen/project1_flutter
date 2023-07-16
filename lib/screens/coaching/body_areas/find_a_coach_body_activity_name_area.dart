import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class FindACoachBodyActivityNameArea extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppFunctions _appFunctions = AppFunctions();
  final CleanAllButtonOnFindACoachScreenCubit cleanActivityButton;

  FindACoachBodyActivityNameArea({
    required this.cleanActivityButton,
    Key? key,
    required double screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CleanAllButtonOnFindACoachScreenCubit cleanActivityButton =
        BlocProvider.of<CleanAllButtonOnFindACoachScreenCubit>(context,
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
  BlocBuilder<ActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenBloc,
          ActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenState>
      _bringActivityNamesFromDatabaseAndDisplayThem(
    CleanAllButtonOnFindACoachScreenCubit cleanActivityButton,
  ) =>
          BlocBuilder<
                  ActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenBloc,
                  ActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenState>(
              builder: (context, state) {
            if (_isCleanAllButtonPressed(cleanActivityButton) &&
                context
                    .read<
                        ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit>()
                    .state
                    .chosenActivityTitleList
                    .isNotEmpty) {
              _unchoseAllChosenActivityNameOnFindACoachScreen(context);
            }
            if (context
                .watch<ActivityTypeDynamicButtonOnFindACoachScreenBloc>()
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
    ActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenState state,
    CleanAllButtonOnFindACoachScreenCubit cleanActivityButton,
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
    ActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenState state,
    CleanAllButtonOnFindACoachScreenCubit cleanActivityButton,
  ) =>
      AppWrap(
          children: _generateActivityNameDetails(
              context, state, cleanActivityButton));

  /// GENERATE =========================================================================================================
  List<Widget> _generateActivityNameDetails(
    BuildContext context,
    ActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenState state,
    CleanAllButtonOnFindACoachScreenCubit cleanActivityButton,
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
          ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit,
          ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenState>
      _buildBlocOfActivityNameButton(
    ActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenState state,
    CleanAllButtonOnFindACoachScreenCubit cleanActivityButton,
    int index,
  ) =>
          BlocBuilder<
                  ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit,
                  ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenState>(
              builder: (context, buttonState) {
            _checkCleanButtonStatus(context, buttonState, cleanActivityButton);
            return _displayActivityNameDetails(
                context, state, buttonState, index);
          });

  /// DISPLAY ==========================================================================================================
  ChoiceContainer _displayActivityNameDetails(
    BuildContext context,
    ActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenState state,
    ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenState
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
    ActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenState state,
    int index,
  ) =>
      _appFunctions
          .setWithoutUnderscore(_findActivityTitle(state, index))
          .toCapitalized();

  Color _displayButtonColor(
    ActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenState state,
    ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenState
        buttonState,
    int index,
  ) =>
      buttonState.chosenActivityTitleList
              .contains(_findActivityTitle(state, index))
          ? _appColors.selectedButtonColor
          : Colors.transparent;

  Color _displayButttonBorderColor(
    ActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenState state,
    ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenState
        buttonState,
    int index,
  ) =>
      buttonState.chosenActivityTitleList
              .contains(_findActivityTitle(state, index))
          ? _appColors.selectedLabelColor
          : _appColors.unselectedLabelColor;

  Color _displayLabelColor(
    ActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenState state,
    ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenState
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
  //             ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit>()
  //         .pressedActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreen(
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
    ActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenState state,
    int index,
  ) =>
      context
          .read<
              ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit>()
          .pressedActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreen(
              _findActivityTitle(state, index));

  /// Check Methods ----------------------------------------------------------------------------------------------------
  //
  //bool _checkAnyActivityTemplateIsNotPressed(
  //   BuildContext context,
  // ) =>
  //     context
  //         .watch<CreateActivityByChosenActivityTemplateDynamicCubit>()
  //         .state
  //         .chosenActivityTemplateDynamicList
  //         .isNotEmpty;

  void _checkCleanButtonStatus(
    BuildContext context,
    ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenState
        buttonState,
    CleanAllButtonOnFindACoachScreenCubit cleanActivityButton,
  ) {
    _isCleanAllButtonPressed(cleanActivityButton) &&
            buttonState.chosenActivityTitleList.isNotEmpty
        ? _unchoseAllChosenActivityNameOnFindACoachScreen(context)
        : buttonState.chosenActivityTitleList;
  }

  bool _isCleanAllButtonPressed(
    CleanAllButtonOnFindACoachScreenCubit cleanActivityButton,
  ) =>
      cleanActivityButton.isCleanAllButtonOnFindACoachScreenPressed == true;

  /// Find Methods -----------------------------------------------------------------------------------------------------
  String _findActivityTitle(
          ActivityNameDynamicByActivityTypeDynamicOnFindACoachScreenState state,
          int index) =>
      state.activityNameDynamicList.elementAt(index).activityTitle;

  /// Other Methods ----------------------------------------------------------------------------------------------------
  void _unchoseAllChosenActivityNameOnFindACoachScreen(BuildContext context) =>
      context
          .read<
              ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit>()
          .cleanActivityNameDynamicButton();
}

// import 'package:flutter/material.dart';
// import 'package:my_project/constants/constants.dart';
// import 'package:my_project/logic/blocs/blocs.dart';
// import 'package:my_project/logic/cubits/cubits.dart';
// import 'package:my_project/widgets/widget.dart';

// class FindACoachBodyActivityNameArea extends StatelessWidget {
//   final AppColors _appColors = AppColors();
//   final AppFunctions _appFunctions = AppFunctions();
//   final double screenWidth;

//   FindACoachBodyActivityNameArea({
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
//           ActivityNameDynamicByActivityTypeDynamicOnFindACoachBloc,
//           ActivityNameDynamicByActivityTypeDynamicOnFindACoachState>
//       _buildActivityNameByActivityTypesThatBroughtFromDatabaseAndDisplayThem() =>
//           BlocBuilder<
//                   ActivityNameDynamicByActivityTypeDynamicOnFindACoachBloc,
//                   ActivityNameDynamicByActivityTypeDynamicOnFindACoachState>(
//               builder: (context, state) {
//             if (context
//                 .watch<
//                     ActivityTypeDynamicButtonOnFindACoachBloc>()
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
//           ActivityNameDynamicByActivityTypeDynamicOnFindACoachState
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
//     ActivityNameDynamicByActivityTypeDynamicOnFindACoachState
//         state,
//   ) =>
//       AppWrap(children: _generateActivityNameDetails(state));

//   /// GENERATE =========================================================================================================
//   List<Widget> _generateActivityNameDetails(
//           ActivityNameDynamicByActivityTypeDynamicOnFindACoachState
//               state) =>
//       List.generate(state.activityNameDynamicList.length,
//           (index) => _buildBlocOfActivityNameButton(state, index));

//   /// BUILD ============================================================================================================
//   BlocBuilder<
//           ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachCubit,
//           ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachState>
//       _buildBlocOfActivityNameButton(
//     ActivityNameDynamicByActivityTypeDynamicOnFindACoachState
//         state,
//     int index,
//   ) =>
//           BlocBuilder<
//                   ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachCubit,
//                   ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachState>(
//               builder: (context, buttonState) {
//             return _displayActivityNameDetails(
//                 context, state, buttonState, index);
//           });

//   /// DISPLAY ==========================================================================================================
//   ChoiceContainer _displayActivityNameDetails(
//     BuildContext context,
//     ActivityNameDynamicByActivityTypeDynamicOnFindACoachState
//         state,
//     ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachState
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
//     ActivityNameDynamicByActivityTypeDynamicOnFindACoachState
//         state,
//     int index,
//   ) =>
//       _appFunctions.setWithoutUnderscore(state
//           .activityNameDynamicList
//           .elementAt(index)
//           .activityTitle);

//   Color _displayLabelColor(
//     ActivityNameDynamicByActivityTypeDynamicOnFindACoachState
//         state,
//     ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachState
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
//     ActivityNameDynamicByActivityTypeDynamicOnFindACoachState
//         state,
//     ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachState
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
//     ActivityNameDynamicByActivityTypeDynamicOnFindACoachState
//         state,
//     ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachState
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
//     ActivityNameDynamicByActivityTypeDynamicOnFindACoachState
//         state,
//     int index,
//   ) =>
//       context
//           .read<
//               ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachCubit>()
//           .pressedActivityNameDynamicByActivityTypeDynamicButtonOnFindACoach(
//               state.activityNameDynamicList
//                   .elementAt(index)
//                   .activityTitle);
// }
