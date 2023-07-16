import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

import 'zbodies.dart';

class ChosenTraineeBody extends StatelessWidget {
  final AppColors _appColors = AppColors();
  final AppTextConstants _appTextConstants = AppTextConstants();

  ChosenTraineeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
        chosenResponseAmongThoseWhoRespondedTrainingOfferCubit =
        context.read<ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit>();
    double screenWidth = MediaQuery.of(context).size.width;
    TextStyle? headlineSmall = Theme.of(context)
        .textTheme
        .headlineSmall!
        .copyWith(color: _appColors.scaffoldBackgroundColor);

    return UserCardScrollAppBody(
      child: BlocBuilder<ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
              ChosenResponseAmongThoseWhoRespondedTrainingOfferState>(
          builder: (context, chosenState) {
        return Column(
          children: [
            ChosenTraineeBodyProfilePhotoArea(
                chosenResponseAmongThoseWhoRespondedTrainingOfferCubit:
                    chosenResponseAmongThoseWhoRespondedTrainingOfferCubit),
            ChosenTraineeBodyUsernameArea(
                chosenResponseAmongThoseWhoRespondedTrainingOfferCubit:
                    chosenResponseAmongThoseWhoRespondedTrainingOfferCubit),
            ChosenTraineeBodyFollowsAndLikesArea(
                chosenResponseAmongThoseWhoRespondedTrainingOfferCubit:
                    chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
                screenWidth: screenWidth),
            ChosenTraineeBodyAmountBoxArea(
                chosenResponseAmongThoseWhoRespondedTrainingOfferCubit:
                    chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
                screenWidth: screenWidth),
            ChosenTraineeBodyAboutUserArea(
                chosenResponseAmongThoseWhoRespondedTrainingOfferCubit:
                    chosenResponseAmongThoseWhoRespondedTrainingOfferCubit),
            ChosenTraineeBodyRecentActivityArea(screenWidth: screenWidth),
            CustomAppDivider(height: 0),
            const CustomAppSizedBox(),
            _createApproveAndDenyArea(
                context, chosenState, screenWidth, headlineSmall),
            const CustomAppSizedBox(height: 18),
          ],
        );
      }),
    );
  }

  /// CREATE ===========================================================================================================
  CustomRow _createApproveAndDenyArea(
    BuildContext context,
    ChosenResponseAmongThoseWhoRespondedTrainingOfferState chosenState,
    double screenWidth,
    TextStyle headlineSmall,
  ) =>
      CustomRow(
        mainAxisSize: MainAxisSize.max,
        children: [
          _displayDenyButton(context, chosenState, screenWidth, headlineSmall),
          _displayApproveButton(
              context, chosenState, screenWidth, headlineSmall),
        ],
      );

  /// DISPLAY ==========================================================================================================

  CustomElevatedButton _displayDenyButton(
    BuildContext context,
    ChosenResponseAmongThoseWhoRespondedTrainingOfferState chosenState,
    double screenWidth,
    TextStyle headlineSmall,
  ) =>
      CustomElevatedButton(
          textlabel: _appTextConstants.denyRequest,
          textStyle: headlineSmall,
          elevatedButtonWidth: screenWidth * 0.35,
          buttonColor: _appColors.buttonDarkColor,
          onPressed: _checkIfUserRequestIsApprovedOrDenied(chosenState)
              ? null
              : () => _denyRequest());

  CustomElevatedButton _displayApproveButton(
    BuildContext context,
    ChosenResponseAmongThoseWhoRespondedTrainingOfferState chosenState,
    double screenWidth,
    TextStyle headlineSmall,
  ) =>
      CustomElevatedButton(
          textlabel: _appTextConstants.startConversation,
          textStyle: headlineSmall,
          elevatedButtonWidth: screenWidth * 0.35,
          buttonColor: _appColors.secondary,
          onPressed: _checkIfUserRequestIsApprovedOrDenied(chosenState)
              ? null
              : () => _approveRequest());

  /// METHOD ===========================================================================================================
  void _denyRequest() {
    if (kDebugMode) {
      print('Deny button has been clicked!!!');
    }
  }

  void _approveRequest() {
    if (kDebugMode) {
      print('Approve button has been clicked!!!');
    }
  }

  /// Check Method -----------------------------------------------------------------------------------------------------
  bool _checkIfUserRequestIsApprovedOrDenied(
    ChosenResponseAmongThoseWhoRespondedTrainingOfferState chosenState,
  ) =>
      chosenState.chosenTrainingOfferResponseDynamicWithDistanceList.last
              .processDetailDynamic.processName ==
          'Approved' ||
      chosenState.chosenTrainingOfferResponseDynamicWithDistanceList.last
              .processDetailDynamic.processName ==
          'Denied';
}




// class ChosenTraineeBody extends StatelessWidget {
//   const ChosenTraineeBody({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
//         chosenResponseAmongThoseWhoRespondedTrainingOfferCubit =
//         context.read<ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit>();

//     return CustomAppScrollView(
//       child: BlocBuilder<ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
//               ChosenResponseAmongThoseWhoRespondedTrainingOfferState>(
//           builder: (context, chosenState) {
//         return CustomColumn(
//           children: [
//             ChosenTraineeBodyUsernameArea(
//                 chosenResponseAmongThoseWhoRespondedTrainingOfferCubit:
//                     chosenResponseAmongThoseWhoRespondedTrainingOfferCubit),
//             ChosenTraineeBodyFollowsAndLikeArea(
//               chosenResponseAmongThoseWhoRespondedTrainingOfferCubit:
//                   chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
//             ),
//             ChosenTraineeBodyAboutUserArea(
//                 chosenResponseAmongThoseWhoRespondedTrainingOfferCubit:
//                     chosenResponseAmongThoseWhoRespondedTrainingOfferCubit),
//             const ChosenTraineeBodyStartConversationArea(),
//           ],
//         );
//       }),
//     );
//   }
// }
