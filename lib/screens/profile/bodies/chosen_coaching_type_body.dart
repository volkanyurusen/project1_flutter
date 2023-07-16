import 'package:flutter/material.dart';
import 'package:my_project/screens/profile/body_areas/zareas.dart';

class ChosenCoachingTypeBody extends StatelessWidget {
  const ChosenCoachingTypeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChosenCoachingTypeDetailArea();
  }
}









// class ChosenCoachingTypeBody extends StatelessWidget {
//   final AppColors _appColors = AppColors();
//   final AppFunctions _appFunctions = AppFunctions();
//   final AppListConstants _appListConstants = AppListConstants();

//   ChosenCoachingTypeBody({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     double bodyWidth = MediaQuery.of(context).size.width;
//     Color whiteColor = _appColors.scaffoldBackgroundColor;
//     Color primaryColor = _appColors.primary;
//     TextStyle? headline2 =
//         Theme.of(context).textTheme.displayLarge!.copyWith(color: whiteColor);
//     TextStyle? titleLarge =
//         Theme.of(context).textTheme.titleLarge!.copyWith(color: whiteColor);

//     return Column(children: [
//       BlocBuilder<ChosenCoachingTypeCubit, ChosenCoachingTypeState>(
//           builder: (context, state) {
//         if (state.chosenCoachingTypeList.isEmpty) {
//           return NothingReturned();
//         } else {
//           return Expanded(
//               child: Container(
//             decoration: BoxDecoration(
//                 color: state.chosenCoachingTypeList.last.coachingTypeName ==
//                         'Basic Coach'
//                     ? _appColors.textColor
//                     : primaryColor,
//                 borderRadius: const BorderRadius.only(
//                     topRight: Radius.circular(50),
//                     topLeft: Radius.circular(50))),
//             width: bodyWidth,
//             child: AppBody(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                     Container(
//                         padding: const EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           border: Border.all(width: 2.0, color: whiteColor),
//                         ),
//                         child: _appListConstants.typeIcon[state
//                                     .chosenCoachingTypeList
//                                     .last
//                                     .coachingTypeName ==
//                                 ' Basic Coach'
//                             ? 0
//                             : 1]),
//                     const CustomAppSizedBox(width: 10),
//                     AppHeaderText(
//                         textLabel:
//                             state.chosenCoachingTypeList.last.coachingTypeName,
//                         textStyle: headline2),
//                   ]),
//                   CustomColumn(
//                     children: List.generate(
//                       _appListConstants.platinumCoachingTypeValue.length,
//                       (index) => AppHeader(
//                         spaceFromUpperWidget: index == 0 ? 0 : 10,
//                         firstWidget: AppHeader(
//                           firstWidget: state.chosenCoachingTypeList.last
//                                       .toJson()
//                                       .entries
//                                       .elementAt(index + 2)
//                                       .value ==
//                                   true
//                               ? Icon(Icons.done_sharp,
//                                   color: whiteColor, size: 18)
//                               : state.chosenCoachingTypeList.last
//                                           .toJson()
//                                           .entries
//                                           .elementAt(index + 2)
//                                           .value ==
//                                       false
//                                   ? Icon(Icons.clear_sharp,
//                                       color: whiteColor, size: 18)
//                                   : state.chosenCoachingTypeList.last
//                                               .toJson()
//                                               .entries
//                                               .elementAt(index + 2)
//                                               .value ==
//                                           0
//                                       ? Icon(Icons.clear_sharp,
//                                           color: whiteColor, size: 18)
//                                       : Icon(Icons.done_sharp,
//                                           color: whiteColor, size: 18),
//                           secondWidget: const CustomAppSizedBox(width: 5),
//                           thirdWidget: AppHeaderText(
//                               textLabel: _appFunctions
//                                   .setWithoutUnderscore(state
//                                       .chosenCoachingTypeList.last
//                                       .toJson()
//                                       .entries
//                                       .elementAt(index + 2)
//                                       .key)
//                                   .toCapitalized(),
//                               textStyle: titleLarge),
//                         ),
//                         thirdWidget: AppHeaderText(
//                             textLabel: state.chosenCoachingTypeList.last
//                                         .toJson()
//                                         .entries
//                                         .elementAt(index + 2)
//                                         .value ==
//                                     true
//                                 ? 'Included'
//                                 : state.chosenCoachingTypeList.last
//                                             .toJson()
//                                             .entries
//                                             .elementAt(index + 2)
//                                             .value ==
//                                         false
//                                     ? 'Excluded'
//                                     : state.chosenCoachingTypeList.last
//                                                 .toJson()
//                                                 .entries
//                                                 .elementAt(index + 2)
//                                                 .value ==
//                                             0
//                                         ? 'None'
//                                         : state.chosenCoachingTypeList.last
//                                                     .coachingTypeName ==
//                                                 'Basic Coach'
//                                             ? state.chosenCoachingTypeList.last
//                                                     .toJson()
//                                                     .entries
//                                                     .elementAt(index + 2)
//                                                     .value
//                                                     .toString() +
//                                                 _appListConstants.basicCoachingTypeValue
//                                                     .elementAt(index)
//                                             : state.chosenCoachingTypeList.last
//                                                     .toJson()
//                                                     .entries
//                                                     .elementAt(index + 2)
//                                                     .value
//                                                     .toString() +
//                                                 _appListConstants
//                                                     .platinumCoachingTypeValue
//                                                     .elementAt(index),
//                             textStyle: titleLarge),
//                       ),
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       BlocBuilder<ChosenCoachingTypeCubit,
//                           ChosenCoachingTypeState>(
//                         builder: (context, state) {
//                           if (state.chosenCoachingTypeList.isEmpty) {
//                             return const SizedBox();
//                           } else {
//                             return AppHeaderText(
//                                 textLabel: state.chosenCoachingTypeList.last
//                                             .monthlyPrice ==
//                                         0
//                                     ? 'Free'
//                                     : state.chosenCoachingTypeList.last
//                                         .monthlyPrice
//                                         .toString(),
//                                 textStyle: headline2);
//                           }
//                         },
//                       ),
//                       state.chosenCoachingTypeList.last.monthlyPrice == 0
//                           ? const SizedBox()
//                           : AppNumberConstants().appCoachId != 0
//                               ? state.chosenCoachingTypeList.last.coachingTypeId ==
//                                       context
//                                           .read<CoachDynamicBloc>()
//                                           .state
//                                           .coachDynamicList
//                                           .last
//                                           .coachingTypeDynamic
//                                           .coachingTypeId
//                                   ? ChoiceContainer(
//                                       labelStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
//                                           color: _appColors.scaffoldBackgroundColor
//                                               .withBlue(2)
//                                               .withGreen(2)
//                                               .withRed(2)
//                                               .withOpacity(0.5)),
//                                       buttonBorderColor: _appColors.secondary
//                                           .withOpacity(0.50),
//                                       buttonColor: _appColors.secondary
//                                           .withOpacity(0.50),
//                                       containerText: 'Subscribe   ',
//                                       onTap: null)
//                                   : ChoiceContainer(
//                                       labelStyle: Theme.of(context)
//                                           .textTheme
//                                           .headlineMedium!
//                                           .copyWith(
//                                               color: _appColors
//                                                   .scaffoldBackgroundColor),
//                                       buttonBorderColor: _appColors.secondary,
//                                       buttonColor: _appColors.secondary,
//                                       containerText: 'Subscribe   ',
//                                       onTap: () {
//                                         if (kDebugMode) {
//                                           print(
//                                               'Subscribe button has been clicked!!!');
//                                         }
//                                       })
//                               : ChoiceContainer(
//                                   labelStyle: Theme.of(context)
//                                       .textTheme
//                                       .headlineMedium!
//                                       .copyWith(color: _appColors.scaffoldBackgroundColor),
//                                   buttonBorderColor: _appColors.secondary,
//                                   buttonColor: _appColors.secondary,
//                                   containerText: 'Subscribe   ',
//                                   onTap: () {
//                                     if (kDebugMode) {
//                                       print(
//                                           'Subscribe button has been clicked!!!');
//                                     }
//                                   })
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ));
//         }
//       }),
//     ]);
//   }
// }
