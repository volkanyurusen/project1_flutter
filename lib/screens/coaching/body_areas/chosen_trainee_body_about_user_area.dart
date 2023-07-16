import 'package:flutter/material.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenTraineeBodyAboutUserArea extends StatelessWidget {
  final ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
      chosenResponseAmongThoseWhoRespondedTrainingOfferCubit;

  const ChosenTraineeBodyAboutUserArea({
    required this.chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ChosenResponseAmongThoseWhoRespondedTrainingOfferState
        chosenResponseAmongThoseWhoRespondedTrainingOfferState =
        chosenResponseAmongThoseWhoRespondedTrainingOfferCubit.state;
    TextStyle? displaySmall = Theme.of(context).textTheme.displaySmall!;

    return Column(
      children: [
        _displayAboutUser(
            context,
            chosenResponseAmongThoseWhoRespondedTrainingOfferState,
            displaySmall),
        const CustomAppSizedBox(height: 9),
        CustomAppDivider(),
        const CustomAppSizedBox(height: 9),
      ],
    );
  }

  /// DISPLAY ==========================================================================================================
  AppHeaderText _displayAboutUser(
    BuildContext context,
    ChosenResponseAmongThoseWhoRespondedTrainingOfferState state,
    TextStyle displaySmall,
  ) =>
      AppHeaderText(
          textLabel: displayAboutUserText(state),
          textStyle: displaySmall.copyWith(fontWeight: FontWeight.normal));

  String displayAboutUserText(
          ChosenResponseAmongThoseWhoRespondedTrainingOfferState state) =>
      '${state.chosenTrainingOfferResponseDynamicWithDistanceList.last.traineeDynamic.aboutUser} Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris';
}




// import 'package:flutter/material.dart';
// import 'package:my_project/logic/blocs/blocs.dart';
// import 'package:my_project/logic/cubits/cubits.dart';
// import 'package:my_project/widgets/widget.dart';

// class ChosenTraineeBodyAboutUserArea extends StatelessWidget {
//   final ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
//       chosenResponseAmongThoseWhoRespondedTrainingOfferCubit;

//   const ChosenTraineeBodyAboutUserArea({
//     required this.chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final ChosenResponseAmongThoseWhoRespondedTrainingOfferState
//         chosenResponseAmongThoseWhoRespondedTrainingOfferState = context
//             .read<ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit>()
//             .state;
//     TextStyle? displaySmall  = Theme.of(context).textTheme.displaySmall !;

//     return Column(
//       children: [
//         _displayAboutUser(context,
//             chosenResponseAmongThoseWhoRespondedTrainingOfferState, displaySmall ),
//         const CustomAppSizedBox(height: 18),
//       ],
//     );
//   }

//   /// DISPLAY ==========================================================================================================
//   AppHeaderText _displayAboutUser(
//     BuildContext context,
//     ChosenResponseAmongThoseWhoRespondedTrainingOfferState
//         chosenResponseAmongThoseWhoRespondedTrainingOfferState,
//     TextStyle displaySmall ,
//   ) =>
//       AppHeaderText(
//           textLabel: displayAboutUserText(
//               chosenResponseAmongThoseWhoRespondedTrainingOfferState),
//           textStyle: displaySmall .copyWith(fontWeight: FontWeight.normal));

//   String displayAboutUserText(
//           ChosenResponseAmongThoseWhoRespondedTrainingOfferState
//               chosenResponseAmongThoseWhoRespondedTrainingOfferState) =>
//       '${chosenResponseAmongThoseWhoRespondedTrainingOfferState.chosenResponseAmongThoseWhoRespondedTrainingOffer.last.traineeDynamic.aboutUser} Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris';
// }