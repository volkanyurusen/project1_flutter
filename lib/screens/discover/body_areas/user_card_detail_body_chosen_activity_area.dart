// import 'package:flutter/material.dart';

// import 'package:my_project/constants/constants.dart';
// import 'package:my_project/logic/cubits/cubits.dart';
// import 'package:my_project/widgets/widget.dart';


// class UserCardDetailBodyChosenActivityArea extends StatelessWidget {
//   final AppFunctions _appFunctions = AppFunctions();
//   final ChosenResultOfChosenActivityDynamicCubit
//       chosenResultOfChosenActivityDynamicCubit;

//   UserCardDetailBodyChosenActivityArea({
//     required this.chosenResultOfChosenActivityDynamicCubit,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final ChosenResultOfChosenActivityDynamicState
//         chosenResultOfChosenActivityDynamicState =
//         chosenResultOfChosenActivityDynamicCubit.state;
//     final TextStyle? titleLarge = Theme.of(context).textTheme.titleLarge;

//     return UserCardChosenActivityDetailColumn(
//       asset:
//           'assets/images/activities/${chosenResultOfChosenActivityDynamicState.chosenCreatedActivityDynamicWithDistanceList.last.activityNameDynamic.activityTitle.toLowerCase()}.jpg',
//       children: [
//         CustomAppDivider(height: 0),
//         const CustomAppSizedBox(),
//         _displayTitleOfActivityName(),
//         _displayActivityName(titleLarge),
//         const CustomAppSizedBox(height: 10),
//         CustomAppDivider(height: 0),
//       ],
//     );
//   }

//   /// TITLES ===========================================================================================================
//   TitleOfActivityOnUserCardScreen _displayTitleOfActivityName() =>
//       TitleOfActivityOnUserCardScreen(title: 'Activity Name');

//   /// DISPLAY ==========================================================================================================
//   DetailOfActivityOnUserCardScreen _displayActivityName(
//     TextStyle? titleLarge,
//   ) =>
//       DetailOfActivityOnUserCardScreen(
//           textLabel: _displayActivityTitle(), textStyle: titleLarge);


//   String _displayActivityTitle() => _appFunctions.setWithoutUnderscore(
//       chosenResultOfChosenActivityDynamicCubit
//           .state
//           .chosenCreatedActivityDynamicWithDistanceList
//           .last
//           .activityNameDynamic
//           .activityTitle);
// }
