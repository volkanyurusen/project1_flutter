import 'package:flutter/material.dart';
import 'package:my_project/constants/constants.dart';

import 'bodies/zbodies.dart';

class TabOfConversationOfGroupedTrainingRequest extends StatelessWidget {
  const TabOfConversationOfGroupedTrainingRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = context.width;

    return ConversationOfGroupedTrainingRequestBody(screenWidth: screenWidth);
  }
}
