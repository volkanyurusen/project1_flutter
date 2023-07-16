import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

import 'zbodies.dart';

class ChosenCoachWhoFoundBody extends StatelessWidget {
  const ChosenCoachWhoFoundBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ChosenCoachAmongThoseWhoFoundCubit chosenCoachAmongThoseWhoFoundCubit =
        context.read<ChosenCoachAmongThoseWhoFoundCubit>();

    return CustomAppScrollView(
      child: BlocBuilder<ChosenCoachAmongThoseWhoFoundCubit,
          ChosenCoachAmongThoseWhoFoundState>(builder: (context, chosenState) {
        return CustomColumn(
          children: [
            ChosenCoachWhoFoundBodyUsernameArea(
                chosenCoachAmongThoseWhoFoundCubit:
                    chosenCoachAmongThoseWhoFoundCubit),
            ChosenCoachWhoFoundBodyFollowsAndLikeArea(
                chosenCoachAmongThoseWhoFoundCubit:
                    chosenCoachAmongThoseWhoFoundCubit),
            ChosenCoachWhoFoundBodyAboutUserArea(
                chosenCoachAmongThoseWhoFoundCubit:
                    chosenCoachAmongThoseWhoFoundCubit),
            const ChosenCoachWhoFoundBodyExercisePhotosArea(),
            ChosenCoachWhoFoundBodyStartConversationButtonArea(
              chosenCoachAmongThoseWhoFoundCubit:
                  chosenCoachAmongThoseWhoFoundCubit,
            ),
          ],
        );
      }),
    );
  }
}
