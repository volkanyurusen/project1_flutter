import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

import 'zbodies.dart';

class ChosenResponseWhoRespondedTrainingOfferBody extends StatelessWidget {
  const ChosenResponseWhoRespondedTrainingOfferBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit
        chosenResponseAmongThoseWhoRespondedTrainingOfferCubit =
        context.read<ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit>();
    double screenWidth = MediaQuery.of(context).size.width;

    return UserCardScrollAppBody(
      child: BlocBuilder<ChosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
              ChosenResponseAmongThoseWhoRespondedTrainingOfferState>(
          builder: (context, chosenState) {
        return Column(
          children: [
            ChosenResponseWhoRespondedTrainingOfferBodyProfilePhotoArea(
                chosenResponseAmongThoseWhoRespondedTrainingOfferCubit:
                    chosenResponseAmongThoseWhoRespondedTrainingOfferCubit),
            ChosenResponseWhoRespondedTrainingOfferBodyUsernameArea(
                chosenResponseAmongThoseWhoRespondedTrainingOfferCubit:
                    chosenResponseAmongThoseWhoRespondedTrainingOfferCubit),
            ChosenResponseWhoRespondedTrainingOfferBodyFollowsAndLikeArea(
                chosenResponseAmongThoseWhoRespondedTrainingOfferCubit:
                    chosenResponseAmongThoseWhoRespondedTrainingOfferCubit),
            ChosenResponseWhoRespondedTrainingOfferBodyAmountBoxArea(
                chosenResponseAmongThoseWhoRespondedTrainingOfferCubit:
                    chosenResponseAmongThoseWhoRespondedTrainingOfferCubit,
                screenWidth: screenWidth),
            ChosenResponseWhoRespondedTrainingOfferBodyAboutUserArea(
                chosenResponseAmongThoseWhoRespondedTrainingOfferCubit:
                    chosenResponseAmongThoseWhoRespondedTrainingOfferCubit),
            ChosenResponseWhoRespondedTrainingOfferBodyRecentActivityArea(
                screenWidth: screenWidth),
          ],
        );
      }),
    );
  }
}
