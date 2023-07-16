import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class FindACoachBodyActivityTypeArea extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppFunctions _appFunctions = AppFunctions();
  final CleanAllButtonOnFindACoachScreenCubit cleanActivityButton;
  final double screenWidth;

  FindACoachBodyActivityTypeArea({
    required this.cleanActivityButton,
    required this.screenWidth,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CleanAllButtonOnFindACoachScreenCubit cleanActivityButton =
        BlocProvider.of<CleanAllButtonOnFindACoachScreenCubit>(context,
            listen: true);
    double screenWidth = MediaQuery.of(context).size.width;
    return CustomColumn(
      children: [
        _displayActivityTypesTitle(),
        const CustomAppSizedBox(),
        _bringActivityTypesFromDatabaseAndDisplayThem(
            cleanActivityButton, screenWidth),
      ],
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
    CleanAllButtonOnFindACoachScreenCubit cleanActivityButton,
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
    CleanAllButtonOnFindACoachScreenCubit cleanActivityButton,
  ) =>
      AppWrap(
          children: _generateActivityTypeDetails(
              context, state, cleanActivityButton));

  /// GENERATE =========================================================================================================
  List<BlocBuilder> _generateActivityTypeDetails(
    BuildContext context,
    ActivityTypeDynamicState state,
    CleanAllButtonOnFindACoachScreenCubit cleanActivityButton,
  ) {
    // if (_checkAnyActivityTemplateIsNotPressed(context)) {
    //   _updateButtonWithChosenActivityTemplate(context);
    // }
    return List.generate(
        state.activityTypeDynamicList.length,
        (index) =>
            _buildBlocOfActivityTypeButton(state, cleanActivityButton, index));
  }

  /// BUILD ============================================================================================================
  BlocBuilder<ActivityTypeDynamicButtonOnFindACoachScreenBloc,
          ActivityTypeDynamicButtonOnFindACoachScreenState>
      _buildBlocOfActivityTypeButton(
    ActivityTypeDynamicState state,
    CleanAllButtonOnFindACoachScreenCubit cleanActivityButton,
    int index,
  ) =>
          BlocBuilder<ActivityTypeDynamicButtonOnFindACoachScreenBloc,
                  ActivityTypeDynamicButtonOnFindACoachScreenState>(
              builder: (context, buttonState) {
            _checkCleanButtonStatus(context, buttonState, cleanActivityButton);
            return _buildActivityTypeDetailChoiceContainer(
                context, state, buttonState, index);
          });

  /// DISPLAY ==========================================================================================================
  ChoiceContainer _buildActivityTypeDetailChoiceContainer(
    BuildContext context,
    ActivityTypeDynamicState state,
    ActivityTypeDynamicButtonOnFindACoachScreenState buttonState,
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
    ActivityTypeDynamicButtonOnFindACoachScreenState buttonState,
    int index,
  ) =>
      buttonState.chosenActivityTypeDynamicList.contains(
              state.activityTypeDynamicList.elementAt(index).activityTypeDetail)
          ? _appColors.selectedButtonColor
          : Colors.transparent;

  Color _displayButttonBorderColor(
    ActivityTypeDynamicState state,
    ActivityTypeDynamicButtonOnFindACoachScreenState buttonState,
    int index,
  ) =>
      buttonState.chosenActivityTypeDynamicList.contains(
              state.activityTypeDynamicList.elementAt(index).activityTypeDetail)
          ? _appColors.selectedContainerColor
          : _appColors.unselectedContainerColor;

  Color _displayLabelColor(
    ActivityTypeDynamicState state,
    ActivityTypeDynamicButtonOnFindACoachScreenState buttonState,
    int index,
  ) =>
      buttonState.chosenActivityTypeDynamicList.contains(
              state.activityTypeDynamicList.elementAt(index).activityTypeDetail)
          ? _appColors.selectedLabelColor
          : _appColors.unselectedLabelColor;

  /// METHOD ===========================================================================================================
  // void _updateButtonWithChosenActivityTemplate(
  //   BuildContext context,
  // ) =>
  //     context.read<ActivityTypeDynamicButtonOnFindACoachScreenBloc>().add(
  //         PressActivityTypeDynamicButtonOnFindACoachScreen(
  //             activityTypeDynamic: context
  //                 .read<CreateActivityByChosenActivityTemplateDynamicCubit>()
  //                 .state
  //                 .chosenActivityTemplateDynamicList
  //                 .first
  //                 .activityDetailDynamic
  //                 .activityNameDynamic
  //                 .activityTypeDynamic
  //                 .activityTypeDetail));

  void _pressActivityTypeButton(
    BuildContext context,
    ActivityTypeDynamicState state,
    int index,
  ) =>
      context.read<ActivityTypeDynamicButtonOnFindACoachScreenBloc>().add(
          PressActivityTypeDynamicButtonOnFindACoachScreen(
              activityTypeDynamic: state.activityTypeDynamicList
                  .elementAt(index)
                  .activityTypeDetail));

  /// Check Methods ----------------------------------------------------------------------------------------------------
  // bool _checkAnyActivityTemplateIsNotPressed(BuildContext context) => context
  //     .watch<CreateActivityByChosenActivityTemplateDynamicCubit>()
  //     .state
  //     .chosenActivityTemplateDynamicList
  //     .isNotEmpty;

  bool _isCleanAllButtonPressed(
          CleanAllButtonOnFindACoachScreenCubit cleanActivityButton) =>
      cleanActivityButton.isCleanAllButtonOnFindACoachScreenPressed == true;

  void _checkCleanButtonStatus(
    BuildContext context,
    ActivityTypeDynamicButtonOnFindACoachScreenState buttonState,
    CleanAllButtonOnFindACoachScreenCubit cleanActivityButton,
  ) {
    if (_isCleanAllButtonPressed(cleanActivityButton) &&
        buttonState.chosenActivityTypeDynamicList.isNotEmpty) {
      _unchoseAllChosenActivityTypeOnFindACoachScreen(context);
    }
    cleanActivityButton.isCleanAllButtonOnFindACoachScreenPressed == true
        ? cleanActivityButton.callInitialStateBack()
        : buttonState.chosenActivityTypeDynamicList;

    _unchoseAllChosenActivityNameOnFindACoachScreen(context);
  }

  /// Other Methods ----------------------------------------------------------------------------------------------------
  void _unchoseAllChosenActivityTypeOnFindACoachScreen(
    BuildContext context,
  ) =>
      context
          .read<ActivityTypeDynamicButtonOnFindACoachScreenBloc>()
          .add(CleanActivityTypeDynamicButtonOnFindACoachScreen());

  void _unchoseAllChosenActivityNameOnFindACoachScreen(BuildContext context) {
    context
        .read<
            ActivityNameDynamicByActivityTypeDynamicButtonOnFindACoachScreenCubit>()
        .cleanActivityNameDynamicButton();
  }
}





// import 'package:flutter/material.dart';
// import 'package:my_project/constants/constants.dart';
// import 'package:my_project/logic/blocs/blocs.dart';
// import 'package:my_project/widgets/widget.dart';

// class FindACoachBodyActivityTypeArea extends StatelessWidget {
//   final AppColors _appColors = AppColors();
//   final AppFunctions _appFunctions = AppFunctions();
//   final double screenWidth;

//   FindACoachBodyActivityTypeArea({
//     required this.screenWidth,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CustomColumn(
//       children: [
//         _createActivityTypesTitle(),
//         const CustomAppSizedBox(height: 9),
//         _bringActivityTypesFromDatabaseAndDisplayThem(),
//       ],
//     );
//   }

//   /// TITLES =========================================================================================================
//   CustomTitle _createActivityTypesTitle() => const CustomTitle(
//       spaceFromUpperWidget: 32, textLabel: 'Preffered Activity Types');

//   /// SKELTONS =========================================================================================================
//   SkeltonWrap _displayActivityTypeDynamicSkelton(BuildContext context) =>
//       SkeltonWrap(screenWidth: screenWidth, numberOfWidget: 8);

//   /// BLOC =============================================================================================================
//   BlocBuilder<ActivityTypeDynamicBloc, ActivityTypeDynamicState>
//       _bringActivityTypesFromDatabaseAndDisplayThem() =>
//           BlocBuilder<ActivityTypeDynamicBloc, ActivityTypeDynamicState>(
//               builder: (context, state) {
//             switch (state.status) {
//               case Status.initial:
//                 return _displayActivityTypeDynamicSkelton(context);
//               case Status.loading:
//                 return _displayActivityTypeDynamicSkelton(context);
//               case Status.success:
//                 if (state.activityTypeDynamicList.isEmpty) {
//                   return const SizedBox();
//                 } else {
//                   return _createActivityTypeArea(state);
//                 }
//               case Status.failure:
//                 return StateError(error: state.error);
//             }
//           });

//   /// CREATE ===========================================================================================================
//   AppWrap _createActivityTypeArea(
//     ActivityTypeDynamicState state,
//   ) =>
//       AppWrap(children: _generateActivityTypeDetails(state));

//   /// GENERATE =========================================================================================================
//   List<Widget> _generateActivityTypeDetails(
//     ActivityTypeDynamicState state,
//   ) =>
//       List.generate(state.activityTypeDynamicList.length,
//           (index) => _buildBlocOfActivityTypeButton(state, index));

//   /// BUILD ============================================================================================================
//   BlocBuilder<ActivityTypeDynamicButtonOnTrainingOfferAddingPopUpBloc,
//           ActivityTypeDynamicButtonOnTrainingOfferAddingPopUpState>
//       _buildBlocOfActivityTypeButton(
//     ActivityTypeDynamicState state,
//     int index,
//   ) =>
//           BlocBuilder<ActivityTypeDynamicButtonOnTrainingOfferAddingPopUpBloc,
//                   ActivityTypeDynamicButtonOnTrainingOfferAddingPopUpState>(
//               builder: (context, buttonState) {
//             return _displayctivityTypeDetailArea(
//                 context, state, buttonState, index);
//           });

//   /// DISPLAY ==========================================================================================================
//   ChoiceContainer _displayctivityTypeDetailArea(
//     BuildContext context,
//     ActivityTypeDynamicState state,
//     ActivityTypeDynamicButtonOnTrainingOfferAddingPopUpState buttonState,
//     int index,
//   ) =>
//       ChoiceContainer(
//           containerText: _displayActivityType(state, index),
//           buttonColor: _displayButtonColor(state, buttonState, index),
//           buttonBorderColor:
//               _displayButttonBorderColor(state, buttonState, index),
//           labelColor: _displayLabelColor(state, buttonState, index),
//           onTap: () => _pressActivityTypeButton(context, state, index));

//   String _displayActivityType(
//     ActivityTypeDynamicState state,
//     int index,
//   ) =>
//       _appFunctions.setWithoutUnderscore(
//           state.activityTypeDynamicList.elementAt(index).activityTypeDetail);

//   Color _displayButtonColor(
//     ActivityTypeDynamicState state,
//     ActivityTypeDynamicButtonOnTrainingOfferAddingPopUpState buttonState,
//     int index,
//   ) =>
//       buttonState.chosenActivityTypeDynamicList.contains(
//               state.activityTypeDynamicList.elementAt(index).activityTypeDetail)
//           ? _appColors.selectedButtonColor
//           : Colors.transparent;

//   Color _displayButttonBorderColor(
//     ActivityTypeDynamicState state,
//     ActivityTypeDynamicButtonOnTrainingOfferAddingPopUpState buttonState,
//     int index,
//   ) =>
//       buttonState.chosenActivityTypeDynamicList.contains(
//               state.activityTypeDynamicList.elementAt(index).activityTypeDetail)
//           ? _appColors.selectedContainerColor
//           : _appColors.unselectedContainerColor;

//   Color _displayLabelColor(
//     ActivityTypeDynamicState state,
//     ActivityTypeDynamicButtonOnTrainingOfferAddingPopUpState buttonState,
//     int index,
//   ) =>
//       buttonState.chosenActivityTypeDynamicList.contains(
//               state.activityTypeDynamicList.elementAt(index).activityTypeDetail)
//           ? _appColors.selectedLabelColor
//           : _appColors.unselectedLabelColor;

//   /// METHODS ==========================================================================================================
//   void _pressActivityTypeButton(
//     BuildContext context,
//     ActivityTypeDynamicState state,
//     int index,
//   ) =>
//       context
//           .read<ActivityTypeDynamicButtonOnTrainingOfferAddingPopUpBloc>()
//           .add(PressActivityTypeDynamicButtonOnTrainingOfferAddingPopUp(
//               activityTypeDynamic: state.activityTypeDynamicList
//                   .elementAt(index)
//                   .activityTypeDetail));
// }
