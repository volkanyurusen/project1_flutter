import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';

import 'bodies/zbodies.dart';

class TabOfConversationOfGroupedFindACoach extends StatelessWidget {
  const TabOfConversationOfGroupedFindACoach({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = context.width;

    return ConversationOfGroupedFindACoachBody(screenWidth: screenWidth);
  }
}
