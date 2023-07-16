import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

import 'zbodies.dart';

class ChosenTrainingOfferDetailBody extends StatelessWidget {
  const ChosenTrainingOfferDetailBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppScrollView(
      child: BlocBuilder<
          ChosenTrainingOfferConversationDynamicByUserCubit,
          ChosenTrainingOfferConversationDynamicByUserState>(
        builder: (context, chosenState) {
          return CustomColumn(children: [
            ChosenTrainingOfferDetailBodyActivityNameArea(),
            const ChosenTrainingOfferDetailBodyLessonPriceArea(),
            const ChosenTrainingOfferDetailBodyTraineeArea(),
            ChosenTrainingOfferDetailBodyTraineeDetailArea(),
          ]);
        },
      ),
    );
  }
}
