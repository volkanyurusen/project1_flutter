import 'package:flutter/material.dart';

import 'bodies/zbodies.dart';

class TabOfConversationOfGroupedTrainingOffer extends StatelessWidget {
  const TabOfConversationOfGroupedTrainingOffer({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return ConversationOfGroupedTrainingOfferBody(screenWidth: screenWidth);
  }
}
