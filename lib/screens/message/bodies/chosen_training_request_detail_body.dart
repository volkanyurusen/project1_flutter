import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

import 'zbodies.dart';

class ChosenTrainingRequestDetailBody extends StatelessWidget {
  const ChosenTrainingRequestDetailBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppScrollView(
      child: BlocBuilder<ChosenTrainingRequestConversationDynamicByUserCubit,
          ChosenTrainingRequestConversationDynamicByUserState>(
        builder: (context, chosenState) {
          return CustomColumn(children: [
            ChosenTrainingRequestDetailBodyActivityNameArea(),
            const ChosenTrainingRequestDetailBodyLessonPriceArea(),
            const ChosenTrainingRequestDetailBodyCoachArea(),
            ChosenTrainingRequestDetailBodyCoachDetailArea(),
          ]);
        },
      ),
    );
  }
}
