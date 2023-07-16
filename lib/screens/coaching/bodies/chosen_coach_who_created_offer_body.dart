import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/screens/coaching/body_areas/zareas.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenCoachWhoCreatedOfferBody extends StatelessWidget {
  const ChosenCoachWhoCreatedOfferBody({super.key});

  @override
  Widget build(BuildContext context) {
    ChosenOfferAmongThoseWhoCreatedTrainingOfferCubit
        chosenOfferAmongThoseWhoCreatedTrainingOfferCubit =
        context.read<ChosenOfferAmongThoseWhoCreatedTrainingOfferCubit>();

    return CustomAppScrollView(
      child: BlocBuilder<ChosenOfferAmongThoseWhoCreatedTrainingOfferCubit,
              ChosenOfferAmongThoseWhoCreatedTrainingOfferState>(
          builder: (context, chosenState) {
        return CustomColumn(
          children: [
            ChosenCoachWhoCreatedOfferBodyUsernameArea(
                chosenOfferAmongThoseWhoCreatedTrainingOfferCubit:
                    chosenOfferAmongThoseWhoCreatedTrainingOfferCubit),
            ChosenCoachWhoCreatedOfferBodyFollowsAndLikeArea(
                chosenOfferAmongThoseWhoCreatedTrainingOfferCubit:
                    chosenOfferAmongThoseWhoCreatedTrainingOfferCubit),
            ChosenCoachWhoCreatedOfferBodyAboutUserArea(
                chosenOfferAmongThoseWhoCreatedTrainingOfferCubit:
                    chosenOfferAmongThoseWhoCreatedTrainingOfferCubit),
            const ChosenCoachBodyExercisePhotosArea(),
            ChosenCoachWhoCreatedOfferBodyStartConversationButtonArea(
                chosenOfferAmongThoseWhoCreatedTrainingOfferCubit:
                    chosenOfferAmongThoseWhoCreatedTrainingOfferCubit)
          ],
        );
      }),
    );
  }
}
