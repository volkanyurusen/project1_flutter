import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_project/widgets/widget.dart';

class ChosenTraineeBodyStartConversationArea extends StatelessWidget {
  const ChosenTraineeBodyStartConversationArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      children: [
        const CustomAppSizedBox(),
        _createStartConversationArea(),
        const CustomAppSizedBox(),
      ],
    );
  }

  /// CREATE ===========================================================================================================
  CustomElevatedButton _createStartConversationArea() {
    return CustomElevatedButton(
        textlabel: 'Start conversation',
        onPressed: () {
          /// Here will be a function which starts a conversation between the trainee and the app user.
          /// This function will go to a message page and create a conversation between them.
          if (kDebugMode) {
            print('Start conversation button is clicked!!!');
          }
        });
  }

  /// GENERATE =========================================================================================================

  /// BUILD ============================================================================================================

  /// DISPLAY ==========================================================================================================

  /// METHODS ==========================================================================================================
}
