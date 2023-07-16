import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

import 'zbodies.dart';

class ChosenTraineeWhoCreatedRequestBody extends StatelessWidget {
  const ChosenTraineeWhoCreatedRequestBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ChosenRequestAmongThoseWhoCreatedTrainingRequestCubit
        chosenRequestAmongThoseWhoCreatedTrainingRequestCubit =
        context.read<ChosenRequestAmongThoseWhoCreatedTrainingRequestCubit>();
    double screenWidth = MediaQuery.of(context).size.width;

    return UserCardScrollAppBody(
      child: BlocBuilder<ChosenRequestAmongThoseWhoCreatedTrainingRequestCubit,
              ChosenRequestAmongThoseWhoCreatedTrainingRequestState>(
          builder: (context, chosenState) {
        return Column(
          children: [
            ChosenTraineeWhoCreatedRequestBodyProfilePhotoArea(
                chosenRequestAmongThoseWhoCreatedTrainingRequestCubit:
                    chosenRequestAmongThoseWhoCreatedTrainingRequestCubit),
            ChosenTraineeWhoCreatedRequestBodyUsernameArea(
                chosenRequestAmongThoseWhoCreatedTrainingRequestCubit:
                    chosenRequestAmongThoseWhoCreatedTrainingRequestCubit),
            ChosenTraineeWhoCreatedRequestBodyFollowsAndLikeArea(
                chosenRequestAmongThoseWhoCreatedTrainingRequestCubit:
                    chosenRequestAmongThoseWhoCreatedTrainingRequestCubit),
            ChosenTraineeWhoCreatedRequestBodyAmountBoxArea(
                chosenRequestAmongThoseWhoCreatedTrainingRequestCubit:
                    chosenRequestAmongThoseWhoCreatedTrainingRequestCubit,
                screenWidth: screenWidth),
            ChosenTraineeWhoCreatedRequestBodyAboutUserArea(
                chosenRequestAmongThoseWhoCreatedTrainingRequestCubit:
                    chosenRequestAmongThoseWhoCreatedTrainingRequestCubit),
            ChosenTraineeWhoCreatedRequestBodyRecentActivityArea(
                screenWidth: screenWidth),
            ChosenCoachWhoCreatedRequestBodyStartConversationButtonArea(
                chosenRequestAmongThoseWhoCreatedTrainingRequestCubit:
                    chosenRequestAmongThoseWhoCreatedTrainingRequestCubit),
          ],
        );
      }),
    );
  }
}
