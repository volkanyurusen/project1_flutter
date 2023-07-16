import 'package:flutter/material.dart';

import 'bodies/zbodies.dart';

class TabOfConversationOfActivity extends StatelessWidget {
  const TabOfConversationOfActivity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return ConversationOfActivityBody(screenWidth: screenWidth);
  }
}
