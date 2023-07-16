import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

import 'zbodies.dart';

class ChosenFindACoachDetailBody extends StatelessWidget {
  const ChosenFindACoachDetailBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppScrollView(
      child: BlocBuilder<ChosenFindACoachConversationDynamicByTraineeCubit,
          ChosenFindACoachConversationDynamicByTraineeState>(
        builder: (context, chosenState) {
          return CustomColumn(children: [
            ChosenFindACoachDetailBodyActivityNameArea(),
            const ChosenFindACoachDetailBodyLessonPriceArea(),
            const ChosenFindACoachDetailBodyCoachArea(),
            ChosenFindACoachDetailBodyCoachDetailArea(),
          ]);
        },
      ),
    );
  }
}
