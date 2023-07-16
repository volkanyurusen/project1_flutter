import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

import 'zbodies.dart';

class ChosenResponseWhoRespondedTrainingRequestBody extends StatelessWidget {
  const ChosenResponseWhoRespondedTrainingRequestBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppScrollView(
      child: BlocBuilder<
              ChosenResponseAmongThoseWhoRespondedTrainingRequestCubit,
              ChosenResponseAmongThoseWhoRespondedTrainingRequestState>(
          builder: (context, chosenState) {
        return CustomColumn(
          children: [
            ChosenResponseWhoRespondedTrainingRequestBodyUsernameArea(),
            ChosenResponseWhoRespondedTrainingRequestBodyFollowsAndLikeArea(),
            const ChosenResponseWhoRespondedTrainingRequestBodyAboutUserArea(),
            const ChosenResponseWhoRespondedTrainingRequestBodyExercisePhotosArea(),
            const CustomAppSizedBox(),
          ],
        );
      }),
    );
  }
}
