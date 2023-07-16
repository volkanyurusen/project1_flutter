import 'package:flutter/material.dart';
import 'package:my_project/logic/blocs/blocs.dart';
import 'package:my_project/logic/cubits/cubits.dart';
import 'package:my_project/widgets/widget.dart';

import 'zbodies.dart';

class ChosenActivityDetailBody extends StatelessWidget {
  const ChosenActivityDetailBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppScrollView(
      child: BlocBuilder<ChosenActivityConversationDynamicByUserCubit,
          ChosenActivityConversationDynamicByUserState>(
        builder: (context, chosenState) {
          return CustomColumn(children: [
            ChosenActivityDetailBodyActivityNameArea(),
            ChosenActivityDetailBodyHostArea(),
            const ChosenActivityDetailBodyAttendeeArea(),
            ChosenActivityDetailBodyAttendeeDetailArea(),
          ]);
        },
      ),
    );
  }
}
